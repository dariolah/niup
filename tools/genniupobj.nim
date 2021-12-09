import odsreader
import std/tables
import os
import strformat
import std/sets
import strutils

type
  AttributeMapping = ref object
    attribute: string
    pk2: string
    controls: OrderedSet[string]

proc genTypes(controlsSheet: Sheet, iupType: string) =
  var processedControls = OrderedSet[string]()

  echo "type"
  for row in controlsSheet:
    if processedControls.contains(row["IUP"]):
      continue
    processedControls.incl(row["IUP"])
    echo &"  {row[\"IUP\"]}_t* = distinct PIhandle"
  echo ""

  var controls = newSeq[string]()
  for control in processedControls.items:
    controls.add &"{control}_t"

  stdout.write &"type {iupType}* = "
  stdout.write join(controls, " | ")
  echo ""
  echo ""

proc initAttributesMap(attrMapSheet: Sheet, firstColumnName:string): seq[AttributeMapping] =
  ## -> [("attribute", {"IUP control", ...}), ... ]
  var attributesMap = newSeq[AttributeMapping]()
  let columns = attrMapSheet.getColumnNames()

  for row in attrMapSheet:
    var controls = OrderedSet[string]()

    for columnName in columns.keys():
      if columnName != firstColumnName and columnName != "PK2" and row[columnName] != "":
        controls.incl(columnName)

    var mapping = AttributeMapping(attribute: row[firstColumnName], pk2: row["PK2"], controls: controls)
    attributesMap.add(mapping)

  return attributesMap

proc getAttrProcType(attribute: string; pk2:string, controls: OrderedSet[string]): (string, string) =
  var controls_t: seq[string]
  for ctrl in controls:
    controls_t.add(&"{ctrl}_t")
  let
    controls_string = join(controls_t, " | ")
    attrType = &"{attribute.toLowerAscii.capitalizeAscii}{pk2}Types"
  return (attrType, &"type {attrType}* = {controls_string}")

proc getSheetRow(sheet:Sheet; column: string; value:string, pk2: string): Row =
  for row in sheet:
    if row[column] == value and row["PK2"] == pk2:
      return row
  raise newException(Exception, &"Row not found: {column} == {value}")

proc echoDocString(doc: string) =
  let lines = doc.split('\n')
  for line in lines:
    echo &"  ## {line.strip(leading = false)}"

proc genAttributeProcs(attributesMap: seq[AttributeMapping], attrSheet: Sheet) =
  echo "# ATTRIBUTES"
  for mapping in attributesMap:
    let
      attribute = mapping.attribute
      controls = mapping.controls
      pk2 = mapping.pk2
      (attrProcType, attrProcTypeDecl) = getAttrProcType(attribute, pk2, controls)
      lc_attribute = attribute.toLower
      attrRow = getSheetRow(attrSheet, "ATTRIBUTE", attribute, pk2)
    echo attrProcTypeDecl

    if attrRow["READ_WRITE"] != "RO":
      echo &"proc `{lc_attribute}=`*(ih: {attrProcType}, value: string) {{.cdecl.}} ="
      echoDocString(attrRow["DOC"])
      echo &"  SetAttribute(cast[PIhandle](ih), \"{attribute}\", value)"
      echo ""

      echo &"proc `{lc_attribute}`*(ih: {attrProcType}, value: string) {{.cdecl.}} ="
      echo &"  SetAttribute(cast[PIhandle](ih), \"{attribute}\", value)"
      echo ""

      if attrRow["SETHANDLE_TYPE"] != "":
        echo &"proc `{lc_attribute}=`*(ih: {attrProcType}, value: {attrRow[\"SETHANDLE_TYPE\"]}) {{.cdecl.}} ="
        echo &"  SetAttributeHandle(cast[PIhandle](ih), \"{attribute}\", cast[PIhandle](value))"
        echo ""

    let getterExpression = attrRow["GETTER_EXPRESSION"].multiReplace(("”", "\""), ("“", "\""))
    if attrRow["READ_WRITE"] != "WO":
      if getterExpression == "":
        echo &"proc `{lc_attribute}`*(ih: {attrProcType}): string {{.cdecl.}} ="
        if attrRow["READ_WRITE"] == "RO":
          echoDocString(attrRow["DOC"])
        echo &"  return $GetAttribute(cast[PIhandle](ih), \"{attribute}\")"
        echo ""
      else:
        echo &"proc `{lc_attribute}`*(ih: {attrProcType}): {attrRow[\"GETTER_TYPE\"]} {{.cdecl.}} ="
        echo &"  return {getterExpression}"
        echo ""


    let
      altCall = attrRow["ALT_CALL"].multiReplace(("”", "\""), ("“", "\""))
      altCtor = attrRow["ALT_CTOR"]

    if altCtor != "":
      if not (altCtor.contains(",") or altCtor.contains(";")):
        # single arg, we can use =
        echo &"proc `{lc_attribute}=`*(ih: {attrProcType}, {altCtor}) {{.cdecl.}} ="
        echo &"  SetAttribute(cast[PIhandle](ih), \"{attribute}\", cstring({altCall}))"
        echo ""
      # default, calssic f() call
      echo &"proc `{lc_attribute}`*(ih: {attrProcType}, {altCtor}) {{.cdecl.}} ="
      echo &"  SetAttribute(cast[PIhandle](ih), \"{attribute}\", cstring({altCall}))"
    echo ""

