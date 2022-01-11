proc Open*(argc: var cint; argv: ptr cstringArray): cint {.cdecl, importc: "IupOpen", dynlib: libiupSONAME, discardable.}
proc Close*() {.cdecl, importc: "IupClose", dynlib: libiupSONAME.}
proc IsOpened*(): cint {.cdecl, importc: "IupIsOpened", dynlib: libiupSONAME, discardable.}
proc ImageLibOpen*() {.cdecl, importc: "IupImageLibOpen", dynlib: libiupimglibSONAME.}
proc MainLoop*(): cint {.cdecl, importc: "IupMainLoop", dynlib: libiupSONAME, discardable.}
proc LoopStep*(): cint {.cdecl, importc: "IupLoopStep", dynlib: libiupSONAME, discardable.}
proc LoopStepWait*(): cint {.cdecl, importc: "IupLoopStepWait", dynlib: libiupSONAME, discardable.}
proc MainLoopLevel*(): cint {.cdecl, importc: "IupMainLoopLevel", dynlib: libiupSONAME, discardable.}
proc Flush*() {.cdecl, importc: "IupFlush", dynlib: libiupSONAME.}
proc ExitLoop*() {.cdecl, importc: "IupExitLoop", dynlib: libiupSONAME.}
proc PostMessage*(ih: PIhandle; s: cstring; i: cint; d: cdouble; p: pointer) {.cdecl, importc: "IupPostMessage", dynlib: libiupSONAME.}
proc RecordInput*(filename: cstring; mode: cint): cint {.cdecl, importc: "IupRecordInput", dynlib: libiupSONAME, discardable.}
proc PlayInput*(filename: cstring): cint {.cdecl, importc: "IupPlayInput", dynlib: libiupSONAME, discardable.}
proc Update*(ih: PIhandle) {.cdecl, importc: "IupUpdate", dynlib: libiupSONAME.}
proc UpdateChildren*(ih: PIhandle) {.cdecl, importc: "IupUpdateChildren", dynlib: libiupSONAME.}
proc Redraw*(ih: PIhandle; children: cint) {.cdecl, importc: "IupRedraw", dynlib: libiupSONAME.}
proc Refresh*(ih: PIhandle) {.cdecl, importc: "IupRefresh", dynlib: libiupSONAME.}
proc RefreshChildren*(ih: PIhandle) {.cdecl, importc: "IupRefreshChildren", dynlib: libiupSONAME.}
proc Execute*(filename: cstring; parameters: cstring): cint {.cdecl, importc: "IupExecute", dynlib: libiupSONAME, discardable.}
proc ExecuteWait*(filename: cstring; parameters: cstring): cint {.cdecl, importc: "IupExecuteWait", dynlib: libiupSONAME, discardable.}
proc Help*(url: cstring): cint {.cdecl, importc: "IupHelp", dynlib: libiupSONAME, discardable.}
proc Log*(`type`: cstring; format: cstring) {.varargs, cdecl, importc: "IupLog", dynlib: libiupSONAME.}
proc Load*(filename: cstring): cstring {.cdecl, importc: "IupLoad", dynlib: libiupSONAME.}
proc LoadBuffer*(buffer: cstring): cstring {.cdecl, importc: "IupLoadBuffer", dynlib: libiupSONAME.}
proc Version*(): cstring {.cdecl, importc: "IupVersion", dynlib: libiupSONAME.}
proc VersionDate*(): cstring {.cdecl, importc: "IupVersionDate", dynlib: libiupSONAME.}
proc VersionNumber*(): cint {.cdecl, importc: "IupVersionNumber", dynlib: libiupSONAME, discardable.}
proc VersionShow*() {.cdecl, importc: "IupVersionShow", dynlib: libiupSONAME.}
proc SetLanguage*(lng: cstring) {.cdecl, importc: "IupSetLanguage", dynlib: libiupSONAME.}
proc GetLanguage*(): cstring {.cdecl, importc: "IupGetLanguage", dynlib: libiupSONAME.}
proc SetLanguageString*(name: cstring; str: cstring) {.cdecl, importc: "IupSetLanguageString", dynlib: libiupSONAME.}
proc StoreLanguageString*(name: cstring; str: cstring) {.cdecl, importc: "IupStoreLanguageString", dynlib: libiupSONAME.}
proc GetLanguageString*(name: cstring): cstring {.cdecl, importc: "IupGetLanguageString", dynlib: libiupSONAME.}
proc SetLanguagePack*(ih: PIhandle) {.cdecl, importc: "IupSetLanguagePack", dynlib: libiupSONAME.}
proc Destroy*(ih: PIhandle) {.cdecl, importc: "IupDestroy", dynlib: libiupSONAME.}
proc Detach*(child: PIhandle) {.cdecl, importc: "IupDetach", dynlib: libiupSONAME.}
proc Append*(ih: PIhandle; child: PIhandle): PIhandle {.cdecl, importc: "IupAppend", dynlib: libiupSONAME.}
proc Insert*(ih: PIhandle; ref_child: PIhandle; child: PIhandle): PIhandle {. cdecl, importc: "IupInsert", dynlib: libiupSONAME.}
proc GetChild*(ih: PIhandle; pos: cint): PIhandle {.cdecl, importc: "IupGetChild", dynlib: libiupSONAME.}
proc GetChildPos*(ih: PIhandle; child: PIhandle): cint {.cdecl, importc: "IupGetChildPos", dynlib: libiupSONAME, discardable.}
proc GetChildCount*(ih: PIhandle): cint {.cdecl, importc: "IupGetChildCount", dynlib: libiupSONAME, discardable.}
proc GetNextChild*(ih: PIhandle; child: PIhandle): PIhandle {.cdecl, importc: "IupGetNextChild", dynlib: libiupSONAME.}
proc GetBrother*(ih: PIhandle): PIhandle {.cdecl, importc: "IupGetBrother", dynlib: libiupSONAME.}
proc GetParent*(ih: PIhandle): PIhandle {.cdecl, importc: "IupGetParent", dynlib: libiupSONAME.}
proc GetDialog*(ih: PIhandle): PIhandle {.cdecl, importc: "IupGetDialog", dynlib: libiupSONAME.}
proc GetDialogChild*(ih: PIhandle; name: cstring): PIhandle {.cdecl, importc: "IupGetDialogChild", dynlib: libiupSONAME.}
proc Reparent*(ih: PIhandle; new_parent: PIhandle; ref_child: PIhandle): cint {. cdecl, importc: "IupReparent", dynlib: libiupSONAME, discardable.}
proc Popup*(ih: PIhandle; x: cint; y: cint): cint {.cdecl, importc: "IupPopup", dynlib: libiupSONAME, discardable.}
proc Show*(ih: PIhandle): cint {.cdecl, importc: "IupShow", dynlib: libiupSONAME, discardable.}
proc ShowXY*(ih: PIhandle; x: cint; y: cint): cint {.cdecl, importc: "IupShowXY", dynlib: libiupSONAME, discardable.}
proc Hide*(ih: PIhandle): cint {.cdecl, importc: "IupHide", dynlib: libiupSONAME, discardable.}
proc Map*(ih: PIhandle): cint {.cdecl, importc: "IupMap", dynlib: libiupSONAME, discardable.}
proc Unmap*(ih: PIhandle) {.cdecl, importc: "IupUnmap", dynlib: libiupSONAME.}
proc ResetAttribute*(ih: PIhandle; name: cstring) {.cdecl, importc: "IupResetAttribute", dynlib: libiupSONAME.}
proc GetAllAttributes*(ih: PIhandle; names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllAttributes", dynlib: libiupSONAME, discardable.}
proc CopyAttributes*(src_ih: PIhandle; dst_ih: PIhandle) {.cdecl, importc: "IupCopyAttributes", dynlib: libiupSONAME.}
proc SetAtt*(handle_name: cstring; ih: PIhandle; name: cstring): PIhandle {.varargs, cdecl, importc: "IupSetAtt", dynlib: libiupSONAME.}
proc SetAttributes*(ih: PIhandle; str: cstring): PIhandle {.cdecl, importc: "IupSetAttributes", dynlib: libiupSONAME, discardable.}
proc GetAttributes*(ih: PIhandle): cstring {.cdecl, importc: "IupGetAttributes", dynlib: libiupSONAME.}
proc SetAttribute*(ih: PIhandle; name: cstring; value: cstring) {.cdecl, importc: "IupSetAttribute", dynlib: libiupSONAME.}
proc SetStrAttribute*(ih: PIhandle; name: cstring; value: cstring) {.cdecl, importc: "IupSetStrAttribute", dynlib: libiupSONAME.}
proc SetStrf*(ih: PIhandle; name: cstring; format: cstring) {.varargs, cdecl, importc: "IupSetStrf", dynlib: libiupSONAME.}
proc SetInt*(ih: PIhandle; name: cstring; value: cint) {.cdecl, importc: "IupSetInt", dynlib: libiupSONAME.}
proc SetFloat*(ih: PIhandle; name: cstring; value: cfloat) {.cdecl, importc: "IupSetFloat", dynlib: libiupSONAME.}
proc SetDouble*(ih: PIhandle; name: cstring; value: cdouble) {.cdecl, importc: "IupSetDouble", dynlib: libiupSONAME.}
proc SetRGB*(ih: PIhandle; name: cstring; r: uint8; g: uint8; b: uint8) {.cdecl, importc: "IupSetRGB", dynlib: libiupSONAME.}
proc SetRGBA*(ih: PIhandle; name: cstring; r: uint8; g: uint8; b: uint8; a: uint8) {. cdecl, importc: "IupSetRGBA", dynlib: libiupSONAME.}
proc GetAttribute*(ih: PIhandle; name: cstring): cstring {.cdecl, importc: "IupGetAttribute", dynlib: libiupSONAME.}
proc GetInt*(ih: PIhandle; name: cstring): cint {.cdecl, importc: "IupGetInt", dynlib: libiupSONAME, discardable.}
proc GetInt2*(ih: PIhandle; name: cstring): cint {.cdecl, importc: "IupGetInt2", dynlib: libiupSONAME, discardable.}
proc GetIntInt*(ih: PIhandle; name: cstring; i1: var cint; i2: var cint): cint {.cdecl, importc: "IupGetIntInt", dynlib: libiupSONAME, discardable.}
proc GetFloat*(ih: PIhandle; name: cstring): cfloat {.cdecl, importc: "IupGetFloat", dynlib: libiupSONAME.}
proc GetDouble*(ih: PIhandle; name: cstring): cdouble {.cdecl, importc: "IupGetDouble", dynlib: libiupSONAME.}
proc GetRGB*(ih: PIhandle; name: cstring; r: ptr uint8; g: ptr uint8; b: ptr uint8) {. cdecl, importc: "IupGetRGB", dynlib: libiupSONAME.}
proc GetRGBA*(ih: PIhandle; name: cstring; r: ptr uint8; g: ptr uint8; b: ptr uint8; a: ptr uint8) {.cdecl, importc: "IupGetRGBA", dynlib: libiupSONAME.}
proc SetAttributeId*(ih: PIhandle; name: cstring; id: cint; value: cstring) {.cdecl, importc: "IupSetAttributeId", dynlib: libiupSONAME.}
proc SetStrAttributeId*(ih: PIhandle; name: cstring; id: cint; value: cstring) {.cdecl, importc: "IupSetStrAttributeId", dynlib: libiupSONAME.}
proc SetStrfId*(ih: PIhandle; name: cstring; id: cint; format: cstring) {.varargs, cdecl, importc: "IupSetStrfId", dynlib: libiupSONAME.}
proc SetIntId*(ih: PIhandle; name: cstring; id: cint; value: cint) {.cdecl, importc: "IupSetIntId", dynlib: libiupSONAME.}
proc SetFloatId*(ih: PIhandle; name: cstring; id: cint; value: cfloat) {.cdecl, importc: "IupSetFloatId", dynlib: libiupSONAME.}
proc SetDoubleId*(ih: PIhandle; name: cstring; id: cint; value: cdouble) {.cdecl, importc: "IupSetDoubleId", dynlib: libiupSONAME.}
proc SetRGBId*(ih: PIhandle; name: cstring; id: cint; r: uint8; g: uint8; b: uint8) {. cdecl, importc: "IupSetRGBId", dynlib: libiupSONAME.}
proc GetAttributeId*(ih: PIhandle; name: cstring; id: cint): cstring {.cdecl, importc: "IupGetAttributeId", dynlib: libiupSONAME.}
proc GetIntId*(ih: PIhandle; name: cstring; id: cint): cint {.cdecl, importc: "IupGetIntId", dynlib: libiupSONAME, discardable.}
proc GetFloatId*(ih: PIhandle; name: cstring; id: cint): cfloat {.cdecl, importc: "IupGetFloatId", dynlib: libiupSONAME.}
proc GetDoubleId*(ih: PIhandle; name: cstring; id: cint): cdouble {.cdecl, importc: "IupGetDoubleId", dynlib: libiupSONAME.}
proc GetRGBId*(ih: PIhandle; name: cstring; id: cint; r: ptr uint8; g: ptr uint8; b: ptr uint8) {.cdecl, importc: "IupGetRGBId", dynlib: libiupSONAME.}
proc SetAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cstring) {. cdecl, importc: "IupSetAttributeId2", dynlib: libiupSONAME.}
proc SetStrAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cstring) {.cdecl, importc: "IupSetStrAttributeId2", dynlib: libiupSONAME.}
proc SetStrfId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; format: cstring) {. varargs, cdecl, importc: "IupSetStrfId2", dynlib: libiupSONAME.}
proc SetIntId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cint) {.cdecl, importc: "IupSetIntId2", dynlib: libiupSONAME.}
proc SetFloatId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cfloat) {. cdecl, importc: "IupSetFloatId2", dynlib: libiupSONAME.}
proc SetDoubleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cdouble) {. cdecl, importc: "IupSetDoubleId2", dynlib: libiupSONAME.}
proc SetRGBId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; r: uint8; g: uint8; b: uint8) {.cdecl, importc: "IupSetRGBId2", dynlib: libiupSONAME.}
proc GetAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cstring {. cdecl, importc: "IupGetAttributeId2", dynlib: libiupSONAME.}
proc GetIntId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cint {.cdecl, importc: "IupGetIntId2", dynlib: libiupSONAME, discardable.}
proc GetFloatId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cfloat {.cdecl, importc: "IupGetFloatId2", dynlib: libiupSONAME.}
proc GetDoubleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cdouble {.cdecl, importc: "IupGetDoubleId2", dynlib: libiupSONAME.}
proc GetRGBId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; r: ptr uint8; g: ptr uint8; b: ptr uint8) {.cdecl, importc: "IupGetRGBId2", dynlib: libiupSONAME.}
proc SetGlobal*(name: cstring; value: cstring) {.cdecl, importc: "IupSetGlobal", dynlib: libiupSONAME.}
proc SetStrGlobal*(name: cstring; value: cstring) {.cdecl, importc: "IupSetStrGlobal", dynlib: libiupSONAME.}
proc GetGlobal*(name: cstring): cstring {.cdecl, importc: "IupGetGlobal", dynlib: libiupSONAME.}
proc SetFocus*(ih: PIhandle): PIhandle {.cdecl, importc: "IupSetFocus", dynlib: libiupSONAME, discardable.}
proc GetFocus*(): PIhandle {.cdecl, importc: "IupGetFocus", dynlib: libiupSONAME.}
proc PreviousField*(ih: PIhandle): PIhandle {.cdecl, importc: "IupPreviousField", dynlib: libiupSONAME.}
proc NextField*(ih: PIhandle): PIhandle {.cdecl, importc: "IupNextField", dynlib: libiupSONAME.}
proc GetCallback*(ih: PIhandle; name: cstring): Icallback {.cdecl, importc: "IupGetCallback", dynlib: libiupSONAME.}
proc SetCallback*(ih: PIhandle; name: cstring; `func`: Icallback): Icallback {.cdecl, importc: "IupSetCallback", dynlib: libiupSONAME, discardable.}
proc SetCallbacks*(ih: PIhandle; name: cstring; `func`: Icallback): PIhandle {. varargs, cdecl, importc: "IupSetCallbacks", dynlib: libiupSONAME, discardable.}
proc GetFunction*(name: cstring): Icallback {.cdecl, importc: "IupGetFunction", dynlib: libiupSONAME.}
proc SetFunction*(name: cstring; `func`: Icallback): Icallback {.cdecl, importc: "IupSetFunction", dynlib: libiupSONAME, discardable.}
proc GetHandle*(name: cstring): PIhandle {.cdecl, importc: "IupGetHandle", dynlib: libiupSONAME.}
proc SetHandle*(name: cstring; ih: PIhandle): PIhandle {.cdecl, importc: "IupSetHandle", dynlib: libiupSONAME, discardable.}
proc GetAllNames*(names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllNames", dynlib: libiupSONAME, discardable.}
proc GetAllDialogs*(names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllDialogs", dynlib: libiupSONAME, discardable.}
proc GetName*(ih: PIhandle): cstring {.cdecl, importc: "IupGetName", dynlib: libiupSONAME.}
proc SetAttributeHandle*(ih: PIhandle; name: cstring; ih_named: PIhandle) {.cdecl, importc: "IupSetAttributeHandle", dynlib: libiupSONAME.}
proc GetAttributeHandle*(ih: PIhandle; name: cstring): PIhandle {.cdecl, importc: "IupGetAttributeHandle", dynlib: libiupSONAME.}
proc SetAttributeHandleId*(ih: PIhandle; name: cstring; id: cint; ih_named: PIhandle) {.cdecl, importc: "IupSetAttributeHandleId", dynlib: libiupSONAME.}
proc GetAttributeHandleId*(ih: PIhandle; name: cstring; id: cint): PIhandle {.cdecl, importc: "IupGetAttributeHandleId", dynlib: libiupSONAME.}
proc SetAttributeHandleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; ih_named: PIhandle) {.cdecl, importc: "IupSetAttributeHandleId2", dynlib: libiupSONAME.}
proc GetAttributeHandleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): PIhandle {. cdecl, importc: "IupGetAttributeHandleId2", dynlib: libiupSONAME.}
proc GetClassName*(ih: PIhandle): cstring {.cdecl, importc: "IupGetClassName", dynlib: libiupSONAME.}
proc GetClassType*(ih: PIhandle): cstring {.cdecl, importc: "IupGetClassType", dynlib: libiupSONAME.}
proc GetAllClasses*(names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllClasses", dynlib: libiupSONAME, discardable.}
proc GetClassAttributes*(classname: cstring; names: cstringArray; n: cint): cint {. cdecl, importc: "IupGetClassAttributes", dynlib: libiupSONAME, discardable.}
proc GetClassCallbacks*(classname: cstring; names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetClassCallbacks", dynlib: libiupSONAME, discardable.}
proc SaveClassAttributes*(ih: PIhandle) {.cdecl, importc: "IupSaveClassAttributes", dynlib: libiupSONAME.}
proc CopyClassAttributes*(src_ih: PIhandle; dst_ih: PIhandle) {.cdecl, importc: "IupCopyClassAttributes", dynlib: libiupSONAME.}
proc SetClassDefaultAttribute*(classname: cstring; name: cstring; value: cstring) {. cdecl, importc: "IupSetClassDefaultAttribute", dynlib: libiupSONAME.}
proc ClassMatch*(ih: PIhandle; classname: cstring): cint {.cdecl, importc: "IupClassMatch", dynlib: libiupSONAME, discardable.}
proc Create*(classname: cstring): PIhandle {.cdecl, importc: "IupCreate", dynlib: libiupSONAME.}
proc Createv*(classname: cstring; params: ptr pointer): PIhandle {.cdecl, importc: "IupCreatev", dynlib: libiupSONAME.}
proc Createp*(classname: cstring; first: pointer): PIhandle {.varargs, cdecl, importc: "IupCreatep", dynlib: libiupSONAME.}
proc Fill*(): PIhandle {.cdecl, importc: "IupFill", dynlib: libiupSONAME.}
proc Space*(): PIhandle {.cdecl, importc: "IupSpace", dynlib: libiupSONAME.}
proc Radio*(child: PIhandle): PIhandle {.cdecl, importc: "IupRadio", dynlib: libiupSONAME.}
proc Vbox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupVbox", dynlib: libiupSONAME.}
proc Vboxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupVboxv", dynlib: libiupSONAME.}
proc Zbox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupZbox", dynlib: libiupSONAME.}
proc Zboxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupZboxv", dynlib: libiupSONAME.}
proc Hbox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupHbox", dynlib: libiupSONAME.}
proc Hboxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupHboxv", dynlib: libiupSONAME.}
proc Normalizer*(ih_first: PIhandle): PIhandle {.varargs, cdecl, importc: "IupNormalizer", dynlib: libiupSONAME.}
proc Normalizerv*(ih_list: ptr PIhandle): PIhandle {.cdecl, importc: "IupNormalizerv", dynlib: libiupSONAME.}
proc Cbox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupCbox", dynlib: libiupSONAME.}
proc Cboxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupCboxv", dynlib: libiupSONAME.}
proc Sbox*(child: PIhandle): PIhandle {.cdecl, importc: "IupSbox", dynlib: libiupSONAME.}
proc Split*(child1: PIhandle; child2: PIhandle): PIhandle {.cdecl, importc: "IupSplit", dynlib: libiupSONAME.}
proc ScrollBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupScrollBox", dynlib: libiupSONAME.}
proc FlatScrollBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupFlatScrollBox", dynlib: libiupSONAME.}
proc GridBox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupGridBox", dynlib: libiupSONAME.}
proc GridBoxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupGridBoxv", dynlib: libiupSONAME.}
proc MultiBox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupMultiBox", dynlib: libiupSONAME.}
proc MultiBoxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupMultiBoxv", dynlib: libiupSONAME.}
proc Expander*(child: PIhandle): PIhandle {.cdecl, importc: "IupExpander", dynlib: libiupSONAME.}
proc DetachBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupDetachBox", dynlib: libiupSONAME.}
proc BackgroundBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupBackgroundBox", dynlib: libiupSONAME.}
proc Frame*(child: PIhandle): PIhandle {.cdecl, importc: "IupFrame", dynlib: libiupSONAME.}
proc FlatFrame*(child: PIhandle): PIhandle {.cdecl, importc: "IupFlatFrame", dynlib: libiupSONAME.}
proc Image*(width: cint; height: cint; pixels: ptr uint8): PIhandle {.cdecl, importc: "IupImage", dynlib: libiupSONAME.}
proc ImageRGB*(width: cint; height: cint; pixels: ptr uint8): PIhandle {.cdecl, importc: "IupImageRGB", dynlib: libiupSONAME.}
proc ImageRGBA*(width: cint; height: cint; pixels: ptr uint8): PIhandle {.cdecl, importc: "IupImageRGBA", dynlib: libiupSONAME.}
proc Item*(title: cstring; action: cstring): PIhandle {.cdecl, importc: "IupItem", dynlib: libiupSONAME.}
proc Submenu*(title: cstring; child: PIhandle): PIhandle {.cdecl, importc: "IupSubmenu", dynlib: libiupSONAME.}
proc Separator*(): PIhandle {.cdecl, importc: "IupSeparator", dynlib: libiupSONAME.}
proc Menu*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupMenu", dynlib: libiupSONAME.}
proc Menuv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupMenuv", dynlib: libiupSONAME.}
proc Button*(title: cstring; action: cstring): PIhandle {.cdecl, importc: "IupButton", dynlib: libiupSONAME.}
proc FlatButton*(title: cstring): PIhandle {.cdecl, importc: "IupFlatButton", dynlib: libiupSONAME.}
proc FlatToggle*(title: cstring): PIhandle {.cdecl, importc: "IupFlatToggle", dynlib: libiupSONAME.}
proc DropButton*(dropchild: PIhandle): PIhandle {.cdecl, importc: "IupDropButton", dynlib: libiupSONAME.}
proc FlatLabel*(title: cstring): PIhandle {.cdecl, importc: "IupFlatLabel", dynlib: libiupSONAME.}
proc FlatSeparator*(): PIhandle {.cdecl, importc: "IupFlatSeparator", dynlib: libiupSONAME.}
proc Canvas*(action: cstring): PIhandle {.cdecl, importc: "IupCanvas", dynlib: libiupSONAME.}
proc Dialog*(child: PIhandle): PIhandle {.cdecl, importc: "IupDialog", dynlib: libiupSONAME.}
proc User*(): PIhandle {.cdecl, importc: "IupUser", dynlib: libiupSONAME.}
proc Thread*(): PIhandle {.cdecl, importc: "IupThread", dynlib: libiupSONAME.}
proc Label*(title: cstring): PIhandle {.cdecl, importc: "IupLabel", dynlib: libiupSONAME.}
proc List*(action: cstring): PIhandle {.cdecl, importc: "IupList", dynlib: libiupSONAME.}
proc FlatList*(): PIhandle {.cdecl, importc: "IupFlatList", dynlib: libiupSONAME.}
proc Text*(action: cstring): PIhandle {.cdecl, importc: "IupText", dynlib: libiupSONAME.}
proc MultiLine*(action: cstring): PIhandle {.cdecl, importc: "IupMultiLine", dynlib: libiupSONAME.}
proc Toggle*(title: cstring; action: cstring): PIhandle {.cdecl, importc: "IupToggle", dynlib: libiupSONAME.}
proc Timer*(): PIhandle {.cdecl, importc: "IupTimer", dynlib: libiupSONAME.}
proc Clipboard*(): PIhandle {.cdecl, importc: "IupClipboard", dynlib: libiupSONAME.}
proc ProgressBar*(): PIhandle {.cdecl, importc: "IupProgressBar", dynlib: libiupSONAME.}
proc Val*(`type`: cstring): PIhandle {.cdecl, importc: "IupVal", dynlib: libiupSONAME.}
proc FlatVal*(`type`: cstring): PIhandle {.cdecl, importc: "IupFlatVal", dynlib: libiupSONAME.}
proc FlatTree*(): PIhandle {.cdecl, importc: "IupFlatTree", dynlib: libiupSONAME.}
proc Tabs*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupTabs", dynlib: libiupSONAME.}
proc Tabsv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupTabsv", dynlib: libiupSONAME.}
proc FlatTabs*(first: PIhandle): PIhandle {.varargs, cdecl, importc: "IupFlatTabs", dynlib: libiupSONAME.}
proc FlatTabsv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupFlatTabsv", dynlib: libiupSONAME.}
proc Tree*(): PIhandle {.cdecl, importc: "IupTree", dynlib: libiupSONAME.}
proc Link*(url: cstring; title: cstring): PIhandle {.cdecl, importc: "IupLink", dynlib: libiupSONAME.}
proc AnimatedLabel*(animation: PIhandle): PIhandle {.cdecl, importc: "IupAnimatedLabel", dynlib: libiupSONAME.}
proc DatePick*(): PIhandle {.cdecl, importc: "IupDatePick", dynlib: libiupSONAME.}
proc Calendar*(): PIhandle {.cdecl, importc: "IupCalendar", dynlib: libiupSONAME.}
proc Colorbar*(): PIhandle {.cdecl, importc: "IupColorbar", dynlib: libiupSONAME.}
proc Gauge*(): PIhandle {.cdecl, importc: "IupGauge", dynlib: libiupSONAME.}
proc Dial*(`type`: cstring): PIhandle {.cdecl, importc: "IupDial", dynlib: libiupSONAME.}
proc ColorBrowser*(): PIhandle {.cdecl, importc: "IupColorBrowser", dynlib: libiupSONAME.}
proc Spin*(): PIhandle {.cdecl, importc: "IupSpin", dynlib: libiupSONAME.}
proc Spinbox*(child: PIhandle): PIhandle {.cdecl, importc: "IupSpinbox", dynlib: libiupSONAME.}
proc StringCompare*(str1: cstring; str2: cstring; casesensitive: cint; lexicographic: cint): cint {.cdecl, importc: "IupStringCompare", dynlib: libiupSONAME, discardable.}
proc SaveImageAsText*(ih: PIhandle; filename: cstring; format: cstring; name: cstring): cint {. cdecl, importc: "IupSaveImageAsText", dynlib: libiupimSONAME, discardable.}
proc ImageGetHandle*(name: cstring): PIhandle {.cdecl, importc: "IupImageGetHandle", dynlib: libiupSONAME.}
proc TextConvertLinColToPos*(ih: PIhandle; lin: cint; col: cint; pos: var cint) {.cdecl, importc: "IupTextConvertLinColToPos", dynlib: libiupSONAME.}
proc TextConvertPosToLinCol*(ih: PIhandle; pos: cint; lin: var cint; col: var cint) {. cdecl, importc: "IupTextConvertPosToLinCol", dynlib: libiupSONAME.}
proc ConvertXYToPos*(ih: PIhandle; x: cint; y: cint): cint {.cdecl, importc: "IupConvertXYToPos", dynlib: libiupSONAME, discardable.}
proc StoreGlobal*(name: cstring; value: cstring) {.cdecl, importc: "IupStoreGlobal", dynlib: libiupSONAME.}
proc StoreAttribute*(ih: PIhandle; name: cstring; value: cstring) {.cdecl, importc: "IupStoreAttribute", dynlib: libiupSONAME.}
proc SetfAttribute*(ih: PIhandle; name: cstring; format: cstring) {.varargs, cdecl, importc: "IupSetfAttribute", dynlib: libiupSONAME.}
proc StoreAttributeId*(ih: PIhandle; name: cstring; id: cint; value: cstring) {.cdecl, importc: "IupStoreAttributeId", dynlib: libiupSONAME.}
proc SetfAttributeId*(ih: PIhandle; name: cstring; id: cint; f: cstring) {.varargs, cdecl, importc: "IupSetfAttributeId", dynlib: libiupSONAME.}
proc StoreAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cstring) {.cdecl, importc: "IupStoreAttributeId2", dynlib: libiupSONAME.}
proc SetfAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; format: cstring) {.varargs, cdecl, importc: "IupSetfAttributeId2", dynlib: libiupSONAME.}
proc TreeSetUserId*(ih: PIhandle; id: cint; userid: pointer): cint {.cdecl, importc: "IupTreeSetUserId", dynlib: libiupSONAME, discardable.}
proc TreeGetUserId*(ih: PIhandle; id: cint): pointer {.cdecl, importc: "IupTreeGetUserId", dynlib: libiupSONAME.}
proc TreeGetId*(ih: PIhandle; userid: pointer): cint {.cdecl, importc: "IupTreeGetId", dynlib: libiupSONAME, discardable.}
proc TreeSetAttributeHandle*(ih: PIhandle; name: cstring; id: cint; ih_named: PIhandle) {.cdecl, importc: "IupTreeSetAttributeHandle", dynlib: libiupSONAME.}
proc FileDlg*(): PIhandle {.cdecl, importc: "IupFileDlg", dynlib: libiupSONAME.}
proc MessageDlg*(): PIhandle {.cdecl, importc: "IupMessageDlg", dynlib: libiupSONAME.}
proc ColorDlg*(): PIhandle {.cdecl, importc: "IupColorDlg", dynlib: libiupSONAME.}
proc FontDlg*(): PIhandle {.cdecl, importc: "IupFontDlg", dynlib: libiupSONAME.}
proc ProgressDlg*(): PIhandle {.cdecl, importc: "IupProgressDlg", dynlib: libiupSONAME.}
proc GetFile*(arq: cstring): cint {.cdecl, importc: "IupGetFile", dynlib: libiupSONAME, discardable.}
proc Message*(title: cstring; msg: cstring) {.cdecl, importc: "IupMessage", dynlib: libiupSONAME.}
proc Messagef*(title: cstring; format: cstring) {.varargs, cdecl, importc: "IupMessagef", dynlib: libiupSONAME.}
proc MessageError*(parent: PIhandle; message: cstring) {.cdecl, importc: "IupMessageError", dynlib: libiupSONAME.}
proc MessageAlarm*(parent: PIhandle; title: cstring; message: cstring; buttons: cstring): cint {.cdecl, importc: "IupMessageAlarm", dynlib: libiupSONAME, discardable.}
proc Alarm*(title: cstring; msg: cstring; b1: cstring; b2: cstring; b3: cstring): cint {. cdecl, importc: "IupAlarm", dynlib: libiupSONAME, discardable.}
proc Scanf*(format: cstring): cint {.varargs, cdecl, importc: "IupScanf", dynlib: libiupSONAME, discardable.}
proc ListDialog*(`type`: cint; title: cstring; size: cint; list: cstringArray; op: cint; max_col: cint; max_lin: cint; marks: var cint): cint {.cdecl, importc: "IupListDialog", dynlib: libiupSONAME, discardable.}
proc GetText*(title: cstring; text: cstring; maxsize: cint): cint {.cdecl, importc: "IupGetText", dynlib: libiupSONAME, discardable.}
proc GetColor*(x: cint; y: cint; r: ptr uint8; g: ptr uint8; b: ptr uint8): cint {.cdecl, importc: "IupGetColor", dynlib: libiupSONAME, discardable.}
proc GetParam*(title: cstring; action: Iparamcb; user_data: pointer; format: cstring): cint {. varargs, cdecl, importc: "IupGetParam", dynlib: libiupSONAME, discardable.}
proc GetParamv*(title: cstring; action: Iparamcb; user_data: pointer; format: cstring; param_count: cint; param_extra: cint; param_data: ptr pointer): cint {. cdecl, importc: "IupGetParamv", dynlib: libiupSONAME, discardable.}
proc Param*(format: cstring): PIhandle {.cdecl, importc: "IupParam", dynlib: libiupSONAME.}
proc ParamBox*(param: PIhandle): PIhandle {.varargs, cdecl, importc: "IupParamBox", dynlib: libiupSONAME.}
proc ParamBoxv*(param_array: ptr PIhandle): PIhandle {.cdecl, importc: "IupParamBoxv", dynlib: libiupSONAME.}
proc LayoutDialog*(dialog: PIhandle): PIhandle {.cdecl, importc: "IupLayoutDialog", dynlib: libiupSONAME.}
proc ElementPropertiesDialog*(parent: PIhandle; elem: PIhandle): PIhandle {. cdecl, importc: "IupElementPropertiesDialog", dynlib: libiupSONAME.}
proc GlobalsDialog*(): PIhandle {.cdecl, importc: "IupGlobalsDialog", dynlib: libiupSONAME.}
proc ClassInfoDialog*(parent: PIhandle): PIhandle {.cdecl, importc: "IupClassInfoDialog", dynlib: libiupSONAME.}
proc Config*(): PIhandle {.cdecl, importc: "IupConfig", dynlib: libiupSONAME.}
proc ConfigLoad*(ih: PIhandle): cint {.cdecl, importc: "IupConfigLoad", dynlib: libiupSONAME, discardable.}
proc ConfigSave*(ih: PIhandle): cint {.cdecl, importc: "IupConfigSave", dynlib: libiupSONAME, discardable.}
proc ConfigSetVariableStr*(ih: PIhandle; group: cstring; key: cstring; value: cstring) {. cdecl, importc: "IupConfigSetVariableStr", dynlib: libiupSONAME.}
proc ConfigSetVariableStrId*(ih: PIhandle; group: cstring; key: cstring; id: cint; value: cstring) {.cdecl, importc: "IupConfigSetVariableStrId", dynlib: libiupSONAME.}
proc ConfigSetVariableInt*(ih: PIhandle; group: cstring; key: cstring; value: cint) {. cdecl, importc: "IupConfigSetVariableInt", dynlib: libiupSONAME.}
proc ConfigSetVariableIntId*(ih: PIhandle; group: cstring; key: cstring; id: cint; value: cint) {.cdecl, importc: "IupConfigSetVariableIntId", dynlib: libiupSONAME.}
proc ConfigSetVariableDouble*(ih: PIhandle; group: cstring; key: cstring; value: cdouble) {.cdecl, importc: "IupConfigSetVariableDouble", dynlib: libiupSONAME.}
proc ConfigSetVariableDoubleId*(ih: PIhandle; group: cstring; key: cstring; id: cint; value: cdouble) {.cdecl, importc: "IupConfigSetVariableDoubleId", dynlib: libiupSONAME.}
proc ConfigGetVariableStr*(ih: PIhandle; group: cstring; key: cstring): cstring {. cdecl, importc: "IupConfigGetVariableStr", dynlib: libiupSONAME.}
proc ConfigGetVariableStrId*(ih: PIhandle; group: cstring; key: cstring; id: cint): cstring {. cdecl, importc: "IupConfigGetVariableStrId", dynlib: libiupSONAME.}
proc ConfigGetVariableInt*(ih: PIhandle; group: cstring; key: cstring): cint {.cdecl, importc: "IupConfigGetVariableInt", dynlib: libiupSONAME, discardable.}
proc ConfigGetVariableIntId*(ih: PIhandle; group: cstring; key: cstring; id: cint): cint {. cdecl, importc: "IupConfigGetVariableIntId", dynlib: libiupSONAME, discardable.}
proc ConfigGetVariableDouble*(ih: PIhandle; group: cstring; key: cstring): cdouble {. cdecl, importc: "IupConfigGetVariableDouble", dynlib: libiupSONAME.}
proc ConfigGetVariableDoubleId*(ih: PIhandle; group: cstring; key: cstring; id: cint): cdouble {. cdecl, importc: "IupConfigGetVariableDoubleId", dynlib: libiupSONAME.}
proc ConfigGetVariableStrDef*(ih: PIhandle; group: cstring; key: cstring; def: cstring): cstring {.cdecl, importc: "IupConfigGetVariableStrDef", dynlib: libiupSONAME.}
proc ConfigGetVariableStrIdDef*(ih: PIhandle; group: cstring; key: cstring; id: cint; def: cstring): cstring {.cdecl, importc: "IupConfigGetVariableStrIdDef", dynlib: libiupSONAME.}
proc ConfigGetVariableIntDef*(ih: PIhandle; group: cstring; key: cstring; def: cint): cint {. cdecl, importc: "IupConfigGetVariableIntDef", dynlib: libiupSONAME, discardable.}
proc ConfigGetVariableIntIdDef*(ih: PIhandle; group: cstring; key: cstring; id: cint; def: cint): cint {.cdecl, importc: "IupConfigGetVariableIntIdDef", dynlib: libiupSONAME, discardable.}
proc ConfigGetVariableDoubleDef*(ih: PIhandle; group: cstring; key: cstring; def: cdouble): cdouble {.cdecl, importc: "IupConfigGetVariableDoubleDef", dynlib: libiupSONAME.}
proc ConfigGetVariableDoubleIdDef*(ih: PIhandle; group: cstring; key: cstring; id: cint; def: cdouble): cdouble {.cdecl, importc: "IupConfigGetVariableDoubleIdDef", dynlib: libiupSONAME.}
proc ConfigCopy*(ih1: PIhandle; ih2: PIhandle; exclude_prefix: cstring) {.cdecl, importc: "IupConfigCopy", dynlib: libiupSONAME.}
proc ConfigSetListVariable*(ih: PIhandle; group: cstring; key: cstring; value: cstring; add: cint) {.cdecl, importc: "IupConfigSetListVariable", dynlib: libiupSONAME.}
proc ConfigRecentInit*(ih: PIhandle; menu: PIhandle; recent_cb: Icallback; max_recent: cint) {.cdecl, importc: "IupConfigRecentInit", dynlib: libiupSONAME.}
proc ConfigRecentUpdate*(ih: PIhandle; filename: cstring) {.cdecl, importc: "IupConfigRecentUpdate", dynlib: libiupSONAME.}
proc ConfigDialogShow*(ih: PIhandle; dialog: PIhandle; name: cstring) {.cdecl, importc: "IupConfigDialogShow", dynlib: libiupSONAME.}
proc ConfigDialogClosed*(ih: PIhandle; dialog: PIhandle; name: cstring) {.cdecl, importc: "IupConfigDialogClosed", dynlib: libiupSONAME.}
proc ControlsOpen*(): cint {.cdecl, importc: "IupControlsOpen", dynlib: libiupcontrolsSONAME, discardable.}
proc Cells*(): PIhandle {.cdecl, importc: "IupCells", dynlib: libiupcontrolsSONAME.}
proc Matrix*(action: cstring): PIhandle {.cdecl, importc: "IupMatrix", dynlib: libiupcontrolsSONAME.}
proc MatrixList*(): PIhandle {.cdecl, importc: "IupMatrixList", dynlib: libiupcontrolsSONAME.}
proc MatrixEx*(): PIhandle {.cdecl, importc: "IupMatrixEx", dynlib: libiupcontrolsSONAME.}
proc MatrixSetFormula*(ih: PIhandle; col: cint; formula: cstring; init: cstring) {. cdecl, importc: "IupMatrixSetFormula", dynlib: libiupcontrolsSONAME.}
proc MatrixSetDynamic*(ih: PIhandle; init: cstring) {.cdecl, importc: "IupMatrixSetDynamic", dynlib: libiupcontrolsSONAME.}
proc cdContextIupDraw*(): ptr cdContext {.cdecl, importc: "cdContextIupDraw", dynlib: libiupSONAME.}
proc DrawBegin*(ih: PIhandle) {.cdecl, importc: "IupDrawBegin", dynlib: libiupSONAME.}
proc DrawEnd*(ih: PIhandle) {.cdecl, importc: "IupDrawEnd", dynlib: libiupSONAME.}
proc DrawSetClipRect*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "IupDrawSetClipRect", dynlib: libiupSONAME.}
proc DrawGetClipRect*(ih: PIhandle; x1: var cint; y1: var cint; x2: var cint; y2: var cint) {. cdecl, importc: "IupDrawGetClipRect", dynlib: libiupSONAME.}
proc DrawResetClip*(ih: PIhandle) {.cdecl, importc: "IupDrawResetClip", dynlib: libiupSONAME.}
proc DrawParentBackground*(ih: PIhandle) {.cdecl, importc: "IupDrawParentBackground", dynlib: libiupSONAME.}
proc DrawLine*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "IupDrawLine", dynlib: libiupSONAME.}
proc DrawRectangle*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "IupDrawRectangle", dynlib: libiupSONAME.}
proc DrawArc*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint; a1: cdouble; a2: cdouble) {.cdecl, importc: "IupDrawArc", dynlib: libiupSONAME.}
proc DrawPolygon*(ih: PIhandle; points: var cint; count: cint) {.cdecl, importc: "IupDrawPolygon", dynlib: libiupSONAME.}
proc DrawText*(ih: PIhandle; text: cstring; len: cint; x: cint; y: cint; w: cint; h: cint) {. cdecl, importc: "IupDrawText", dynlib: libiupSONAME.}
proc DrawImage*(ih: PIhandle; name: cstring; x: cint; y: cint; w: cint; h: cint) {.cdecl, importc: "IupDrawImage", dynlib: libiupSONAME.}
proc DrawSelectRect*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "IupDrawSelectRect", dynlib: libiupSONAME.}
proc DrawFocusRect*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "IupDrawFocusRect", dynlib: libiupSONAME.}
proc DrawGetSize*(ih: PIhandle; w: var cint; h: var cint) {.cdecl, importc: "IupDrawGetSize", dynlib: libiupSONAME.}
proc DrawGetTextSize*(ih: PIhandle; text: cstring; len: cint; w: var cint; h: var cint) {. cdecl, importc: "IupDrawGetTextSize", dynlib: libiupSONAME.}
proc DrawGetImageInfo*(name: cstring; w: var cint; h: var cint; bpp: var cint) {.cdecl, importc: "IupDrawGetImageInfo", dynlib: libiupSONAME.}
proc NewFileDlgOpen*(): cint {.cdecl, importc: "IupNewFileDlgOpen", dynlib: libiupSONAME, discardable.}
proc GLControlsOpen*(): cint {.cdecl, importc: "IupGLControlsOpen", dynlib: libiupglcontrolsSONAME, discardable.}
proc GLCanvasBoxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupGLCanvasBoxv", dynlib: libiupglcontrolsSONAME.}
proc GLCanvasBox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupGLCanvasBox", dynlib: libiupglcontrolsSONAME.}
proc GLSubCanvas*(): PIhandle {.cdecl, importc: "IupGLSubCanvas", dynlib: libiupglcontrolsSONAME.}
proc GLLabel*(title: cstring): PIhandle {.cdecl, importc: "IupGLLabel", dynlib: libiupglcontrolsSONAME.}
proc GLSeparator*(): PIhandle {.cdecl, importc: "IupGLSeparator", dynlib: libiupglcontrolsSONAME.}
proc GLButton*(title: cstring): PIhandle {.cdecl, importc: "IupGLButton", dynlib: libiupglcontrolsSONAME.}
proc GLToggle*(title: cstring): PIhandle {.cdecl, importc: "IupGLToggle", dynlib: libiupglcontrolsSONAME.}
proc GLLink*(url: cstring; title: cstring): PIhandle {.cdecl, importc: "IupGLLink", dynlib: libiupglcontrolsSONAME.}
proc GLProgressBar*(): PIhandle {.cdecl, importc: "IupGLProgressBar", dynlib: libiupglcontrolsSONAME.}
proc GLVal*(): PIhandle {.cdecl, importc: "IupGLVal", dynlib: libiupglcontrolsSONAME.}
proc GLFrame*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLFrame", dynlib: libiupglcontrolsSONAME.}
proc GLExpander*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLExpander", dynlib: libiupglcontrolsSONAME.}
proc GLScrollBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLScrollBox", dynlib: libiupglcontrolsSONAME.}
proc GLSizeBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLSizeBox", dynlib: libiupglcontrolsSONAME.}
proc GLText*(): PIhandle {.cdecl, importc: "IupGLText", dynlib: libiupglcontrolsSONAME.}
proc GLDrawImage*(ih: PIhandle; name: cstring; x: cint; y: cint; active: cint) {.cdecl, importc: "IupGLDrawImage", dynlib: libiupglcontrolsSONAME.}
proc GLDrawText*(ih: PIhandle; str: cstring; len: cint; x: cint; y: cint) {.cdecl, importc: "IupGLDrawText", dynlib: libiupglcontrolsSONAME.}
proc GLDrawGetTextSize*(ih: PIhandle; str: cstring; w: var cint; h: var cint) {.cdecl, importc: "IupGLDrawGetTextSize", dynlib: libiupglcontrolsSONAME.}
proc GLDrawGetImageInfo*(name: cstring; w: var cint; h: var cint; bpp: var cint) {.cdecl, importc: "IupGLDrawGetImageInfo", dynlib: libiupglcontrolsSONAME.}
proc GLCanvasOpen*() {.cdecl, importc: "IupGLCanvasOpen", dynlib: libiupglSONAME.}
proc GLCanvas*(action: cstring): PIhandle {.cdecl, importc: "IupGLCanvas", dynlib: libiupglSONAME.}
proc GLBackgroundBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLBackgroundBox", dynlib: libiupglSONAME.}
proc GLMakeCurrent*(ih: PIhandle) {.cdecl, importc: "IupGLMakeCurrent", dynlib: libiupglSONAME.}
proc GLIsCurrent*(ih: PIhandle): cint {.cdecl, importc: "IupGLIsCurrent", dynlib: libiupglSONAME, discardable.}
proc GLSwapBuffers*(ih: PIhandle) {.cdecl, importc: "IupGLSwapBuffers", dynlib: libiupglSONAME.}
proc GLPalette*(ih: PIhandle; index: cint; r: cfloat; g: cfloat; b: cfloat) {.cdecl, importc: "IupGLPalette", dynlib: libiupglSONAME.}
proc GLUseFont*(ih: PIhandle; first: cint; count: cint; list_base: cint) {.cdecl, importc: "IupGLUseFont", dynlib: libiupglSONAME.}
proc GLWait*(gl: cint) {.cdecl, importc: "IupGLWait", dynlib: libiupglSONAME.}
proc ImOpen*() {.cdecl, importc: "IupImOpen", dynlib: libiupimSONAME.}
proc LoadImage*(filename: cstring): PIhandle {.cdecl, importc: "IupLoadImage", dynlib: libiupimSONAME.}
proc SaveImage*(ih: PIhandle; filename: cstring; format: cstring): cint {.cdecl, importc: "IupSaveImage", dynlib: libiupimSONAME, discardable.}
proc LoadAnimation*(filename: cstring): PIhandle {.cdecl, importc: "IupLoadAnimation", dynlib: libiupimSONAME.}
proc LoadAnimationFrames*(filename_list: cstringArray; file_count: cint): PIhandle {. cdecl, importc: "IupLoadAnimationFrames", dynlib: libiupimSONAME.}
proc GetNativeHandleImage*(handle: pointer): ptr imImage {.cdecl, importc: "IupGetNativeHandleImage", dynlib: libiupimSONAME.}
proc GetImageNativeHandle*(image: ptr imImage): pointer {.cdecl, importc: "IupGetImageNativeHandle", dynlib: libiupimSONAME.}
proc ImageFromImImage*(image: ptr imImage): PIhandle {.cdecl, importc: "IupImageFromImImage", dynlib: libiupimSONAME.}
proc ImageToImImage*(iup_image: PIhandle): ptr imImage {.cdecl, importc: "IupImageToImImage", dynlib: libiupimSONAME.}
proc MglPlotOpen*() {.cdecl, importc: "IupMglPlotOpen", dynlib: libiup_mglplotSONAME.}
proc MglPlot*(): PIhandle {.cdecl, importc: "IupMglPlot", dynlib: libiup_mglplotSONAME.}
proc MglPlotBegin*(ih: PIhandle; dim: cint) {.cdecl, importc: "IupMglPlotBegin", dynlib: libiup_mglplotSONAME.}
proc MglPlotAdd1D*(ih: PIhandle; name: cstring; y: cdouble) {.cdecl, importc: "IupMglPlotAdd1D", dynlib: libiup_mglplotSONAME.}
proc MglPlotAdd2D*(ih: PIhandle; x: cdouble; y: cdouble) {.cdecl, importc: "IupMglPlotAdd2D", dynlib: libiup_mglplotSONAME.}
proc MglPlotAdd3D*(ih: PIhandle; x: cdouble; y: cdouble; z: cdouble) {.cdecl, importc: "IupMglPlotAdd3D", dynlib: libiup_mglplotSONAME.}
proc MglPlotEnd*(ih: PIhandle): cint {.cdecl, importc: "IupMglPlotEnd", dynlib: libiup_mglplotSONAME, discardable.}
proc MglPlotNewDataSet*(ih: PIhandle; dim: cint): cint {.cdecl, importc: "IupMglPlotNewDataSet", dynlib: libiup_mglplotSONAME, discardable.}
proc MglPlotInsert1D*(ih: PIhandle; ds_index: cint; sample_index: cint; names: cstringArray; y: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotInsert1D", dynlib: libiup_mglplotSONAME.}
proc MglPlotInsert2D*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotInsert2D", dynlib: libiup_mglplotSONAME.}
proc MglPlotInsert3D*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotInsert3D", dynlib: libiup_mglplotSONAME.}
proc MglPlotSet1D*(ih: PIhandle; ds_index: cint; names: cstringArray; y: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotSet1D", dynlib: libiup_mglplotSONAME.}
proc MglPlotSet2D*(ih: PIhandle; ds_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotSet2D", dynlib: libiup_mglplotSONAME.}
proc MglPlotSet3D*(ih: PIhandle; ds_index: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotSet3D", dynlib: libiup_mglplotSONAME.}
proc MglPlotSetFormula*(ih: PIhandle; ds_index: cint; formulaX: cstring; formulaY: cstring; formulaZ: cstring; count: cint) {.cdecl, importc: "IupMglPlotSetFormula", dynlib: libiup_mglplotSONAME.}
proc MglPlotSetData*(ih: PIhandle; ds_index: cint; data: ptr cdouble; count_x: cint; count_y: cint; count_z: cint) {.cdecl, importc: "IupMglPlotSetData", dynlib: libiup_mglplotSONAME.}
proc MglPlotLoadData*(ih: PIhandle; ds_index: cint; filename: cstring; count_x: cint; count_y: cint; count_z: cint) {.cdecl, importc: "IupMglPlotLoadData", dynlib: libiup_mglplotSONAME.}
proc MglPlotSetFromFormula*(ih: PIhandle; ds_index: cint; formula: cstring; count_x: cint; count_y: cint; count_z: cint) {.cdecl, importc: "IupMglPlotSetFromFormula", dynlib: libiup_mglplotSONAME.}
proc MglPlotTransform*(ih: PIhandle; x: cdouble; y: cdouble; z: cdouble; ix: var cint; iy: var cint) {.cdecl, importc: "IupMglPlotTransform", dynlib: libiup_mglplotSONAME.}
proc MglPlotTransformTo*(ih: PIhandle; ix: cint; iy: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble) {.cdecl, importc: "IupMglPlotTransformTo", dynlib: libiup_mglplotSONAME.}
proc MglPlotDrawMark*(ih: PIhandle; x: cdouble; y: cdouble; z: cdouble) {.cdecl, importc: "IupMglPlotDrawMark", dynlib: libiup_mglplotSONAME.}
proc MglPlotDrawLine*(ih: PIhandle; x1: cdouble; y1: cdouble; z1: cdouble; x2: cdouble; y2: cdouble; z2: cdouble) {.cdecl, importc: "IupMglPlotDrawLine", dynlib: libiup_mglplotSONAME.}
proc MglPlotDrawText*(ih: PIhandle; text: cstring; x: cdouble; y: cdouble; z: cdouble) {. cdecl, importc: "IupMglPlotDrawText", dynlib: libiup_mglplotSONAME.}
proc MglPlotPaintTo*(ih: PIhandle; format: cstring; w: cint; h: cint; dpi: cdouble; data: pointer) {.cdecl, importc: "IupMglPlotPaintTo", dynlib: libiup_mglplotSONAME.}
proc MglLabel*(title: cstring): PIhandle {.cdecl, importc: "IupMglLabel", dynlib: libiup_mglplotSONAME.}
proc PlotOpen*() {.cdecl, importc: "IupPlotOpen", dynlib: libiup_plotSONAME.}
proc Plot*(): PIhandle {.cdecl, importc: "IupPlot", dynlib: libiup_plotSONAME.}
proc PlotBegin*(ih: PIhandle; strXdata: cint) {.cdecl, importc: "IupPlotBegin", dynlib: libiup_plotSONAME.}
proc PlotAdd*(ih: PIhandle; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotAdd", dynlib: libiup_plotSONAME.}
proc PlotAddStr*(ih: PIhandle; x: cstring; y: cdouble) {.cdecl, importc: "IupPlotAddStr", dynlib: libiup_plotSONAME.}
proc PlotAddSegment*(ih: PIhandle; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotAddSegment", dynlib: libiup_plotSONAME.}
proc PlotEnd*(ih: PIhandle): cint {.cdecl, importc: "IupPlotEnd", dynlib: libiup_plotSONAME, discardable.}
proc PlotLoadData*(ih: PIhandle; filename: cstring; strXdata: cint): cint {.cdecl, importc: "IupPlotLoadData", dynlib: libiup_plotSONAME, discardable.}
proc PlotSetFormula*(ih: PIhandle; sample_count: cint; formula: cstring; init: cstring): cint {.cdecl, importc: "IupPlotSetFormula", dynlib: libiup_plotSONAME, discardable.}
proc PlotInsert*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotInsert", dynlib: libiup_plotSONAME.}
proc PlotInsertStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstring; y: cdouble) {.cdecl, importc: "IupPlotInsertStr", dynlib: libiup_plotSONAME.}
proc PlotInsertSegment*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotInsertSegment", dynlib: libiup_plotSONAME.}
proc PlotInsertStrSamples*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstringArray; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotInsertStrSamples", dynlib: libiup_plotSONAME.}
proc PlotInsertSamples*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotInsertSamples", dynlib: libiup_plotSONAME.}
proc PlotAddSamples*(ih: PIhandle; ds_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotAddSamples", dynlib: libiup_plotSONAME.}
proc PlotAddStrSamples*(ih: PIhandle; ds_index: cint; x: cstringArray; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotAddStrSamples", dynlib: libiup_plotSONAME.}
proc PlotGetSample*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble) {.cdecl, importc: "IupPlotGetSample", dynlib: libiup_plotSONAME.}
proc PlotGetSampleStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstringArray; y: ptr cdouble) {.cdecl, importc: "IupPlotGetSampleStr", dynlib: libiup_plotSONAME.}
proc PlotGetSampleSelection*(ih: PIhandle; ds_index: cint; sample_index: cint): cint {. cdecl, importc: "IupPlotGetSampleSelection", dynlib: libiup_plotSONAME, discardable.}
proc PlotGetSampleExtra*(ih: PIhandle; ds_index: cint; sample_index: cint): cdouble {. cdecl, importc: "IupPlotGetSampleExtra", dynlib: libiup_plotSONAME.}
proc PlotSetSample*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotSetSample", dynlib: libiup_plotSONAME.}
proc PlotSetSampleStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstring; y: cdouble) {.cdecl, importc: "IupPlotSetSampleStr", dynlib: libiup_plotSONAME.}
proc PlotSetSampleSelection*(ih: PIhandle; ds_index: cint; sample_index: cint; selected: cint) {.cdecl, importc: "IupPlotSetSampleSelection", dynlib: libiup_plotSONAME.}
proc PlotSetSampleExtra*(ih: PIhandle; ds_index: cint; sample_index: cint; extra: cdouble) {.cdecl, importc: "IupPlotSetSampleExtra", dynlib: libiup_plotSONAME.}
proc PlotTransform*(ih: PIhandle; x: cdouble; y: cdouble; cnv_x: ptr cdouble; cnv_y: ptr cdouble) {.cdecl, importc: "IupPlotTransform", dynlib: libiup_plotSONAME.}
proc PlotTransformTo*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; x: ptr cdouble; y: ptr cdouble) {.cdecl, importc: "IupPlotTransformTo", dynlib: libiup_plotSONAME.}
proc PlotFindSample*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; ds_index: var cint; sample_index: var cint): cint {.cdecl, importc: "IupPlotFindSample", dynlib: libiup_plotSONAME, discardable.}
proc PlotFindSegment*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; ds_index: var cint; sample_index1: var cint; sample_index2: var cint): cint {.cdecl, importc: "IupPlotFindSegment", dynlib: libiup_plotSONAME, discardable.}
proc PlotPaintTo*(ih: PIhandle; cnv: ptr cdCanvas) {.cdecl, importc: "IupPlotPaintTo", dynlib: libiup_plotSONAME.}
proc ScintillaOpen*() {.cdecl, importc: "IupScintillaOpen", dynlib: libiup_scintillaSONAME.}
proc Scintilla*(): PIhandle {.cdecl, importc: "IupScintilla", dynlib: libiup_scintillaSONAME.}
proc ScintillaDlg*(): PIhandle {.cdecl, importc: "IupScintillaDlg", dynlib: libiup_scintillaSONAME.}
proc ScintillaSendMessage*(ih: PIhandle; iMessage: cuint; wParam: uptr_t; lParam: sptr_t): sptr_t {.cdecl, importc: "IupScintillaSendMessage", dynlib: libiup_scintillaSONAME.}
proc TuioOpen*(): cint {.cdecl, importc: "IupTuioOpen", dynlib: libiuptuioSONAME, discardable.}
proc TuioClient*(port: cint): PIhandle {.cdecl, importc: "IupTuioClient", dynlib: libiuptuioSONAME.}
proc WebBrowserOpen*(): cint {.cdecl, importc: "IupWebBrowserOpen", dynlib: libiupwebSONAME, discardable.}
proc WebBrowser*(): PIhandle {.cdecl, importc: "IupWebBrowser", dynlib: libiupwebSONAME.}
