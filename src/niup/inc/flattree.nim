when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: FlatTree
##
## NIUP type: FlatTree_t
##
## constructors
##
##    proc FlatTree(): FlatTree_t
##

proc FlatTree*(): FlatTree_t {.cdecl.} =
    ## Creates a tree containing nodes of branches or leaves. Both
    ## branches and leaves can have an associated text and image. The
    ## branches can be expanded or collapsed. When a branch is
    ## expanded, its immediate children are visible, and when it is
    ## collapsed they are hidden. The leaves can generate an
    ## "executed" or "renamed" actions, branches can only generate a
    ## "renamed" action. The focus node is the node with the focus
    ## rectangle, marked nodes have their background inverted. It
    ## behaves like IupFlatTree but it does not depends on the native
    ## system. It inherits from IupCanvas.
    return FlatTree_t(niupc.FlatTree())

proc `active=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

# TODO getter flattree ADDBRANCH
proc `addexpanded=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDEXPANDED"), cstring(value))

proc `addexpanded`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDEXPANDED"), cstring(value))

proc `addexpanded=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDEXPANDED"), cstring((if yes: "YES" else: "NO")))

proc `addexpanded`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDEXPANDED"), cstring((if yes: "YES" else: "NO")))

proc `addexpanded`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ADDEXPANDED")) == "YES"

# TODO getter flattree ADDLEAF
proc `arrowimages=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ARROWIMAGES"), cstring(value))

proc `arrowimages`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ARROWIMAGES"), cstring(value))

proc `arrowimages=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ARROWIMAGES"), cstring(&"{x}"))

proc `arrowimages`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ARROWIMAGES"), cstring(&"{x}"))

proc `arrowimages`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ARROWIMAGES"))

proc `autoredraw=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    ## AUTOREDRAW BGCOLOR BORDERCOLOR(\*)BORDERWIDTH(\*)COUNT
    ## EXPANDEXTRATEXTWIDTH(\*) FGCOLORHLCOLOR(\*)
    ## HLCOLORALPHA(\*)PSCOLOR(\*)TEXTPSCOLOR(\*)ICONSPACING(\*)
    ## INDENTATION RASTERSIZE SPACING TOPITEM
    SetAttribute(cast[PIhandle](ih), cstring("AUTOREDRAW"), cstring(value))

proc `autoredraw`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOREDRAW"), cstring(value))

proc `autoredraw=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOREDRAW"), cstring((if yes: "YES" else: "NO")))

proc `autoredraw`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOREDRAW"), cstring((if yes: "YES" else: "NO")))

# TODO getter flattree BACKCOLOR
proc `backimage=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGE"), cast[PIhandle](handle))

proc `backimage`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGE"), cast[PIhandle](handle))

proc `backimage`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKIMAGE"))

proc `backimagezoom=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring(value))

proc `backimagezoom`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring(value))

proc `backimagezoom=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring((if yes: "YES" else: "NO")))

proc `backimagezoom`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring((if yes: "YES" else: "NO")))

proc `backimagezoom`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM")) == "YES"

proc `backingstore=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring(value))

proc `backingstore`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring(value))

proc `backingstore=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring((if yes: "YES" else: "NO")))

proc `backingstore`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring((if yes: "YES" else: "NO")))

proc `backingstore`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE")) == "YES"

proc `bgcolor=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    ## AUTOREDRAW BGCOLOR BORDERCOLOR(\*)BORDERWIDTH(\*)COUNT
    ## EXPANDEXTRATEXTWIDTH(\*) FGCOLORHLCOLOR(\*)
    ## HLCOLORALPHA(\*)PSCOLOR(\*)TEXTPSCOLOR(\*)ICONSPACING(\*)
    ## INDENTATION RASTERSIZE SPACING TOPITEM
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `border=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDER")) == "YES"

proc `bordercolor=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(value))

proc `bordercolor`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(value))

proc `bordercolor=`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bordercolor`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bordercolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"))

proc `borderwidth=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(value))

proc `borderwidth`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(value))

proc `borderwidth=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(&"{x}"))

proc `borderwidth`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(&"{x}"))

proc `borderwidth`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"))

# TODO unknown: flattree BUTTONBGCOLOR Unknown Binary
proc `buttonbgcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTONBGCOLOR"))

# TODO unknown: flattree BUTTONBRDCOLOR Unknown Binary
proc `buttonbrdcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTONBRDCOLOR"))

