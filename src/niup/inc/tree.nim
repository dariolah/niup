when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Tree
##
## NIUP type: Tree_t
##
## constructors
##
##    proc Tree(): Tree_t
##

proc Tree*(): Tree_t {.cdecl.} =
    ## Creates a tree containing nodes of branches or leaves. Both
    ## branches and leaves can have an associated text and image. The
    ## branches can be expanded or collapsed. When a branch is
    ## expanded, its immediate children are visible, and when it is
    ## collapsed they are hidden. The leaves can generate an
    ## "executed" or "renamed" actions, branches can only generate a
    ## "renamed" action. The focus node is the node with the focus
    ## rectangle, marked nodes have their background inverted.
    return Tree_t(niupc.Tree())

proc `active=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

# TODO getter tree ADDBRANCH
proc `addexpanded=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## ADDEXPANDED ADDROOT ADDLEAF ADDBRANCH COPYNODE DELNODE
    ## EXPANDALL INSERTLEAF INSERTBRANCH MOVENODE
    SetAttribute(cast[PIhandle](ih), cstring("ADDEXPANDED"), cstring(value))

proc `addexpanded`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDEXPANDED"), cstring(value))

proc `addexpanded=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDEXPANDED"), cstring((if yes: "YES" else: "NO")))

proc `addexpanded`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDEXPANDED"), cstring((if yes: "YES" else: "NO")))

proc `addexpanded`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ADDEXPANDED")) == "YES"

# TODO getter tree ADDLEAF
# TODO unknown: tree ADDROOT Unknown Binary
proc `addroot`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ADDROOT"))

proc `bgcolor=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## AUTOREDRAW BGCOLOR COUNT EXPAND FGCOLOR INDENTATION RASTERSIZE
    ## SPACING TOPITEM
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: Tree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Tree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `canfocus=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

# TODO getter tree CHILDCOUNT
# TODO getter tree COLOR
# TODO getter tree COPYNODE
proc `count`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COUNT"))

proc `cpadding=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding=`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CPADDING"))

proc `cspacing=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(value))

proc `cspacing`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(value))

proc `cspacing=`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(&"{x}"))

proc `cspacing`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(&"{x}"))

proc `cspacing`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CSPACING"))

# TODO unknown: tree CTRL Unknown Binary
proc `ctrl`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CTRL"))

# TODO getter tree DELNODE
# TODO getter tree DEPTH
proc `dragdrop=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragdroptree=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## DRAGDROPTREE DROPFILESTARGET DROPEQUALDRAG SHOWDRAGDROP
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPTREE"), cstring(value))

proc `dragdroptree`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPTREE"), cstring(value))

proc `dragdroptree=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPTREE"), cstring((if yes: "YES" else: "NO")))

proc `dragdroptree`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPTREE"), cstring((if yes: "YES" else: "NO")))

proc `dragdroptree`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROPTREE")) == "YES"

proc `dragsource=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary tree
proc `dragtypes`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

proc `dropequaldrag=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## DRAGDROPTREE DROPFILESTARGET DROPEQUALDRAG SHOWDRAGDROP
    SetAttribute(cast[PIhandle](ih), cstring("DROPEQUALDRAG"), cstring(value))

proc `dropequaldrag`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPEQUALDRAG"), cstring(value))

