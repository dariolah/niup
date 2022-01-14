when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Vbox
##
## NIUP type: Vbox_t
##
## constructors
##
##    macro Vbox(args: varargs[untyped]): Vbox_t
##

macro Vbox*(args: varargs[untyped]): Vbox_t =
    ## Creates a void container for composing elements vertically. It
    ## is a box that arranges the elements it contains from top to
    ## bottom. It does not have a native representation.


    result = nnkCall.newTree(
        nnkDotExpr.newTree(
            newIdentNode("niup"),
            newIdentNode("Vbox_t")
          ),
       )
    let inner = nnkCall.newTree(
            newIdentNode("Vbox")
          )

    if args.len > 0:
        for i in 0 ..< args.len:
          inner.add nnkCast.newTree(newIdentNode("PIhandle"), args[i])
    inner.add newNilLit()
    result.add inner


proc `active=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Vbox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `alignment=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## ALIGNMENT (non inheritable): Horizontally aligns the elements.
    ## Possible values: "ALEFT", "ACENTER", "ARIGHT". Default:
    ## "ALEFT".
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"))

proc `canfocus=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Vbox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `cgap=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## GAP, CGAP: Defines a vertical space in pixels between the
    ## children, CGAP is in the same units of the SIZE attribute for
    ## the height. Default: "0". (CGAP since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("CGAP"), cstring(value))

proc `cgap`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAP"), cstring(value))

proc `cgap=`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAP"), cstring(&"{x}"))

proc `cgap`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CGAP"), cstring(&"{x}"))

proc `cgap`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CGAP"))

proc `charsize`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `clientoffset`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `cmargin=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## MARGIN, CMARGIN: Defines a margin in pixels, CMARGIN is in the
    ## same units of the SIZE attribute. Its value has the format
    ## "widthxheight", where width and height are integer values
    ## corresponding to the horizontal and vertical margins,
    ## respectively. Default: "0x0" (no margin). (CMARGIN since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(value))

proc `cmargin`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(value))

proc `cmargin=`*(ih: Vbox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(&"{horiz}x{vert}"))

proc `cmargin`*(ih: Vbox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CMARGIN"), cstring(&"{horiz}x{vert}"))

proc `cmargin`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CMARGIN"))

proc `expand=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## EXPAND (non inheritable\*): The default value is "YES". See the
    ## documentation of the attribute for EXPAND inheritance.
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandchildren=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## EXPANDCHILDREN (non inheritable): forces all children to expand
    ## horizontally and to fully occupy its space available inside the
    ## box. Default: "NO". This has the same effect as setting
    ## EXPAND=HORIZONTAL on each child. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"), cstring(value))

proc `expandchildren`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"), cstring(value))

proc `expandchildren=`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"), cstring((if yes: "YES" else: "NO")))

proc `expandchildren`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN"), cstring((if yes: "YES" else: "NO")))

proc `expandchildren`*(ih: Vbox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDCHILDREN")) == "YES"

proc `expandweight=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## EXPANDWEIGHT (non inheritable) (at children only): If a child
    ## defines the expand weight, then it is used to multiply the free
    ## space used for expansion. (since 3.1)
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: Vbox_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Vbox_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `floating=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## FLOATING (non inheritable) (at children only): If a child has
    ## FLOATING=YES then its size and position will be ignored by the
    ## layout processing. Default: "NO". (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## FONT, CLIENTSIZE, CLIENTOFFSET, POSITION, MINSIZE, MAXSIZE,
    ## THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary vbox
proc `font`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary vbox
proc `fontface`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary vbox
proc `fontstyle`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `gap=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## GAP, CGAP: Defines a vertical space in pixels between the
    ## children, CGAP is in the same units of the SIZE attribute for
    ## the height. Default: "0". (CGAP since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(value))

proc `gap`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(value))

proc `gap=`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(&"{x}"))

proc `gap`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(&"{x}"))

proc `gap`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("GAP"))

proc `handlename=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary vbox
proc `handlename`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `homogeneous=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## HOMOGENEOUS (non inheritable): forces all children to get equal
    ## vertical space. The space height will be based on the highest
    ## child. Default: "NO". Notice that this does not changes the
    ## children size, only the available space for each one of them to
    ## expand. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUS"), cstring(value))

proc `homogeneous`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUS"), cstring(value))

proc `homogeneous=`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUS"), cstring((if yes: "YES" else: "NO")))

proc `homogeneous`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUS"), cstring((if yes: "YES" else: "NO")))

proc `homogeneous`*(ih: Vbox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HOMOGENEOUS")) == "YES"

proc `margin=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## MARGIN, CMARGIN: Defines a margin in pixels, CMARGIN is in the
    ## same units of the SIZE attribute. Its value has the format
    ## "widthxheight", where width and height are integer values
    ## corresponding to the horizontal and vertical margins,
    ## respectively. Default: "0x0" (no margin). (CMARGIN since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(value))

proc `margin`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(value))