# TODO unknown: flattree BUTTONFGCOLOR Unknown Binary
proc `buttonfgcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTONFGCOLOR"))

proc `buttonminusimage=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BUTTONMINUSIMAGE"), cast[PIhandle](handle))

proc `buttonminusimage`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BUTTONMINUSIMAGE"), cast[PIhandle](handle))

proc `buttonminusimage`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTONMINUSIMAGE"))

proc `buttonplusimage=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BUTTONPLUSIMAGE"), cast[PIhandle](handle))

proc `buttonplusimage`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BUTTONPLUSIMAGE"), cast[PIhandle](handle))

proc `buttonplusimage`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTONPLUSIMAGE"))

# TODO unknown: flattree BUTTONSIZE Unknown Binary
proc `buttonsize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTONSIZE"))

proc `canfocus=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

# TODO getter flattree CHILDCOUNT
# TODO getter flattree COLOR
# TODO getter flattree COPYNODE
proc `count`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COUNT"))

proc `cspacing=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(value))

proc `cspacing`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(value))

proc `cspacing=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(&"{x}"))

proc `cspacing`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(&"{x}"))

proc `cspacing`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CSPACING"))

proc `cursor=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CURSOR"))

# TODO getter flattree DELNODE
# TODO getter flattree DEPTH
proc `dragdrop=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragdroptree=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    ## DRAGDROPTREE DROPFILESTARGET DROPEQUALDRAG SHOWDRAGDROP
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPTREE"), cstring(value))

proc `dragdroptree`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPTREE"), cstring(value))

proc `dragdroptree=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPTREE"), cstring((if yes: "YES" else: "NO")))

proc `dragdroptree`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPTREE"), cstring((if yes: "YES" else: "NO")))

proc `dragdroptree`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROPTREE")) == "YES"

proc `dragsource=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary flattree
proc `dragtypes`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

# TODO unknown: flattree DRAWABLE Unknown Binary
proc `drawable`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWABLE"))

proc `drawbgcolor=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(value))

proc `drawbgcolor`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(value))

proc `drawbgcolor=`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawbgcolor`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawbgcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"))

proc `drawcolor=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(value))

proc `drawcolor`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(value))

proc `drawcolor=`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawcolor`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"))

proc `drawdriver`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWDRIVER"))

proc `drawfont=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"), cstring(value))

proc `drawfont`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"), cstring(value))

# TODO ??? String Binary flattree
proc `drawfont`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"))

proc `drawlinewidth=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(value))

proc `drawlinewidth`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(value))

proc `drawlinewidth=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(&"{x}"))

proc `drawlinewidth`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(&"{x}"))

proc `drawlinewidth`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"))

proc `drawmakeinactive=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring(value))

proc `drawmakeinactive`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring(value))

proc `drawmakeinactive=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `drawmakeinactive`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `drawmakeinactive`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE")) == "YES"

proc `drawsize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWSIZE"))

proc `drawstyle=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"), cstring(value))

proc `drawstyle`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"), cstring(value))

proc `drawstyle`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"))

proc `drawtextalignment=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"), cstring(value))

proc `drawtextalignment`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"), cstring(value))

proc `drawtextalignment`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"))

proc `drawtextclip=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring(value))

proc `drawtextclip`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring(value))

proc `drawtextclip=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextclip`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextclip`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP")) == "YES"

proc `drawtextellipsis=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring(value))

proc `drawtextellipsis`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring(value))

proc `drawtextellipsis=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring((if yes: "YES" else: "NO")))

proc `drawtextellipsis`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring((if yes: "YES" else: "NO")))

proc `drawtextellipsis`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS")) == "YES"

proc `drawtextlayoutcenter=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring(value))

proc `drawtextlayoutcenter`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring(value))

proc `drawtextlayoutcenter=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring((if yes: "YES" else: "NO")))

proc `drawtextlayoutcenter`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring((if yes: "YES" else: "NO")))

proc `drawtextlayoutcenter`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER")) == "YES"

proc `drawtextorientation=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(value))

proc `drawtextorientation`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(value))

proc `drawtextorientation=`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(&"{x}"))

proc `drawtextorientation`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(&"{x}"))

proc `drawtextorientation`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"))

proc `drawtextwrap=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring(value))

proc `drawtextwrap`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring(value))

proc `drawtextwrap=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextwrap`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextwrap`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP")) == "YES"

proc `dropequaldrag=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    ## DRAGDROPTREE DROPFILESTARGET DROPEQUALDRAG SHOWDRAGDROP
    SetAttribute(cast[PIhandle](ih), cstring("DROPEQUALDRAG"), cstring(value))

proc `dropequaldrag`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPEQUALDRAG"), cstring(value))

proc `dropequaldrag=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPEQUALDRAG"), cstring((if yes: "YES" else: "NO")))

