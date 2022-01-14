when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: MultiBox
##
## NIUP type: MultiBox_t
##
## constructors
##
##    macro MultiBox(args: varargs[untyped]): MultiBox_t
##

macro MultiBox*(args: varargs[untyped]): MultiBox_t =
    ## Creates a void container for composing elements in a irregular
    ## grid. It is a box that arranges the elements it contains from
    ## top to bottom and from left to right, by distributing the
    ## elements in lines or in columns. But its EXPAND attribute does
    ## not behave as a regular container, instead it behaves as a
    ## regular element expanding into the available space. The child
    ## elements are added to the control just like a vbox and hbox,
    ## sequentially. Then they are distributed accordingly the
    ## ORIENTATION attribute. When ORIENTATION=HORIZONTAL children are
    ## distributed from left to right on the first line until the line
    ## does not fits more elements according to the multibox current
    ## width, then on the second line, and so on. When
    ## ORIENTATION=VERTICAL children are distributed from top to
    ## bottom on the first column until columns does not fits more
    ## elements according to the multibox current height, then on the
    ## second column, and so on. Because of that its elements can
    ## overlap other elements in the dialog, so the ideal combination
    ## is to put the IupMultiBox inside an IupScrollBox. IMPORTANT:
    ## the actual element distribution in the container is done only
    ## after the natural size of the dialog is computed because it
    ## needs the current with or height to determine which elements
    ## will fit in the current space according to the orientation. The
    ## first time the multibox natural size is computed it returns
    ## simply the largest width and the highest height among the
    ## children. The next time it will use the size previously
    ## calculated with the line/column breaks, to avoid obtaining an
    ## outdated layout call IupRefresh or IupMap before showing the
    ## dialog (when the layout will be updated again). It does not
    ## have a native representation.


    result = nnkCall.newTree(
        nnkDotExpr.newTree(
            newIdentNode("niup"),
            newIdentNode("MultiBox_t")
          ),
       )
    let inner = nnkCall.newTree(
            newIdentNode("MultiBox")
          )

    if args.len > 0:
        for i in 0 ..< args.len:
          inner.add nnkCast.newTree(newIdentNode("PIhandle"), args[i])
    inner.add newNilLit()
    result.add inner


proc `active=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: MultiBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: MultiBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: MultiBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `canfocus=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: MultiBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: MultiBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: MultiBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

# TODO unknown: multibox CGAPHORIZ Unknown Binary
proc `cgaphoriz`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CGAPHORIZ"))

# TODO unknown: multibox CGAPVERT Unknown Binary
proc `cgapvert`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CGAPVERT"))

proc `charsize`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

# TODO unknown: multibox CHILDMAXSIZE Unknown Binary
proc `childmaxsize`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHILDMAXSIZE"))

# TODO unknown: multibox CHILDMINSPACE Unknown Binary
proc `childminspace`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHILDMINSPACE"))

proc `clientoffset`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `cmargin=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    ## MARGIN, CMARGIN: Defines a margin in pixels, CMARGIN is in the
    ## same units of the SIZE attribute. Its value has the format
    ## "widthxheight", where width and height are integer values
    ## corresponding to the horizontal and vertical margins,
    ## respectively. Default: "0x0" (no margin).
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(value))

proc `cmargin`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(value))

proc `cmargin=`*(ih: MultiBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(&"{horiz}x{vert}"))

proc `cmargin`*(ih: MultiBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(&"{horiz}x{vert}"))

proc `cmargin`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CMARGIN"))

proc `expand=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    ## EXPAND (non inheritable\*): The default value is "YES". See the
    ## documentation of the attribute for EXPAND inheritance.
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: MultiBox_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: MultiBox_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `floating=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary multibox
proc `font`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary multibox
proc `fontface`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: MultiBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: MultiBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary multibox
proc `fontstyle`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

# TODO unknown: multibox GAPHORIZ Unknown Binary
proc `gaphoriz`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("GAPHORIZ"))

# TODO unknown: multibox GAPVERT Unknown Binary
proc `gapvert`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("GAPVERT"))

proc `handlename=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary multibox
proc `handlename`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `margin=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    ## MARGIN, CMARGIN: Defines a margin in pixels, CMARGIN is in the
    ## same units of the SIZE attribute. Its value has the format
    ## "widthxheight", where width and height are integer values
    ## corresponding to the horizontal and vertical margins,
    ## respectively. Default: "0x0" (no margin).
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(value))

proc `margin`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(value))

proc `margin=`*(ih: MultiBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(&"{horiz}x{vert}"))

proc `margin`*(ih: MultiBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(&"{horiz}x{vert}"))

proc `margin`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARGIN"))

proc `maxsize=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: MultiBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: MultiBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: MultiBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: MultiBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary multibox
proc `name`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

# TODO unknown: multibox NCGAPHORIZ Unknown Binary
proc `ncgaphoriz`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NCGAPHORIZ"))

# TODO unknown: multibox NCGAPVERT Unknown Binary
proc `ncgapvert`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NCGAPVERT"))

proc `ncmargin=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    ## NMARGIN, NCMARGIN (non inheritable): Same as MARGIN but are non
    ## inheritable.
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(value))

proc `ncmargin`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(value))

proc `ncmargin=`*(ih: MultiBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(&"{horiz}x{vert}"))

proc `ncmargin`*(ih: MultiBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(&"{horiz}x{vert}"))

proc `ncmargin`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"))

# TODO unknown: multibox NGAPHORIZ Unknown Binary
proc `ngaphoriz`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NGAPHORIZ"))

# TODO unknown: multibox NGAPVERT Unknown Binary
proc `ngapvert`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NGAPVERT"))

proc `nmargin=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    ## NMARGIN, NCMARGIN (non inheritable): Same as MARGIN but are non
    ## inheritable.
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(value))

proc `nmargin`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(value))

proc `nmargin=`*(ih: MultiBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(&"{horiz}x{vert}"))

proc `nmargin`*(ih: MultiBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(&"{horiz}x{vert}"))

proc `nmargin`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NMARGIN"))

proc `normalizergroup=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary multibox
proc `normalizergroup`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary multibox
proc `ntheme`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `numcol`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NUMCOL"))

proc `numlin`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NUMLIN"))

proc `orientation=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    ## ORIENTATION (non inheritable): controls the distribution of the
    ## children in lines or in columns. Can be: HORIZONTAL or
    ## VERTICAL. Default: HORIZONTAL.
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"))

# TODO unknown: multibox PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: multibox PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: MultiBox_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: MultiBox_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: MultiBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: MultiBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: MultiBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: MultiBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: MultiBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `size=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    ## SIZE, RASTERSIZE, FONT, CLIENTSIZE, CLIENTOFFSET, POSITION,
    ## MINSIZE, MAXSIZE, THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: MultiBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: MultiBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `theme=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary multibox
proc `theme`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `usersize=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: MultiBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: MultiBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `visible=`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: MultiBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: MultiBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: MultiBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: MultiBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

# TODO unknown: multibox XFONTID Unknown Binary
proc `xfontid`*(ih: MultiBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `destroy_cb=`*(ih: MultiBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: MultiBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: MultiBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `ldestroy_cb=`*(ih: MultiBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: MultiBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: MultiBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: MultiBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: MultiBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: MultiBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: MultiBox_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: MultiBox_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: MultiBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: MultiBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: MultiBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: MultiBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `updateattribfromfont_cb=`*(ih: MultiBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB"), cast[Icallback](cb))

proc `updateattribfromfont_cb`*(ih: MultiBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB"), cast[Icallback](cb))

proc `updateattribfromfont_cb`*(ih: MultiBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB")))

