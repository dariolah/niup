proc Open*(utf8Mode: bool = false, imageLib: bool = false) {.cdecl.} =
  var argc:cint=0
  var argv:cstringArray=nil
  Open(argc, addr argv)

  if utf8Mode:
    SetGlobal("UTF8MODE", "Yes")

  if imageLib:
    ImageLibOpen()

# Attributes
proc `[]`*(ih: IUPhandle_t, attribute: string): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), attribute)

proc `[]=`*(ih: IUPhandle_t, attribute, value: string or typeof(nil)) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), cstring(attribute), cstring(value))

# List utility functions
proc image*(ih: List_t , n: int, img: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
   SetAttributeHandle(cast[PIhandle](ih), cstring(&"IMAGE{n}"), cast[PIhandle](img))

proc insertitem*(ih: List_t , n: int, value: string) {.cdecl.} =
   SetAttribute(cast[PIhandle](ih), cstring(&"INSERTITEM{n}"), cstring(value))

# functions using PIhandle, usefull in callbacks to avoid casting
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



# K_* callbacks
proc `k_sp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_SP", cast[Icallback](cb))
proc `k_sp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_SP"))
proc `k_exclam=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_exclam", cast[Icallback](cb))
proc `k_exclam`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_exclam"))
proc `k_quotedbl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_quotedbl", cast[Icallback](cb))
proc `k_quotedbl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_quotedbl"))
proc `k_numbersign=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_numbersign", cast[Icallback](cb))
proc `k_numbersign`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_numbersign"))
proc `k_dollar=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_dollar", cast[Icallback](cb))
proc `k_dollar`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_dollar"))
proc `k_percent=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_percent", cast[Icallback](cb))
proc `k_percent`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_percent"))
proc `k_ampersand=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_ampersand", cast[Icallback](cb))
proc `k_ampersand`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ampersand"))
proc `k_apostrophe=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_apostrophe", cast[Icallback](cb))
proc `k_apostrophe`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_apostrophe"))
proc `k_parentleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_parentleft", cast[Icallback](cb))
proc `k_parentleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_parentleft"))
proc `k_parentright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_parentright", cast[Icallback](cb))
proc `k_parentright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_parentright"))
proc `k_asterisk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_asterisk", cast[Icallback](cb))
proc `k_asterisk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_asterisk"))
proc `k_plus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_plus", cast[Icallback](cb))
proc `k_plus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_plus"))
proc `k_comma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_comma", cast[Icallback](cb))
proc `k_comma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_comma"))
proc `k_minus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_minus", cast[Icallback](cb))
proc `k_minus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_minus"))
proc `k_period=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_period", cast[Icallback](cb))
proc `k_period`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_period"))
proc `k_slash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_slash", cast[Icallback](cb))
proc `k_slash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_slash"))
proc `k_0=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_0", cast[Icallback](cb))
proc `k_0`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_0"))
proc `k_1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_1", cast[Icallback](cb))
proc `k_1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_1"))
proc `k_2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_2", cast[Icallback](cb))
proc `k_2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_2"))
proc `k_3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_3", cast[Icallback](cb))
proc `k_3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_3"))
proc `k_4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_4", cast[Icallback](cb))
proc `k_4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_4"))
proc `k_5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_5", cast[Icallback](cb))
proc `k_5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_5"))
proc `k_6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_6", cast[Icallback](cb))
proc `k_6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_6"))
proc `k_7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_7", cast[Icallback](cb))
proc `k_7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_7"))
proc `k_8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_8", cast[Icallback](cb))
proc `k_8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_8"))
proc `k_9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_9", cast[Icallback](cb))
proc `k_9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_9"))
proc `k_colon=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_colon", cast[Icallback](cb))
proc `k_colon`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_colon"))
proc `k_semicolon=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_semicolon", cast[Icallback](cb))
proc `k_semicolon`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_semicolon"))
proc `k_less=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_less", cast[Icallback](cb))
proc `k_less`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_less"))
proc `k_equal=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_equal", cast[Icallback](cb))
proc `k_equal`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_equal"))
proc `k_greater=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_greater", cast[Icallback](cb))
proc `k_greater`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_greater"))
proc `k_question=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_question", cast[Icallback](cb))
proc `k_question`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_question"))
proc `k_at=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_at", cast[Icallback](cb))
proc `k_at`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_at"))
proc `k_uppera=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperA", cast[Icallback](cb))
proc `k_uppera`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperA"))
proc `k_upperb=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperB", cast[Icallback](cb))
proc `k_upperb`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperB"))
proc `k_upperc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperC", cast[Icallback](cb))
proc `k_upperc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperC"))
proc `k_upperd=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperD", cast[Icallback](cb))
proc `k_upperd`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperD"))
proc `k_uppere=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperE", cast[Icallback](cb))
proc `k_uppere`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperE"))
proc `k_upperf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperF", cast[Icallback](cb))
proc `k_upperf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperF"))
proc `k_upperg=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperG", cast[Icallback](cb))
proc `k_upperg`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperG"))
proc `k_upperh=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperH", cast[Icallback](cb))
proc `k_upperh`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperH"))
proc `k_upperi=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperI", cast[Icallback](cb))
proc `k_upperi`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperI"))
proc `k_upperj=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperJ", cast[Icallback](cb))
proc `k_upperj`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperJ"))
proc `k_upperk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperK", cast[Icallback](cb))
proc `k_upperk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperK"))
proc `k_upperl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperL", cast[Icallback](cb))
proc `k_upperl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperL"))
proc `k_upperm=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperM", cast[Icallback](cb))
proc `k_upperm`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperM"))
proc `k_uppern=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperN", cast[Icallback](cb))
proc `k_uppern`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperN"))
proc `k_uppero=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperO", cast[Icallback](cb))
proc `k_uppero`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperO"))
proc `k_upperp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperP", cast[Icallback](cb))
proc `k_upperp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperP"))
proc `k_upperq=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperQ", cast[Icallback](cb))
proc `k_upperq`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperQ"))
proc `k_upperr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperR", cast[Icallback](cb))
proc `k_upperr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperR"))
proc `k_uppers=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperS", cast[Icallback](cb))
proc `k_uppers`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperS"))
proc `k_uppert=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperT", cast[Icallback](cb))
proc `k_uppert`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperT"))
proc `k_upperu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperU", cast[Icallback](cb))
proc `k_upperu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperU"))
proc `k_upperv=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperV", cast[Icallback](cb))
proc `k_upperv`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperV"))
proc `k_upperw=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperW", cast[Icallback](cb))
proc `k_upperw`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperW"))
proc `k_upperx=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperX", cast[Icallback](cb))
proc `k_upperx`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperX"))
proc `k_uppery=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperY", cast[Icallback](cb))
proc `k_uppery`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperY"))
proc `k_upperz=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_upperZ", cast[Icallback](cb))
proc `k_upperz`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperZ"))
proc `k_bracketleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_bracketleft", cast[Icallback](cb))
proc `k_bracketleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_bracketleft"))
proc `k_backslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_backslash", cast[Icallback](cb))
proc `k_backslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_backslash"))
proc `k_bracketright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_bracketright", cast[Icallback](cb))
proc `k_bracketright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_bracketright"))
proc `k_circum=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_circum", cast[Icallback](cb))
proc `k_circum`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_circum"))
proc `k_underscore=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_underscore", cast[Icallback](cb))
proc `k_underscore`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_underscore"))
proc `k_grave=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_grave", cast[Icallback](cb))
proc `k_grave`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_grave"))
proc `k_lowera=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowera", cast[Icallback](cb))
proc `k_lowera`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowera"))
proc `k_lowerb=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerb", cast[Icallback](cb))
proc `k_lowerb`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerb"))
proc `k_lowerc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerc", cast[Icallback](cb))
proc `k_lowerc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerc"))
proc `k_lowerd=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerd", cast[Icallback](cb))
proc `k_lowerd`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerd"))
proc `k_lowere=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowere", cast[Icallback](cb))
proc `k_lowere`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowere"))
proc `k_lowerf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerf", cast[Icallback](cb))
proc `k_lowerf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerf"))
proc `k_lowerg=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerg", cast[Icallback](cb))
proc `k_lowerg`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerg"))
proc `k_lowerh=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerh", cast[Icallback](cb))
proc `k_lowerh`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerh"))
proc `k_loweri=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_loweri", cast[Icallback](cb))
proc `k_loweri`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_loweri"))
proc `k_lowerj=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerj", cast[Icallback](cb))
proc `k_lowerj`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerj"))
proc `k_lowerk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerk", cast[Icallback](cb))
proc `k_lowerk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerk"))
proc `k_lowerl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerl", cast[Icallback](cb))
proc `k_lowerl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerl"))
proc `k_lowerm=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerm", cast[Icallback](cb))
proc `k_lowerm`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerm"))
proc `k_lowern=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowern", cast[Icallback](cb))
proc `k_lowern`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowern"))
proc `k_lowero=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowero", cast[Icallback](cb))
proc `k_lowero`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowero"))
proc `k_lowerp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerp", cast[Icallback](cb))
proc `k_lowerp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerp"))
proc `k_lowerq=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerq", cast[Icallback](cb))
proc `k_lowerq`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerq"))
proc `k_lowerr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerr", cast[Icallback](cb))
proc `k_lowerr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerr"))
proc `k_lowers=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowers", cast[Icallback](cb))
proc `k_lowers`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowers"))
proc `k_lowert=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowert", cast[Icallback](cb))
proc `k_lowert`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowert"))
proc `k_loweru=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_loweru", cast[Icallback](cb))
proc `k_loweru`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_loweru"))
proc `k_lowerv=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerv", cast[Icallback](cb))
proc `k_lowerv`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerv"))
proc `k_lowerw=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerw", cast[Icallback](cb))
proc `k_lowerw`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerw"))
proc `k_lowerx=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerx", cast[Icallback](cb))
proc `k_lowerx`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerx"))
proc `k_lowery=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowery", cast[Icallback](cb))
proc `k_lowery`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowery"))
proc `k_lowerz=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerz", cast[Icallback](cb))
proc `k_lowerz`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerz"))
proc `k_braceleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_braceleft", cast[Icallback](cb))
proc `k_braceleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_braceleft"))
proc `k_bar=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_bar", cast[Icallback](cb))
proc `k_bar`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_bar"))
proc `k_braceright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_braceright", cast[Icallback](cb))
proc `k_braceright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_braceright"))
proc `k_tilde=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_tilde", cast[Icallback](cb))
proc `k_tilde`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_tilde"))
proc `k_bs=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_BS", cast[Icallback](cb))
proc `k_bs`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_BS"))
proc `k_tab=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_TAB", cast[Icallback](cb))
proc `k_tab`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_TAB"))
proc `k_lf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_LF", cast[Icallback](cb))
proc `k_lf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_LF"))
proc `k_cr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_CR", cast[Icallback](cb))
proc `k_cr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_CR"))
proc `k_quoteleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_quoteleft", cast[Icallback](cb))
proc `k_quoteleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_quoteleft"))
proc `k_quoteright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_quoteright", cast[Icallback](cb))
proc `k_quoteright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_quoteright"))
proc `k_pause=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_PAUSE", cast[Icallback](cb))
proc `k_pause`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_PAUSE"))
proc `k_esc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_ESC", cast[Icallback](cb))
proc `k_esc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ESC"))
proc `k_home=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_HOME", cast[Icallback](cb))
proc `k_home`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_HOME"))
proc `k_left=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_LEFT", cast[Icallback](cb))
proc `k_left`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_LEFT"))
proc `k_up=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_UP", cast[Icallback](cb))
proc `k_up`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_UP"))
proc `k_right=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_RIGHT", cast[Icallback](cb))
proc `k_right`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_RIGHT"))
proc `k_down=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_DOWN", cast[Icallback](cb))
proc `k_down`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_DOWN"))
proc `k_pgup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_PGUP", cast[Icallback](cb))
proc `k_pgup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_PGUP"))
proc `k_pgdn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_PGDN", cast[Icallback](cb))
proc `k_pgdn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_PGDN"))
proc `k_end=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_END", cast[Icallback](cb))
proc `k_end`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_END"))
proc `k_middle=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_MIDDLE", cast[Icallback](cb))
proc `k_middle`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_MIDDLE"))
proc `k_print=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_Print", cast[Icallback](cb))
proc `k_print`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_Print"))
proc `k_ins=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_INS", cast[Icallback](cb))
proc `k_ins`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_INS"))
proc `k_menu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_Menu", cast[Icallback](cb))
proc `k_menu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_Menu"))
proc `k_del=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_DEL", cast[Icallback](cb))
proc `k_del`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_DEL"))
proc `k_f1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F1", cast[Icallback](cb))
proc `k_f1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F1"))
proc `k_f2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F2", cast[Icallback](cb))
proc `k_f2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F2"))
proc `k_f3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F3", cast[Icallback](cb))
proc `k_f3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F3"))
proc `k_f4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F4", cast[Icallback](cb))
proc `k_f4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F4"))
proc `k_f5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F5", cast[Icallback](cb))
proc `k_f5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F5"))
proc `k_f6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F6", cast[Icallback](cb))
proc `k_f6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F6"))
proc `k_f7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F7", cast[Icallback](cb))
proc `k_f7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F7"))
proc `k_f8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F8", cast[Icallback](cb))
proc `k_f8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F8"))
proc `k_f9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F9", cast[Icallback](cb))
proc `k_f9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F9"))
proc `k_f10=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F10", cast[Icallback](cb))
proc `k_f10`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F10"))
proc `k_f11=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F11", cast[Icallback](cb))
proc `k_f11`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F11"))
proc `k_f12=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F12", cast[Icallback](cb))
proc `k_f12`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F12"))
proc `k_f13=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F13", cast[Icallback](cb))
proc `k_f13`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F13"))
proc `k_f14=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F14", cast[Icallback](cb))
proc `k_f14`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F14"))
proc `k_f15=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F15", cast[Icallback](cb))
proc `k_f15`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F15"))
proc `k_f16=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F16", cast[Icallback](cb))
proc `k_f16`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F16"))
proc `k_f17=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F17", cast[Icallback](cb))
proc `k_f17`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F17"))
proc `k_f18=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F18", cast[Icallback](cb))
proc `k_f18`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F18"))
proc `k_f19=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F19", cast[Icallback](cb))
proc `k_f19`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F19"))
proc `k_f20=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_F20", cast[Icallback](cb))
proc `k_f20`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F20"))
proc `k_lshift=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_LSHIFT", cast[Icallback](cb))
proc `k_lshift`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_LSHIFT"))
proc `k_rshift=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_RSHIFT", cast[Icallback](cb))
proc `k_rshift`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_RSHIFT"))
proc `k_lctrl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_LCTRL", cast[Icallback](cb))
proc `k_lctrl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_LCTRL"))
proc `k_rctrl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_RCTRL", cast[Icallback](cb))
proc `k_rctrl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_RCTRL"))
proc `k_lalt=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_LALT", cast[Icallback](cb))
proc `k_lalt`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_LALT"))
proc `k_ralt=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_RALT", cast[Icallback](cb))
proc `k_ralt`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_RALT"))
proc `k_num=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_NUM", cast[Icallback](cb))
proc `k_num`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_NUM"))
proc `k_scroll=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_SCROLL", cast[Icallback](cb))
proc `k_scroll`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_SCROLL"))
proc `k_caps=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_CAPS", cast[Icallback](cb))
proc `k_caps`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_CAPS"))
proc `k_clear=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_CLEAR", cast[Icallback](cb))
proc `k_clear`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_CLEAR"))
proc `k_help=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_HELP", cast[Icallback](cb))
proc `k_help`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_HELP"))
proc `k_lowerccedilla=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_lowerccedilla", cast[Icallback](cb))
proc `k_lowerccedilla`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerccedilla"))
proc `k_ccedilla=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_Ccedilla", cast[Icallback](cb))
proc `k_ccedilla`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_Ccedilla"))
proc `k_acute=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_acute", cast[Icallback](cb))
proc `k_acute`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_acute"))
proc `k_diaeresis=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_diaeresis", cast[Icallback](cb))
proc `k_diaeresis`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_diaeresis"))
proc `k_shome=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sHOME", cast[Icallback](cb))
proc `k_shome`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sHOME"))
proc `k_sup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sUP", cast[Icallback](cb))
proc `k_sup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sUP"))
proc `k_spgup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sPGUP", cast[Icallback](cb))
proc `k_spgup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPGUP"))
proc `k_sleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sLEFT", cast[Icallback](cb))
proc `k_sleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sLEFT"))
proc `k_smiddle=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sMIDDLE", cast[Icallback](cb))
proc `k_smiddle`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sMIDDLE"))
proc `k_sright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sRIGHT", cast[Icallback](cb))
proc `k_sright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sRIGHT"))
proc `k_send=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sEND", cast[Icallback](cb))
proc `k_send`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sEND"))
proc `k_sdown=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sDOWN", cast[Icallback](cb))
proc `k_sdown`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sDOWN"))
proc `k_spgdn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sPGDN", cast[Icallback](cb))
proc `k_spgdn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPGDN"))
proc `k_sins=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sINS", cast[Icallback](cb))
proc `k_sins`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sINS"))
proc `k_sdel=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sDEL", cast[Icallback](cb))
proc `k_sdel`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sDEL"))
proc `k_ssp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sSP", cast[Icallback](cb))
proc `k_ssp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sSP"))
proc `k_stab=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sTAB", cast[Icallback](cb))
proc `k_stab`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sTAB"))
proc `k_scr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sCR", cast[Icallback](cb))
proc `k_scr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sCR"))
proc `k_sbs=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sBS", cast[Icallback](cb))
proc `k_sbs`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sBS"))
proc `k_spause=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sPAUSE", cast[Icallback](cb))
proc `k_spause`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPAUSE"))
proc `k_sesc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sESC", cast[Icallback](cb))
proc `k_sesc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sESC"))
proc `k_sclear=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sCLEAR", cast[Icallback](cb))
proc `k_sclear`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sCLEAR"))
proc `k_sf1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF1", cast[Icallback](cb))
proc `k_sf1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF1"))
proc `k_sf2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF2", cast[Icallback](cb))
proc `k_sf2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF2"))
proc `k_sf3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF3", cast[Icallback](cb))
proc `k_sf3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF3"))
proc `k_sf4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF4", cast[Icallback](cb))
proc `k_sf4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF4"))
proc `k_sf5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF5", cast[Icallback](cb))
proc `k_sf5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF5"))
proc `k_sf6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF6", cast[Icallback](cb))
proc `k_sf6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF6"))
proc `k_sf7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF7", cast[Icallback](cb))
proc `k_sf7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF7"))
proc `k_sf8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF8", cast[Icallback](cb))
proc `k_sf8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF8"))
proc `k_sf9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF9", cast[Icallback](cb))
proc `k_sf9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF9"))
proc `k_sf10=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF10", cast[Icallback](cb))
proc `k_sf10`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF10"))
proc `k_sf11=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF11", cast[Icallback](cb))
proc `k_sf11`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF11"))
proc `k_sf12=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF12", cast[Icallback](cb))
proc `k_sf12`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF12"))
proc `k_sf13=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF13", cast[Icallback](cb))
proc `k_sf13`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF13"))
proc `k_sf14=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF14", cast[Icallback](cb))
proc `k_sf14`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF14"))
proc `k_sf15=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF15", cast[Icallback](cb))
proc `k_sf15`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF15"))
proc `k_sf16=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF16", cast[Icallback](cb))
proc `k_sf16`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF16"))
proc `k_sf17=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF17", cast[Icallback](cb))
proc `k_sf17`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF17"))
proc `k_sf18=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF18", cast[Icallback](cb))
proc `k_sf18`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF18"))
proc `k_sf19=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF19", cast[Icallback](cb))
proc `k_sf19`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF19"))
proc `k_sf20=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sF20", cast[Icallback](cb))
proc `k_sf20`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF20"))
proc `k_sprint=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sPrint", cast[Icallback](cb))
proc `k_sprint`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPrint"))
proc `k_smenu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sMenu", cast[Icallback](cb))
proc `k_smenu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sMenu"))
proc `k_chome=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cHOME", cast[Icallback](cb))
proc `k_chome`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cHOME"))
proc `k_cup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cUP", cast[Icallback](cb))
proc `k_cup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cUP"))
proc `k_cpgup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cPGUP", cast[Icallback](cb))
proc `k_cpgup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPGUP"))
proc `k_cleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cLEFT", cast[Icallback](cb))
proc `k_cleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cLEFT"))
proc `k_cmiddle=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cMIDDLE", cast[Icallback](cb))
proc `k_cmiddle`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cMIDDLE"))
proc `k_cright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cRIGHT", cast[Icallback](cb))
proc `k_cright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cRIGHT"))
proc `k_cend=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cEND", cast[Icallback](cb))
proc `k_cend`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cEND"))
proc `k_cdown=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cDOWN", cast[Icallback](cb))
proc `k_cdown`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cDOWN"))
proc `k_cpgdn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cPGDN", cast[Icallback](cb))
proc `k_cpgdn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPGDN"))
proc `k_cins=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cINS", cast[Icallback](cb))
proc `k_cins`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cINS"))
proc `k_cdel=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cDEL", cast[Icallback](cb))
proc `k_cdel`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cDEL"))
proc `k_csp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cSP", cast[Icallback](cb))
proc `k_csp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cSP"))
proc `k_ctab=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cTAB", cast[Icallback](cb))
proc `k_ctab`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cTAB"))
proc `k_ccr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cCR", cast[Icallback](cb))
proc `k_ccr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cCR"))
proc `k_cbs=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cBS", cast[Icallback](cb))
proc `k_cbs`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cBS"))
proc `k_cpause=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cPAUSE", cast[Icallback](cb))
proc `k_cpause`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPAUSE"))
proc `k_cesc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cESC", cast[Icallback](cb))
proc `k_cesc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cESC"))
proc `k_cclear=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cCLEAR", cast[Icallback](cb))
proc `k_cclear`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cCLEAR"))
proc `k_cccedilla=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cCcedilla", cast[Icallback](cb))
proc `k_cccedilla`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cCcedilla"))
proc `k_cf1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF1", cast[Icallback](cb))
proc `k_cf1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF1"))
proc `k_cf2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF2", cast[Icallback](cb))
proc `k_cf2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF2"))
proc `k_cf3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF3", cast[Icallback](cb))
proc `k_cf3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF3"))
proc `k_cf4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF4", cast[Icallback](cb))
proc `k_cf4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF4"))
proc `k_cf5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF5", cast[Icallback](cb))
proc `k_cf5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF5"))
proc `k_cf6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF6", cast[Icallback](cb))
proc `k_cf6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF6"))
proc `k_cf7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF7", cast[Icallback](cb))
proc `k_cf7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF7"))
proc `k_cf8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF8", cast[Icallback](cb))
proc `k_cf8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF8"))
proc `k_cf9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF9", cast[Icallback](cb))
proc `k_cf9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF9"))
proc `k_cf10=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF10", cast[Icallback](cb))
proc `k_cf10`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF10"))
proc `k_cf11=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF11", cast[Icallback](cb))
proc `k_cf11`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF11"))
proc `k_cf12=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF12", cast[Icallback](cb))
proc `k_cf12`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF12"))
proc `k_cf13=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF13", cast[Icallback](cb))
proc `k_cf13`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF13"))
proc `k_cf14=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF14", cast[Icallback](cb))
proc `k_cf14`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF14"))
proc `k_cf15=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF15", cast[Icallback](cb))
proc `k_cf15`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF15"))
proc `k_cf16=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF16", cast[Icallback](cb))
proc `k_cf16`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF16"))
proc `k_cf17=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF17", cast[Icallback](cb))
proc `k_cf17`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF17"))
proc `k_cf18=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF18", cast[Icallback](cb))
proc `k_cf18`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF18"))
proc `k_cf19=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF19", cast[Icallback](cb))
proc `k_cf19`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF19"))
proc `k_cf20=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cF20", cast[Icallback](cb))
proc `k_cf20`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF20"))
proc `k_cprint=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cPrint", cast[Icallback](cb))
proc `k_cprint`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPrint"))
proc `k_cmenu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cMenu", cast[Icallback](cb))
proc `k_cmenu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cMenu"))
proc `k_mhome=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mHOME", cast[Icallback](cb))
proc `k_mhome`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mHOME"))
proc `k_mup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mUP", cast[Icallback](cb))
proc `k_mup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mUP"))
proc `k_mpgup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mPGUP", cast[Icallback](cb))
proc `k_mpgup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPGUP"))
proc `k_mleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mLEFT", cast[Icallback](cb))
proc `k_mleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mLEFT"))
proc `k_mmiddle=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mMIDDLE", cast[Icallback](cb))
proc `k_mmiddle`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mMIDDLE"))
proc `k_mright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mRIGHT", cast[Icallback](cb))
proc `k_mright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mRIGHT"))
proc `k_mend=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mEND", cast[Icallback](cb))
proc `k_mend`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mEND"))
proc `k_mdown=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mDOWN", cast[Icallback](cb))
proc `k_mdown`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mDOWN"))
proc `k_mpgdn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mPGDN", cast[Icallback](cb))
proc `k_mpgdn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPGDN"))
proc `k_mins=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mINS", cast[Icallback](cb))
proc `k_mins`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mINS"))
proc `k_mdel=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mDEL", cast[Icallback](cb))
proc `k_mdel`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mDEL"))
proc `k_msp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mSP", cast[Icallback](cb))
proc `k_msp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mSP"))
proc `k_mtab=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mTAB", cast[Icallback](cb))
proc `k_mtab`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mTAB"))
proc `k_mcr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mCR", cast[Icallback](cb))
proc `k_mcr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mCR"))
proc `k_mbs=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mBS", cast[Icallback](cb))
proc `k_mbs`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mBS"))
proc `k_mpause=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mPAUSE", cast[Icallback](cb))
proc `k_mpause`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPAUSE"))
proc `k_mesc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mESC", cast[Icallback](cb))
proc `k_mesc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mESC"))
proc `k_mclear=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mCLEAR", cast[Icallback](cb))
proc `k_mclear`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mCLEAR"))
proc `k_mccedilla=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mCcedilla", cast[Icallback](cb))
proc `k_mccedilla`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mCcedilla"))
proc `k_mf1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF1", cast[Icallback](cb))
proc `k_mf1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF1"))
proc `k_mf2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF2", cast[Icallback](cb))
proc `k_mf2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF2"))
proc `k_mf3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF3", cast[Icallback](cb))
proc `k_mf3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF3"))
proc `k_mf4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF4", cast[Icallback](cb))
proc `k_mf4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF4"))
proc `k_mf5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF5", cast[Icallback](cb))
proc `k_mf5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF5"))
proc `k_mf6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF6", cast[Icallback](cb))
proc `k_mf6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF6"))
proc `k_mf7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF7", cast[Icallback](cb))
proc `k_mf7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF7"))
proc `k_mf8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF8", cast[Icallback](cb))
proc `k_mf8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF8"))
proc `k_mf9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF9", cast[Icallback](cb))
proc `k_mf9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF9"))
proc `k_mf10=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF10", cast[Icallback](cb))
proc `k_mf10`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF10"))
proc `k_mf11=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF11", cast[Icallback](cb))
proc `k_mf11`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF11"))
proc `k_mf12=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF12", cast[Icallback](cb))
proc `k_mf12`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF12"))
proc `k_mf13=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF13", cast[Icallback](cb))
proc `k_mf13`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF13"))
proc `k_mf14=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF14", cast[Icallback](cb))
proc `k_mf14`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF14"))
proc `k_mf15=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF15", cast[Icallback](cb))
proc `k_mf15`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF15"))
proc `k_mf16=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF16", cast[Icallback](cb))
proc `k_mf16`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF16"))
proc `k_mf17=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF17", cast[Icallback](cb))
proc `k_mf17`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF17"))
proc `k_mf18=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF18", cast[Icallback](cb))
proc `k_mf18`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF18"))
proc `k_mf19=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF19", cast[Icallback](cb))
proc `k_mf19`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF19"))
proc `k_mf20=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF20", cast[Icallback](cb))
proc `k_mf20`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF20"))
proc `k_mprint=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mPrint", cast[Icallback](cb))
proc `k_mprint`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPrint"))
proc `k_mmenu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mMenu", cast[Icallback](cb))
proc `k_mmenu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mMenu"))
proc `k_yhome=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yHOME", cast[Icallback](cb))
proc `k_yhome`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yHOME"))
proc `k_yup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yUP", cast[Icallback](cb))
proc `k_yup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yUP"))
proc `k_ypgup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yPGUP", cast[Icallback](cb))
proc `k_ypgup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPGUP"))
proc `k_yleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yLEFT", cast[Icallback](cb))
proc `k_yleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yLEFT"))
proc `k_ymiddle=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yMIDDLE", cast[Icallback](cb))
proc `k_ymiddle`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yMIDDLE"))
proc `k_yright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yRIGHT", cast[Icallback](cb))
proc `k_yright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yRIGHT"))
proc `k_yend=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yEND", cast[Icallback](cb))
proc `k_yend`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yEND"))
proc `k_ydown=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yDOWN", cast[Icallback](cb))
proc `k_ydown`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yDOWN"))
proc `k_ypgdn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yPGDN", cast[Icallback](cb))
proc `k_ypgdn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPGDN"))
proc `k_yins=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yINS", cast[Icallback](cb))
proc `k_yins`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yINS"))
proc `k_ydel=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yDEL", cast[Icallback](cb))
proc `k_ydel`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yDEL"))
proc `k_ysp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_ySP", cast[Icallback](cb))
proc `k_ysp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ySP"))
proc `k_ytab=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yTAB", cast[Icallback](cb))
proc `k_ytab`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yTAB"))
proc `k_ycr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yCR", cast[Icallback](cb))
proc `k_ycr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yCR"))
proc `k_ybs=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yBS", cast[Icallback](cb))
proc `k_ybs`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yBS"))
proc `k_ypause=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yPAUSE", cast[Icallback](cb))
proc `k_ypause`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPAUSE"))
proc `k_yesc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yESC", cast[Icallback](cb))
proc `k_yesc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yESC"))
proc `k_yclear=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yCLEAR", cast[Icallback](cb))
proc `k_yclear`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yCLEAR"))
proc `k_yccedilla=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yCcedilla", cast[Icallback](cb))
proc `k_yccedilla`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yCcedilla"))
proc `k_yf1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF1", cast[Icallback](cb))
proc `k_yf1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF1"))
proc `k_yf2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF2", cast[Icallback](cb))
proc `k_yf2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF2"))
proc `k_yf3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF3", cast[Icallback](cb))
proc `k_yf3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF3"))
proc `k_yf4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF4", cast[Icallback](cb))
proc `k_yf4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF4"))
proc `k_yf5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF5", cast[Icallback](cb))
proc `k_yf5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF5"))
proc `k_yf6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF6", cast[Icallback](cb))
proc `k_yf6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF6"))
proc `k_yf7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF7", cast[Icallback](cb))
proc `k_yf7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF7"))
proc `k_yf8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF8", cast[Icallback](cb))
proc `k_yf8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF8"))
proc `k_yf9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF9", cast[Icallback](cb))
proc `k_yf9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF9"))
proc `k_yf10=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF10", cast[Icallback](cb))
proc `k_yf10`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF10"))
proc `k_yf11=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF11", cast[Icallback](cb))
proc `k_yf11`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF11"))
proc `k_yf12=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF12", cast[Icallback](cb))
proc `k_yf12`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF12"))
proc `k_yf13=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF13", cast[Icallback](cb))
proc `k_yf13`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF13"))
proc `k_yf14=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF14", cast[Icallback](cb))
proc `k_yf14`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF14"))
proc `k_yf15=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF15", cast[Icallback](cb))
proc `k_yf15`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF15"))
proc `k_yf16=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF16", cast[Icallback](cb))
proc `k_yf16`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF16"))
proc `k_yf17=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF17", cast[Icallback](cb))
proc `k_yf17`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF17"))
proc `k_yf18=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF18", cast[Icallback](cb))
proc `k_yf18`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF18"))
proc `k_yf19=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF19", cast[Icallback](cb))
proc `k_yf19`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF19"))
proc `k_yf20=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF20", cast[Icallback](cb))
proc `k_yf20`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF20"))
proc `k_yprint=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yPrint", cast[Icallback](cb))
proc `k_yprint`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPrint"))
proc `k_ymenu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yMenu", cast[Icallback](cb))
proc `k_ymenu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yMenu"))
proc `k_splus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sPlus", cast[Icallback](cb))
proc `k_splus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPlus"))
proc `k_scomma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sComma", cast[Icallback](cb))
proc `k_scomma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sComma"))
proc `k_sminus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sMinus", cast[Icallback](cb))
proc `k_sminus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sMinus"))
proc `k_speriod=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sPeriod", cast[Icallback](cb))
proc `k_speriod`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPeriod"))
proc `k_sslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sSlash", cast[Icallback](cb))
proc `k_sslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sSlash"))
proc `k_sasterisk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_sAsterisk", cast[Icallback](cb))
proc `k_sasterisk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sAsterisk"))
proc `k_cuppera=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperA", cast[Icallback](cb))
proc `k_cuppera`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperA"))
proc `k_cupperb=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperB", cast[Icallback](cb))
proc `k_cupperb`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperB"))
proc `k_cupperc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperC", cast[Icallback](cb))
proc `k_cupperc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperC"))
proc `k_cupperd=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperD", cast[Icallback](cb))
proc `k_cupperd`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperD"))
proc `k_cuppere=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperE", cast[Icallback](cb))
proc `k_cuppere`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperE"))
proc `k_cupperf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperF", cast[Icallback](cb))
proc `k_cupperf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperF"))
proc `k_cupperg=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperG", cast[Icallback](cb))
proc `k_cupperg`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperG"))
proc `k_cupperh=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperH", cast[Icallback](cb))
proc `k_cupperh`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperH"))
proc `k_cupperi=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperI", cast[Icallback](cb))
proc `k_cupperi`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperI"))
proc `k_cupperj=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperJ", cast[Icallback](cb))
proc `k_cupperj`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperJ"))
proc `k_cupperk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperK", cast[Icallback](cb))
proc `k_cupperk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperK"))
proc `k_cupperl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperL", cast[Icallback](cb))
proc `k_cupperl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperL"))
proc `k_cupperm=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperM", cast[Icallback](cb))
proc `k_cupperm`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperM"))
proc `k_cuppern=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperN", cast[Icallback](cb))
proc `k_cuppern`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperN"))
proc `k_cuppero=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperO", cast[Icallback](cb))
proc `k_cuppero`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperO"))
proc `k_cupperp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperP", cast[Icallback](cb))
proc `k_cupperp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperP"))
proc `k_cupperq=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperQ", cast[Icallback](cb))
proc `k_cupperq`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperQ"))
proc `k_cupperr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperR", cast[Icallback](cb))
proc `k_cupperr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperR"))
proc `k_cuppers=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperS", cast[Icallback](cb))
proc `k_cuppers`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperS"))
proc `k_cuppert=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperT", cast[Icallback](cb))
proc `k_cuppert`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperT"))
proc `k_cupperu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperU", cast[Icallback](cb))
proc `k_cupperu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperU"))
proc `k_cupperv=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperV", cast[Icallback](cb))
proc `k_cupperv`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperV"))
proc `k_cupperw=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperW", cast[Icallback](cb))
proc `k_cupperw`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperW"))
proc `k_cupperx=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperX", cast[Icallback](cb))
proc `k_cupperx`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperX"))
proc `k_cuppery=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperY", cast[Icallback](cb))
proc `k_cuppery`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperY"))
proc `k_cupperz=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cupperZ", cast[Icallback](cb))
proc `k_cupperz`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperZ"))
proc `k_c1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_c1", cast[Icallback](cb))
proc `k_c1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c1"))
proc `k_c2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_c2", cast[Icallback](cb))
proc `k_c2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c2"))
proc `k_c3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_c3", cast[Icallback](cb))
proc `k_c3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c3"))
proc `k_c4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_c4", cast[Icallback](cb))
proc `k_c4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c4"))
proc `k_c5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_c5", cast[Icallback](cb))
proc `k_c5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c5"))
proc `k_c6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_c6", cast[Icallback](cb))
proc `k_c6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c6"))
proc `k_c7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_c7", cast[Icallback](cb))
proc `k_c7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c7"))
proc `k_c8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_c8", cast[Icallback](cb))
proc `k_c8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c8"))
proc `k_c9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_c9", cast[Icallback](cb))
proc `k_c9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c9"))
proc `k_c0=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_c0", cast[Icallback](cb))
proc `k_c0`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c0"))
proc `k_cplus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cPlus", cast[Icallback](cb))
proc `k_cplus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPlus"))
proc `k_ccomma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cComma", cast[Icallback](cb))
proc `k_ccomma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cComma"))
proc `k_cminus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cMinus", cast[Icallback](cb))
proc `k_cminus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cMinus"))
proc `k_cperiod=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cPeriod", cast[Icallback](cb))
proc `k_cperiod`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPeriod"))
proc `k_cslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cSlash", cast[Icallback](cb))
proc `k_cslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cSlash"))
proc `k_csemicolon=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cSemicolon", cast[Icallback](cb))
proc `k_csemicolon`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cSemicolon"))
proc `k_cequal=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cEqual", cast[Icallback](cb))
proc `k_cequal`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cEqual"))
proc `k_cbracketleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cBracketleft", cast[Icallback](cb))
proc `k_cbracketleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cBracketleft"))
proc `k_cbracketright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cBracketright", cast[Icallback](cb))
proc `k_cbracketright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cBracketright"))
proc `k_cbackslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cBackslash", cast[Icallback](cb))
proc `k_cbackslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cBackslash"))
proc `k_casterisk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_cAsterisk", cast[Icallback](cb))
proc `k_casterisk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cAsterisk"))
proc `k_ma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mA", cast[Icallback](cb))
proc `k_ma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mA"))
proc `k_mb=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mB", cast[Icallback](cb))
proc `k_mb`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mB"))
proc `k_mc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mC", cast[Icallback](cb))
proc `k_mc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mC"))
proc `k_md=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mD", cast[Icallback](cb))
proc `k_md`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mD"))
proc `k_me=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mE", cast[Icallback](cb))
proc `k_me`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mE"))
proc `k_mf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mF", cast[Icallback](cb))
proc `k_mf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF"))
proc `k_mg=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mG", cast[Icallback](cb))
proc `k_mg`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mG"))
proc `k_mh=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mH", cast[Icallback](cb))
proc `k_mh`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mH"))
proc `k_mi=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mI", cast[Icallback](cb))
proc `k_mi`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mI"))
proc `k_mj=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mJ", cast[Icallback](cb))
proc `k_mj`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mJ"))
proc `k_mk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mK", cast[Icallback](cb))
proc `k_mk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mK"))
proc `k_ml=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mL", cast[Icallback](cb))
proc `k_ml`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mL"))
proc `k_mm=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mM", cast[Icallback](cb))
proc `k_mm`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mM"))
proc `k_mn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mN", cast[Icallback](cb))
proc `k_mn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mN"))
proc `k_mo=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mO", cast[Icallback](cb))
proc `k_mo`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mO"))
proc `k_mp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mP", cast[Icallback](cb))
proc `k_mp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mP"))
proc `k_mq=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mQ", cast[Icallback](cb))
proc `k_mq`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mQ"))
proc `k_mr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mR", cast[Icallback](cb))
proc `k_mr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mR"))
proc `k_ms=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mS", cast[Icallback](cb))
proc `k_ms`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mS"))
proc `k_mt=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mT", cast[Icallback](cb))
proc `k_mt`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mT"))
proc `k_mu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mU", cast[Icallback](cb))
proc `k_mu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mU"))
proc `k_mv=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mV", cast[Icallback](cb))
proc `k_mv`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mV"))
proc `k_mw=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mW", cast[Icallback](cb))
proc `k_mw`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mW"))
proc `k_mx=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mX", cast[Icallback](cb))
proc `k_mx`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mX"))
proc `k_my=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mY", cast[Icallback](cb))
proc `k_my`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mY"))
proc `k_mz=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mZ", cast[Icallback](cb))
proc `k_mz`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mZ"))
proc `k_m1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_m1", cast[Icallback](cb))
proc `k_m1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m1"))
proc `k_m2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_m2", cast[Icallback](cb))
proc `k_m2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m2"))
proc `k_m3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_m3", cast[Icallback](cb))
proc `k_m3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m3"))
proc `k_m4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_m4", cast[Icallback](cb))
proc `k_m4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m4"))
proc `k_m5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_m5", cast[Icallback](cb))
proc `k_m5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m5"))
proc `k_m6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_m6", cast[Icallback](cb))
proc `k_m6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m6"))
proc `k_m7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_m7", cast[Icallback](cb))
proc `k_m7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m7"))
proc `k_m8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_m8", cast[Icallback](cb))
proc `k_m8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m8"))
proc `k_m9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_m9", cast[Icallback](cb))
proc `k_m9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m9"))
proc `k_m0=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_m0", cast[Icallback](cb))
proc `k_m0`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m0"))
proc `k_mplus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mPlus", cast[Icallback](cb))
proc `k_mplus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPlus"))
proc `k_mcomma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mComma", cast[Icallback](cb))
proc `k_mcomma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mComma"))
proc `k_mminus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mMinus", cast[Icallback](cb))
proc `k_mminus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mMinus"))
proc `k_mperiod=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mPeriod", cast[Icallback](cb))
proc `k_mperiod`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPeriod"))
proc `k_mslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mSlash", cast[Icallback](cb))
proc `k_mslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mSlash"))
proc `k_msemicolon=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mSemicolon", cast[Icallback](cb))
proc `k_msemicolon`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mSemicolon"))
proc `k_mequal=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mEqual", cast[Icallback](cb))
proc `k_mequal`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mEqual"))
proc `k_mbracketleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mBracketleft", cast[Icallback](cb))
proc `k_mbracketleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mBracketleft"))
proc `k_mbracketright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mBracketright", cast[Icallback](cb))
proc `k_mbracketright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mBracketright"))
proc `k_mbackslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mBackslash", cast[Icallback](cb))
proc `k_mbackslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mBackslash"))
proc `k_masterisk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_mAsterisk", cast[Icallback](cb))
proc `k_masterisk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mAsterisk"))
proc `k_ya=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yA", cast[Icallback](cb))
proc `k_ya`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yA"))
proc `k_yb=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yB", cast[Icallback](cb))
proc `k_yb`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yB"))
proc `k_yc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yC", cast[Icallback](cb))
proc `k_yc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yC"))
proc `k_yd=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yD", cast[Icallback](cb))
proc `k_yd`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yD"))
proc `k_ye=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yE", cast[Icallback](cb))
proc `k_ye`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yE"))
proc `k_yf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yF", cast[Icallback](cb))
proc `k_yf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF"))
proc `k_yg=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yG", cast[Icallback](cb))
proc `k_yg`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yG"))
proc `k_yh=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yH", cast[Icallback](cb))
proc `k_yh`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yH"))
proc `k_yi=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yI", cast[Icallback](cb))
proc `k_yi`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yI"))
proc `k_yj=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yJ", cast[Icallback](cb))
proc `k_yj`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yJ"))
proc `k_yk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yK", cast[Icallback](cb))
proc `k_yk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yK"))
proc `k_yl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yL", cast[Icallback](cb))
proc `k_yl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yL"))
proc `k_ym=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yM", cast[Icallback](cb))
proc `k_ym`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yM"))
proc `k_yn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yN", cast[Icallback](cb))
proc `k_yn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yN"))
proc `k_yo=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yO", cast[Icallback](cb))
proc `k_yo`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yO"))
proc `k_yp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yP", cast[Icallback](cb))
proc `k_yp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yP"))
proc `k_yq=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yQ", cast[Icallback](cb))
proc `k_yq`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yQ"))
proc `k_yr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yR", cast[Icallback](cb))
proc `k_yr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yR"))
proc `k_ys=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yS", cast[Icallback](cb))
proc `k_ys`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yS"))
proc `k_yt=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yT", cast[Icallback](cb))
proc `k_yt`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yT"))
proc `k_yu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yU", cast[Icallback](cb))
proc `k_yu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yU"))
proc `k_yv=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yV", cast[Icallback](cb))
proc `k_yv`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yV"))
proc `k_yw=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yW", cast[Icallback](cb))
proc `k_yw`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yW"))
proc `k_yx=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yX", cast[Icallback](cb))
proc `k_yx`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yX"))
proc `k_yy=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yY", cast[Icallback](cb))
proc `k_yy`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yY"))
proc `k_yz=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yZ", cast[Icallback](cb))
proc `k_yz`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yZ"))
proc `k_y1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_y1", cast[Icallback](cb))
proc `k_y1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y1"))
proc `k_y2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_y2", cast[Icallback](cb))
proc `k_y2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y2"))
proc `k_y3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_y3", cast[Icallback](cb))
proc `k_y3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y3"))
proc `k_y4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_y4", cast[Icallback](cb))
proc `k_y4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y4"))
proc `k_y5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_y5", cast[Icallback](cb))
proc `k_y5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y5"))
proc `k_y6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_y6", cast[Icallback](cb))
proc `k_y6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y6"))
proc `k_y7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_y7", cast[Icallback](cb))
proc `k_y7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y7"))
proc `k_y8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_y8", cast[Icallback](cb))
proc `k_y8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y8"))
proc `k_y9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_y9", cast[Icallback](cb))
proc `k_y9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y9"))
proc `k_y0=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_y0", cast[Icallback](cb))
proc `k_y0`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y0"))
proc `k_yplus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yPlus", cast[Icallback](cb))
proc `k_yplus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPlus"))
proc `k_ycomma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yComma", cast[Icallback](cb))
proc `k_ycomma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yComma"))
proc `k_yminus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yMinus", cast[Icallback](cb))
proc `k_yminus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yMinus"))
proc `k_yperiod=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yPeriod", cast[Icallback](cb))
proc `k_yperiod`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPeriod"))
proc `k_yslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_ySlash", cast[Icallback](cb))
proc `k_yslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ySlash"))
proc `k_ysemicolon=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_ySemicolon", cast[Icallback](cb))
proc `k_ysemicolon`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ySemicolon"))
proc `k_yequal=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yEqual", cast[Icallback](cb))
proc `k_yequal`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yEqual"))
proc `k_ybracketleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yBracketleft", cast[Icallback](cb))
proc `k_ybracketleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yBracketleft"))
proc `k_ybracketright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yBracketright", cast[Icallback](cb))
proc `k_ybracketright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yBracketright"))
proc `k_ybackslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yBackslash", cast[Icallback](cb))
proc `k_ybackslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yBackslash"))
proc `k_yasterisk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  niupc.SetCallback(cast[PIhandle](control), "K_yAsterisk", cast[Icallback](cb))
proc `k_yasterisk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): Icallback {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yAsterisk"))
