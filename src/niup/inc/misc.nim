when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #


proc Open*(utf8Mode: bool = false, imageLib: bool = false) {.cdecl.} =
  var argc:cint=0
  var argv:cstringArray=nil
  Open(argc, addr argv)

  if utf8Mode:
    SetGlobal("UTF8MODE", "Yes")

  if imageLib:
    ImageLibOpen()

#
# Attributes
#
proc `[]`*(ih: IUPhandle_t, attribute: string): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), attribute)

proc `[]=`*(ih: IUPhandle_t, attribute, value: string or typeof(nil)) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), cstring(attribute), cstring(value))

# List utility functions
proc image*(ih: List_t , n: int, img: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
   SetAttributeHandle(cast[PIhandle](ih), cstring(&"IMAGE{n}"), cast[PIhandle](img))

proc insertitem*(ih: List_t , n: int, value: string) {.cdecl.} =
   SetAttribute(cast[PIhandle](ih), cstring(&"INSERTITEM{n}"), cstring(value))

#
# functions using PIhandle, usefull in callbacks to avoid casting
#
proc PostMessage*(ih: PIhandle; s: string; i: cint; d: cdouble; p: pointer) {.cdecl.} =
    niupc.PostMessage(ih, cstring(s), i, d, p)

proc Update*(ih: PIhandle) {.cdecl.} =
    niupc.Update(ih)

proc UpdateChildren*(ih: PIhandle) {.cdecl.} =
    niupc.UpdateChildren(ih)

proc Redraw*(ih: PIhandle; children: cint) {.cdecl.} =
    niupc.Redraw(ih, children)

proc Refresh*(ih: PIhandle) {.cdecl.} =
    niupc.Refresh(ih)

proc RefreshChildren*(ih: PIhandle) {.cdecl.} =
    niupc.RefreshChildren(ih)

proc SetLanguagePack*(ih: PIhandle) {.cdecl.} =
    niupc.SetLanguagePack(ih)

proc Destroy*(ih: PIhandle) {.cdecl.} =
    niupc.Destroy(ih)

proc Detach*(child: PIhandle) {.cdecl.} =
    niupc.Detach(cast[PIhandle](child))

proc Append*(ih: PIhandle; child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Append(ih, cast[PIhandle](child))

proc Insert*(ih: PIhandle; ref_child: IUPhandle_t; child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Insert(ih, cast[PIhandle](ref_child), cast[PIhandle](child))

proc GetChild*(ih: PIhandle; pos: cint): PIhandle {.cdecl.} =
    return niupc.GetChild(ih, pos)

proc GetChildPos*(ih: PIhandle; child: IUPhandle_t): cint {.cdecl.} =
    return niupc.GetChildPos(ih, cast[PIhandle](child))

proc GetChildCount*(ih: PIhandle): cint {.cdecl.} =
    return niupc.GetChildCount(ih)

proc GetNextChild*(ih: PIhandle; child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GetNextChild(ih, cast[PIhandle](child))

proc GetBrother*(ih: PIhandle): PIhandle {.cdecl.} =
    return niupc.GetBrother(ih)

proc GetParent*(ih: PIhandle): PIhandle {.cdecl.} =
    return niupc.GetParent(ih)

proc GetDialog*(ih: PIhandle): PIhandle {.cdecl.} =
    return niupc.GetDialog(ih)

proc GetDialogChild*(ih: PIhandle; name: string): PIhandle {.cdecl.} =
    return niupc.GetDialogChild(ih, cstring(name))

proc Reparent*(ih: PIhandle; new_parent: IUPhandle_t; ref_child: IUPhandle_t): cint {.cdecl.} =
    return niupc.Reparent(ih, cast[PIhandle](new_parent), cast[PIhandle](ref_child))

proc Popup*(ih: PIhandle; x: cint; y: cint): cint {.cdecl.} =
    return niupc.Popup(ih, x, y)

proc Show*(ih: PIhandle): cint {.cdecl, discardable.} =
    return niupc.Show(ih)

proc ShowXY*(ih: PIhandle; x: cint; y: cint): cint {.cdecl, discardable.} =
    return niupc.ShowXY(ih, x, y)

proc Hide*(ih: PIhandle): cint {.cdecl.} =
    return niupc.Hide(ih)

proc Map*(ih: PIhandle): cint {.cdecl, discardable.} =
    return niupc.Map(ih)

proc Unmap*(ih: PIhandle) {.cdecl.} =
    niupc.Unmap(ih)

proc ResetAttribute*(ih: PIhandle; name: string) {.cdecl.} =
    niupc.ResetAttribute(ih, cstring(name))

proc GetAllAttributes*(ih: PIhandle; names: cstringArray; n: cint): cint {.cdecl.} =
    return niupc.GetAllAttributes(ih, names, n)

proc CopyAttributes*(src_ih: PIhandle; dst_ih: IUPhandle_t) {.cdecl.} =
    niupc.CopyAttributes(cast[PIhandle](src_ih), cast[PIhandle](dst_ih))

proc SetAttributes*(ih: PIhandle; str: string): PIhandle {.cdecl, discardable.} =
    return niupc.SetAttributes(ih, cstring(str))

proc GetAttributes*(ih: PIhandle): string {.cdecl.} =
    return $niupc.GetAttributes(ih)

proc SetAttribute*(ih: PIhandle; name: string; value: string) {.cdecl.} =
    niupc.SetAttribute(ih, cstring(name), cstring(value))

proc SetStrAttribute*(ih: PIhandle; name: string; value: string) {.cdecl.} =
    niupc.SetStrAttribute(ih, cstring(name), cstring(value))

proc SetInt*(ih: PIhandle; name: string; value: cint) {.cdecl.} =
    niupc.SetInt(ih, cstring(name), value)

proc SetFloat*(ih: PIhandle; name: string; value: cfloat) {.cdecl.} =
    niupc.SetFloat(ih, cstring(name), value)

proc SetDouble*(ih: PIhandle; name: string; value: cdouble) {.cdecl.} =
    niupc.SetDouble(ih, cstring(name), value)

proc SetRGB*(ih: PIhandle; name: string; r: uint8; g: uint8; b: uint8) {.cdecl.} =
    niupc.SetRGB(ih, cstring(name), r, g, b)

proc SetRGBA*(ih: PIhandle; name: string; r: uint8; g: uint8; b: uint8; a: uint8) {.cdecl.} =
    niupc.SetRGBA(ih, cstring(name), r, g, b, a)

proc GetAttribute*(ih: PIhandle; name: string): string {.cdecl.} =
    return $niupc.GetAttribute(ih, cstring(name))

proc GetInt*(ih: PIhandle; name: string): cint {.cdecl.} =
    return niupc.GetInt(ih, cstring(name))

proc GetInt2*(ih: PIhandle; name: string): cint {.cdecl.} =
    return niupc.GetInt2(ih, cstring(name))

proc GetIntInt*(ih: PIhandle; name: string; i1: var cint; i2: var cint): cint {.cdecl.} =
    return niupc.GetIntInt(ih, cstring(name), i1, i2)

proc GetFloat*(ih: PIhandle; name: string): cfloat {.cdecl.} =
    return niupc.GetFloat(ih, cstring(name))

proc GetDouble*(ih: PIhandle; name: string): cdouble {.cdecl.} =
    return niupc.GetDouble(ih, cstring(name))

proc GetFile*(arq: cstring): cint {.cdecl, discardable.} =
    return niupc.GetFile(arq)

proc GetRGB*(ih: PIhandle; name: string; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]) {.cdecl.} =
    niupc.GetRGB(ih, cstring(name), cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b))

proc GetRGBA*(ih: PIhandle; name: string; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]; a: openArray[uint8]) {.cdecl.} =
    niupc.GetRGBA(ih, cstring(name), cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b), cast[ptr uint8](a))

