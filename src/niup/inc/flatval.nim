when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: FlatVal
##
## NIUP type: FlatVal_t
##
## constructors
##
##    proc FlatVal(`type`: string): FlatVal_t
##

proc FlatVal*(`type`: string): FlatVal_t {.cdecl.} =
    ## Creates a Valuator control, but it does not have native
    ## decorations. Selects a value in a limited interval. Also known
    ## as Scale or Trackbar in native systems. It behaves just like an
    ## IupVal, but since it is not a native control it has more
    ## flexibility for additional options. But ticks are NOT
    ## supported. It inherits from IupCanvas.
    return FlatVal_t(niupc.FlatVal(cstring(`type`)))

proc `active=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## ACTIVE, EXPAND, FONT, SCREENPOSITION, POSITION, MINSIZE,
    ## MAXSIZE, WID, TIP, SIZE, ZORDER, VISIBLE, THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `backimage=`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## BACKIMAGE (non inheritable): image name to be used as
    ## background. Use IupSetHandle or IupSetAttributeHandle to
    ## associate an image to a name. See also IupImage.
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGE"), cast[PIhandle](handle))

proc `backimage`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGE"), cast[PIhandle](handle))

proc `backimage`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKIMAGE"))

proc `backimagezoom=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## BACKIMAGEZOOM (non inheritable): if set the back image will be
    ## zoomed to occupy the full background. Aspect ratio is NOT
    ## preserved. Can be Yes or No. Default: No.
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring(value))

proc `backimagezoom`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring(value))

proc `backimagezoom=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring((if yes: "YES" else: "NO")))

proc `backimagezoom`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring((if yes: "YES" else: "NO")))

proc `backimagezoom`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM")) == "YES"

proc `backingstore=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring(value))

proc `backingstore`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring(value))

proc `backingstore=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring((if yes: "YES" else: "NO")))

proc `backingstore`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring((if yes: "YES" else: "NO")))

proc `backingstore`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE")) == "YES"

proc `bgcolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## BGCOLOR: ignored. It will use the background color of the
    ## native parent.
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `border`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDER")) == "YES"

proc `bordercolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## BORDERCOLOR: color used for borders. Default: "50 150 255".
    ## This is for the drawn border.
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(value))

proc `bordercolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(value))

proc `bordercolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bordercolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bordercolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"))

proc `borderhlcolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## BORDERHLCOLOR: color used for borders when highlighted. Pre-
    ## defined to "0 120 220". Can be set to NULL. If NULL BORDERCOLOR
    ## will be used instead.
    SetAttribute(cast[PIhandle](ih), cstring("BORDERHLCOLOR"), cstring(value))

proc `borderhlcolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERHLCOLOR"), cstring(value))

proc `borderhlcolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERHLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `borderhlcolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERHLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `borderhlcolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERHLCOLOR"))

proc `borderpscolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## BORDERPSCOLOR: color used for borders when pressed or selected.
    ## Default use BORDERCOLOR.
    SetAttribute(cast[PIhandle](ih), cstring("BORDERPSCOLOR"), cstring(value))

proc `borderpscolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERPSCOLOR"), cstring(value))

proc `borderpscolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERPSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `borderpscolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERPSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `borderpscolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERPSCOLOR"))

proc `borderwidth=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## BORDERWIDTH: line width used for borders. Default: "1". Any
    ## borders can be hidden by simply setting this value to 0. This
    ## is for the IupFlatButton drawn border.
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(value))

proc `borderwidth`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(value))

proc `borderwidth=`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(&"{x}"))

proc `borderwidth`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(&"{x}"))

proc `borderwidth`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"))

proc `canfocus=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## CANFOCUS (creation only) (non inheritable): enables the focus
    ## traversal of the control. In Windows the control will still get
    ## the focus when clicked. Default: YES.
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `cursor=`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CURSOR"))

proc `dragdrop=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragsource=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary flatval
proc `dragtypes`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

# TODO unknown: flatval DRAWABLE Unknown Binary
proc `drawable`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWABLE"))

