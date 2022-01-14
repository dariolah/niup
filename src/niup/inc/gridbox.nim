when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: GridBox
##
## NIUP type: GridBox_t
##
## constructors
##
##    macro GridBox(args: varargs[untyped]): GridBox_t
##

macro GridBox*(args: varargs[untyped]): GridBox_t =
    ## Creates a void container for composing elements in a regular
    ## grid. It is a box that arranges the elements it contains from
    ## top to bottom and from left to right, but can distribute the
    ## elements in lines or in columns. The child elements are added
    ## to the control just like a vbox and hbox, sequentially. Then
    ## they are distributed accordingly the attributes ORIENTATION and
    ## NUMDIV. When ORIENTATION=HORIZONTAL children are distributed
    ## from left to right on the first line until NUMDIV, then on the
    ## second line, and so on. When ORIENTATION=VERTICAL children are
    ## distributed from top to bottom on the first column until
    ## NUMDIV, then on the second column, and so on. The number of
    ## lines and the number of columns can be easily obtained from the
    ## combination of these attributes: if
    ## (orientation==IGBOX_HORIZONTAL) num_lin = child_count / num_div
    ## num_col = num_div else num_lin = num_div num_col = child_count
    ## / num_div Notice that the total number of spaces can be larger
    ## than the number of actual children, the last line or column can
    ## be incomplete. The column sizes will be based only on the width
    ## of the children of the reference line, usually line 0. The line
    ## sizes will be based only on the height of the children of the
    ## reference column, usually column 0. It does not have a native
    ## representation.


    result = nnkCall.newTree(
        nnkDotExpr.newTree(
            newIdentNode("niup"),
            newIdentNode("GridBox_t")
          ),
       )
    let inner = nnkCall.newTree(
            newIdentNode("GridBox")
          )

    if args.len > 0:
        for i in 0 ..< args.len:
          inner.add nnkCast.newTree(newIdentNode("PIhandle"), args[i])
    inner.add newNilLit()
    result.add inner


proc `active=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: GridBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: GridBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: GridBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

# TODO unknown: gridbox ALIGNMENTCOL Unknown Binary
proc `alignmentcol`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ALIGNMENTCOL"))

# TODO unknown: gridbox ALIGNMENTLIN Unknown Binary
proc `alignmentlin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ALIGNMENTLIN"))

proc `canfocus=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: GridBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: GridBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: GridBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `cgapcol=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## GAPCOL, CGAPCOL: Defines a horizontal space in pixels between
    ## columns, CGAPCOL is in the same units of the SIZE attribute for
    ## the height. Default: "0".
    SetAttribute(cast[PIhandle](ih), cstring("CGAPCOL"), cstring(value))

proc `cgapcol`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAPCOL"), cstring(value))

proc `cgapcol=`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAPCOL"), cstring(&"{x}"))

proc `cgapcol`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAPCOL"), cstring(&"{x}"))

proc `cgapcol`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CGAPCOL"))

proc `cgaplin=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## GAPLIN, CGAPLIN: Defines a vertical space in pixels between
    ## lines, CGAPLIN is in the same units of the SIZE attribute for
    ## the height. Default: "0".
    SetAttribute(cast[PIhandle](ih), cstring("CGAPLIN"), cstring(value))

proc `cgaplin`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAPLIN"), cstring(value))

proc `cgaplin=`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAPLIN"), cstring(&"{x}"))

proc `cgaplin`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAPLIN"), cstring(&"{x}"))

proc `cgaplin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CGAPLIN"))

proc `charsize`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `clientoffset`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `cmargin=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## MARGIN, CMARGIN: Defines a margin in pixels, CMARGIN is in the
    ## same units of the SIZE attribute. Its value has the format
    ## "widthxheight", where width and height are integer values
    ## corresponding to the horizontal and vertical margins,
    ## respectively. Default: "0x0" (no margin).
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(value))

proc `cmargin`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(value))

proc `cmargin=`*(ih: GridBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(&"{horiz}x{vert}"))

proc `cmargin`*(ih: GridBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(&"{horiz}x{vert}"))

proc `cmargin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CMARGIN"))

proc `expand=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## EXPAND (non inheritable\*): The default value is "YES". See the
    ## documentation of the attribute for EXPAND inheritance.
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandchildren=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## EXPANDCHILDREN (non inheritable): forces all children to expand
    ## in the given direction and to fully occupy its space available
    ## inside the box. Can be YES (both directions), HORIZONTAL,
    ## VERTICAL or NO. Default: "NO". This has the same effect as
    ## setting EXPAND on each child.
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"), cstring(value))

proc `expandchildren`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"), cstring(value))

proc `expandchildren`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"))

proc `expandweight=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: GridBox_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: GridBox_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