proc `dropequaldrag`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPEQUALDRAG"), cstring((if yes: "YES" else: "NO")))

proc `dropequaldrag`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPEQUALDRAG")) == "YES"

proc `dropfilestarget=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    ## DRAGDROPTREE DROPFILESTARGET DROPEQUALDRAG SHOWDRAGDROP
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary flattree
proc `droptypes`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `dx=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(value))

proc `dx`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(value))

proc `dx=`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(&"{x}"))

proc `dx`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(&"{x}"))

proc `dx`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DX"))

proc `dy=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(value))

proc `dy`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(value))

proc `dy=`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(&"{x}"))

proc `dy`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(&"{x}"))

proc `dy`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DY"))

# TODO unknown: flattree EMPTYTOGGLE Unknown Binary
proc `emptytoggle`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EMPTYTOGGLE"))

proc `expand=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandall=`*(ih: FlatTree_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDALL"), cstring(""))

proc `expandall`*(ih: FlatTree_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDALL"), cstring(""))

proc `expandweight=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

# TODO getter flattree EXTRATEXT
# TODO unknown: flattree EXTRATEXTWIDTH Unknown Binary
proc `extratextwidth`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXTRATEXTWIDTH"))

proc `fgcolor=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor=`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"))

# TODO getter flattree FIRST
# TODO unknown: flattree FLATSCROLLBAR Unknown Binary
proc `flatscrollbar`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLATSCROLLBAR"))

proc `floating=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

# TODO unknown: flattree FLOATINGDELAY Unknown Binary
proc `floatingdelay`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATINGDELAY"))

proc `focusfeedback=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring(value))

proc `focusfeedback`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring(value))

proc `focusfeedback=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring((if yes: "YES" else: "NO")))

proc `focusfeedback`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring((if yes: "YES" else: "NO")))

proc `focusfeedback`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK")) == "YES"

proc `font=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary flattree
proc `font`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary flattree
proc `fontface`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary flattree
proc `fontstyle`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `handlename=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary flattree
proc `handlename`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `hasfocus`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HASFOCUS")) == "YES"

proc `hidebuttons=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    ## HIDELINES HIDEBUTTONS LINECOLOR(\*)
    ## BUTTONBGCOLOR(\*)BUTTONFGCOLOR(\*) BUTTONBRDCOLOR(\*)BUTTONSIZE(\*)
    ## BUTTONPLUSIMAGE(\*)BUTTONMINUSIMAGE(\*)
    SetAttribute(cast[PIhandle](ih), cstring("HIDEBUTTONS"), cstring(value))

proc `hidebuttons`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDEBUTTONS"), cstring(value))

proc `hidebuttons=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDEBUTTONS"), cstring((if yes: "YES" else: "NO")))

proc `hidebuttons`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDEBUTTONS"), cstring((if yes: "YES" else: "NO")))

proc `hidebuttons`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDEBUTTONS")) == "YES"

proc `hidelines=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    ## HIDELINES HIDEBUTTONS LINECOLOR(\*)
    ## BUTTONBGCOLOR(\*)BUTTONFGCOLOR(\*) BUTTONBRDCOLOR(\*)BUTTONSIZE(\*)
    ## BUTTONPLUSIMAGE(\*)BUTTONMINUSIMAGE(\*)
    SetAttribute(cast[PIhandle](ih), cstring("HIDELINES"), cstring(value))

proc `hidelines`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDELINES"), cstring(value))

proc `hidelines=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDELINES"), cstring((if yes: "YES" else: "NO")))

proc `hidelines`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDELINES"), cstring((if yes: "YES" else: "NO")))

proc `hidelines`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDELINES")) == "YES"

proc `hlcolor=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(value))

proc `hlcolor`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(value))

proc `hlcolor=`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `hlcolor`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `hlcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"))

proc `hlcoloralpha=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLORALPHA"), cstring(value))

proc `hlcoloralpha`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLORALPHA"), cstring(value))

proc `hlcoloralpha=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLORALPHA"), cstring(&"{x}"))

proc `hlcoloralpha`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLORALPHA"), cstring(&"{x}"))

proc `hlcoloralpha`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HLCOLORALPHA"))

proc `iconspacing=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ICONSPACING"), cstring(value))

proc `iconspacing`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ICONSPACING"), cstring(value))