proc `drawbgcolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(value))

proc `drawbgcolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(value))

proc `drawbgcolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawbgcolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawbgcolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"))

proc `drawcolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(value))

proc `drawcolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(value))

proc `drawcolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawcolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawcolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"))

proc `drawdriver`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWDRIVER"))

proc `drawfont=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"), cstring(value))

proc `drawfont`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"), cstring(value))

# TODO ??? String Binary flatval
proc `drawfont`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"))

proc `drawlinewidth=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(value))

proc `drawlinewidth`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(value))

proc `drawlinewidth=`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(&"{x}"))

proc `drawlinewidth`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(&"{x}"))

proc `drawlinewidth`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"))

proc `drawmakeinactive=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring(value))

proc `drawmakeinactive`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring(value))

proc `drawmakeinactive=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `drawmakeinactive`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `drawmakeinactive`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE")) == "YES"

proc `drawsize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWSIZE"))

proc `drawstyle=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"), cstring(value))

proc `drawstyle`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"), cstring(value))

proc `drawstyle`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"))

proc `drawtextalignment=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"), cstring(value))

proc `drawtextalignment`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"), cstring(value))

proc `drawtextalignment`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"))

proc `drawtextclip=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring(value))

proc `drawtextclip`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring(value))

proc `drawtextclip=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextclip`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextclip`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP")) == "YES"

proc `drawtextellipsis=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring(value))

proc `drawtextellipsis`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring(value))

proc `drawtextellipsis=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring((if yes: "YES" else: "NO")))

proc `drawtextellipsis`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring((if yes: "YES" else: "NO")))

proc `drawtextellipsis`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS")) == "YES"

proc `drawtextlayoutcenter=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring(value))

proc `drawtextlayoutcenter`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring(value))

proc `drawtextlayoutcenter=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring((if yes: "YES" else: "NO")))

proc `drawtextlayoutcenter`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring((if yes: "YES" else: "NO")))

proc `drawtextlayoutcenter`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER")) == "YES"

proc `drawtextorientation=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(value))

proc `drawtextorientation`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(value))

proc `drawtextorientation=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(&"{x}"))

proc `drawtextorientation`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(&"{x}"))

proc `drawtextorientation`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"))

proc `drawtextwrap=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring(value))

proc `drawtextwrap`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring(value))

proc `drawtextwrap=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextwrap`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextwrap`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP")) == "YES"

proc `dropfilestarget=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary flatval
proc `droptypes`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `dx=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(value))

proc `dx`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(value))

proc `dx=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(&"{x}"))

proc `dx`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(&"{x}"))

proc `dx`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DX"))

proc `dy=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(value))

proc `dy`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(value))

proc `dy=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(&"{x}"))

proc `dy`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(&"{x}"))

proc `dy`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DY"))

proc `expand=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `fgcolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## FGCOLOR: Controls the handler color. Default: "0 120 220".
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"))

proc `fittobackimage=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## FITTOBACKIMAGE (non inheritable): enable the natural size to be
    ## computed from the BACKIMAGE. If BACKIMAGE is not defined will
    ## be ignored. Can be Yes or No. Default: No.
    SetAttribute(cast[PIhandle](ih), cstring("FITTOBACKIMAGE"), cstring(value))

proc `fittobackimage`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FITTOBACKIMAGE"), cstring(value))

proc `fittobackimage=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FITTOBACKIMAGE"), cstring((if yes: "YES" else: "NO")))

proc `fittobackimage`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FITTOBACKIMAGE"), cstring((if yes: "YES" else: "NO")))

proc `fittobackimage`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FITTOBACKIMAGE")) == "YES"

proc `floating=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `focusfeedback=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring(value))

proc `focusfeedback`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring(value))

proc `focusfeedback=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring((if yes: "YES" else: "NO")))

proc `focusfeedback`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring((if yes: "YES" else: "NO")))

proc `focusfeedback`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK")) == "YES"

proc `font=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary flatval
proc `font`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary flatval
proc `fontface`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary flatval
proc `fontstyle`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `handlename=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary flatval
proc `handlename`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

# TODO unknown: flatval HANDLERSIZE Unknown Binary
proc `handlersize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLERSIZE"))