proc SetAttributeId*(ih: PIhandle; name: string; id: cint; value: string) {.cdecl.} =
    niupc.SetAttributeId(ih, cstring(name), id, cstring(value))

proc SetStrAttributeId*(ih: PIhandle; name: string; id: cint; value: string) {.cdecl.} =
    niupc.SetStrAttributeId(ih, cstring(name), id, cstring(value))

proc SetIntId*(ih: PIhandle; name: string; id: cint; value: cint) {.cdecl.} =
    niupc.SetIntId(ih, cstring(name), id, value)

proc SetFloatId*(ih: PIhandle; name: string; id: cint; value: cfloat) {.cdecl.} =
    niupc.SetFloatId(ih, cstring(name), id, value)

proc SetDoubleId*(ih: PIhandle; name: string; id: cint; value: cdouble) {.cdecl.} =
    niupc.SetDoubleId(ih, cstring(name), id, value)

proc SetRGBId*(ih: PIhandle; name: string; id: cint; r: uint8; g: uint8; b: uint8) {.cdecl.} =
    niupc.SetRGBId(ih, cstring(name), id, r, g, b)

proc GetAttributeId*(ih: PIhandle; name: string; id: cint): string {.cdecl.} =
    return $niupc.GetAttributeId(ih, cstring(name), id)

proc GetIntId*(ih: PIhandle; name: string; id: cint): cint {.cdecl.} =
    return niupc.GetIntId(ih, cstring(name), id)

proc GetFloatId*(ih: PIhandle; name: string; id: cint): cfloat {.cdecl.} =
    return niupc.GetFloatId(ih, cstring(name), id)

proc GetDoubleId*(ih: PIhandle; name: string; id: cint): cdouble {.cdecl.} =
    return niupc.GetDoubleId(ih, cstring(name), id)

proc GetRGBId*(ih: PIhandle; name: string; id: cint; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]) {.cdecl.} =
    niupc.GetRGBId(ih, cstring(name), id, cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b))

