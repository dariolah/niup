when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Colorbar
##
## NIUP type: Colorbar_t
##
## constructors
##
##    proc Colorbar(): Colorbar_t
##

proc Colorbar*(): Colorbar_t {.cdecl.} =
    ## Creates a color palette to enable a color selection from
    ## several samples. It can select one or two colors. The primary
    ## color is selected with the left mouse button, and the secondary
    ## color is selected with the right mouse button. You can double
    ## click a cell to change its color and you can double click the
    ## preview area to switch between primary and secondary colors.
    ## (Migrated from the IupControls library since IUP 3.24, it does
    ## not depend on the CD library anymore.) It inherits from
    ## IupCanvas. Originally implemented by Andr Clinio.
    return Colorbar_t(niupc.Colorbar())

proc `active=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    ## ACTIVE, BGCOLOR, FONT, SCREENPOSITION, POSITION, MINSIZE,
    ## MAXSIZE, WID, TIP, EXPAND, SIZE, RASTERSIZE, ZORDER, VISIBLE,
    ## THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `backingstore=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring(value))

proc `backingstore`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring(value))

proc `backingstore=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring((if yes: "YES" else: "NO")))

proc `backingstore`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring((if yes: "YES" else: "NO")))

proc `backingstore`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE")) == "YES"

proc `bgcolor=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `border`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDER")) == "YES"

proc `canfocus=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

# TODO getter colorbar CELL
proc `charsize`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `count`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COUNT"))

proc `cursor=`*(ih: Colorbar_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: Colorbar_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CURSOR"))

proc `dragdrop=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragsource=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary colorbar
proc `dragtypes`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

# TODO unknown: colorbar DRAWABLE Unknown Binary
proc `drawable`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWABLE"))

proc `drawbgcolor=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(value))

proc `drawbgcolor`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(value))

proc `drawbgcolor=`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawbgcolor`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawbgcolor`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"))

proc `drawcolor=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(value))

proc `drawcolor`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(value))

proc `drawcolor=`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawcolor`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawcolor`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"))

proc `drawdriver`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWDRIVER"))

proc `drawfont=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"), cstring(value))

proc `drawfont`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"), cstring(value))

# TODO ??? String Binary colorbar
proc `drawfont`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"))

proc `drawlinewidth=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(value))

proc `drawlinewidth`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(value))

proc `drawlinewidth=`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(&"{x}"))

proc `drawlinewidth`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(&"{x}"))

proc `drawlinewidth`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"))

proc `drawmakeinactive=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring(value))

proc `drawmakeinactive`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring(value))

proc `drawmakeinactive=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `drawmakeinactive`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `drawmakeinactive`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE")) == "YES"

proc `drawsize`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWSIZE"))

proc `drawstyle=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"), cstring(value))

proc `drawstyle`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"), cstring(value))

proc `drawstyle`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"))

proc `drawtextalignment=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"), cstring(value))

proc `drawtextalignment`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"), cstring(value))

proc `drawtextalignment`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"))

proc `drawtextclip=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring(value))

proc `drawtextclip`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring(value))

proc `drawtextclip=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextclip`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextclip`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP")) == "YES"

proc `drawtextellipsis=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring(value))

proc `drawtextellipsis`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring(value))

proc `drawtextellipsis=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring((if yes: "YES" else: "NO")))

proc `drawtextellipsis`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring((if yes: "YES" else: "NO")))

proc `drawtextellipsis`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS")) == "YES"

proc `drawtextlayoutcenter=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring(value))

proc `drawtextlayoutcenter`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring(value))

proc `drawtextlayoutcenter=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring((if yes: "YES" else: "NO")))

proc `drawtextlayoutcenter`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring((if yes: "YES" else: "NO")))

proc `drawtextlayoutcenter`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER")) == "YES"

proc `drawtextorientation=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(value))

proc `drawtextorientation`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(value))

proc `drawtextorientation=`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(&"{x}"))

proc `drawtextorientation`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(&"{x}"))

proc `drawtextorientation`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"))

proc `drawtextwrap=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring(value))

proc `drawtextwrap`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring(value))

proc `drawtextwrap=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextwrap`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextwrap`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP")) == "YES"

proc `dropfilestarget=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary colorbar
proc `droptypes`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `dx=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(value))

proc `dx`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(value))

proc `dx=`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(&"{x}"))

proc `dx`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(&"{x}"))

proc `dx`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DX"))

proc `dy=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(value))