# TODO unknown: gridbox FITTOCHILDREN Unknown Binary
proc `floating=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## FLOATING (non inheritable) (at children only): If a child has
    ## FLOATING=YES then its size and position will be ignored by the
    ## layout processing. Default: "NO".
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary gridbox
proc `font`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary gridbox
proc `fontface`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary gridbox
proc `fontstyle`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `gapcol=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## GAPCOL, CGAPCOL: Defines a horizontal space in pixels between
    ## columns, CGAPCOL is in the same units of the SIZE attribute for
    ## the height. Default: "0".
    SetAttribute(cast[PIhandle](ih), cstring("GAPCOL"), cstring(value))

proc `gapcol`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAPCOL"), cstring(value))

proc `gapcol=`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAPCOL"), cstring(&"{x}"))

proc `gapcol`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAPCOL"), cstring(&"{x}"))

proc `gapcol`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("GAPCOL"))

proc `gaplin=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## GAPLIN, CGAPLIN: Defines a vertical space in pixels between
    ## lines, CGAPLIN is in the same units of the SIZE attribute for
    ## the height. Default: "0".
    SetAttribute(cast[PIhandle](ih), cstring("GAPLIN"), cstring(value))

proc `gaplin`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAPLIN"), cstring(value))

proc `gaplin=`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAPLIN"), cstring(&"{x}"))

proc `gaplin`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAPLIN"), cstring(&"{x}"))

proc `gaplin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("GAPLIN"))

proc `handlename=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary gridbox
proc `handlename`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

# TODO unknown: gridbox HOMOGENEOUSCOL Unknown Binary
proc `homogeneouscol`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUSCOL"))

# TODO unknown: gridbox HOMOGENEOUSLIN Unknown Binary
proc `homogeneouslin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUSLIN"))

proc `margin=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## MARGIN, CMARGIN: Defines a margin in pixels, CMARGIN is in the
    ## same units of the SIZE attribute. Its value has the format
    ## "widthxheight", where width and height are integer values
    ## corresponding to the horizontal and vertical margins,
    ## respectively. Default: "0x0" (no margin).
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(value))

proc `margin`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(value))

proc `margin=`*(ih: GridBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(&"{horiz}x{vert}"))

proc `margin`*(ih: GridBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(&"{horiz}x{vert}"))

proc `margin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARGIN"))

proc `maxsize=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: GridBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: GridBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: GridBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: GridBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary gridbox
proc `name`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `ncgapcol=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## NGAPLIN, NCGAPLIN, NGAPCOL, NCGAPCOL (non inheritable): Same as
    ## \*GAP\* but are non inheritable.
    SetAttribute(cast[PIhandle](ih), cstring("NCGAPCOL"), cstring(value))

proc `ncgapcol`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAPCOL"), cstring(value))

proc `ncgapcol=`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAPCOL"), cstring(&"{x}"))

proc `ncgapcol`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAPCOL"), cstring(&"{x}"))

proc `ncgapcol`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NCGAPCOL"))

proc `ncgaplin=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## NGAPLIN, NCGAPLIN, NGAPCOL, NCGAPCOL (non inheritable): Same as
    ## \*GAP\* but are non inheritable.
    SetAttribute(cast[PIhandle](ih), cstring("NCGAPLIN"), cstring(value))

proc `ncgaplin`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAPLIN"), cstring(value))

proc `ncgaplin=`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAPLIN"), cstring(&"{x}"))

proc `ncgaplin`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAPLIN"), cstring(&"{x}"))

proc `ncgaplin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NCGAPLIN"))

proc `ncmargin=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## NMARGIN, NCMARGIN (non inheritable): Same as MARGIN but are non
    ## inheritable.
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(value))

proc `ncmargin`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(value))

proc `ncmargin=`*(ih: GridBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(&"{horiz}x{vert}"))

proc `ncmargin`*(ih: GridBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(&"{horiz}x{vert}"))

proc `ncmargin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"))