proc `margin=`*(ih: Vbox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(&"{horiz}x{vert}"))

proc `margin`*(ih: Vbox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(&"{horiz}x{vert}"))

proc `margin`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARGIN"))

proc `maxsize=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: Vbox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Vbox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: Vbox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Vbox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary vbox
proc `name`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `ncgap=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## NGAP, NCGAP (non inheritable): Same as GAP but are non
    ## inheritable. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("NCGAP"), cstring(value))

proc `ncgap`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAP"), cstring(value))

proc `ncgap=`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAP"), cstring(&"{x}"))

proc `ncgap`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCGAP"), cstring(&"{x}"))

proc `ncgap`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NCGAP"))

proc `ncmargin=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## NMARGIN, NCMARGIN (non inheritable): Same as MARGIN but are non
    ## inheritable. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(value))

proc `ncmargin`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(value))

proc `ncmargin=`*(ih: Vbox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(&"{horiz}x{vert}"))

proc `ncmargin`*(ih: Vbox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"), cstring(&"{horiz}x{vert}"))

proc `ncmargin`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NCMARGIN"))

proc `ngap=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## NGAP, NCGAP (non inheritable): Same as GAP but are non
    ## inheritable. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("NGAP"), cstring(value))

proc `ngap`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAP"), cstring(value))

proc `ngap=`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAP"), cstring(&"{x}"))

proc `ngap`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NGAP"), cstring(&"{x}"))

proc `ngap`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NGAP"))

proc `nmargin=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## NMARGIN, NCMARGIN (non inheritable): Same as MARGIN but are non
    ## inheritable. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(value))

proc `nmargin`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(value))

proc `nmargin=`*(ih: Vbox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(&"{horiz}x{vert}"))

proc `nmargin`*(ih: Vbox_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NMARGIN"), cstring(&"{horiz}x{vert}"))

proc `nmargin`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NMARGIN"))

proc `normalizergroup=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary vbox
proc `normalizergroup`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `normalizesize=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## NORMALIZESIZE (non inheritable): normalizes all children
    ## natural size to be the biggest natural size among them. All
    ## natural width will be set to the biggest width, and all natural
    ## height will be set to the biggest height according to is value.
    ## Can be NO, HORIZONTAL, VERTICAL or BOTH. Default: "NO". Same as
    ## using IupNormalizer. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZESIZE"), cstring(value))

proc `normalizesize`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZESIZE"), cstring(value))

proc `normalizesize`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZESIZE"))

proc `ntheme=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary vbox
proc `ntheme`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `orientation`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIENTATION"))

# TODO unknown: vbox PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: vbox PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: Vbox_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Vbox_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Vbox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: Vbox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Vbox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `size=`*(ih: Vbox_t, value: string) {.cdecl.} =
    ## SIZE / RASTERSIZE (non inheritable): Defines the height of the
    ## box. When consulted behaves as the standard SIZE/RASTERSIZE
    ## attributes. The standard format "wxh" can also be used, but
    ## width will be ignored (since 3.3).
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{x}"))

proc `size`*(ih: Vbox_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{x}"))

proc `size`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `theme=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary vbox
proc `theme`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `usersize=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: Vbox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Vbox_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `visible=`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: Vbox_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Vbox_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Vbox_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

# TODO unknown: vbox XFONTID Unknown Binary
proc `xfontid`*(ih: Vbox_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `destroy_cb=`*(ih: Vbox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Vbox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Vbox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `ldestroy_cb=`*(ih: Vbox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Vbox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Vbox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: Vbox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Vbox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Vbox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: Vbox_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Vbox_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Vbox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: Vbox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Vbox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Vbox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `updateattribfromfont_cb=`*(ih: Vbox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB"), cast[Icallback](cb))

proc `updateattribfromfont_cb`*(ih: Vbox_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB"), cast[Icallback](cb))

proc `updateattribfromfont_cb`*(ih: Vbox_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UPDATEATTRIBFROMFONT_CB")))