proc `dy`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(value))

proc `dy=`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(&"{x}"))

proc `dy`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(&"{x}"))

proc `dy`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DY"))

proc `expand=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `flat=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    ## FLAT: use a 1 pixel flat border instead of the default 3 pixels
    ## sunken border. When enabled is the same as setting SHADOWED=NO.
    ## Can be Yes or No. Default: No. (since 3.24)
    SetAttribute(cast[PIhandle](ih), cstring("FLAT"), cstring(value))

proc `flat`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLAT"), cstring(value))

proc `flat=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLAT"), cstring((if yes: "YES" else: "NO")))

proc `flat`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLAT"), cstring((if yes: "YES" else: "NO")))

proc `flat`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLAT")) == "YES"

proc `flatcolor=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    ## FLATCOLOR: color of the border when FLAT=Yes and the preview
    ## area borders. Default: "0 0 0". (since 3.24)
    SetAttribute(cast[PIhandle](ih), cstring("FLATCOLOR"), cstring(value))

proc `flatcolor`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLATCOLOR"), cstring(value))

proc `flatcolor=`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLATCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `flatcolor`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLATCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `flatcolor`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLATCOLOR"))

proc `floating=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

# TODO unknown: colorbar FOCUSSELECT Unknown Binary
proc `focusselect`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FOCUSSELECT"))

proc `font=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary colorbar
proc `font`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary colorbar
proc `fontface`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary colorbar
proc `fontstyle`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `handlename=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary colorbar
proc `handlename`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `linex=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(value))

proc `linex`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(value))

proc `linex=`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(&"{x}"))

proc `linex`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(&"{x}"))

proc `linex`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINEX"))

proc `liney=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(value))

proc `liney`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(value))

proc `liney=`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(&"{x}"))

proc `liney`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(&"{x}"))

proc `liney`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINEY"))

proc `maxsize=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: Colorbar_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Colorbar_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: Colorbar_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Colorbar_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary colorbar
proc `name`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `normalizergroup=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary colorbar
proc `normalizergroup`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary colorbar
proc `ntheme`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

# TODO unknown: colorbar NUM_CELLS Unknown Binary
proc `num_cells`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NUM_CELLS"))

# TODO unknown: colorbar NUM_PARTS Unknown Binary
proc `num_parts`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NUM_PARTS"))

proc `orientation=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    ## ORIENTATION: Controls the orientation. It can be "VERTICAL" or
    ## "HORIZONTAL". Default: "VERTICAL".
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"))

# TODO unknown: colorbar PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: colorbar PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: Colorbar_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Colorbar_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `posx=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(value))

proc `posx`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(value))

proc `posx=`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(&"{x}"))

proc `posx`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(&"{x}"))

proc `posx`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSX"))

proc `posy=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(value))

proc `posy`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(value))

proc `posy=`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(&"{x}"))

proc `posy`*(ih: Colorbar_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(&"{x}"))

proc `posy`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSY"))

# TODO unknown: colorbar PREVIEW_SIZE Unknown Binary
proc `preview_size`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PREVIEW_SIZE"))

# TODO unknown: colorbar PRIMARY_CELL Unknown Binary
proc `primary_cell`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PRIMARY_CELL"))

proc `propagatefocus=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: Colorbar_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Colorbar_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `sb_resize`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_RESIZE"))

proc `screenposition`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `scrollbar=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR")) == "YES"

# TODO unknown: colorbar SECONDARY_CELL Unknown Binary
proc `secondary_cell`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SECONDARY_CELL"))

# TODO unknown: colorbar SHADOWED Unknown Binary
proc `shadowed`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHADOWED"))

proc `show_preview=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    ## SHOW_PREVIEW: Controls the display of the preview area.
    ## Default: "YES".
    SetAttribute(cast[PIhandle](ih), cstring("SHOW_PREVIEW"), cstring(value))

proc `show_preview`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOW_PREVIEW"), cstring(value))

proc `show_preview=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOW_PREVIEW"), cstring((if yes: "YES" else: "NO")))

proc `show_preview`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOW_PREVIEW"), cstring((if yes: "YES" else: "NO")))

proc `show_preview`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOW_PREVIEW")) == "YES"

# TODO unknown: colorbar SHOW_SECONDARY Unknown Binary
proc `show_secondary`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOW_SECONDARY"))

proc `size=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    ## SIZE: there is no initial size. You must define SIZE or
    ## RASTERSIZE.
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: Colorbar_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Colorbar_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