proc `dropequaldrag=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPEQUALDRAG"), cstring((if yes: "YES" else: "NO")))

proc `dropequaldrag`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPEQUALDRAG"), cstring((if yes: "YES" else: "NO")))

proc `dropequaldrag`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPEQUALDRAG")) == "YES"

proc `dropfilestarget=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## DRAGDROPTREE DROPFILESTARGET DROPEQUALDRAG SHOWDRAGDROP
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary tree
proc `droptypes`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `expand=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## AUTOREDRAW BGCOLOR COUNT EXPAND FGCOLOR INDENTATION RASTERSIZE
    ## SPACING TOPITEM
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandall=`*(ih: Tree_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDALL"), cstring(""))

proc `expandall`*(ih: Tree_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDALL"), cstring(""))

proc `expandweight=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: Tree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Tree_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `fgcolor=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## AUTOREDRAW BGCOLOR COUNT EXPAND FGCOLOR INDENTATION RASTERSIZE
    ## SPACING TOPITEM
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor=`*(ih: Tree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: Tree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"))

# TODO getter tree FIRST
proc `floating=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary tree
proc `font`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary tree
proc `fontface`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary tree
proc `fontstyle`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `handlename=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary tree
proc `handlename`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `hidebuttons=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## HIDELINES HIDEBUTTONS
    SetAttribute(cast[PIhandle](ih), cstring("HIDEBUTTONS"), cstring(value))

proc `hidebuttons`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDEBUTTONS"), cstring(value))

proc `hidebuttons=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDEBUTTONS"), cstring((if yes: "YES" else: "NO")))

proc `hidebuttons`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDEBUTTONS"), cstring((if yes: "YES" else: "NO")))

proc `hidebuttons`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDEBUTTONS")) == "YES"

proc `hidelines=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## HIDELINES HIDEBUTTONS
    SetAttribute(cast[PIhandle](ih), cstring("HIDELINES"), cstring(value))

proc `hidelines`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDELINES"), cstring(value))

proc `hidelines=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDELINES"), cstring((if yes: "YES" else: "NO")))

proc `hidelines`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDELINES"), cstring((if yes: "YES" else: "NO")))

proc `hidelines`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDELINES")) == "YES"

# TODO getter tree IMAGE
proc `imagebranchcollapsed=`*(ih: Tree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGEIMAGEEXPANDEDIMAGELEAF IMAGEBRANCHCOLLAPSED
    ## IMAGEBRANCHEXPANDED. In Windows, IMAGELEAF,
    ## IMAGEBRANCHCOLLAPSED and IMAGEBRANCHEXPANDED must have the same
    ## size. In other systems only IMAGEBRANCHCOLLAPSED and
    ## IMAGEBRANCHEXPANDED must have the same size. In Windows,
    ## IMAGELEAF defines the size available for the image on all
    ## nodes. In Windows, IMAGELEAF, IMAGEBRANCHCOLLAPSED and
    ## IMAGEBRANCHEXPANDED must have the same size. In other systems
    ## only IMAGEBRANCHCOLLAPSED and IMAGEBRANCHEXPANDED must have the
    ## same size. In Windows, IMAGELEAF defines the size available for
    ## the image on all nodes.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEBRANCHCOLLAPSED"), cast[PIhandle](handle))

proc `imagebranchcollapsed`*(ih: Tree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEBRANCHCOLLAPSED"), cast[PIhandle](handle))

proc `imagebranchcollapsed`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEBRANCHCOLLAPSED"))

proc `imagebranchexpanded=`*(ih: Tree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGEIMAGEEXPANDEDIMAGELEAF IMAGEBRANCHCOLLAPSED
    ## IMAGEBRANCHEXPANDED. In Windows, IMAGELEAF,
    ## IMAGEBRANCHCOLLAPSED and IMAGEBRANCHEXPANDED must have the same
    ## size. In other systems only IMAGEBRANCHCOLLAPSED and
    ## IMAGEBRANCHEXPANDED must have the same size. In Windows,
    ## IMAGELEAF defines the size available for the image on all
    ## nodes. In Windows, IMAGELEAF, IMAGEBRANCHCOLLAPSED and
    ## IMAGEBRANCHEXPANDED must have the same size. In other systems
    ## only IMAGEBRANCHCOLLAPSED and IMAGEBRANCHEXPANDED must have the
    ## same size. In Windows, IMAGELEAF defines the size available for
    ## the image on all nodes.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEBRANCHEXPANDED"), cast[PIhandle](handle))

proc `imagebranchexpanded`*(ih: Tree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEBRANCHEXPANDED"), cast[PIhandle](handle))

proc `imagebranchexpanded`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEBRANCHEXPANDED"))

# TODO getter tree IMAGEEXPANDED
proc `imageleaf=`*(ih: Tree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## In Windows, IMAGELEAF, IMAGEBRANCHCOLLAPSED and
    ## IMAGEBRANCHEXPANDED must have the same size. In other systems
    ## only IMAGEBRANCHCOLLAPSED and IMAGEBRANCHEXPANDED must have the
    ## same size. In Windows, IMAGELEAF defines the size available for
    ## the image on all nodes. In Windows, IMAGELEAF,
    ## IMAGEBRANCHCOLLAPSED and IMAGEBRANCHEXPANDED must have the same
    ## size. In other systems only IMAGEBRANCHCOLLAPSED and
    ## IMAGEBRANCHEXPANDED must have the same size. In Windows,
    ## IMAGELEAF defines the size available for the image on all
    ## nodes.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGELEAF"), cast[PIhandle](handle))

proc `imageleaf`*(ih: Tree_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGELEAF"), cast[PIhandle](handle))

proc `imageleaf`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGELEAF"))

proc `indentation=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## AUTOREDRAW BGCOLOR COUNT EXPAND FGCOLOR INDENTATION RASTERSIZE
    ## SPACING TOPITEM
    SetAttribute(cast[PIhandle](ih), cstring("INDENTATION"), cstring(value))

proc `indentation`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("INDENTATION"), cstring(value))

proc `indentation=`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("INDENTATION"), cstring(&"{x}"))

proc `indentation`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("INDENTATION"), cstring(&"{x}"))

proc `indentation`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("INDENTATION"))

# TODO getter tree INSERTBRANCH
# TODO getter tree INSERTLEAF
# TODO getter tree KIND
# TODO getter tree LAST
proc `lastaddnode`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LASTADDNODE"))