proc `iconspacing=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ICONSPACING"), cstring(&"{x}"))

proc `iconspacing`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ICONSPACING"), cstring(&"{x}"))

proc `iconspacing`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ICONSPACING"))

# TODO getter flattree IMAGE
proc `imagebranchcollapsed=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGEIMAGEEXPANDEDIMAGELEAF IMAGEBRANCHCOLLAPSED
    ## IMAGEBRANCHEXPANDEDBACKIMAGE(\*)BACKIMAGEZOOM(\*)
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEBRANCHCOLLAPSED"), cast[PIhandle](handle))

proc `imagebranchcollapsed`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEBRANCHCOLLAPSED"), cast[PIhandle](handle))

proc `imagebranchcollapsed`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEBRANCHCOLLAPSED"))

proc `imagebranchexpanded=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEBRANCHEXPANDED"), cast[PIhandle](handle))

proc `imagebranchexpanded`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEBRANCHEXPANDED"), cast[PIhandle](handle))

proc `imagebranchexpanded`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEBRANCHEXPANDED"))

# TODO getter flattree IMAGEEXPANDED
proc `imageleaf=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGELEAF"), cast[PIhandle](handle))

proc `imageleaf`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGELEAF"), cast[PIhandle](handle))

proc `imageleaf`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGELEAF"))

proc `indentation=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("INDENTATION"), cstring(value))

proc `indentation`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("INDENTATION"), cstring(value))

proc `indentation=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("INDENTATION"), cstring(&"{x}"))

proc `indentation`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("INDENTATION"), cstring(&"{x}"))

proc `indentation`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("INDENTATION"))

# TODO getter flattree INSERTBRANCH
# TODO getter flattree INSERTLEAF
# TODO getter flattree ITEMTIP
# TODO getter flattree KIND
# TODO getter flattree LAST
proc `lastaddnode`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LASTADDNODE"))

# TODO unknown: flattree LINECOLOR Unknown Binary
proc `linecolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINECOLOR"))

proc `linex=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(value))

proc `linex`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(value))

proc `linex=`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(&"{x}"))

proc `linex`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(&"{x}"))

proc `linex`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINEX"))

proc `liney=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(value))

proc `liney`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(value))

proc `liney=`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(&"{x}"))

proc `liney`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(&"{x}"))

proc `liney`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINEY"))

proc `mark=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    ## MARK MARKED MARKEDNODESMARKMODE MARKSTARTMARKWHENTOGGLE
    SetAttribute(cast[PIhandle](ih), cstring("MARK"), cstring(value))

proc `mark`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARK"), cstring(value))

# TODO getter flattree MARKED
proc `markednodes=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKEDNODES"), cstring(value))

proc `markednodes`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKEDNODES"), cstring(value))

# TODO ??? String Binary flattree
proc `markednodes`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARKEDNODES"))

proc `markmode=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKMODE"), cstring(value))

proc `markmode`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKMODE"), cstring(value))

proc `markmode`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARKMODE"))

proc `markstart=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKSTART"), cstring(value))

proc `markstart`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKSTART"), cstring(value))

proc `markstart=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKSTART"), cstring((if yes: "YES" else: "NO")))

proc `markstart`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKSTART"), cstring((if yes: "YES" else: "NO")))

proc `markstart`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARKSTART")) == "YES"

proc `markwhentoggle=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKWHENTOGGLE"), cstring(value))

proc `markwhentoggle`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKWHENTOGGLE"), cstring(value))

proc `markwhentoggle=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKWHENTOGGLE"), cstring((if yes: "YES" else: "NO")))

proc `markwhentoggle`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKWHENTOGGLE"), cstring((if yes: "YES" else: "NO")))

proc `markwhentoggle`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARKWHENTOGGLE")) == "YES"

proc `maxsize=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: FlatTree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: FlatTree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: FlatTree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: FlatTree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

# TODO getter flattree MOVENODE
proc `name=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary flattree
proc `name`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

# TODO getter flattree NEXT
proc `normalizergroup=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary flattree
proc `normalizergroup`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary flattree
proc `ntheme`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

# TODO unknown: flattree PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: flattree PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

# TODO getter flattree PARENT
proc `position=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: FlatTree_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: FlatTree_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `posx=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(value))

proc `posx`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(value))

proc `posx=`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(&"{x}"))

proc `posx`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(&"{x}"))

proc `posx`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSX"))

proc `posy=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(value))

proc `posy`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(value))

proc `posy=`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(&"{x}"))

proc `posy`*(ih: FlatTree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(&"{x}"))

