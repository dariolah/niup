when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Param
##
## NIUP type: Param_t
##
## constructors
##
##    proc Param(format: string): Param_t
##

proc Param*(format: string): Param_t {.cdecl.} =
    ## Construction element used only in IupParamBox. It is not mapped
    ## in the native system, but it will exist while its IupParamBox
    ## container exists.
    return Param_t(niupc.Param(cstring(format)))

# TODO unknown: param ANGLE Unknown Binary
proc `angle`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ANGLE"))

# TODO unknown: param AUXCONTROL Unknown Binary
proc `auxcontrol`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUXCONTROL"))

proc `button1=`*(ih: Param_t, value: string) {.cdecl.} =
    ## BUTTON1, BUTTON2, BUTTON3: button titles. Default is
    ## "OK/Cancel/Help" for regular IupGetParam, and
    ## "Apply/Reset/Help" when IupParamBox is directly used. For 'u'
    ## parameter.
    SetAttribute(cast[PIhandle](ih), cstring("BUTTON1"), cstring(value))

proc `button1`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BUTTON1"), cstring(value))

# TODO ??? String Binary param
proc `button1`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTON1"))

proc `button2=`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BUTTON2"), cstring(value))

proc `button2`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BUTTON2"), cstring(value))

# TODO ??? String Binary param
proc `button2`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTON2"))

proc `button3=`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BUTTON3"), cstring(value))

proc `button3`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BUTTON3"), cstring(value))

# TODO ??? String Binary param
proc `button3`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTON3"))

# TODO unknown: param CONTROL Unknown Binary
proc `control`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CONTROL"))

# TODO unknown: param DATATYPE Unknown Binary
proc `datatype`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DATATYPE"))

proc `dialogtype=`*(ih: Param_t, value: string) {.cdecl.} =
    ## DIALOGTYPE, FILTER, DIRECTORY, NOCHANGEDIR, NOOVERWRITEPROMPT:
    ## used for the FILE parameter dialog. See IupFileDlg. For 'f'
    ## parameter.
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGTYPE"), cstring(value))

proc `dialogtype`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGTYPE"), cstring(value))

proc `dialogtype`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIALOGTYPE"))

proc `directory=`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIRECTORY"), cstring(value))

proc `directory`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIRECTORY"), cstring(value))

# TODO ??? String Binary param
proc `directory`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIRECTORY"))

proc `filter=`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FILTER"), cstring(value))

proc `filter`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FILTER"), cstring(value))

# TODO ??? String Binary param
proc `filter`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FILTER"))

# TODO unknown: param INDENT Unknown Binary
proc `indent`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("INDENT"))

# TODO unknown: param INDEX Unknown Binary
proc `index`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("INDEX"))

# TODO unknown: param INTERVAL Unknown Binary
proc `interval`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("INTERVAL"))

# TODO unknown: param LABEL Unknown Binary
proc `label`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LABEL"))

proc `mask=`*(ih: Param_t, value: string) {.cdecl.} =
    ## MASK: mask for the edit box input. For 's' and 'm' parameters.
    SetAttribute(cast[PIhandle](ih), cstring("MASK"), cstring(value))

proc `mask`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASK"), cstring(value))

# TODO ??? String Binary param
proc `mask`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASK"))

proc `max=`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAX"), cstring(value))

proc `max`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAX"), cstring(value))