proc `mark=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## MARK MARKED MARKEDNODESMARKMODE MARKSTARTMARKWHENTOGGLE
    SetAttribute(cast[PIhandle](ih), cstring("MARK"), cstring(value))

proc `mark`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARK"), cstring(value))

# TODO getter tree MARKED
proc `markednodes=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKEDNODES"), cstring(value))

proc `markednodes`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKEDNODES"), cstring(value))

# TODO ??? String Binary tree
proc `markednodes`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARKEDNODES"))

proc `markmode=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKMODE"), cstring(value))

proc `markmode`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKMODE"), cstring(value))

proc `markmode`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARKMODE"))

proc `markstart=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKSTART"), cstring(value))

proc `markstart`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKSTART"), cstring(value))

proc `markstart=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKSTART"), cstring((if yes: "YES" else: "NO")))

proc `markstart`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKSTART"), cstring((if yes: "YES" else: "NO")))

proc `markstart`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARKSTART")) == "YES"

proc `markwhentoggle=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKWHENTOGGLE"), cstring(value))

proc `markwhentoggle`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKWHENTOGGLE"), cstring(value))

proc `markwhentoggle=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKWHENTOGGLE"), cstring((if yes: "YES" else: "NO")))

proc `markwhentoggle`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKWHENTOGGLE"), cstring((if yes: "YES" else: "NO")))

proc `markwhentoggle`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARKWHENTOGGLE")) == "YES"

proc `maxsize=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

# TODO getter tree MOVENODE
proc `name=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary tree
proc `name`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

# TODO getter tree NEXT
proc `normalizergroup=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary tree
proc `normalizergroup`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary tree
proc `ntheme`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

# TODO unknown: tree PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: tree PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

# TODO getter tree PARENT
proc `position=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: Tree_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Tree_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

# TODO getter tree PREVIOUS
proc `propagatefocus=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## VALUECANFOCUS PROPAGATEFOCUS
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## AUTOREDRAW BGCOLOR COUNT EXPAND FGCOLOR INDENTATION RASTERSIZE
    ## SPACING TOPITEM
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `rename=`*(ih: Tree_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAME"), cstring(""))

proc `rename`*(ih: Tree_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAME"), cstring(""))

proc `renamecaret=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAMECARET"), cstring(value))

proc `renamecaret`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAMECARET"), cstring(value))

# TODO ??? String Binary tree
proc `renamecaret`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RENAMECARET"))

proc `renameselection=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAMESELECTION"), cstring(value))

proc `renameselection`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RENAMESELECTION"), cstring(value))

# TODO ??? String Binary tree
proc `renameselection`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RENAMESELECTION"))

proc `rootcount`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ROOTCOUNT"))

proc `rubberband=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RUBBERBAND"), cstring(value))

proc `rubberband`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RUBBERBAND"), cstring(value))

# TODO ??? String Binary tree
proc `rubberband`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RUBBERBAND"))

proc `screenposition`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

# TODO unknown: tree SHIFT Unknown Binary
proc `shift`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHIFT"))

proc `showdragdrop=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## DRAGDROPTREE DROPFILESTARGET DROPEQUALDRAG SHOWDRAGDROP
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring(value))

proc `showdragdrop`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring(value))

proc `showdragdrop=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `showdragdrop`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `showdragdrop`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP")) == "YES"

proc `showrename=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWRENAME"), cstring(value))

proc `showrename`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWRENAME"), cstring(value))

proc `showrename=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWRENAME"), cstring((if yes: "YES" else: "NO")))

proc `showrename`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWRENAME"), cstring((if yes: "YES" else: "NO")))

proc `showrename`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWRENAME")) == "YES"

proc `showtoggle=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWTOGGLE"), cstring(value))

proc `showtoggle`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWTOGGLE"), cstring(value))

proc `showtoggle=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWTOGGLE"), cstring((if yes: "YES" else: "NO")))

proc `showtoggle`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWTOGGLE"), cstring((if yes: "YES" else: "NO")))

proc `showtoggle`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWTOGGLE")) == "YES"

proc `size=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `spacing=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## AUTOREDRAW BGCOLOR COUNT EXPAND FGCOLOR INDENTATION RASTERSIZE
    ## SPACING TOPITEM
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(value))

proc `spacing`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(value))

proc `spacing=`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(&"{x}"))

proc `spacing`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(&"{x}"))

proc `spacing`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPACING"))

# TODO unknown: tree STARTING Unknown Binary
proc `starting`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("STARTING"))

# TODO getter tree STATE
proc `theme=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary tree
proc `theme`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary tree
proc `tip`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: Tree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Tree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: Tree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Tree_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary tree
proc `tipicon`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary tree
proc `tipmarkup`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: Tree_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Tree_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

