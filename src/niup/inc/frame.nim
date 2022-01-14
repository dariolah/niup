when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Frame
##
## NIUP type: Frame_t
##
## constructors
##
##    proc Frame(child: IUPhandle_t): Frame_t
##

proc Frame*(child: IUPhandle_t): Frame_t {.cdecl.} =
    ## Creates a native container, which draws a frame with a title
    ## around its child.
    return Frame_t(niupc.Frame(cast[PIhandle](child)))

proc `active=`*(ih: Frame_t, value: string) {.cdecl.} =
    ## ACTIVE, FONT, SCREENPOSITION, POSITION, CLIENTSIZE,
    ## CLIENTOFFSET, MINSIZE, MAXSIZE, WID, SIZE, RASTERSIZE, ZORDER,
    ## VISIBLE, THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Frame_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Frame_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Frame_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `backcolor=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKCOLOR"), cstring(value))

proc `backcolor`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKCOLOR"), cstring(value))

proc `backcolor=`*(ih: Frame_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `backcolor`*(ih: Frame_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `backcolor`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKCOLOR"))

proc `bgcolor=`*(ih: Frame_t, value: string) {.cdecl.} =
    ## BGCOLOR: ignored, transparent in all systems. Will use the
    ## background color of the native parent. Except if TITLE is not
    ## defined and BGCOLOR is defined before map (can be changed
    ## later), then the frame will have a color background.
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: Frame_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Frame_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `canfocus=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: Frame_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Frame_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Frame_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `childoffset=`*(ih: Frame_t, value: string) {.cdecl.} =
    ## CHILDOFFSET: Allow to specify a position offset for the child.
    ## Available for native containers only. It will not affect the
    ## natural size, and allows to position controls outside the
    ## client area. Format "dxxdy", where dx and dy are integer values
    ## corresponding to the horizontal and vertical offsets,
    ## respectively, in pixels. Default: 0x0. (since 3.14)
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(value))

proc `childoffset`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(value))

proc `childoffset=`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(&"{width}x{height}"))

proc `childoffset`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(&"{width}x{height}"))

proc `childoffset`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"))

proc `clientoffset`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `expand=`*(ih: Frame_t, value: string) {.cdecl.} =
    ## EXPAND (non inheritable): The default value is "YES".
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: Frame_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Frame_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `fgcolor=`*(ih: Frame_t, value: string) {.cdecl.} =
    ## FGCOLOR: Text title color. Not available in Windows when using
    ## Windows Visual Styles. Default: the global attribute
    ## DLGFGCOLOR.
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor=`*(ih: Frame_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: Frame_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"))

proc `floating=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary frame
proc `font`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary frame
proc `fontface`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: Frame_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Frame_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary frame
proc `fontstyle`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `handlename=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary frame
proc `handlename`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `maxsize=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary frame
proc `name`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `normalizergroup=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary frame
proc `normalizergroup`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary frame
proc `ntheme`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

# TODO unknown: frame PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: frame PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: Frame_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Frame_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: Frame_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Frame_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Frame_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `screenposition`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `size=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

# TODO unknown: frame SUNKEN Unknown Binary
proc `sunken`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SUNKEN"))

proc `theme=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary frame
proc `theme`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary frame
proc `tip`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: Frame_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Frame_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: Frame_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Frame_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: Frame_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Frame_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary frame
proc `tipicon`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary frame
proc `tipmarkup`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: Frame_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Frame_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: Frame_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Frame_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Frame_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `title=`*(ih: Frame_t, value: string) {.cdecl.} =
    ## TITLE (non inheritable): Text the user will see at the top of
    ## the frame. If not defined during creation it can not be added
    ## lately, to be changed it must be at least "" during creation.
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

proc `title`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

# TODO ??? String Binary frame
proc `title`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLE"))

proc `usersize=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Frame_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `visible=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: Frame_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Frame_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Frame_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

# TODO unknown: frame XFONTID Unknown Binary
proc `xfontid`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `y`*(ih: Frame_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `zorder=`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: Frame_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `focus_cb=`*(ih: Frame_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    ## FOCUS_CB: Called when a child of the container gets or looses
    ## the focus. It is called only if PROPAGATEFOCUS is defined in
    ## the child. (since 3.23) int function(Ihandle \*ih, int focus);
    ## [in C]ih:focus_cb(focus: number) -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: Frame_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: Frame_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FOCUS_CB")))

proc `map_cb=`*(ih: Frame_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Frame_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Frame_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `unmap_cb=`*(ih: Frame_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Frame_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Frame_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