proc genCallbackProcs(attributesMap: seq[AttributeMapping], cbSheet: Sheet) =
  echo "# CALLBACKS"
  for mapping in attributesMap:
    let
      callback = mapping.attribute
      controls = mapping.controls
      pk2 = mapping.pk2
      (cbProcType, cbProcTypeDecl) = getAttrProcType(callback, pk2, controls)
      lc_callback = callback.toLower
      cbRow = getSheetRow(cbSheet, "CALLBACK", callback, pk2)
      cbProto = cbRow["CB_PROTO"]
      cbRet = cbRow["CB_RET"]
    echo cbProcTypeDecl
    echo &"proc `{lc_callback}=`*(control: {cbProcType}, cb: proc ({cbProto}): {cbRet} {{.cdecl.}}) ="
    echoDocString(cbRow["DOC"])
    echo &"  SetCallback(cast[PIhandle](control), \"{callback}\", cast[Icallback](cb))"
    echo &"proc `{lc_callback}`*(control: {cbProcType}): proc ({cbProto}): {cbRet} {{.cdecl.}} ="
    echo &"  return cast[proc ({cbProto}): {cbRet} {{.cdecl.}}](GetCallback(cast[PIhandle](control), \"{callback}\"))"
    echo ""

proc genCtors(controlsSheet: Sheet) =
  echo "# CTORs"
  for row in controlsSheet:
    let
      control = row["IUP"]
      constructor = row["CONSTRUCTOR"]
      callArgs = row["CALL_ARGS"]
      notes = row["NOTES"]

    if constructor.contains("varargs"):
      echo &"macro {control}*(args: varargs[untyped]): {control}_t ="
      if notes != "":
        echoDocString(notes)
      echo "  result = nnkCall.newTree("
      echo "            nnkDotExpr.newTree("
      echo "                newIdentNode(\"niup\"),"
      echo &"                newIdentNode(\"{control}_t\")"
      echo "              ),"
      echo "           )"
      echo "  let inner = nnkCall.newTree("
      echo "                nnkDotExpr.newTree("
      echo "                  newIdentNode(\"niupc\"),"
      echo &"                  newIdentNode(\"{control}\")"
      echo "                )"
      echo "              )"
      echo ""
      echo "  if args.len > 0:"
      echo "    for i in 0 ..< args.len:"
      echo "      inner.add nnkCast.newTree(newIdentNode(\"PIhandle\"), args[i])"
      echo "  inner.add newNilLit()"
      echo "  result.add inner"
    else:
      echo &"proc {control}*({constructor}):{control}_t ="
      if notes != "":
        echoDocString(notes)
      echo &"  return {control}_t(niupc.{control}({callArgs}))"
      echo ""
  echo ""


proc main(filename: string) =
  let doc = loadOds(filename)

  echo "# CONTROLS"
  genTypes(doc["CONTROLS"], "IUPControls_t")
  echo "# CONTAINERS"
  genTypes(doc["CONTAINERS"], "IUPContainers_t")
  echo "# DIALOGS"
  genTypes(doc["DIALOGS"], "IUPDialogs_t")

  echo "type IUPhandle_t* = IUPControls_t | IUPContainers_t | IUPDialogs_t"
  echo ""
  genCtors(doc["CONTROLS"])
  genCtors(doc["CONTAINERS"])
  genCtors(doc["DIALOGS"])

  let attributesMap = initAttributesMap(doc["ATTR_MAP"], "ATTRIBUTE")
  genAttributeProcs(attributesMap, doc["ATTRIBUTES"])

  let callbacksMap = initAttributesMap(doc["CB_MAP"], "CALLBACK")
  genCallbackProcs(callbacksMap, doc["CALLBACKS"])

if isMainModule:
  if paramCount() == 0:
    echo "Usage geniupobj iup-metadata.ods"
    quit(1)

  main(paramStr(1))