# TODO getter tree TITLE
# TODO getter tree TITLEFONT
# TODO getter tree TITLEFONTSIZE
# TODO getter tree TITLEFONTSTYLE
# TODO getter tree TOGGLEVALUE
# TODO getter tree TOGGLEVISIBLE
proc `topitem=`*(ih: Tree_t, value: string) {.cdecl.} =
    ## AUTOREDRAW BGCOLOR COUNT EXPAND FGCOLOR INDENTATION RASTERSIZE
    ## SPACING TOPITEM
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(value))

proc `topitem`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(value))

proc `topitem=`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(&"{x}"))

proc `topitem`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(&"{x}"))

# TODO getter tree TOTALCHILDCOUNT
# TODO getter tree USERDATA
proc `usersize=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Tree_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `value=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value=`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(&"{x}"))

proc `value`*(ih: Tree_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(&"{x}"))

proc `value`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `visible=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Tree_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Tree_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

# TODO unknown: tree XFONTID Unknown Binary
proc `xfontid`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `y`*(ih: Tree_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `zorder=`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: Tree_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `branchclose_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BRANCHCLOSE_CB"), cast[Icallback](cb))

proc `branchclose_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BRANCHCLOSE_CB"), cast[Icallback](cb))

proc `branchclose_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BRANCHCLOSE_CB")))

proc `branchopen_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BRANCHOPEN_CB"), cast[Icallback](cb))

proc `branchopen_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BRANCHOPEN_CB"), cast[Icallback](cb))

proc `branchopen_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BRANCHOPEN_CB")))

proc `button_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `button_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BUTTON_CB")))

proc `destroy_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragdrop_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, drag_id, drop_id, isshift, iscontrol: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDROP_CB"), cast[Icallback](cb))

proc `dragdrop_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, drag_id, drop_id, isshift, iscontrol: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDROP_CB"), cast[Icallback](cb))

proc `dragdrop_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDROP_CB")))

proc `dragend_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropfiles_cb=`*(ih: Tree_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `dropfiles_cb`*(ih: Tree_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `enterwindow_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `enterwindow_cb`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `executebranch_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EXECUTEBRANCH_CB"), cast[Icallback](cb))

proc `executebranch_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EXECUTEBRANCH_CB"), cast[Icallback](cb))

proc `executebranch_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("EXECUTEBRANCH_CB")))

proc `executeleaf_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EXECUTELEAF_CB"), cast[Icallback](cb))

proc `executeleaf_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EXECUTELEAF_CB"), cast[Icallback](cb))

proc `executeleaf_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("EXECUTELEAF_CB")))

proc `getfocus_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `getfocus_cb`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `killfocus_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `killfocus_cb`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: Tree_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `k_any`*(ih: Tree_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `leavewindow_cb`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `motion_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `motion_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MOTION_CB"), cast[Icallback](cb))

proc `motion_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MOTION_CB")))

proc `multiselection_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: ptr cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MULTISELECTION_CB"), cast[Icallback](cb))

proc `multiselection_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: ptr cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MULTISELECTION_CB"), cast[Icallback](cb))

proc `multiselection_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MULTISELECTION_CB")))

proc `multiunselection_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: ptr cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MULTIUNSELECTION_CB"), cast[Icallback](cb))

proc `multiunselection_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: ptr cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MULTIUNSELECTION_CB"), cast[Icallback](cb))

proc `multiunselection_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MULTIUNSELECTION_CB")))

proc `noderemoved_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("NODEREMOVED_CB"), cast[Icallback](cb))

proc `noderemoved_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("NODEREMOVED_CB"), cast[Icallback](cb))

proc `noderemoved_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("NODEREMOVED_CB")))

proc `postmessage_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `rename_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RENAME_CB"), cast[Icallback](cb))

proc `rename_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RENAME_CB"), cast[Icallback](cb))

proc `rename_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RENAME_CB")))

proc `rightclick_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RIGHTCLICK_CB"), cast[Icallback](cb))

proc `rightclick_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RIGHTCLICK_CB"), cast[Icallback](cb))

proc `rightclick_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RIGHTCLICK_CB")))

proc `selection_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `selection_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SELECTION_CB"), cast[Icallback](cb))

proc `selection_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SELECTION_CB")))

proc `showrename_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SHOWRENAME_CB"), cast[Icallback](cb))

proc `showrename_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SHOWRENAME_CB"), cast[Icallback](cb))

proc `showrename_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SHOWRENAME_CB")))

proc `togglevalue_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("TOGGLEVALUE_CB"), cast[Icallback](cb))

proc `togglevalue_cb`*(ih: Tree_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("TOGGLEVALUE_CB"), cast[Icallback](cb))

proc `togglevalue_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("TOGGLEVALUE_CB")))

proc `unmap_cb=`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Tree_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Tree_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