proc `ngapcol=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## NGAPLIN, NCGAPLIN, NGAPCOL, NCGAPCOL (non inheritable): Same as
    ## \*GAP\* but are non inheritable.
    SetAttribute(cast[PIhandle](ih), cstring("NGAPCOL"), cstring(value))

proc `ngapcol`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAPCOL"), cstring(value))

proc `ngapcol=`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAPCOL"), cstring(&"{x}"))

proc `ngapcol`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAPCOL"), cstring(&"{x}"))

proc `ngapcol`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NGAPCOL"))

proc `ngaplin=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## NGAPLIN, NCGAPLIN, NGAPCOL, NCGAPCOL (non inheritable): Same as
    ## \*GAP\* but are non inheritable.
    SetAttribute(cast[PIhandle](ih), cstring("NGAPLIN"), cstring(value))

proc `ngaplin`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAPLIN"), cstring(value))

proc `ngaplin=`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAPLIN"), cstring(&"{x}"))

proc `ngaplin`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAPLIN"), cstring(&"{x}"))

proc `ngaplin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NGAPLIN"))

proc `nmargin=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## NMARGIN, NCMARGIN (non inheritable): Same as MARGIN but are non
    ## inheritable.
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(value))

proc `nmargin`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(value))

proc `nmargin=`*(ih: GridBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(&"{horiz}x{vert}"))

proc `nmargin`*(ih: GridBox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(&"{horiz}x{vert}"))

proc `nmargin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NMARGIN"))

proc `normalizergroup=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary gridbox
proc `normalizergroup`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `normalizesize=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## NORMALIZESIZE (non inheritable): normalizes all children
    ## natural size to be the biggest natural size among the reference
    ## line and/or the reference column. All natural width will be set
    ## to the biggest width, and all natural height will be set to the
    ## biggest height according to is value. Can be NO, HORIZONTAL
    ## (width only), VERTICAL (height only) or BOTH. Default: "NO".
    ## Same as using IupNormalizer. Notice that this is different from
    ## the HOMOGENEOUS\* attributes in the sense that the children will
    ## have their sizes changed.
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZESIZE"), cstring(value))

proc `normalizesize`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZESIZE"), cstring(value))

proc `normalizesize`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZESIZE"))

proc `ntheme=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary gridbox
proc `ntheme`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `numcol`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NUMCOL"))

proc `numdiv=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## NUMDIV: controls the number of divisions along the distribution
    ## according to ORIENTATION. When ORIENTATION=HORIZONTAL, NUMDIV
    ## is the number of columns, when ORIENTATION=VERTICAL, NUMDIV is
    ## the number of lines. When value is AUTO, its actual value will
    ## be calculated to fit the maximum number of elements in the
    ## orientation direction. Default: AUTO.
    SetAttribute(cast[PIhandle](ih), cstring("NUMDIV"), cstring(value))

proc `numdiv`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NUMDIV"), cstring(value))

proc `numdiv=`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NUMDIV"), cstring(&"{x}"))

proc `numdiv`*(ih: GridBox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NUMDIV"), cstring(&"{x}"))

proc `numdiv`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NUMDIV"))

proc `numlin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NUMLIN"))

proc `orientation=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## ORIENTATION (non inheritable): controls the distribution of the
    ## children in lines or in columns. Can be: HORIZONTAL or
    ## VERTICAL. Default: HORIZONTAL.
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"), cstring(value))

proc `orientation`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"))

# TODO unknown: gridbox PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: gridbox PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: GridBox_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: GridBox_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: GridBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: GridBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: GridBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: GridBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: GridBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `size=`*(ih: GridBox_t, value: string) {.cdecl.} =
    ## SIZE, RASTERSIZE, FONT, CLIENTSIZE, CLIENTOFFSET, POSITION,
    ## MINSIZE, MAXSIZE, THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: GridBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: GridBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

# TODO unknown: gridbox SIZECOL Unknown Binary
proc `sizecol`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZECOL"))

# TODO unknown: gridbox SIZELIN Unknown Binary
proc `sizelin`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZELIN"))

proc `theme=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary gridbox
proc `theme`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `usersize=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: GridBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: GridBox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `visible=`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: GridBox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: GridBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: GridBox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: GridBox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

# TODO unknown: gridbox XFONTID Unknown Binary
proc `xfontid`*(ih: GridBox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `destroy_cb=`*(ih: GridBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: GridBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: GridBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `ldestroy_cb=`*(ih: GridBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: GridBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: GridBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: GridBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: GridBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: GridBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: GridBox_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: GridBox_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: GridBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: GridBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: GridBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: GridBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `updateattribfromfont_cb=`*(ih: GridBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB"), cast[Icallback](cb))

proc `updateattribfromfont_cb`*(ih: GridBox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB"), cast[Icallback](cb))

proc `updateattribfromfont_cb`*(ih: GridBox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB")))