proc `posy`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSY"))

# TODO getter flattree PREVIOUS
proc `propagatefocus=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `pscolor=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(value))

proc `pscolor`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(value))

proc `pscolor=`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `pscolor`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `pscolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"))

proc `rastersize=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: FlatTree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: FlatTree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `rename=`*(ih: FlatTree_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAME"), cstring(""))

proc `rename`*(ih: FlatTree_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAME"), cstring(""))

proc `renamecaret=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAMECARET"), cstring(value))

proc `renamecaret`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAMECARET"), cstring(value))

# TODO ??? String Binary flattree
proc `renamecaret`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RENAMECARET"))

proc `renameselection=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAMESELECTION"), cstring(value))

proc `renameselection`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAMESELECTION"), cstring(value))

# TODO ??? String Binary flattree
proc `renameselection`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RENAMESELECTION"))

proc `rootcount`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ROOTCOUNT"))

# TODO unknown: flattree SB_BACKCOLOR Unknown Binary
proc `sb_backcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_BACKCOLOR"))

# TODO unknown: flattree SB_FORECOLOR Unknown Binary
proc `sb_forecolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_FORECOLOR"))

# TODO unknown: flattree SB_HIGHCOLOR Unknown Binary
proc `sb_highcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_HIGHCOLOR"))

proc `sb_imagebottom=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOM"), cast[PIhandle](handle))

proc `sb_imagebottom`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOM"), cast[PIhandle](handle))

proc `sb_imagebottom`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOM"))

proc `sb_imagebottomhighlight=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOMHIGHLIGHT"), cast[PIhandle](handle))

proc `sb_imagebottomhighlight`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOMHIGHLIGHT"), cast[PIhandle](handle))

proc `sb_imagebottomhighlight`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOMHIGHLIGHT"))

proc `sb_imagebottominactive=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOMINACTIVE"), cast[PIhandle](handle))

proc `sb_imagebottominactive`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOMINACTIVE"), cast[PIhandle](handle))

proc `sb_imagebottominactive`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOMINACTIVE"))

proc `sb_imagebottompress=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOMPRESS"), cast[PIhandle](handle))

proc `sb_imagebottompress`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOMPRESS"), cast[PIhandle](handle))

proc `sb_imagebottompress`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGEBOTTOMPRESS"))

proc `sb_imageleft=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGELEFT"), cast[PIhandle](handle))

proc `sb_imageleft`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGELEFT"), cast[PIhandle](handle))

proc `sb_imageleft`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGELEFT"))

proc `sb_imagelefthighlight=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGELEFTHIGHLIGHT"), cast[PIhandle](handle))

proc `sb_imagelefthighlight`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGELEFTHIGHLIGHT"), cast[PIhandle](handle))

proc `sb_imagelefthighlight`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGELEFTHIGHLIGHT"))

proc `sb_imageleftinactive=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGELEFTINACTIVE"), cast[PIhandle](handle))

proc `sb_imageleftinactive`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGELEFTINACTIVE"), cast[PIhandle](handle))

proc `sb_imageleftinactive`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGELEFTINACTIVE"))

proc `sb_imageleftpress=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGELEFTPRESS"), cast[PIhandle](handle))

proc `sb_imageleftpress`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGELEFTPRESS"), cast[PIhandle](handle))

proc `sb_imageleftpress`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGELEFTPRESS"))

proc `sb_imageright=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGERIGHT"), cast[PIhandle](handle))

proc `sb_imageright`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGERIGHT"), cast[PIhandle](handle))

proc `sb_imageright`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGERIGHT"))

proc `sb_imagerighthighlight=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGERIGHTHIGHLIGHT"), cast[PIhandle](handle))

proc `sb_imagerighthighlight`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGERIGHTHIGHLIGHT"), cast[PIhandle](handle))

proc `sb_imagerighthighlight`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGERIGHTHIGHLIGHT"))

proc `sb_imagerightinactive=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGERIGHTINACTIVE"), cast[PIhandle](handle))

proc `sb_imagerightinactive`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGERIGHTINACTIVE"), cast[PIhandle](handle))

proc `sb_imagerightinactive`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGERIGHTINACTIVE"))

proc `sb_imagerightpress=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGERIGHTPRESS"), cast[PIhandle](handle))

proc `sb_imagerightpress`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGERIGHTPRESS"), cast[PIhandle](handle))

proc `sb_imagerightpress`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGERIGHTPRESS"))

proc `sb_imagetop=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGETOP"), cast[PIhandle](handle))

proc `sb_imagetop`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGETOP"), cast[PIhandle](handle))

proc `sb_imagetop`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGETOP"))

proc `sb_imagetophighlight=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGETOPHIGHLIGHT"), cast[PIhandle](handle))

proc `sb_imagetophighlight`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGETOPHIGHLIGHT"), cast[PIhandle](handle))

proc `sb_imagetophighlight`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGETOPHIGHLIGHT"))

proc `sb_imagetopinactive=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGETOPINACTIVE"), cast[PIhandle](handle))

proc `sb_imagetopinactive`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGETOPINACTIVE"), cast[PIhandle](handle))

proc `sb_imagetopinactive`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGETOPINACTIVE"))

proc `sb_imagetoppress=`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGETOPPRESS"), cast[PIhandle](handle))

proc `sb_imagetoppress`*(ih: FlatTree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SB_IMAGETOPPRESS"), cast[PIhandle](handle))

proc `sb_imagetoppress`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_IMAGETOPPRESS"))

# TODO unknown: flattree SB_PRESSCOLOR Unknown Binary
proc `sb_presscolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_PRESSCOLOR"))

proc `sb_resize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_RESIZE"))

proc `screenposition`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `scrollbar=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR")) == "YES"

# TODO unknown: flattree SCROLLBARSIZE Unknown Binary
proc `scrollbarsize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCROLLBARSIZE"))

# TODO unknown: flattree SHOWARROWS Unknown Binary
proc `showarrows`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWARROWS"))

proc `showdragdrop=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    ## DRAGDROPTREE DROPFILESTARGET DROPEQUALDRAG SHOWDRAGDROP
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring(value))

proc `showdragdrop`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring(value))

proc `showdragdrop=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `showdragdrop`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `showdragdrop`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP")) == "YES"

# TODO unknown: flattree SHOWFLOATING Unknown Binary
proc `showfloating`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWFLOATING"))

proc `showrename=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWRENAME"), cstring(value))

proc `showrename`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWRENAME"), cstring(value))

proc `showrename=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWRENAME"), cstring((if yes: "YES" else: "NO")))

proc `showrename`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWRENAME"), cstring((if yes: "YES" else: "NO")))

proc `showrename`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWRENAME")) == "YES"

proc `showtoggle=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWTOGGLE"), cstring(value))

proc `showtoggle`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWTOGGLE"), cstring(value))

proc `showtoggle=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWTOGGLE"), cstring((if yes: "YES" else: "NO")))

proc `showtoggle`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWTOGGLE"), cstring((if yes: "YES" else: "NO")))

proc `showtoggle`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWTOGGLE")) == "YES"

# TODO unknown: flattree SHOWTRANSPARENT Unknown Binary
proc `showtransparent`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWTRANSPARENT"))

proc `size=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: FlatTree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: FlatTree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `spacing=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    ## The SPACING attribute is simply the vertical space between each
    ## node, different from the IupTree.
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(value))

proc `spacing`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(value))

proc `spacing=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(&"{x}"))

proc `spacing`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(&"{x}"))

proc `spacing`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPACING"))

# TODO getter flattree STATE
proc `textpscolor=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTPSCOLOR"), cstring(value))

proc `textpscolor`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTPSCOLOR"), cstring(value))

proc `textpscolor=`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTPSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `textpscolor`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTPSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `textpscolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TEXTPSCOLOR"))

proc `theme=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary flattree
proc `theme`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary flattree
proc `tip`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: FlatTree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary flattree
proc `tipicon`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary flattree
proc `tipmarkup`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: FlatTree_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: FlatTree_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

# TODO getter flattree TITLE
# TODO getter flattree TITLEFONT
# TODO getter flattree TITLEFONTSIZE
# TODO getter flattree TITLEFONTSTYLE
# TODO unknown: flattree TOGGLEBGCOLOR Unknown Binary
proc `togglebgcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOGGLEBGCOLOR"))

# TODO unknown: flattree TOGGLEFGCOLOR Unknown Binary
proc `togglefgcolor`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOGGLEFGCOLOR"))

# TODO unknown: flattree TOGGLESIZE Unknown Binary
proc `togglesize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOGGLESIZE"))

# TODO getter flattree TOGGLEVALUE
# TODO getter flattree TOGGLEVISIBLE
proc `topitem=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(value))

proc `topitem`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(value))

proc `topitem=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(&"{x}"))