proc `hasfocus`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HASFOCUS")) == "YES"

proc `hlcolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## HLCOLOR: color used to indicate a highlight state. Pre-defined
    ## to "30 150 250". Can be set to NULL. If NULL FGCOLOR will be
    ## used instead.
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(value))

proc `hlcolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(value))

proc `hlcolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `hlcolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `hlcolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"))

proc `image=`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGE (non inheritable): Image name for the handler. Use
    ## IupSetHandle or IupSetAttributeHandle to associate an image to
    ## a name. See also IupImage. If defined the handler will be
    ## replaced by the image.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGE"))

proc `imagehighlight=`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGEHIGHLIGHT (non inheritable): Image name of the element in
    ## highlight state. If it is not defined then the IMAGE is used.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `imagehighlight`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `imagehighlight`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEHIGHLIGHT"))

proc `imageinactive=`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGEINACTIVE (non inheritable): Image name of the element when
    ## inactive. If it is not defined then the IMAGE is used and its
    ## colors will be replaced by a modified version creating the
    ## disabled effect.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEINACTIVE"), cast[PIhandle](handle))

proc `imageinactive`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEINACTIVE"), cast[PIhandle](handle))

proc `imageinactive`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEINACTIVE"))

proc `imagepress=`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGEPRESS (non inheritable): Image name of the element in
    ## pressed state. If it is not defined then the IMAGE is used.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEPRESS"), cast[PIhandle](handle))

proc `imagepress`*(ih: FlatVal_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEPRESS"), cast[PIhandle](handle))

proc `imagepress`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEPRESS"))

proc `linex=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(value))

proc `linex`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(value))

proc `linex=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(&"{x}"))

proc `linex`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(&"{x}"))

proc `linex`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINEX"))

proc `liney=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(value))

proc `liney`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(value))

proc `liney=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(&"{x}"))

proc `liney`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(&"{x}"))

proc `liney`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINEY"))

proc `max=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## MAX: Contains the maximum valuator value. Default is "1". When
    ## changed the display will not be updated until VALUE is set.
    SetAttribute(cast[PIhandle](ih), cstring("MAX"), cstring(value))

proc `max`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAX"), cstring(value))

proc `max=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAX"), cstring(&"{x}"))

proc `max`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAX"), cstring(&"{x}"))

proc `max`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAX"))

proc `maxsize=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: FlatVal_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: FlatVal_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `min=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## MIN: Contains the minimum valuator value. Default is "0". When
    ## changed the display will not be updated until VALUE is set.
    SetAttribute(cast[PIhandle](ih), cstring("MIN"), cstring(value))

proc `min`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MIN"), cstring(value))

proc `min=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MIN"), cstring(&"{x}"))

proc `min`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MIN"), cstring(&"{x}"))

proc `min`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MIN"))

proc `minsize=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: FlatVal_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: FlatVal_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary flatval
proc `name`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `normalizergroup=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary flatval
proc `normalizergroup`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary flatval
proc `ntheme`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `orientation=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## ORIENTATION (creation only) (non inheritable): Informs whether
    ## the valuator is "VERTICAL" or "HORIZONTAL". Vertical valuators
    ## are bottom to up, and horizontal valuators are left to right
    ## variations of min to max. Default: "HORIZONTAL".
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"))

# TODO unknown: flatval PAGESTEP Unknown Binary
proc `pagestep`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PAGESTEP"))

# TODO unknown: flatval PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: flatval PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: FlatVal_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: FlatVal_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `posx=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(value))

proc `posx`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(value))

proc `posx=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(&"{x}"))

proc `posx`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(&"{x}"))

proc `posx`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSX"))

proc `posy=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(value))

proc `posy`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(value))