# TODO unknown: colorbar SQUARED Unknown Binary
proc `squared`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SQUARED"))

proc `theme=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary colorbar
proc `theme`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary colorbar
proc `tip`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Colorbar_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary colorbar
proc `tipicon`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary colorbar
proc `tipmarkup`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: Colorbar_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Colorbar_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `touch=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring(value))

proc `touch`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring(value))

proc `touch=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring((if yes: "YES" else: "NO")))

proc `touch`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring((if yes: "YES" else: "NO")))

proc `touch`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOUCH")) == "YES"

# TODO unknown: colorbar TRANSPARENCY Unknown Binary
proc `transparency`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRANSPARENCY"))

proc `usersize=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: Colorbar_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Colorbar_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `visible=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wheeldropfocus=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring(value))

proc `wheeldropfocus`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring(value))

proc `wheeldropfocus=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `wheeldropfocus`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `wheeldropfocus`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS")) == "YES"

proc `wid`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

proc `xautohide=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring(value))

proc `xautohide`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring(value))

proc `xautohide=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `xautohide`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `xautohide`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE")) == "YES"

proc `xdisplay`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XDISPLAY"))

# TODO unknown: colorbar XFONTID Unknown Binary
proc `xfontid`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `xhidden`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XHIDDEN")) == "YES"

proc `xmax=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(value))

proc `xmax`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(value))

proc `xmax=`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(&"{x}"))

proc `xmax`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(&"{x}"))

proc `xmax`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XMAX"))

proc `xmin=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(value))

proc `xmin`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(value))

proc `xmin=`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(&"{x}"))

proc `xmin`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(&"{x}"))

proc `xmin`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XMIN"))

# TODO unknown: colorbar XWINDOW Unknown Binary
proc `xwindow`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XWINDOW"))

proc `y`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `yautohide=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring(value))

proc `yautohide`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring(value))

proc `yautohide=`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `yautohide`*(ih: Colorbar_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `yautohide`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE")) == "YES"

proc `yhidden`*(ih: Colorbar_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YHIDDEN")) == "YES"

proc `ymax=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(value))

proc `ymax`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(value))

proc `ymax=`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(&"{x}"))

proc `ymax`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(&"{x}"))

proc `ymax`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YMAX"))

proc `ymin=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(value))

proc `ymin`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(value))

proc `ymin=`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(&"{x}"))

proc `ymin`*(ih: Colorbar_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(&"{x}"))

proc `ymin`*(ih: Colorbar_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YMIN"))

proc `zorder=`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: Colorbar_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `action=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cfloat, arg3: cfloat): cint {.cdecl.}) {.cdecl.} =
    ## ACTION ACTION Action generated when the element is activated.
    ## Affects each element differently. Callback int function(Ihandle
    ## \*ih); [in C] ih:action() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. In some
    ## elements, this callback may receive more parameters, apart from
    ## ih. Please refer to each element's documentation. Affects
    ## IupButton, IupItem, IupList, IupText, IupCanvas, IupMultiline,
    ## IupToggle
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cfloat, arg3: cfloat): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION")))