proc `max=`*(ih: Param_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAX"), cstring(&"{x}"))

proc `max`*(ih: Param_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAX"), cstring(&"{x}"))

proc `max`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAX"))

proc `min=`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MIN"), cstring(value))

proc `min`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MIN"), cstring(value))

proc `min=`*(ih: Param_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MIN"), cstring(&"{x}"))

proc `min`*(ih: Param_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MIN"), cstring(&"{x}"))

proc `min`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MIN"))

proc `multiline=`*(ih: Param_t, value: string) {.cdecl.} =
    ## MULTILINE: can be Yes or No. Defines if the edit box can have
    ## more than one line. For 'm' parameter.
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring(value))

proc `multiline`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring(value))

proc `multiline=`*(ih: Param_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring((if yes: "YES" else: "NO")))

proc `multiline`*(ih: Param_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring((if yes: "YES" else: "NO")))

proc `multiline`*(ih: Param_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MULTILINE")) == "YES"

proc `nochangedir=`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOCHANGEDIR"), cstring(value))

proc `nochangedir`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOCHANGEDIR"), cstring(value))

proc `nochangedir=`*(ih: Param_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOCHANGEDIR"), cstring((if yes: "YES" else: "NO")))

proc `nochangedir`*(ih: Param_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOCHANGEDIR"), cstring((if yes: "YES" else: "NO")))

proc `nochangedir`*(ih: Param_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NOCHANGEDIR")) == "YES"

# TODO unknown: param NOFRAME Unknown Binary
proc `noframe`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NOFRAME"))

proc `nooverwriteprompt=`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOOVERWRITEPROMPT"), cstring(value))

proc `nooverwriteprompt`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOOVERWRITEPROMPT"), cstring(value))

proc `nooverwriteprompt=`*(ih: Param_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOOVERWRITEPROMPT"), cstring((if yes: "YES" else: "NO")))

proc `nooverwriteprompt`*(ih: Param_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOOVERWRITEPROMPT"), cstring((if yes: "YES" else: "NO")))

proc `nooverwriteprompt`*(ih: Param_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NOOVERWRITEPROMPT")) == "YES"

# TODO unknown: param PARTIAL Unknown Binary
proc `partial`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PARTIAL"))

# TODO unknown: param PRECISION Unknown Binary
proc `precision`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PRECISION"))

proc `step=`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STEP"), cstring(value))

proc `step`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STEP"), cstring(value))

proc `step=`*(ih: Param_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STEP"), cstring(&"{x}"))

proc `step`*(ih: Param_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STEP"), cstring(&"{x}"))

proc `step`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("STEP"))

proc `tip=`*(ih: Param_t, value: string) {.cdecl.} =
    ## TIP: text of the tip. For all parameters.
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary param
proc `tip`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `title=`*(ih: Param_t, value: string) {.cdecl.} =
    ## TITLE: text of the parameter, used as label. For all
    ## parameters.
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

proc `title`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

# TODO ??? String Binary param
proc `title`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLE"))

proc `type=`*(ih: Param_t, value: string) {.cdecl.} =
    ## TYPE: can be BOOLEAN ('b'), LIST ('l'), OPTIONS ('o'), REAL
    ## ('A', 'a', 'R', 'r'), STRING ('m', 's'), INTEGER ('i'), DATE
    ## ('d'), FILE ('f'), COLOR ('c'), SEPARATOR ('t'), BUTTONNAMES
    ## ('u'), PARAMBOX ('x') and HANDLE ('h'). And describe the type
    ## of the parameter. For all parameters.
    SetAttribute(cast[PIhandle](ih), cstring("TYPE"), cstring(value))

proc `type`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TYPE"), cstring(value))

# TODO ??? String Binary param
proc `type`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TYPE"))

proc `value=`*(ih: Param_t, value: string) {.cdecl.} =
    ## VALUE - the value of the parameter. IupGetFloat and IupGetInt
    ## can also be used. For the current parameter inside the callback
    ## contains the new value that will be applied to the control, to
    ## get the old value use the VALUE attribute for the CONTROL
    ## returned Ihandle\*.
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: Param_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

# TODO ??? String Binary param
proc `value`*(ih: Param_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `destroy_cb=`*(ih: Param_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## DESTROY_CB DESTROY_CB Called right before an element is
    ## destroyed. Callback int function(Ihandle \*ih); [in C]
    ## ih:destroy_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Notes If the dialog is
    ## visible then it is hidden before it is destroyed. The callback
    ## will be called right after it is hidden. The callback will be
    ## called before all other destroy procedures. For instance, if
    ## the element has children then it is called before the children
    ## are destroyed. For language binding implementations use the
    ## callback name "LDESTROY_CB" to release memory allocated by the
    ## binding for the element. Also the callback will be called
    ## before the language callback. Affects All.
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Param_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Param_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `ldestroy_cb=`*(ih: Param_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Param_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Param_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: Param_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Param_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Param_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: Param_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Param_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Param_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: Param_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Param_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Param_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