proc SetAttributeId2*(ih: PIhandle; name: string; lin: cint; col: cint; value: string) {.cdecl.} =
    niupc.SetAttributeId2(ih, cstring(name), lin, col, cstring(value))

proc SetStrAttributeId2*(ih: PIhandle; name: string; lin: cint; col: cint; value: string) {.cdecl.} =
    niupc.SetStrAttributeId2(ih, cstring(name), lin, col, cstring(value))

proc SetIntId2*(ih: PIhandle; name: string; lin: cint; col: cint; value: cint) {.cdecl.} =
    niupc.SetIntId2(ih, cstring(name), lin, col, value)

proc SetFloatId2*(ih: PIhandle; name: string; lin: cint; col: cint; value: cfloat) {.cdecl.} =
    niupc.SetFloatId2(ih, cstring(name), lin, col, value)

proc SetDoubleId2*(ih: PIhandle; name: string; lin: cint; col: cint; value: cdouble) {.cdecl.} =
    niupc.SetDoubleId2(ih, cstring(name), lin, col, value)

proc SetRGBId2*(ih: PIhandle; name: string; lin: cint; col: cint; r: uint8; g: uint8; b: uint8) {.cdecl.} =
    niupc.SetRGBId2(ih, cstring(name), lin, col, r, g, b)

proc GetAttributeId2*(ih: PIhandle; name: string; lin: cint; col: cint): string {.cdecl.} =
    return $niupc.GetAttributeId2(ih, cstring(name), lin, col)

proc GetIntId2*(ih: PIhandle; name: string; lin: cint; col: cint): cint {.cdecl.} =
    return niupc.GetIntId2(ih, cstring(name), lin, col)

proc GetFloatId2*(ih: PIhandle; name: string; lin: cint; col: cint): cfloat {.cdecl.} =
    return niupc.GetFloatId2(ih, cstring(name), lin, col)

proc GetDoubleId2*(ih: PIhandle; name: string; lin: cint; col: cint): cdouble {.cdecl.} =
    return niupc.GetDoubleId2(ih, cstring(name), lin, col)

proc GetRGBId2*(ih: PIhandle; name: string; lin: cint; col: cint; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]) {.cdecl.} =
    niupc.GetRGBId2(ih, cstring(name), lin, col, cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b))

proc SetFocus*(ih: PIhandle): PIhandle {.cdecl, discardable.} =
    return niupc.SetFocus(ih)

proc PreviousField*(ih: PIhandle): PIhandle {.cdecl.} =
    return niupc.PreviousField(ih)

proc NextField*(ih: PIhandle): PIhandle {.cdecl.} =
    return niupc.NextField(ih)

proc GetCallback*(ih: PIhandle; name: string): Icallback {.cdecl.} =
    return niupc.GetCallback(ih, cstring(name))

proc SetCallback*(ih: PIhandle; name: string; `func`: Icallback): Icallback {.cdecl.} =
    return niupc.SetCallback(ih, cstring(name), cast[Icallback](`func`))

proc SetHandle*(name: string; ih: PIhandle): PIhandle {.cdecl, discardable.} =
    return niupc.SetHandle(cstring(name), ih)

proc GetName*(ih: PIhandle): string {.cdecl.} =
    return $niupc.GetName(ih)

proc SetAttributeHandle*(ih: PIhandle; name: string; ih_named: IUPhandle_t) {.cdecl.} =
    niupc.SetAttributeHandle(ih, cstring(name), cast[PIhandle](ih_named))

proc GetAttributeHandle*(ih: PIhandle; name: string): PIhandle {.cdecl.} =
    return niupc.GetAttributeHandle(ih, cstring(name))

proc SetAttributeHandleId*(ih: PIhandle; name: string; id: cint; ih_named: IUPhandle_t) {.cdecl.} =
    niupc.SetAttributeHandleId(ih, cstring(name), id, cast[PIhandle](ih_named))

proc GetAttributeHandleId*(ih: PIhandle; name: string; id: cint): PIhandle {.cdecl.} =
    return niupc.GetAttributeHandleId(ih, cstring(name), id)

proc SetAttributeHandleId2*(ih: PIhandle; name: string; lin: cint; col: cint; ih_named: IUPhandle_t) {.cdecl.} =
    niupc.SetAttributeHandleId2(ih, cstring(name), lin, col, cast[PIhandle](ih_named))

proc GetAttributeHandleId2*(ih: PIhandle; name: string; lin: cint; col: cint): PIhandle {.cdecl.} =
    return niupc.GetAttributeHandleId2(ih, cstring(name), lin, col)

proc GetClassName*(ih: PIhandle): string {.cdecl.} =
    return $niupc.GetClassName(ih)

proc GetClassType*(ih: PIhandle): string {.cdecl.} =
    return $niupc.GetClassType(ih)