proc `button_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    ## BUTTON_CB BUTTON_CB Action generated when a mouse button is
    ## pressed or released. Callback int function(Ihandle\* ih, int
    ## button, int pressed, int x, int y, char\* status); [in C]
    ## ih:button_cb(button, pressed, x, y: number, status: string) ->
    ## (ret: number) [in Lua] ih: identifies the element that
    ## activated the event. button: identifies the activated mouse
    ## button: IUP_BUTTON1 - left mouse button (button 1); IUP_BUTTON2
    ## - middle mouse button (button 2); IUP_BUTTON3 - right mouse
    ## button (button 3). pressed: indicates the state of the button:
    ## 0 - mouse button was released; 1 - mouse button was pressed. x,
    ## y: position in the canvas where the event has occurred, in
    ## pixels. status: status of the mouse buttons and some keyboard
    ## keys at the moment the event is generated. The following macros
    ## must be used for verification: iup_isshift(status)
    ## iup_iscontrol(status) iup_isbutton1(status)
    ## iup_isbutton2(status) iup_isbutton3(status)
    ## iup_isbutton4(status) iup_isbutton5(status)
    ## iup_isdouble(status) iup_isalt(status) iup_issys(status) They
    ## return 1 if the respective key or button is pressed, and 0
    ## otherwise. These macros are also available in Lua, returning a
    ## boolean. Returns: IUP_CLOSE will be processed. On some controls
    ## if IUP_IGNORE is returned the action is ignored (this is system
    ## dependent). Notes This callback can be used to customize a
    ## button behavior. For a standard button behavior use the ACTION
    ## callback of the IupButton. For a single click the callback is
    ## called twice, one for pressed=1 and one for pressed=0. Only
    ## after both calls the ACTION callback is called. In Windows, if
    ## a dialog is shown or popup in any situation there could be
    ## unpredictable results because the native system still has
    ## processing to be done even after the callback is called. A
    ## double click is preceded by two single clicks, one for
    ## pressed=1 and one for pressed=0, and followed by a press=0, all
    ## three without the double click flag set. In GTK, it is preceded
    ## by an additional two single clicks sequence. For example, for
    ## one double click all the following calls are made:
    ## BUTTON_CB(but=1 (1), x=154, y=83 [ 1 ]) BUTTON_CB(but=1 (0),
    ## x=154, y=83 [ 1 ]) BUTTON_CB(but=1 (1), x=154, y=83 [ 1 ]) (in
    ## GTK only) BUTTON_CB(but=1 (0), x=154, y=83 [ 1 ]) (in GTK only)
    ## BUTTON_CB(but=1 (1), x=154, y=83 [ 1 D ]) BUTTON_CB(but=1 (0),
    ## x=154, y=83 [ 1 ]) Between press and release all mouse events
    ## are redirected only to this control, even if the cursor moves
    ## outside the element. So the BUTTON_CB callback when released
    ## and the MOTION_CB callback can be called with coordinates
    ## outside the element rectangle. Affects IupCanvas, IupButton,
    ## IupText, IupList, IupGLCanvas
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BUTTON_CB")))

proc `cell_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    ## CELL_CB: called when the user double clicks a color cell to
    ## change its value. char\* function(Ihandle\* ih, int cell); [in C]
    ## ih:cell_cb(cell: number) -> (ret: string) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("CELL_CB"), cast[Icallback](cb))

proc `cell_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("CELL_CB"), cast[Icallback](cb))

proc `cell_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("CELL_CB")))

proc `destroy_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragend_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropfiles_cb=`*(ih: Colorbar_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    ## DROPFILES_CB DROPFILES_CB Action called when a file is
    ## "dropped" into the control. When several files are dropped at
    ## once, the callback is called several times, once for each file.
    ## If defined after the element is mapped then the attribute
    ## DROPFILESTARGET must be set to YES. [Windows and GTK Only] (GTK
    ## 2.6) Callback int function(Ihandle \*ih, const char\* filename,
    ## int num, int x, int y); [in C] ih:dropfiles_cb(filename:
    ## string; num, x, y: number) -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. filename:
    ## Name of the dropped file. num: Number index of the dropped
    ## file. If several files are dropped, num is the index of the
    ## dropped file starting from "total-1" to "0". x: X coordinate of
    ## the point where the user released the mouse button. y: Y
    ## coordinate of the point where the user released the mouse
    ## button. Returns: If IUP_IGNORE is returned the callback will
    ## NOT be called for the next dropped files, and the processing of
    ## dropped files will be interrupted. Affects IupDialog,
    ## IupCanvas, IupGLCanvas, IupText, IupList
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: Colorbar_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `enterwindow_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## ENTERWINDOW_CB ENTERWINDOW_CB Action generated when the mouse
    ## enters the native element. Callback int function(Ihandle \*ih);
    ## [in C] ih:enterwindow_cb() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. Notes When
    ## the cursor is moved from one element to another, the call order
    ## in all platforms will be first the LEAVEWINDOW_CB callback of
    ## the old control followed by the ENTERWINDOW_CB callback of the
    ## new control. (since 3.14) If the mouse button is hold pressed
    ## and the cursor moves outside the element the behavior is system
    ## dependent. In Windows the LEAVEWINDOW_CB/ENTERWINDOW_CB
    ## callbacks are NOT called, in GTK the callbacks are called.
    ## Affects All controls with user interaction. See Also
    ## LEAVEWINDOW_CB
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `extended_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    ## EXTENDED_CB: called when the user right click a cell with the
    ## Shift key pressed. It is independent of the SHOW_SECONDARY
    ## attribute. int function(Ihandle\* ih, int cell); [in C]
    ## ih:extended_cb(cell: number) -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("EXTENDED_CB"), cast[Icallback](cb))

proc `extended_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EXTENDED_CB"), cast[Icallback](cb))

proc `extended_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("EXTENDED_CB")))