proc `posy=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(&"{x}"))

proc `posy`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(&"{x}"))

proc `posy`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSY"))

proc `propagatefocus=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## PROPAGATEFOCUS(non inheritable): enables the focus callback
    ## forwarding to the next native parent with FOCUS_CB defined.
    ## Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `pscolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## PSCOLOR: color used to indicate a press state. Pre-defined to
    ## "0 60 190". Can be set to NULL. If NULL FGCOLOR will be used
    ## instead.
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(value))

proc `pscolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(value))

proc `pscolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `pscolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `pscolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"))

proc `rastersize=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: FlatVal_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: FlatVal_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `sb_resize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_RESIZE"))

proc `screenposition`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `scrollbar=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR")) == "YES"

proc `size=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## SIZE (non inheritable): The natural size is the height of one
    ## character in one direction and the width of 15 characters in
    ## the other.
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: FlatVal_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: FlatVal_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

# TODO unknown: flatval SLIDERBORDERCOLOR Unknown Binary
proc `sliderbordercolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SLIDERBORDERCOLOR"))

# TODO unknown: flatval SLIDERCOLOR Unknown Binary
proc `slidercolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SLIDERCOLOR"))

# TODO unknown: flatval SLIDERSIZE Unknown Binary
proc `slidersize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SLIDERSIZE"))

proc `step=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## STEP (non inheritable): Controls the increment for keyboard
    ## control and the mouse wheel. It is not the size of the
    ## increment. The increment size is "step\*(max-min)", so it must
    ## be 0<step<1. Default is "0.01".
    SetAttribute(cast[PIhandle](ih), cstring("STEP"), cstring(value))

proc `step`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STEP"), cstring(value))

proc `step=`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STEP"), cstring(&"{x}"))

proc `step`*(ih: FlatVal_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STEP"), cstring(&"{x}"))

proc `step`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("STEP"))

proc `theme=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary flatval
proc `theme`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary flatval
proc `tip`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: FlatVal_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary flatval
proc `tipicon`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary flatval
proc `tipmarkup`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: FlatVal_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: FlatVal_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `touch=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring(value))

proc `touch`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring(value))

proc `touch=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring((if yes: "YES" else: "NO")))

proc `touch`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring((if yes: "YES" else: "NO")))

proc `touch`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOUCH")) == "YES"

proc `usersize=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: FlatVal_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: FlatVal_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `value=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    ## VALUE (non inheritable): Contains a number between MIN and MAX,
    ## indicating the valuator position. Default: "0.0".
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

# TODO ??? String Binary flatval
proc `value`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `visible=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wheeldropfocus=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring(value))

proc `wheeldropfocus`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring(value))

proc `wheeldropfocus=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `wheeldropfocus`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `wheeldropfocus`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS")) == "YES"

proc `wid`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

proc `xautohide=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring(value))

proc `xautohide`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring(value))

proc `xautohide=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `xautohide`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `xautohide`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE")) == "YES"

proc `xdisplay`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XDISPLAY"))

# TODO unknown: flatval XFONTID Unknown Binary
proc `xfontid`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `xhidden`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XHIDDEN")) == "YES"

proc `xmax=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(value))

proc `xmax`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(value))

proc `xmax=`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(&"{x}"))

proc `xmax`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(&"{x}"))

proc `xmax`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XMAX"))

proc `xmin=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(value))

proc `xmin`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(value))

proc `xmin=`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(&"{x}"))

proc `xmin`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(&"{x}"))

proc `xmin`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XMIN"))

# TODO unknown: flatval XWINDOW Unknown Binary
proc `xwindow`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XWINDOW"))

proc `y`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `yautohide=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring(value))

proc `yautohide`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring(value))

proc `yautohide=`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `yautohide`*(ih: FlatVal_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `yautohide`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE")) == "YES"

proc `yhidden`*(ih: FlatVal_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YHIDDEN")) == "YES"

proc `ymax=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(value))

proc `ymax`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(value))

proc `ymax=`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(&"{x}"))

proc `ymax`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(&"{x}"))

proc `ymax`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YMAX"))

proc `ymin=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(value))

proc `ymin`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(value))

proc `ymin=`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(&"{x}"))

proc `ymin`*(ih: FlatVal_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(&"{x}"))

