import odsreader
import std/tables
import os
import strformat
import std/sets
import strutils

proc genTypes(controlsSheet: Sheet) =
  var processedControls = OrderedSet[string]()

  echo "type"
  for row in controlsSheet:
    if processedControls.contains(row["IUP"]):
      continue
    processedControls.incl(row["IUP"])
    echo &"  {row[\"IUP\"]}_t* = PIhandle"
  echo ""

proc initAttributesMap(attrMapSheet: Sheet, firstColumnName:string): OrderedTableRef[string, OrderedSet[string]] =
  ## -> {"attribute": {"IUP control", ...}
  var attributesMap = OrderedTableRef[string, OrderedSet[string]]()
  let columns = attrMapSheet.getColumnNames()

  for row in attrMapSheet:
    var controls = OrderedSet[string]()
    for columnName in columns.keys():
      if columnName != firstColumnName and row[columnName] != "":
        controls.incl(columnName)
    attributesMap[row[firstColumnName]] = controls
  return attributesMap

proc getAttrProcType(attribute: string; controls: OrderedSet[string]): (string, string) =
  var controls_t: seq[string]
  for ctrl in controls:
    controls_t.add(&"{ctrl}_t")
  let
    controls_string = join(controls_t, " | ")
    attrType = &"{attribute.toLowerAscii.capitalizeAscii}Types"
  return (attrType, &"type {attrType} = {controls_string}")

proc getSheetRow(sheet:Sheet; column: string; value:string): Row =
  for row in sheet:
    if row[column] == value:
      return row
  raise newException(Exception, &"Row not found: {column} == {value}")

proc echoDocString(doc: string) =
  let lines = doc.split('\n')
  for line in lines:
    echo &"  ## {line.strip()}"

proc genAttributeProcs(attributesMap: OrderedTableRef[string, OrderedSet[string]], attrSheet: Sheet) =
  echo "# ATTRIBUTES"
  for attribute, controls in attributesMap:
    let
      (attrProcType, attrProcTypeDecl) = getAttrProcType(attribute, controls)
      lc_attribute = attribute.toLower
      attrRow = getSheetRow(attrSheet, "ATTRIBUTE", attribute)
    echo attrProcTypeDecl

    if attrRow["READ_WRITE"] != "RO":
      echo &"proc `{lc_attribute}=`*(control: {attrProcType}, value: string) ="
      echoDocString(attrRow["DOC"])
      echo &"  SetAttribute(control, \"{attribute}\", value)"
      echo ""

    if attrRow["READ_WRITE"] != "WO":
      echo &"proc `{lc_attribute}`*(control: {attrProcType}): string ="
      if attrRow["READ_WRITE"] == "RO":
        echoDocString(attrRow["DOC"])
      echo &"  return $GetAttribute(control, \"{attribute}\")"
      echo ""

    if attrRow["ALT_CTOR"] != "":
      let altCall = attrRow["ALT_CALL"].multiReplace(("”", "\""), ("“", "\""))
      echo &"proc `{lc_attribute}=`*(control: {attrProcType}, {attrRow[\"ALT_CTOR\"]}) ="
      echo &"  SetAttribute(control, \"{attribute}\", {altCall})"
      # TODO get attribute - parse string and return tuple?
    echo ""

proc genCallbackProcs(attributesMap: OrderedTableRef[string, OrderedSet[string]], cbSheet: Sheet) =
  echo "# CALLBACKS"
  for callback, controls in attributesMap:
    let
      (cbProcType, cbProcTypeDecl) = getAttrProcType(callback, controls)
      lc_callback = callback.toLower
      cbRow = getSheetRow(cbSheet, "CALLBACK", callback)
      cbProto = cbRow["CB_PROTO"]
      cbRet = cbRow["CB_RET"]
    echo cbProcTypeDecl
    echo &"proc `{lc_callback}=`*(control: {cbProcType}, cb: proc ({cbProto}): {cbRet} {{.cdecl.}}) ="
    echoDocString(cbRow["DOC"])
    echo &"  SetCallback(control, \"{callback}\", cast[Icallback](cb))"
    echo &"proc `{lc_callback}`*(control: {cbProcType}): proc ({cbProto}): {cbRet} {{.cdecl.}} ="
    echo &"  return cast[proc ({cbProto}): {cbRet} {{.cdecl.}}](GetCallback(control, \"{callback}\"))"
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
      echo &"template {control}*({constructor}): {control}_t ="
      if notes != "":
        echoDocString(notes)
      echo &"  when varargsLen(callArgs) > 0:"
      echo &"    {control}_t(unpackVarargs(niupc.{control}, {callArgs}))"
      echo &"  else: {control}_t(niupc.{control}(nil))"
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
  genTypes(doc["CONTROLS"])
  genCtors(doc["CONTROLS"])
  echo "# CONTAINERS"
  genTypes(doc["CONTAINERS"])
  genCtors(doc["CONTAINERS"])
  echo "# DIALOGS"
  genTypes(doc["DIALOGS"])
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
