when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Split
##
## NIUP type: Split_t
##
## constructors
##
##    proc Split(child1: IUPhandle_t; child2: IUPhandle_t): Split_t
##

proc Split*(child1: IUPhandle_t; child2: IUPhandle_t): Split_t {.cdecl.} =
    ## Creates a void container that split its client area in two.
    ## Allows the provided controls to be enclosed in a box that
    ## allows expanding and contracting the element size in one
    ## direction, but when one is expanded the other is contracted. It
    ## does not have a native representation, but it contains also a
    ## IupFlatSeparator to implement the bar handler.
    return Split_t(niupc.Split(cast[PIhandle](child1), cast[PIhandle](child2)))

proc `active=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Split_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `autohide=`*(ih: Split_t, value: string) {.cdecl.} =
    ## AUTOHIDE (non inheritable): if the child client area is smaller
    ## than the bar size, then automatically hide the child. Default:
    ## NO.
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring(value))

proc `autohide`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring(value))

proc `autohide=`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `autohide`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `autohide`*(ih: Split_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE")) == "YES"

proc `barsize=`*(ih: Split_t, value: string) {.cdecl.} =
    ## BARSIZE (non inheritable): controls the size of the bar
    ## handler. Default: 5.
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(value))

proc `barsize`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(value))

proc `barsize=`*(ih: Split_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(&"{x}"))

proc `barsize`*(ih: Split_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(&"{x}"))

proc `barsize`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BARSIZE"))

proc `canfocus=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Split_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `clientoffset`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `color=`*(ih: Split_t, value: string) {.cdecl.} =
    ## COLOR: Changes the color of the bar grip affordance. Default:
    ## "160 160 160".
    SetAttribute(cast[PIhandle](ih), cstring("COLOR"), cstring(value))

proc `color`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COLOR"), cstring(value))

proc `color=`*(ih: Split_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `color`*(ih: Split_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `color`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COLOR"))

proc `direction=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIRECTION"), cstring(value))

proc `direction`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIRECTION"), cstring(value))

proc `direction`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIRECTION"))

proc `expand=`*(ih: Split_t, value: string) {.cdecl.} =
    ## EXPAND (non inheritable): The default value is "YES".
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: Split_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Split_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `floating=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: Split_t, value: string) {.cdecl.} =
    ## FONT, SIZE, RASTERSIZE, CLIENTSIZE, CLIENTOFFSET, POSITION,
    ## MINSIZE, MAXSIZE, THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary split
proc `font`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary split
proc `fontface`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: Split_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Split_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary split
proc `fontstyle`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `handlename=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary split
proc `handlename`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `layoutdrag=`*(ih: Split_t, value: string) {.cdecl.} =
    ## LAYOUTDRAG (non inheritable): When the bar is moved
    ## automatically update the children layout. Default: YES. If set
    ## to NO then the layout will be updated only when the mouse drag
    ## is released.
    SetAttribute(cast[PIhandle](ih), cstring("LAYOUTDRAG"), cstring(value))

proc `layoutdrag`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LAYOUTDRAG"), cstring(value))

proc `layoutdrag=`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LAYOUTDRAG"), cstring((if yes: "YES" else: "NO")))

proc `layoutdrag`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LAYOUTDRAG"), cstring((if yes: "YES" else: "NO")))

proc `layoutdrag`*(ih: Split_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LAYOUTDRAG")) == "YES"

proc `maxsize=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: Split_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Split_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

# TODO unknown: split MINMAX Unknown Binary
proc `minmax`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINMAX"))

proc `minsize=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: Split_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Split_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary split
proc `name`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `normalizergroup=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary split
proc `normalizergroup`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary split
proc `ntheme`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `orientation=`*(ih: Split_t, value: string) {.cdecl.} =
    ## ORIENTATION (creation only) (non inheritable): Indicates the
    ## orientation of the bar handler. The direction of the resize is
    ## perpendicular to the orientation. Possible values are
    ## "VERTICAL" or "HORIZONTAL". Default: "VERTICAL".
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"))

# TODO unknown: split PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: split PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: Split_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Split_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Split_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: Split_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Split_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `showgrip=`*(ih: Split_t, value: string) {.cdecl.} =
    ## SHOWGRIP (non inheritable): Shows the bar grip affordance.
    ## Default: YES. When set to NO, the BARSIZE is set to 3. When set
    ## to NO, COLOR is used to fill the grip area (since 3.11.1) if
    ## defined, if COLOR is not defined the area is filled with the
    ## parent background color. If set to "LINES" then instead of the
    ## traditional grip appearance, it will be two parallel lines
    ## (since 3.11.1).
    SetAttribute(cast[PIhandle](ih), cstring("SHOWGRIP"), cstring(value))

proc `showgrip`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWGRIP"), cstring(value))

proc `showgrip=`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWGRIP"), cstring((if yes: "YES" else: "NO")))

proc `showgrip`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWGRIP"), cstring((if yes: "YES" else: "NO")))

proc `showgrip`*(ih: Split_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWGRIP")) == "YES"

proc `size=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: Split_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Split_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `theme=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary split
proc `theme`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `usersize=`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: Split_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Split_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `value=`*(ih: Split_t, value: string) {.cdecl.} =
    ## VALUE (non inheritable): The proportion of the left or top
    ## (child1) client area relative to the full available area. It is
    ## an integer between 0 and 1000. If not defined or set to NULL,
    ## the Native size of the two children will define its initial
    ## size.
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

# TODO ??? String Binary split
proc `value`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `visible=`*(ih: Split_t, value: string) {.cdecl.} =
    ## When AUTOHIDE=Yes the control will set FLOATING=IGNORE and
    ## VISIBLE=NO for the child to be auto-hidden, then back to
    ## FLOATING=NO and VISIBLE=Yes when shown. So if the child has
    ## several children with different combinations of VISIBLE it is
    ## recommended that this child to be a native container like
    ## IupBackgroundBox or IupFrame, so the VISIBLE attribute will be
    ## not be propagated to its children.
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: Split_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Split_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Split_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

# TODO unknown: split XFONTID Unknown Binary
proc `xfontid`*(ih: Split_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `destroy_cb=`*(ih: Split_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Split_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Split_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `ldestroy_cb=`*(ih: Split_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Split_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Split_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: Split_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Split_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Split_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: Split_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Split_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Split_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: Split_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Split_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Split_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `valuechanged_cb=`*(ih: Split_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## VALUECHANGED_CB: Called after the value was interactively
    ## changed by the user. (since 3.12) int function(Ihandle \*ih);
    ## [in C]ih:valuechanged_cb() -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: Split_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: Split_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB")))

