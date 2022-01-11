## This module implements helper macros, templates and procs to make C API more Nim like

import niup/niupc
import macros

template Open*() =
  ## Initializes IUP library with empty command line arguments
  var argc:cint=0
  var argv:cstringArray=nil
  discard niupc.Open(argc, addr argv)

template InitConfig*(config:PIhandle, appName:string) =
  ## Initializes `config` and sets application name to `appName`
  config = niupc.Config()
  niupc.SetAttribute(config, "APP_NAME", appName)
  discard niupc.ConfigLoad(config)

template SetCallback*(pih: PIhandle, name:string, cb_func: proc) =
  ## Sets callback function on `pih`, with action `name` and callback function `cb_func`.
  ## It casts Nim proc to ``ICallback``
  ##
  ## Generates code:
  ##
  ## .. code-block::
  ##    SetCallback(pih, name.cstring, cast[ICallback](cb_func))
  SetCallback(pih, name.cstring, cast[ICallback](cb_func))

template GetAttributeAsPIhandle*(pih:PIhandle, attr:string): PIhandle =
  ## Gets attribute `attr` from `pih` as ``PIhandle``
  ##
  ## Generates code:
  ##
  ## .. code-block::
  ##    cast[PIhandle](GetAttribute(pih,attr))
  cast[PIhandle](GetAttribute(pih,attr))

template SetAttribute*(pih:PIhandle, attr:string, val:PIhandle) =
  ## Sets `val` ``PIhandle`` as attribute value.
  ##
  ## .. code-block::
  ##    SetAttribute(pih, attr, cast[cstring](val))
  SetAttribute(pih, attr, cast[cstring](val))

template ImageRGBA*(width, height: int, pixmap: openarray[uint8]): PIhandle =
  ## Generates code:
  ##
  ## .. code-block::
  ##    ImageRGBA(width, height, cast[ptr cuchar](unsafeAddr(pixmap)))
  ImageRGBA(width, height, cast[ptr cuchar](unsafeAddr(pixmap)))

type NotBooleanError = object of Exception

proc GetBool*(pih:PIhandle, attr:string): bool {.inline.} =
  ## Return true for **true** values: "1", "YES" or "ON",
  ## return false for "0", "NO" or "OFF"
  let i = GetInt(pih, attr)
  if i == 1:
    return true
  elif i == 0:
    return false
  raise newException(NotBooleanError, "value is not boolean: " & attr & "=" & $i)

macro withPIhandle*(pih: PIhandle, body: untyped): untyped =
  ## SYNTAX
  ##
  ## .. code-block::
  ##    withPIhandle pih:
  ##      "TITLE" "Hello World"             # set attribute "TITLE" "Hello World"
  ##      cb "ACTION" someProcCb            # set callback "ACTION" someProcCb
  ##      callback "ACTION" someProcCb      # same as `cb`
  ##      handle "SOMEATTR" ObjectPIhandle  # set attribute handle
  ##      str "SOMEATTR" someString         # set attribute "SOMEATTR" someString, make internal copy
  ##      int "SOMEATTR" someInt            # set attribute "SOMEATTR" someInt, make internal copy
  ##
  ## `"TITLE" "Hello World"` translates to `SetAttribute(pih, "TITLE", "Hello World")`
  ##
  ## `cb "ACTION" someProcCb` translates to `SetCallback(pih, "ACTION", cast[Icallback](someProcCb))`
  ##
  ## `handle "SOMEATTR" ObjectPIhandle` translates to `SetAttributeHandle(pih, "SOMEATTR", ObjectPIhandle)`
  ##
  ## `str "SOMEATTR" someString` translates to `SetStrAttribute(pih, "SOMEATTR", someString)`
  ##
  ## `int "SOMEATTR" someInt` translates to `SetInt(pih, "SOMEATTR", someInt)`
  ##
  ## EXAMPLE:
  ##
  ## .. code-block::
  ##  multitext =  Text(nil)
  ##  withPIhandle(multitext):
  ##    "MULTILINE" "YES"
  ##    "EXPAND" "YES"
  ##    "NAME" "MULTITEXT"
  ##    "DIRTY" "NO"
  ##    callback "CARET_CB" multitext_caret_cb
  ##    cb "VALUECHANGED_CB" multitext_valuechanged_cb
  ##    cb "DROPFILES_CB" dropfiles_cb

  result = newStmtList()

  for node in body.children:
    if node.kind != nnkCommand:
      error "SYNTAX ERROR: expected Command :" & node.lispRepr

    case node[0].kind:
      of nnkStrLit:
        #SET ATTRIBUTE
        let call = newCall(
          newIdentNode("SetAttribute"),
          newIdentNode(pih.strVal),
          node[0],
          node[1])
        result.add(call)

      of nnkIdent:
        #CALLBACK
        if node[0].strVal == "cb" or node[0].strVal == "callback":
          #StmtList
          #  Call
          #    Ident "SetCallback"
          #    Ident "button"
          #    StrLit "ACTION"
          #    Cast
          #      Ident "ICallback"
          #      Ident "btn_exit_cb"

          let call = newCall(
            newIdentNode("SetCallback"),
            newIdentNode(pih.strVal),       # PIhandle
            node[1][0],                     # callback name, eg. ACTION
            newTree(
              nnkCast,
              newIdentNode("ICallback"),
              node[1][1]
            ))                     # func
          result.add(call)

        #SET ATTRIBUTE HANDLE
        elif node[0].strVal == "handle":
          let call = newCall(
            newIdentNode("SetAttributeHandle"),
            newIdentNode(pih.strVal),       # PIhandle identifier of interface element
            node[1][0],                     # attribute name
            node[1][1]                      # PIhandle named: element to associate using a name
            )
          result.add(call)

        #SET STR ATTRIBUTE
        elif node[0].strVal == "str":
          let call = newCall(
            newIdentNode("SetStrAttribute"),
            newIdentNode(pih.strVal),       # PIhandle identifier of interface element
            node[1][0],                     # attribute name
            node[1][1]                      # PIhandle named: element to associate using a name
            )
          result.add(call)

        #SET INT ATTRIBUTE
        elif node[0].strVal == "int":
          let call = newCall(
            newIdentNode("SetInt"),
            newIdentNode(pih.strVal),       # PIhandle identifier of interface element
            node[1][0],                     # attribute name
            node[1][1]                      # PIhandle named: element to associate using a name
            )
          result.add(call)

        #SYNTAX ERROR
        else:
          error "SYNTAX ERROR: expected [\"ATTRIBUTE\"|str|int|cb|callback|handle]' :" & node.lispRepr
      else:
        error "SYNTAX ERROR: " & node.lispRepr