proc `focus_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FOCUS_CB")))

proc `getfocus_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## GETFOCUS_CB GETFOCUS_CB Action generated when an element is
    ## given keyboard focus. This callback is called after the
    ## KILLFOCUS_CB of the element that loosed the focus. The
    ## IupGetFocus function during the callback returns the element
    ## that loosed the focus. Callback int function(Ihandle \*ih); [in
    ## C] ih:getfocus_cb() -> (ret: number) [in Lua] ih: identifier of
    ## the element that received keyboard focus. Affects All elements
    ## with user interaction, except menus. See Also KILLFOCUS_CB,
    ## IupGetFocus, IupSetFocus
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `keypress_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, c, press: cint): cint {.cdecl.}) {.cdecl.} =
    ## KEYPRESS_CB KEYPRESS_CB Action generated when a key is pressed
    ## or released. If the key is pressed and held several calls will
    ## occur. It is called after the callback K_ANY is processed.
    ## Callback int function(Ihandle \*ih, int c, int press); [in C]
    ## ih:keypress_cb(c, press: number) -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. c:
    ## identifier of typed key. Please refer to the Keyboard Codes
    ## table for a list of possible values. press: 1 is the user
    ## pressed the key or 0 otherwise. Returns: If IUP_IGNORE is
    ## returned the key is ignored by the system. IUP_CLOSE will be
    ## processed. Affects IupCanvas
    SetCallback(cast[PIhandle](ih), cstring("KEYPRESS_CB"), cast[Icallback](cb))

proc `keypress_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, c, press: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KEYPRESS_CB"), cast[Icallback](cb))

proc `keypress_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KEYPRESS_CB")))

proc `killfocus_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## KILLFOCUS_CB KILLFOCUS_CB Action generated when an element
    ## loses keyboard focus. This callback is called before the
    ## GETFOCUS_CB of the element that gets the focus. Callback int
    ## function(Ihandle \*ih); [in C] ih:killfocus_cb() -> (ret:
    ## number) [in Lua] ih: identifier of the element that activated
    ## the event. Affects All elements with user interaction, except
    ## menus. In Windows, there are restrictions when using this
    ## callback. From MSDN on WM_KILLFOCUS: "While processing this
    ## message, do not make any function calls that display or
    ## activate a window. This causes the thread to yield control and
    ## can cause the application to stop responding to messages. See
    ## Also GETFOCUS_CB, IupGetFocus, IupSetFocus
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    ## K_ANY K_ANY Action generated when a keyboard event occurs.
    ## Callback int function(Ihandle \*ih, int c); [in C] ih:k_any(c:
    ## number) -> (ret: number) [in Lua] ih: identifier of the element
    ## that activated the event. c: identifier of typed key. Please
    ## refer to the Keyboard Codes table for a list of possible
    ## values. Returns: If IUP_IGNORE is returned the key is ignored
    ## and not processed by the control and not propagated. If returns
    ## IUP_CONTINUE, the key will be processed and the event will be
    ## propagated to the parent of the element receiving it, this is
    ## the default behavior. If returns IUP_DEFAULT the key is
    ## processed but it is not propagated. IUP_CLOSE will be
    ## processed. Notes Keyboard callbacks depend on the keyboard
    ## usage of the control with the focus. So if you return
    ## IUP_IGNORE the control will usually not process the key. But be
    ## aware that sometimes the control process the key in another
    ## event so even returning IUP_IGNORE the key can get processed.
    ## Although it will not be propagated. IMPORTANT: The callbacks
    ## "K_\*" of the dialog or native containers depend on the
    ## IUP_CONTINUE return value to work while the control is in
    ## focus. If the callback does not exists it is automatically
    ## propagated to the parent of the element. K_\* callbacks All
    ## defined keys are also callbacks of any element, called when the
    ## respective key is activated. For example: "K_cC" is also a
    ## callback activated when the user press Ctrl+C, when the focus
    ## is at the element or at a children with focus. This is the way
    ## an application can create shortcut keys, also called hot keys.
    ## These callbacks are not available in IupLua. Affects All
    ## elements with keyboard interaction.
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: Colorbar_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## LEAVEWINDOW_CB LEAVEWINDOW_CB Action generated when the mouse
    ## leaves the native element. Callback int function(Ihandle \*ih);
    ## [in C] ih:leavewindow_cb() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. Notes When
    ## the cursor is moved from one element to another, the call order
    ## in all platforms will be first the LEAVEWINDOW_CB callback of
    ## the old control followed by the ENTERWINDOW_CB callback of the
    ## new control. (since 3.14) If the mouse button is hold pressed
    ## and the cursor moves outside the element the behavior is system
    ## dependent. In Windows the LEAVEWINDOW_CB/ENTERWINDOW_CB
    ## callbacks are NOT called, in GTK the callbacks are called.
    ## Affects All controls with user interaction. See Also
    ## ENTERWINDOW_CB
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `motion_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    ## MOTION_CB MOTION_CB Action generated when the mouse moves.
    ## Callback int function(Ihandle \*ih, int x, int y, char \*status);
    ## [in C] ih:motion_cb(x, y: number, status: string) -> (ret:
    ## number) [in Lua] ih: identifier of the element that activated
    ## the event. x, y: position in the canvas where the event has
    ## occurred, in pixels. status: status of mouse buttons and
    ## certain keyboard keys at the moment the event was generated.
    ## The same macros used for BUTTON_CB can be used for this status.
    ## Notes Between press and release all mouse events are redirected
    ## only to this control, even if the cursor moves outside the
    ## element. So the BUTTON_CB callback when released and the
    ## MOTION_CB callback can be called with coordinates outside the
    ## element rectangle. Affects IupCanvas, IupGLCanvas
    SetCallback(cast[PIhandle](ih), cstring("MOTION_CB"), cast[Icallback](cb))

proc `motion_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MOTION_CB"), cast[Icallback](cb))

