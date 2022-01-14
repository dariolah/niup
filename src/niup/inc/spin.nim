when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Spin
##
## NIUP type: Spin_t
##
## constructors
##
##    proc Spin(): Spin_t
##

proc Spin*(): Spin_t {.cdecl.} =
    ## This functions will create a control set with a vertical box
    ## containing two buttons, one with an up arrow and the other with
    ## a down arrow, to be used to increment and decrement values.
    ## Unlike the SPIN attribute of the IupText element, the IupSpin
    ## element can NOT automatically increment the value and it is NOT
    ## inserted inside the IupText area. But they can be used with any
    ## element.
    return Spin_t(niupc.Spin())

proc `active=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Spin_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `alignment=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"))

proc `canfocus=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Spin_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `cgap=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAP"), cstring(value))

proc `cgap`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAP"), cstring(value))

proc `cgap=`*(ih: Spin_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAP"), cstring(&"{x}"))

proc `cgap`*(ih: Spin_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAP"), cstring(&"{x}"))

proc `cgap`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CGAP"))

proc `charsize`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `clientoffset`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `cmargin=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(value))

proc `cmargin`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(value))

proc `cmargin=`*(ih: Spin_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(&"{horiz}x{vert}"))

proc `cmargin`*(ih: Spin_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(&"{horiz}x{vert}"))

proc `cmargin`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CMARGIN"))

proc `expand=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandchildren=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"), cstring(value))

proc `expandchildren`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"), cstring(value))

proc `expandchildren=`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"), cstring((if yes: "YES" else: "NO")))

proc `expandchildren`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"), cstring((if yes: "YES" else: "NO")))

proc `expandchildren`*(ih: Spin_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN")) == "YES"

proc `expandweight=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: Spin_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Spin_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `floating=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary spin
proc `font`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary spin
proc `fontface`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: Spin_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Spin_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary spin
proc `fontstyle`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `gap=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(value))

proc `gap`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(value))

proc `gap=`*(ih: Spin_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(&"{x}"))

proc `gap`*(ih: Spin_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(&"{x}"))

proc `gap`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("GAP"))

proc `handlename=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary spin
proc `handlename`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `homogeneous=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUS"), cstring(value))

proc `homogeneous`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUS"), cstring(value))

proc `homogeneous=`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUS"), cstring((if yes: "YES" else: "NO")))

proc `homogeneous`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUS"), cstring((if yes: "YES" else: "NO")))

proc `homogeneous`*(ih: Spin_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUS")) == "YES"

proc `margin=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(value))

proc `margin`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(value))

proc `margin=`*(ih: Spin_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(&"{horiz}x{vert}"))

proc `margin`*(ih: Spin_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(&"{horiz}x{vert}"))

proc `margin`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARGIN"))

proc `maxsize=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: Spin_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Spin_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: Spin_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Spin_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary spin
proc `name`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `ncgap=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAP"), cstring(value))

proc `ncgap`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAP"), cstring(value))

proc `ncgap=`*(ih: Spin_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAP"), cstring(&"{x}"))

proc `ncgap`*(ih: Spin_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAP"), cstring(&"{x}"))

proc `ncgap`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NCGAP"))

proc `ncmargin=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(value))

proc `ncmargin`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(value))

proc `ncmargin=`*(ih: Spin_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(&"{horiz}x{vert}"))

proc `ncmargin`*(ih: Spin_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(&"{horiz}x{vert}"))

proc `ncmargin`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"))

proc `ngap=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAP"), cstring(value))

proc `ngap`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAP"), cstring(value))

proc `ngap=`*(ih: Spin_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAP"), cstring(&"{x}"))

proc `ngap`*(ih: Spin_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAP"), cstring(&"{x}"))

proc `ngap`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NGAP"))

proc `nmargin=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(value))

proc `nmargin`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(value))

proc `nmargin=`*(ih: Spin_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(&"{horiz}x{vert}"))

proc `nmargin`*(ih: Spin_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(&"{horiz}x{vert}"))

proc `nmargin`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NMARGIN"))

proc `normalizergroup=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary spin
proc `normalizergroup`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `normalizesize=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZESIZE"), cstring(value))

proc `normalizesize`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZESIZE"), cstring(value))

proc `normalizesize`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZESIZE"))

proc `ntheme=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary spin
proc `ntheme`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `orientation`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"))

# TODO unknown: spin PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: spin PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: Spin_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Spin_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Spin_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: Spin_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Spin_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `size=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: Spin_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Spin_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `theme=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary spin
proc `theme`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `usersize=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: Spin_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Spin_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `visible=`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: Spin_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Spin_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Spin_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

# TODO unknown: spin XFONTID Unknown Binary
proc `xfontid`*(ih: Spin_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `destroy_cb=`*(ih: Spin_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Spin_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Spin_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `ldestroy_cb=`*(ih: Spin_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Spin_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Spin_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: Spin_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Spin_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Spin_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: Spin_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Spin_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Spin_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `spin_cb=`*(ih: Spin_t, cb: proc (ih: PIhandle, pos: cint): cint {.cdecl.}) {.cdecl.} =
    ## SPIN_CB: Called each time the user clicks in the buttons. It
    ## will increment 1 and decrement -1 by default. Holding the Shift
    ## key will set a factor of 2, holding Ctrl a factor of 10, and
    ## both a factor of 100. int function(Ihandle \*ih, int inc); [in
    ## C] ih:spin_cb(inc: number) -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("SPIN_CB"), cast[Icallback](cb))

proc `spin_cb`*(ih: Spin_t, cb: proc (ih: PIhandle, pos: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SPIN_CB"), cast[Icallback](cb))

proc `spin_cb`*(ih: Spin_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SPIN_CB")))

proc `unmap_cb=`*(ih: Spin_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Spin_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Spin_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `updateattribfromfont_cb=`*(ih: Spin_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB"), cast[Icallback](cb))

proc `updateattribfromfont_cb`*(ih: Spin_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB"), cast[Icallback](cb))

proc `updateattribfromfont_cb`*(ih: Spin_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB")))

