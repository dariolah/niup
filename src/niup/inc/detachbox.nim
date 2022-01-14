when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: DetachBox
##
## NIUP type: DetachBox_t
##
## constructors
##
##    proc DetachBox(child: IUPhandle_t): DetachBox_t
##

proc DetachBox*(child: IUPhandle_t): DetachBox_t {.cdecl.} =
    ## Creates a detachable void container. Dragging and dropping this
    ## element, it creates a new dialog composed by its child or
    ## elements arranged in it (for example, a child like IupVbox or
    ## IupHbox). During the drag, the ESC key can be pressed to cancel
    ## the action. It does not have a native representation, but it
    ## contains also a IupCanvas to implement the bar handler.
    return DetachBox_t(niupc.DetachBox(cast[PIhandle](child)))

proc `active=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: DetachBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: DetachBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: DetachBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `barsize=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    ## BARSIZE (non inheritable): controls the size of the bar
    ## handler. To completely hide the bar set BARSIZE to 0 (since
    ## 3.16). Default: 10.
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(value))

proc `barsize`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(value))

proc `barsize=`*(ih: DetachBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(&"{x}"))

proc `barsize`*(ih: DetachBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(&"{x}"))

proc `barsize`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BARSIZE"))

proc `canfocus=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: DetachBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: DetachBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: DetachBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `clientoffset`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `color=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    ## COLOR: Changes the color of the bar grip affordance. The value
    ## should be given in "R G B" color style. Default: "160 160 160".
    ## When SHOWGRIP = NO, this attribute sets the background color of
    ## the bar handler.
    SetAttribute(cast[PIhandle](ih), cstring("COLOR"), cstring(value))

proc `color`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COLOR"), cstring(value))

proc `color=`*(ih: DetachBox_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `color`*(ih: DetachBox_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `color`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COLOR"))

# TODO unknown: detachbox DETACH Unknown Binary
proc `expand=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    ## EXPAND (non inheritable): The default value is "YES".
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: DetachBox_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: DetachBox_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `floating=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    ## FONT, SIZE, RASTERSIZE, CLIENTSIZE, CLIENTOFFSET, POSITION,
    ## MINSIZE, MAXSIZE, THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary detachbox
proc `font`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary detachbox
proc `fontface`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: DetachBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: DetachBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary detachbox
proc `fontstyle`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `handlename=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary detachbox
proc `handlename`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `maxsize=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: DetachBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: DetachBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: DetachBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: DetachBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary detachbox
proc `name`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `normalizergroup=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary detachbox
proc `normalizergroup`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary detachbox
proc `ntheme`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `oldbrother_handle`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OLDBROTHER_HANDLE"))

proc `oldparent_handle`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OLDPARENT_HANDLE"))

proc `orientation=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    ## ORIENTATION (creation only) (non inheritable): Indicates the
    ## orientation of the bar handler. The direction of the resize is
    ## perpendicular to the orientation. Possible values are
    ## "VERTICAL" or "HORIZONTAL". Default: "VERTICAL".
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"))

# TODO unknown: detachbox PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: detachbox PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: DetachBox_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: DetachBox_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: DetachBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: DetachBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: DetachBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: DetachBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: DetachBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

# TODO unknown: detachbox RESTORE Unknown Binary
# TODO unknown: detachbox RESTOREWHENCLOSED Unknown Binary
proc `restorewhenclosed`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RESTOREWHENCLOSED"))

proc `showgrip=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    ## SHOWGRIP (non inheritable): Shows the bar grip affordance.
    ## Default: YES. When set to NO, the BARSIZE is set to 5 (if
    ## greater than 5). To completely hide the bar set BARSIZE to 0
    ## (since 3.16).
    SetAttribute(cast[PIhandle](ih), cstring("SHOWGRIP"), cstring(value))

proc `showgrip`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWGRIP"), cstring(value))

proc `showgrip=`*(ih: DetachBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWGRIP"), cstring((if yes: "YES" else: "NO")))

proc `showgrip`*(ih: DetachBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWGRIP"), cstring((if yes: "YES" else: "NO")))

proc `showgrip`*(ih: DetachBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWGRIP")) == "YES"

proc `size=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: DetachBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: DetachBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `theme=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary detachbox
proc `theme`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `usersize=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: DetachBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: DetachBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `visible=`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: DetachBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: DetachBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: DetachBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: DetachBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

# TODO unknown: detachbox XFONTID Unknown Binary
proc `xfontid`*(ih: DetachBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `destroy_cb=`*(ih: DetachBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: DetachBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: DetachBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `detached_cb=`*(ih: DetachBox_t, cb: proc (ih: PIhandle, arg2: PIhandle, arg3: cint, arg4: cint): cint {.cdecl.}) {.cdecl.} =
    ## DETACHED_CB: Callback called when the box is detached. int
    ## function(Ihandle \*ih, Ihandle \*new_parent, int x, int y); [in
    ## C] ih:detached_cb(new_parent: ihandle, x, y: number) -> (ret:
    ## number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("DETACHED_CB"), cast[Icallback](cb))

proc `detached_cb`*(ih: DetachBox_t, cb: proc (ih: PIhandle, arg2: PIhandle, arg3: cint, arg4: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DETACHED_CB"), cast[Icallback](cb))

proc `detached_cb`*(ih: DetachBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DETACHED_CB")))

proc `ldestroy_cb=`*(ih: DetachBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: DetachBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: DetachBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: DetachBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: DetachBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: DetachBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: DetachBox_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: DetachBox_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: DetachBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `restored_cb=`*(ih: DetachBox_t, cb: proc (ih: PIhandle, arg2: PIhandle, arg3: cint, arg4: cint): cint {.cdecl.}) {.cdecl.} =
    ## RESTORED_CB: Callback called when the box is restored if
    ## RESTOREWHENCLOSED=Yes. (since 3.21) int function(Ihandle \*ih,
    ## Ihandle \*old_parent, int x, int y); [in C]
    ## ih:restored_cb(old_parent: ihandle, x, y: number) -> (ret:
    ## number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("RESTORED_CB"), cast[Icallback](cb))

proc `restored_cb`*(ih: DetachBox_t, cb: proc (ih: PIhandle, arg2: PIhandle, arg3: cint, arg4: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RESTORED_CB"), cast[Icallback](cb))

proc `restored_cb`*(ih: DetachBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RESTORED_CB")))

proc `unmap_cb=`*(ih: DetachBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: DetachBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: DetachBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