proc `motion_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MOTION_CB")))

proc `postmessage_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `resize_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
    ## RESIZE_CB RESIZE_CB Action generated when the canvas or dialog
    ## size is changed. Callback int function(Ihandle \*ih, int width,
    ## int height); [in C] ih:resize_cb(width, height: number) ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. width: the width of the internal element
    ## size in pixels not considering the decorations (client size)
    ## height: the height of the internal element size in pixels not
    ## considering the decorations (client size) Notes For the dialog,
    ## this action is also generated when the dialog is mapped, after
    ## the map and before the show. When XAUTOHIDE=Yes or
    ## YAUTOHIDE=Yes, if the canvas scrollbar is hidden/shown after
    ## changing the DX or DY attributes from inside the callback, the
    ## size of the drawing area will immediately change, so the
    ## parameters with and height will be invalid. To update the
    ## parameters consult the DRAWSIZE attribute. Also activate the
    ## drawing toolkit only after updating the DX or DY attributes.
    ## Affects IupCanvas, IupGLCanvas, IupDialog
    SetCallback(cast[PIhandle](ih), cstring("RESIZE_CB"), cast[Icallback](cb))

proc `resize_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RESIZE_CB"), cast[Icallback](cb))

proc `resize_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RESIZE_CB")))

proc `scroll_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.}) {.cdecl.} =
    ## SCROLL_CB SCROLL_CB Called when some manipulation is made to
    ## the scrollbar. The canvas is automatically redrawn only if this
    ## callback is NOT defined. (GTK 2.8) Also the POSX and POSY
    ## values will not be correctly updated for older GTK versions. In
    ## Ubuntu, when liboverlay-scrollbar is enabled (the new tiny
    ## auto-hide scrollbar) only the IUP_SBPOSV and IUP_SBPOSH codes
    ## are used. Callback int function(Ihandle \*ih, int op, float
    ## posx, float posy); [in C] ih:scroll_cb(op, posx, posy: number)
    ## -> (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. op: indicates the operation performed on
    ## the scrollbar. If the manipulation was made on the vertical
    ## scrollbar, it can have the following values: IUP_SBUP - line up
    ## IUP_SBDN - line down IUP_SBPGUP - page up IUP_SBPGDN - page
    ## down IUP_SBPOSV - vertical positioning IUP_SBDRAGV - vertical
    ## drag If it was on the horizontal scrollbar, the following
    ## values are valid: IUP_SBLEFT - column left IUP_SBRIGHT - column
    ## right IUP_SBPGLEFT - page left IUP_SBPGRIGHT - page right
    ## IUP_SBPOSH - horizontal positioning IUP_SBDRAGH - horizontal
    ## drag posx, posy: the same as the ACTION canvas callback
    ## (corresponding to the values of attributes POSX and POSY).
    ## Notes IUP_SBDRAGH and IUP_SBDRAGV are not supported in GTK.
    ## During drag IUP_SBPOSH and IUP_SBPOSV are used. In Windows,
    ## after a drag when mouse is released IUP_SBPOSH or IUP_SBPOSV
    ## are called. Affects IupCanvas, IupGLCanvas, SCROLLBAR
    SetCallback(cast[PIhandle](ih), cstring("SCROLL_CB"), cast[Icallback](cb))