proc SaveClassAttributes*(ih: PIhandle) {.cdecl.} =
    niupc.SaveClassAttributes(ih)

proc CopyClassAttributes*(src_ih: PIhandle; dst_ih: IUPhandle_t) {.cdecl.} =
    niupc.CopyClassAttributes(cast[PIhandle](src_ih), cast[PIhandle](dst_ih))

proc ClassMatch*(ih: PIhandle; classname: string): cint {.cdecl.} =
    return niupc.ClassMatch(ih, cstring(classname))

proc Vboxv*(children: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.Vboxv(cast[ptr PIhandle](children))

proc Zboxv*(children: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.Zboxv(cast[ptr PIhandle](children))

proc Hboxv*(children: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.Hboxv(cast[ptr PIhandle](children))

proc Normalizerv*(ih_list: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.Normalizerv(cast[ptr PIhandle](ih_list))

proc Cboxv*(children: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.Cboxv(cast[ptr PIhandle](children))

proc GridBoxv*(children: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.GridBoxv(cast[ptr PIhandle](children))

proc MultiBoxv*(children: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.MultiBoxv(cast[ptr PIhandle](children))

proc Menuv*(children: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.Menuv(cast[ptr PIhandle](children))

proc Tabsv*(children: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.Tabsv(cast[ptr PIhandle](children))

proc FlatTabsv*(children: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.FlatTabsv(cast[ptr PIhandle](children))

proc SaveImageAsText*(ih: PIhandle; filename: string; format: string; name: string): cint {.cdecl.} =
    return niupc.SaveImageAsText(ih, cstring(filename), cstring(format), cstring(name))

proc TextConvertLinColToPos*(ih: PIhandle; lin: cint; col: cint; pos: var cint) {.cdecl.} =
    niupc.TextConvertLinColToPos(ih, lin, col, pos)

proc TextConvertPosToLinCol*(ih: PIhandle; pos: cint; lin: var cint; col: var cint) {.cdecl.} =
    niupc.TextConvertPosToLinCol(ih, pos, lin, col)

proc ConvertXYToPos*(ih: PIhandle; x: cint; y: cint): cint {.cdecl.} =
    return niupc.ConvertXYToPos(ih, x, y)

proc StoreAttribute*(ih: PIhandle; name: string; value: string) {.cdecl.} =
    niupc.StoreAttribute(ih, cstring(name), cstring(value))

proc StoreAttributeId*(ih: PIhandle; name: string; id: cint; value: string) {.cdecl.} =
    niupc.StoreAttributeId(ih, cstring(name), id, cstring(value))

proc StoreAttributeId2*(ih: PIhandle; name: string; lin: cint; col: cint; value: string) {.cdecl.} =
    niupc.StoreAttributeId2(ih, cstring(name), lin, col, cstring(value))

proc TreeSetUserId*(ih: PIhandle; id: cint; userid: pointer): cint {.cdecl.} =
    return niupc.TreeSetUserId(ih, id, userid)

proc TreeGetUserId*(ih: PIhandle; id: cint): pointer {.cdecl.} =
    return niupc.TreeGetUserId(ih, id)

proc TreeGetId*(ih: PIhandle; userid: pointer): cint {.cdecl.} =
    return niupc.TreeGetId(ih, userid)

proc TreeSetAttributeHandle*(ih: PIhandle; name: string; id: cint; ih_named: IUPhandle_t) {.cdecl.} =
    niupc.TreeSetAttributeHandle(ih, cstring(name), id, cast[PIhandle](ih_named))

proc MessageError*(parent: PIhandle; message: string) {.cdecl.} =
    niupc.MessageError(cast[PIhandle](parent), cstring(message))

proc MessageAlarm*(parent: PIhandle; title: string; message: string; buttons: string): cint {.cdecl.} =
    return niupc.MessageAlarm(cast[PIhandle](parent), cstring(title), cstring(message), cstring(buttons))

proc ParamBoxv*(param_array: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.ParamBoxv(cast[ptr PIhandle](param_array))

proc LayoutDialog*(dialog: PIhandle): PIhandle {.cdecl.} =
    return niupc.LayoutDialog(cast[PIhandle](dialog))

proc ElementPropertiesDialog*(parent: PIhandle; elem: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.ElementPropertiesDialog(cast[PIhandle](parent), cast[PIhandle](elem))

proc ClassInfoDialog*(parent: PIhandle): PIhandle {.cdecl.} =
    return niupc.ClassInfoDialog(cast[PIhandle](parent))

proc ConfigLoad*(ih: PIhandle): cint {.cdecl.} =
    return niupc.ConfigLoad(ih)

proc ConfigSave*(ih: PIhandle): cint {.cdecl.} =
    return niupc.ConfigSave(ih)

proc ConfigSetVariableStr*(ih: PIhandle; group: string; key: string; value: string) {.cdecl.} =
    niupc.ConfigSetVariableStr(ih, cstring(group), cstring(key), cstring(value))

proc ConfigSetVariableStrId*(ih: PIhandle; group: string; key: string; id: cint; value: string) {.cdecl.} =
    niupc.ConfigSetVariableStrId(ih, cstring(group), cstring(key), id, cstring(value))

proc ConfigSetVariableInt*(ih: PIhandle; group: string; key: string; value: cint) {.cdecl.} =
    niupc.ConfigSetVariableInt(ih, cstring(group), cstring(key), value)

proc ConfigSetVariableIntId*(ih: PIhandle; group: string; key: string; id: cint; value: cint) {.cdecl.} =
    niupc.ConfigSetVariableIntId(ih, cstring(group), cstring(key), id, value)

proc ConfigSetVariableDouble*(ih: PIhandle; group: string; key: string; value: cdouble) {.cdecl.} =
    niupc.ConfigSetVariableDouble(ih, cstring(group), cstring(key), value)

proc ConfigSetVariableDoubleId*(ih: PIhandle; group: string; key: string; id: cint; value: cdouble) {.cdecl.} =
    niupc.ConfigSetVariableDoubleId(ih, cstring(group), cstring(key), id, value)

proc ConfigGetVariableStr*(ih: PIhandle; group: string; key: string): string {.cdecl.} =
    return $niupc.ConfigGetVariableStr(ih, cstring(group), cstring(key))

proc ConfigGetVariableStrId*(ih: PIhandle; group: string; key: string; id: cint): string {.cdecl.} =
    return $niupc.ConfigGetVariableStrId(ih, cstring(group), cstring(key), id)

proc ConfigGetVariableInt*(ih: PIhandle; group: string; key: string): cint {.cdecl.} =
    return niupc.ConfigGetVariableInt(ih, cstring(group), cstring(key))

proc ConfigGetVariableIntId*(ih: PIhandle; group: string; key: string; id: cint): cint {.cdecl.} =
    return niupc.ConfigGetVariableIntId(ih, cstring(group), cstring(key), id)

proc ConfigGetVariableDouble*(ih: PIhandle; group: string; key: string): cdouble {.cdecl.} =
    return niupc.ConfigGetVariableDouble(ih, cstring(group), cstring(key))

proc ConfigGetVariableDoubleId*(ih: PIhandle; group: string; key: string; id: cint): cdouble {.cdecl.} =
    return niupc.ConfigGetVariableDoubleId(ih, cstring(group), cstring(key), id)

proc ConfigGetVariableStrDef*(ih: PIhandle; group: string; key: string; def: string): string {.cdecl.} =
    return $niupc.ConfigGetVariableStrDef(ih, cstring(group), cstring(key), cstring(def))

proc ConfigGetVariableStrIdDef*(ih: PIhandle; group: string; key: string; id: cint; def: string): string {.cdecl.} =
    return $niupc.ConfigGetVariableStrIdDef(ih, cstring(group), cstring(key), id, cstring(def))

proc ConfigGetVariableIntDef*(ih: PIhandle; group: string; key: string; def: cint): cint {.cdecl.} =
    return niupc.ConfigGetVariableIntDef(ih, cstring(group), cstring(key), def)

proc ConfigGetVariableIntIdDef*(ih: PIhandle; group: string; key: string; id: cint; def: cint): cint {.cdecl.} =
    return niupc.ConfigGetVariableIntIdDef(ih, cstring(group), cstring(key), id, def)

proc ConfigGetVariableDoubleDef*(ih: PIhandle; group: string; key: string; def: cdouble): cdouble {.cdecl.} =
    return niupc.ConfigGetVariableDoubleDef(ih, cstring(group), cstring(key), def)

proc ConfigGetVariableDoubleIdDef*(ih: PIhandle; group: string; key: string; id: cint; def: cdouble): cdouble {.cdecl.} =
    return niupc.ConfigGetVariableDoubleIdDef(ih, cstring(group), cstring(key), id, def)

proc ConfigCopy*(ih1: PIhandle; ih2: IUPhandle_t; exclude_prefix: string) {.cdecl.} =
    niupc.ConfigCopy(cast[PIhandle](ih1), cast[PIhandle](ih2), cstring(exclude_prefix))

proc ConfigSetListVariable*(ih: PIhandle; group: string; key: string; value: string; add: cint) {.cdecl.} =
    niupc.ConfigSetListVariable(ih, cstring(group), cstring(key), cstring(value), add)

proc ConfigRecentInit*(ih: PIhandle; menu: IUPhandle_t; recent_cb: Icallback; max_recent: cint) {.cdecl.} =
    niupc.ConfigRecentInit(ih, cast[PIhandle](menu), cast[Icallback](recent_cb), max_recent)

proc ConfigRecentUpdate*(ih: PIhandle; filename: string) {.cdecl.} =
    niupc.ConfigRecentUpdate(ih, cstring(filename))

proc ConfigDialogShow*(ih: PIhandle; dialog: IUPhandle_t; name: string) {.cdecl.} =
    niupc.ConfigDialogShow(ih, cast[PIhandle](dialog), cstring(name))

proc ConfigDialogClosed*(ih: PIhandle; dialog: IUPhandle_t; name: string) {.cdecl.} =
    niupc.ConfigDialogClosed(ih, cast[PIhandle](dialog), cstring(name))

proc MatrixSetFormula*(ih: PIhandle; col: cint; formula: string; init: string) {.cdecl.} =
    niupc.MatrixSetFormula(ih, col, cstring(formula), cstring(init))

proc MatrixSetDynamic*(ih: PIhandle; init: string) {.cdecl.} =
    niupc.MatrixSetDynamic(ih, cstring(init))

proc DrawBegin*(ih: PIhandle) {.cdecl.} =
    niupc.DrawBegin(ih)

proc DrawEnd*(ih: PIhandle) {.cdecl.} =
    niupc.DrawEnd(ih)

proc DrawSetClipRect*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.DrawSetClipRect(ih, x1, y1, x2, y2)

proc DrawGetClipRect*(ih: PIhandle; x1: var cint; y1: var cint; x2: var cint; y2: var cint) {.cdecl.} =
    niupc.DrawGetClipRect(ih, x1, y1, x2, y2)

proc DrawResetClip*(ih: PIhandle) {.cdecl.} =
    niupc.DrawResetClip(ih)

proc DrawParentBackground*(ih: PIhandle) {.cdecl.} =
    niupc.DrawParentBackground(ih)

proc DrawLine*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.DrawLine(ih, x1, y1, x2, y2)

proc DrawRectangle*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.DrawRectangle(ih, x1, y1, x2, y2)

proc DrawArc*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint; a1: cdouble; a2: cdouble) {.cdecl.} =
    niupc.DrawArc(ih, x1, y1, x2, y2, a1, a2)

proc DrawPolygon*(ih: PIhandle; points: var cint; count: cint) {.cdecl.} =
    niupc.DrawPolygon(ih, points, count)

proc DrawText*(ih: PIhandle; text: string; len: cint; x: cint; y: cint; w: cint; h: cint) {.cdecl.} =
    niupc.DrawText(ih, cstring(text), len, x, y, w, h)

proc DrawImage*(ih: PIhandle; name: string; x: cint; y: cint; w: cint; h: cint) {.cdecl.} =
    niupc.DrawImage(ih, cstring(name), x, y, w, h)

proc DrawSelectRect*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.DrawSelectRect(ih, x1, y1, x2, y2)

proc DrawFocusRect*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.DrawFocusRect(ih, x1, y1, x2, y2)

proc DrawGetSize*(ih: PIhandle; w: var cint; h: var cint) {.cdecl.} =
    niupc.DrawGetSize(ih, w, h)

proc DrawGetTextSize*(ih: PIhandle; text: string; len: cint; w: var cint; h: var cint) {.cdecl.} =
    niupc.DrawGetTextSize(ih, cstring(text), len, w, h)

proc GLCanvasBoxv*(children: ptr PIhandle): PIhandle {.cdecl.} =
    return niupc.GLCanvasBoxv(cast[ptr PIhandle](children))

proc GLFrame*(child: PIhandle): PIhandle {.cdecl.} =
    return niupc.GLFrame(cast[PIhandle](child))

proc GLExpander*(child: PIhandle): PIhandle {.cdecl.} =
    return niupc.GLExpander(cast[PIhandle](child))

proc GLScrollBox*(child: PIhandle): PIhandle {.cdecl.} =
    return niupc.GLScrollBox(cast[PIhandle](child))

proc GLSizeBox*(child: PIhandle): PIhandle {.cdecl.} =
    return niupc.GLSizeBox(cast[PIhandle](child))

proc GLDrawImage*(ih: PIhandle; name: string; x: cint; y: cint; active: cint) {.cdecl.} =
    niupc.GLDrawImage(ih, cstring(name), x, y, active)

proc GLDrawText*(ih: PIhandle; str: string; len: cint; x: cint; y: cint) {.cdecl.} =
    niupc.GLDrawText(ih, cstring(str), len, x, y)

proc GLDrawGetTextSize*(ih: PIhandle; str: string; w: var cint; h: var cint) {.cdecl.} =
    niupc.GLDrawGetTextSize(ih, cstring(str), w, h)

proc GLBackgroundBox*(child: PIhandle): PIhandle {.cdecl.} =
    return niupc.GLBackgroundBox(cast[PIhandle](child))

proc GLMakeCurrent*(ih: PIhandle) {.cdecl.} =
    niupc.GLMakeCurrent(ih)

proc GLIsCurrent*(ih: PIhandle): cint {.cdecl.} =
    return niupc.GLIsCurrent(ih)

proc GLSwapBuffers*(ih: PIhandle) {.cdecl.} =
    niupc.GLSwapBuffers(ih)

proc GLPalette*(ih: PIhandle; index: cint; r: cfloat; g: cfloat; b: cfloat) {.cdecl.} =
    niupc.GLPalette(ih, index, r, g, b)

proc GLUseFont*(ih: PIhandle; first: cint; count: cint; list_base: cint) {.cdecl.} =
    niupc.GLUseFont(ih, first, count, list_base)

proc SaveImage*(ih: PIhandle; filename: string; format: string): cint {.cdecl.} =
    return niupc.SaveImage(ih, cstring(filename), cstring(format))

proc ImageToImImage*(iup_image: PIhandle): ptr imImage {.cdecl.} =
    return niupc.ImageToImImage(cast[PIhandle](iup_image))

proc MglPlotBegin*(ih: PIhandle; dim: cint) {.cdecl.} =
    niupc.MglPlotBegin(ih, dim)

proc MglPlotAdd1D*(ih: PIhandle; name: string; y: cdouble) {.cdecl.} =
    niupc.MglPlotAdd1D(ih, cstring(name), y)

proc MglPlotAdd2D*(ih: PIhandle; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.MglPlotAdd2D(ih, x, y)

proc MglPlotAdd3D*(ih: PIhandle; x: cdouble; y: cdouble; z: cdouble) {.cdecl.} =
    niupc.MglPlotAdd3D(ih, x, y, z)

proc MglPlotEnd*(ih: PIhandle): cint {.cdecl.} =
    return niupc.MglPlotEnd(ih)

proc MglPlotNewDataSet*(ih: PIhandle; dim: cint): cint {.cdecl.} =
    return niupc.MglPlotNewDataSet(ih, dim)

proc MglPlotInsert1D*(ih: PIhandle; ds_index: cint; sample_index: cint; names: cstringArray; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotInsert1D(ih, ds_index, sample_index, names, y, count)

proc MglPlotInsert2D*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotInsert2D(ih, ds_index, sample_index, x, y, count)

proc MglPlotInsert3D*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotInsert3D(ih, ds_index, sample_index, x, y, z, count)

proc MglPlotSet1D*(ih: PIhandle; ds_index: cint; names: cstringArray; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotSet1D(ih, ds_index, names, y, count)

proc MglPlotSet2D*(ih: PIhandle; ds_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotSet2D(ih, ds_index, x, y, count)

proc MglPlotSet3D*(ih: PIhandle; ds_index: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotSet3D(ih, ds_index, x, y, z, count)

proc MglPlotSetFormula*(ih: PIhandle; ds_index: cint; formulaX: string; formulaY: string; formulaZ: string; count: cint) {.cdecl.} =
    niupc.MglPlotSetFormula(ih, ds_index, cstring(formulaX), cstring(formulaY), cstring(formulaZ), count)

proc MglPlotSetData*(ih: PIhandle; ds_index: cint; data: ptr cdouble; count_x: cint; count_y: cint; count_z: cint) {.cdecl.} =
    niupc.MglPlotSetData(ih, ds_index, data, count_x, count_y, count_z)

proc MglPlotLoadData*(ih: PIhandle; ds_index: cint; filename: string; count_x: cint; count_y: cint; count_z: cint) {.cdecl.} =
    niupc.MglPlotLoadData(ih, ds_index, cstring(filename), count_x, count_y, count_z)

proc MglPlotSetFromFormula*(ih: PIhandle; ds_index: cint; formula: string; count_x: cint; count_y: cint; count_z: cint) {.cdecl.} =
    niupc.MglPlotSetFromFormula(ih, ds_index, cstring(formula), count_x, count_y, count_z)

proc MglPlotTransform*(ih: PIhandle; x: cdouble; y: cdouble; z: cdouble; ix: var cint; iy: var cint) {.cdecl.} =
    niupc.MglPlotTransform(ih, x, y, z, ix, iy)

proc MglPlotTransformTo*(ih: PIhandle; ix: cint; iy: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble) {.cdecl.} =
    niupc.MglPlotTransformTo(ih, ix, iy, x, y, z)

proc MglPlotDrawMark*(ih: PIhandle; x: cdouble; y: cdouble; z: cdouble) {.cdecl.} =
    niupc.MglPlotDrawMark(ih, x, y, z)

proc MglPlotDrawLine*(ih: PIhandle; x1: cdouble; y1: cdouble; z1: cdouble; x2: cdouble; y2: cdouble; z2: cdouble) {.cdecl.} =
    niupc.MglPlotDrawLine(ih, x1, y1, z1, x2, y2, z2)

proc MglPlotDrawText*(ih: PIhandle; text: string; x: cdouble; y: cdouble; z: cdouble) {.cdecl.} =
    niupc.MglPlotDrawText(ih, cstring(text), x, y, z)

proc MglPlotPaintTo*(ih: PIhandle; format: string; w: cint; h: cint; dpi: cdouble; data: pointer) {.cdecl.} =
    niupc.MglPlotPaintTo(ih, cstring(format), w, h, dpi, data)

proc PlotBegin*(ih: PIhandle; strXdata: cint) {.cdecl.} =
    niupc.PlotBegin(ih, strXdata)

proc PlotAdd*(ih: PIhandle; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.PlotAdd(ih, x, y)

proc PlotAddStr*(ih: PIhandle; x: string; y: cdouble) {.cdecl.} =
    niupc.PlotAddStr(ih, cstring(x), y)

proc PlotAddSegment*(ih: PIhandle; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.PlotAddSegment(ih, x, y)

proc PlotEnd*(ih: PIhandle): cint {.cdecl.} =
    return niupc.PlotEnd(ih)

proc PlotLoadData*(ih: PIhandle; filename: string; strXdata: cint): cint {.cdecl.} =
    return niupc.PlotLoadData(ih, cstring(filename), strXdata)

proc PlotSetFormula*(ih: PIhandle; sample_count: cint; formula: string; init: string): cint {.cdecl.} =
    return niupc.PlotSetFormula(ih, sample_count, cstring(formula), cstring(init))

proc PlotInsert*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.PlotInsert(ih, ds_index, sample_index, x, y)

proc PlotInsertStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: string; y: cdouble) {.cdecl.} =
    niupc.PlotInsertStr(ih, ds_index, sample_index, cstring(x), y)

proc PlotInsertSegment*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.PlotInsertSegment(ih, ds_index, sample_index, x, y)

proc PlotInsertStrSamples*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstringArray; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.PlotInsertStrSamples(ih, ds_index, sample_index, x, y, count)

proc PlotInsertSamples*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.PlotInsertSamples(ih, ds_index, sample_index, x, y, count)

proc PlotAddSamples*(ih: PIhandle; ds_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.PlotAddSamples(ih, ds_index, x, y, count)

proc PlotAddStrSamples*(ih: PIhandle; ds_index: cint; x: cstringArray; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.PlotAddStrSamples(ih, ds_index, x, y, count)

proc PlotGetSample*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble) {.cdecl.} =
    niupc.PlotGetSample(ih, ds_index, sample_index, x, y)

proc PlotGetSampleStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstringArray; y: ptr cdouble) {.cdecl.} =
    niupc.PlotGetSampleStr(ih, ds_index, sample_index, x, y)

proc PlotGetSampleSelection*(ih: PIhandle; ds_index: cint; sample_index: cint): cint {.cdecl.} =
    return niupc.PlotGetSampleSelection(ih, ds_index, sample_index)

proc PlotGetSampleExtra*(ih: PIhandle; ds_index: cint; sample_index: cint): cdouble {.cdecl.} =
    return niupc.PlotGetSampleExtra(ih, ds_index, sample_index)

proc PlotSetSample*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.PlotSetSample(ih, ds_index, sample_index, x, y)

proc PlotSetSampleStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: string; y: cdouble) {.cdecl.} =
    niupc.PlotSetSampleStr(ih, ds_index, sample_index, cstring(x), y)

proc PlotSetSampleSelection*(ih: PIhandle; ds_index: cint; sample_index: cint; selected: cint) {.cdecl.} =
    niupc.PlotSetSampleSelection(ih, ds_index, sample_index, selected)

proc PlotSetSampleExtra*(ih: PIhandle; ds_index: cint; sample_index: cint; extra: cdouble) {.cdecl.} =
    niupc.PlotSetSampleExtra(ih, ds_index, sample_index, extra)

proc PlotTransform*(ih: PIhandle; x: cdouble; y: cdouble; cnv_x: ptr cdouble; cnv_y: ptr cdouble) {.cdecl.} =
    niupc.PlotTransform(ih, x, y, cnv_x, cnv_y)

proc PlotTransformTo*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; x: ptr cdouble; y: ptr cdouble) {.cdecl.} =
    niupc.PlotTransformTo(ih, cnv_x, cnv_y, x, y)

proc PlotFindSample*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; ds_index: var cint; sample_index: var cint): cint {.cdecl.} =
    return niupc.PlotFindSample(ih, cnv_x, cnv_y, ds_index, sample_index)

proc PlotFindSegment*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; ds_index: var cint; sample_index1: var cint; sample_index2: var cint): cint {.cdecl.} =
    return niupc.PlotFindSegment(ih, cnv_x, cnv_y, ds_index, sample_index1, sample_index2)

proc PlotPaintTo*(ih: PIhandle; cnv: ptr cdCanvas) {.cdecl.} =
    niupc.PlotPaintTo(ih, cnv)

proc ScintillaSendMessage*(ih: PIhandle; iMessage: cuint; wParam: clong; lParam: clong): clong {.cdecl.} =
    return niupc.ScintillaSendMessage(ih, iMessage, wParam, lParam)