proc `topitem`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(&"{x}"))

# TODO getter flattree TOTALCHILDCOUNT
proc `touch=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring(value))

proc `touch`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring(value))

proc `touch=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring((if yes: "YES" else: "NO")))

proc `touch`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring((if yes: "YES" else: "NO")))

proc `touch`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOUCH")) == "YES"

# TODO getter flattree USERDATA
proc `usersize=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: FlatTree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: FlatTree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `value=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(&"{x}"))

proc `value`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(&"{x}"))

proc `value`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `visible=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wheeldropfocus=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring(value))

proc `wheeldropfocus`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring(value))

proc `wheeldropfocus=`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `wheeldropfocus`*(ih: FlatTree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `wheeldropfocus`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS")) == "YES"

proc `wid`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

proc `xautohide`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE")) == "YES"

proc `xdisplay`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XDISPLAY"))

# TODO unknown: flattree XFONTID Unknown Binary
proc `xfontid`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `xhidden`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XHIDDEN")) == "YES"

proc `xmax=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(value))

proc `xmax`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(value))

proc `xmax=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(&"{x}"))

proc `xmax`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(&"{x}"))

proc `xmax`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XMAX"))

proc `xmin=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(value))

proc `xmin`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(value))

proc `xmin=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(&"{x}"))

proc `xmin`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(&"{x}"))

proc `xmin`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XMIN"))

# TODO unknown: flattree XWINDOW Unknown Binary
proc `xwindow`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XWINDOW"))

proc `y`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `yautohide`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE")) == "YES"

proc `yhidden`*(ih: FlatTree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YHIDDEN")) == "YES"

proc `ymax=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(value))