proc `scroll_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SCROLL_CB"), cast[Icallback](cb))

proc `scroll_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SCROLL_CB")))

proc `select_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    ## SELECT_CB: called when a color is selected. The primary color
    ## is selected with the left mouse button, and if existent the
    ## secondary is selected with the right mouse button. int
    ## function(Ihandle\* ih, int cell, int type); [in C]
    ## ih:select_cb(cell, type: number) -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("SELECT_CB"), cast[Icallback](cb))

proc `select_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SELECT_CB"), cast[Icallback](cb))

proc `select_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SELECT_CB")))

proc `switch_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    ## SWITCH_CB: called when the user double clicks the preview area
    ## outside the preview cells to switch the primary and secondary
    ## selections. It is only called if SHOW_SECONDARY=YES. int
    ## function(Ihandle\* ih, int prim_cell, int sec_cell); [in C]
    ## ih:switch_cb(prim_cell, sec_cell: number) -> (ret: number) [in
    ## Lua]
    SetCallback(cast[PIhandle](ih), cstring("SWITCH_CB"), cast[Icallback](cb))

proc `switch_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SWITCH_CB"), cast[Icallback](cb))

proc `switch_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SWITCH_CB")))

proc `unmap_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `wheel_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    ## WHEEL_CB WHEEL_CB Action generated when the mouse wheel is
    ## rotated. If this callback is not defined the wheel will
    ## automatically scroll the canvas in the vertical direction by
    ## some lines, the SCROLL_CB callback if defined will be called
    ## with the IUP_SBDRAGV operation. Callback int function(Ihandle
    ## \*ih, float delta, int x, int y, char \*status); [in C]
    ## ih:wheel_cb(delta, x, y: number, status: string) -> (ret:
    ## number) [in Lua] ih: identifier of the element that activated
    ## the event. delta: the amount the wheel was rotated in notches.
    ## x, y: position in the canvas where the event has occurred, in
    ## pixels. status: status of mouse buttons and certain keyboard
    ## keys at the moment the event was generated. The same macros
    ## used for BUTTON_CB can be used for this status. Notes In Motif
    ## and GTK delta is always 1 or -1. In Windows is some situations
    ## delta can reach the value of two. In the future with more
    ## precise wheels this increment can be changed. Affects
    ## IupCanvas, IupGLCanvas
    SetCallback(cast[PIhandle](ih), cstring("WHEEL_CB"), cast[Icallback](cb))

proc `wheel_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("WHEEL_CB"), cast[Icallback](cb))

proc `wheel_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("WHEEL_CB")))

proc `wom_cb=`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    ## WOM_CB WOM_CB Action generated when an audio device receives an
    ## event. [Windows Only] Callback int function(Ihandle \*ih, int
    ## state); [in C] ih:wom_cb(state: number) -> (ret: number) [in
    ## Lua] ih: identifies the element that activated the event.
    ## state: can be opening=1, done=0, or closing=-1. Notes This
    ## callback is used to syncronize video playback with audio. It is
    ## sent when the audio device: Message Description opening is
    ## opened by using the waveOutOpen function. done is finished with
    ## a data block sent by using the waveOutWrite function. closing
    ## is closed by using the waveOutClose function. You must use the
    ## HWND attribute when calling waveOutOpen in the dwCallback
    ## parameter and set fdwOpen to CALLBACK_WINDOW. Affects
    ## IupDialog, IupCanvas, IupGLCanvas
    SetCallback(cast[PIhandle](ih), cstring("WOM_CB"), cast[Icallback](cb))

proc `wom_cb`*(ih: Colorbar_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("WOM_CB"), cast[Icallback](cb))

proc `wom_cb`*(ih: Colorbar_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("WOM_CB")))