proc `ymin`*(ih: FlatVal_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YMIN"))

proc `zorder=`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: FlatVal_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `action=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cfloat, arg3: cfloat): cint {.cdecl.}) {.cdecl.} =
    ## ACTION ACTION Action generated when the element is activated.
    ## Affects each element differently. Callback int function(Ihandle
    ## \*ih); [in C] ih:action() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. In some
    ## elements, this callback may receive more parameters, apart from
    ## ih. Please refer to each element's documentation. Affects
    ## IupButton, IupItem, IupList, IupText, IupCanvas, IupMultiline,
    ## IupToggle
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cfloat, arg3: cfloat): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION")))

proc `button_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `button_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BUTTON_CB")))

proc `destroy_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragend_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropfiles_cb=`*(ih: FlatVal_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `dropfiles_cb`*(ih: FlatVal_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `enterwindow_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `enterwindow_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `flat_button_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_BUTTON_CB"), cast[Icallback](cb))

proc `flat_button_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_BUTTON_CB"), cast[Icallback](cb))

proc `flat_button_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_BUTTON_CB")))

proc `flat_enterwindow_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_ENTERWINDOW_CB"), cast[Icallback](cb))

proc `flat_enterwindow_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_ENTERWINDOW_CB"), cast[Icallback](cb))

proc `flat_enterwindow_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_ENTERWINDOW_CB")))

proc `flat_focus_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_FOCUS_CB"), cast[Icallback](cb))

proc `flat_focus_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_FOCUS_CB"), cast[Icallback](cb))

proc `flat_focus_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_FOCUS_CB")))

proc `flat_leavewindow_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `flat_leavewindow_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `flat_leavewindow_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_LEAVEWINDOW_CB")))

proc `flat_motion_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_MOTION_CB"), cast[Icallback](cb))

proc `flat_motion_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_MOTION_CB"), cast[Icallback](cb))

proc `flat_motion_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_MOTION_CB")))

proc `flat_wheel_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cfloat, arg3: cint, arg4: cint, arg5: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_WHEEL_CB"), cast[Icallback](cb))

proc `flat_wheel_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cfloat, arg3: cint, arg4: cint, arg5: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_WHEEL_CB"), cast[Icallback](cb))

proc `flat_wheel_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_WHEEL_CB")))

proc `focus_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FOCUS_CB")))

proc `getfocus_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `getfocus_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `keypress_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, c, press: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `keypress_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, c, press: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KEYPRESS_CB"), cast[Icallback](cb))

proc `keypress_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KEYPRESS_CB")))

proc `killfocus_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `killfocus_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `k_any`*(ih: FlatVal_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `leavewindow_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `motion_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `motion_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MOTION_CB"), cast[Icallback](cb))

proc `motion_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MOTION_CB")))

proc `postmessage_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `resize_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `resize_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RESIZE_CB"), cast[Icallback](cb))

proc `resize_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RESIZE_CB")))

proc `scroll_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.}) {.cdecl.} =
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

proc `scroll_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SCROLL_CB"), cast[Icallback](cb))

proc `scroll_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SCROLL_CB")))

proc `unmap_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `valuechanged_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## VALUECHANGED_CB: Called after the value was interactively
    ## changed by the user. int function(Ihandle \*ih); [in
    ## C]ih:valuechanged_cb() -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB")))

proc `valuechanging_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    ## VALUECHANGING_CB: Called when the value starts or ends to be
    ## interactively changed by the user. int function(Ihandle \*ih,
    ## int start); [in C]elem:valuechanging_cb(start: number) -> (ret:
    ## number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGING_CB"), cast[Icallback](cb))

proc `valuechanging_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGING_CB"), cast[Icallback](cb))

proc `valuechanging_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("VALUECHANGING_CB")))

proc `wheel_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `wheel_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("WHEEL_CB"), cast[Icallback](cb))

proc `wheel_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("WHEEL_CB")))

proc `wom_cb=`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `wom_cb`*(ih: FlatVal_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("WOM_CB"), cast[Icallback](cb))

proc `wom_cb`*(ih: FlatVal_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("WOM_CB")))