proc `ymax`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(value))

proc `ymax=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(&"{x}"))

proc `ymax`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(&"{x}"))

proc `ymax`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YMAX"))

proc `ymin=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(value))

proc `ymin`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(value))

proc `ymin=`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(&"{x}"))

proc `ymin`*(ih: FlatTree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(&"{x}"))

proc `ymin`*(ih: FlatTree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YMIN"))

proc `zorder=`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: FlatTree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `action=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cfloat, arg3: cfloat): cint {.cdecl.}) {.cdecl.} =
    ## ACTION ACTION Action generated when the element is activated.
    ## Affects each element differently. Callback int function(Ihandle
    ## \*ih); [in C] ih:action() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. In some
    ## elements, this callback may receive more parameters, apart from
    ## ih. Please refer to each element's documentation. Affects
    ## IupButton, IupItem, IupList, IupText, IupCanvas, IupMultiline,
    ## IupToggle
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cfloat, arg3: cfloat): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION")))

proc `branchclose_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BRANCHCLOSE_CB"), cast[Icallback](cb))

proc `branchclose_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BRANCHCLOSE_CB"), cast[Icallback](cb))

proc `branchclose_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BRANCHCLOSE_CB")))

proc `branchopen_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BRANCHOPEN_CB"), cast[Icallback](cb))

proc `branchopen_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BRANCHOPEN_CB"), cast[Icallback](cb))

proc `branchopen_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BRANCHOPEN_CB")))

proc `button_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `button_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BUTTON_CB")))

proc `destroy_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragdrop_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, drag_id, drop_id, isshift, iscontrol: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDROP_CB"), cast[Icallback](cb))

proc `dragdrop_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, drag_id, drop_id, isshift, iscontrol: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDROP_CB"), cast[Icallback](cb))

proc `dragdrop_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDROP_CB")))

proc `dragend_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropfiles_cb=`*(ih: FlatTree_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `dropfiles_cb`*(ih: FlatTree_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `enterwindow_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `enterwindow_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `executebranch_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EXECUTEBRANCH_CB"), cast[Icallback](cb))

proc `executebranch_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EXECUTEBRANCH_CB"), cast[Icallback](cb))

proc `executebranch_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("EXECUTEBRANCH_CB")))

proc `executeleaf_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EXECUTELEAF_CB"), cast[Icallback](cb))

proc `executeleaf_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EXECUTELEAF_CB"), cast[Icallback](cb))

proc `executeleaf_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("EXECUTELEAF_CB")))

proc `flat_button_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_BUTTON_CB"), cast[Icallback](cb))

proc `flat_button_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_BUTTON_CB"), cast[Icallback](cb))

proc `flat_button_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_BUTTON_CB")))

proc `flat_focus_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_FOCUS_CB"), cast[Icallback](cb))

proc `flat_focus_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_FOCUS_CB"), cast[Icallback](cb))

proc `flat_focus_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_FOCUS_CB")))

proc `flat_leavewindow_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `flat_leavewindow_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `flat_leavewindow_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_LEAVEWINDOW_CB")))

proc `flat_motion_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_MOTION_CB"), cast[Icallback](cb))

proc `flat_motion_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_MOTION_CB"), cast[Icallback](cb))

proc `flat_motion_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_MOTION_CB")))

proc `focus_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FOCUS_CB")))

proc `getfocus_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `getfocus_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `keypress_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, c, press: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `keypress_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, c, press: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KEYPRESS_CB"), cast[Icallback](cb))

proc `keypress_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KEYPRESS_CB")))

proc `killfocus_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `killfocus_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `k_any`*(ih: FlatTree_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `leavewindow_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `motion_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `motion_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MOTION_CB"), cast[Icallback](cb))

proc `motion_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MOTION_CB")))

proc `multiselection_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: ptr cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MULTISELECTION_CB"), cast[Icallback](cb))

proc `multiselection_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: ptr cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MULTISELECTION_CB"), cast[Icallback](cb))

proc `multiselection_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MULTISELECTION_CB")))

proc `multiunselection_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: ptr cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MULTIUNSELECTION_CB"), cast[Icallback](cb))

proc `multiunselection_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: ptr cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MULTIUNSELECTION_CB"), cast[Icallback](cb))

proc `multiunselection_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MULTIUNSELECTION_CB")))

proc `noderemoved_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("NODEREMOVED_CB"), cast[Icallback](cb))

proc `noderemoved_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("NODEREMOVED_CB"), cast[Icallback](cb))

proc `noderemoved_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("NODEREMOVED_CB")))

proc `postmessage_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `rename_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RENAME_CB"), cast[Icallback](cb))

proc `rename_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RENAME_CB"), cast[Icallback](cb))

proc `rename_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RENAME_CB")))

proc `resize_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `resize_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RESIZE_CB"), cast[Icallback](cb))

proc `resize_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RESIZE_CB")))

proc `rightclick_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RIGHTCLICK_CB"), cast[Icallback](cb))

proc `rightclick_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RIGHTCLICK_CB"), cast[Icallback](cb))

proc `rightclick_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RIGHTCLICK_CB")))

proc `scroll_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.}) {.cdecl.} =
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

proc `scroll_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SCROLL_CB"), cast[Icallback](cb))

proc `scroll_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SCROLL_CB")))

proc `selection_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    ## SELECTION_CB: Action generated when an node is selected or
    ## deselected. MULTISELECTION_CB: Action generated when multiple
    ## nodes are selected with the mouse and the shift key pressed.
    ## MULTIUNSELECTION_CB: Action generated before multiple nodes are
    ## unselected in one single operation. BRANCHOPEN_CB: Action
    ## generated when a branch is expanded. BRANCHCLOSE_CB: Action
    ## generated when a branch is collapsed. EXECUTELEAF_CB: Action
    ## generated when a leaf is executed. EXECUTEBRANCH_CB: Action
    ## generated when a branch is executed. SHOWRENAME_CB: Action
    ## generated before a node is renamed. RENAME_CB: Action generated
    ## after a node is renamed. DRAGDROP_CB: Action generated when an
    ## internal drag & drop is executed. NODEREMOVED_CB: Action
    ## generated when a node is about to be removed. RIGHTCLICK_CB:
    ## Action generated when the right mouse button is pressed over a
    ## node. TOGGLEVALUE_CB: Action generated when the toggle&#39;s
    ## state was changed. The callback also receives the new
    ## toggle&#39;s state.
    SetCallback(cast[PIhandle](ih), cstring("SELECTION_CB"), cast[Icallback](cb))

proc `selection_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SELECTION_CB"), cast[Icallback](cb))

proc `selection_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SELECTION_CB")))

proc `showrename_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SHOWRENAME_CB"), cast[Icallback](cb))

proc `showrename_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SHOWRENAME_CB"), cast[Icallback](cb))

proc `showrename_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SHOWRENAME_CB")))

proc `togglevalue_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("TOGGLEVALUE_CB"), cast[Icallback](cb))

proc `togglevalue_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("TOGGLEVALUE_CB"), cast[Icallback](cb))

proc `togglevalue_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("TOGGLEVALUE_CB")))

proc `unmap_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `wheel_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `wheel_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("WHEEL_CB"), cast[Icallback](cb))

proc `wheel_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("WHEEL_CB")))

proc `wom_cb=`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `wom_cb`*(ih: FlatTree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("WOM_CB"), cast[Icallback](cb))

proc `wom_cb`*(ih: FlatTree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("WOM_CB")))

