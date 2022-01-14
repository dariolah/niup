when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Button
##
## NIUP type: Button_t
##
## constructors
##
##    proc Button(title: string; action: string): Button_t
##
##    proc Button(title:string): Button_t
##

proc Button*(title: string; action: string): Button_t {.cdecl.} =
    ## Creates an interface element that is a button. When selected,
    ## this element activates a function in the application. Its
    ## visual presentation can contain a text and/or an image.
    return Button_t(niupc.Button(cstring(title), cstring(action)))

proc Button*(title:string): Button_t {.cdecl.} =
    ## Creates an interface element that is a button. When selected,
    ## this element activates a function in the application. Its
    ## visual presentation can contain a text and/or an image.
    return Button_t(niupc.Button(title, nil))

proc `active=`*(ih: Button_t, value: string) {.cdecl.} =
    ## ACTIVE, FONT, EXPAND, SCREENPOSITION, POSITION, MINSIZE,
    ## MAXSIZE, WID, TIP, SIZE, RASTERSIZE, ZORDER, VISIBLE, THEME:
    ## also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Button_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `alignment=`*(ih: Button_t, value: string) {.cdecl.} =
    ## ALIGNMENT (non inheritable): horizontal and vertical alignment.
    ## Possible values: "ALEFT", "ACENTER" and "ARIGHT", combined to
    ## "ATOP", "ACENTER" and "ABOTTOM". Default: "ACENTER:ACENTER".
    ## Partial values are also accepted, like "ARIGHT" or ":ATOP", the
    ## other value will be obtained from the default value. In Motif,
    ## vertical alignment is restricted to "ACENTER". In GTK,
    ## horizontal alignment for multiple lines will align only the
    ## text block. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"))

proc `bgcolor=`*(ih: Button_t, value: string) {.cdecl.} =
    ## BGCOLOR: Background color. If text and image are not defined,
    ## the button is configured to simply show a color, in this case
    ## set the button size because the natural size will be very
    ## small. In Windows and in GTK 3, the BGCOLOR attribute is
    ## ignored if text or image is defined. Default: the global
    ## attribute DLGBGCOLOR. BGCOLOR is ignored when FLAT=YES because
    ## it will be used the background from the native parent. The
    ## buttons with image and text simultaneous have PADDING=5x5, the
    ## other buttons have no padding. The buttons with no text and
    ## BGCOLOR defined have their RASTERSIZE set. Motif Windows
    ## Classic Windows w/ Styles GTK
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: Button_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Button_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `canfocus=`*(ih: Button_t, value: string) {.cdecl.} =
    ## CANFOCUS (creation only) (non inheritable): enables the focus
    ## traversal of the control. In Windows the button will respect
    ## CANFOCUS differently to some other controls. Default: YES.
    ## (since 3.0). Buttons are not activated if the user clicks
    ## inside the button but moves the cursor and releases outside the
    ## button area. Also in Windows the highlight feedback when that
    ## happens is different if the button has CANFOCUS enabled or not.
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Button_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `cpadding=`*(ih: Button_t, value: string) {.cdecl.} =
    ## CPADDING: same as PADDING but using the units of the SIZE
    ## attribute. It will actually set the PADDING attribute. (since
    ## 3.29)
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding=`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CPADDING"))

proc `cspacing=`*(ih: Button_t, value: string) {.cdecl.} =
    ## CSPACING: same as SPACING but using the units of the vertical
    ## part of the SIZE attribute. It will actually set the SPACING
    ## attribute. (since 3.29)
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(value))

proc `cspacing`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(value))

proc `cspacing=`*(ih: Button_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(&"{x}"))

proc `cspacing`*(ih: Button_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(&"{x}"))

proc `cspacing`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CSPACING"))

proc `expand=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: Button_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Button_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `fgcolor=`*(ih: Button_t, value: string) {.cdecl.} =
    ## FGCOLOR: Text color. Default: the global attribute DLGFGCOLOR.
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor=`*(ih: Button_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: Button_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"))

proc `flat=`*(ih: Button_t, value: string) {.cdecl.} =
    ## FLAT (creation only): Hides the button borders until the mouse
    ## cursor enters the button area. The border space is always
    ## there. Can be YES or NO. Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("FLAT"), cstring(value))

proc `flat`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLAT"), cstring(value))

proc `flat=`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLAT"), cstring((if yes: "YES" else: "NO")))

proc `flat`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLAT"), cstring((if yes: "YES" else: "NO")))

proc `flat`*(ih: Button_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLAT")) == "YES"

proc `floating=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

# TODO unknown: button FOCUSONCLICK Unknown Binary
proc `focusonclick`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FOCUSONCLICK"))

proc `font=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary button
proc `font`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary button
proc `fontface`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: Button_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Button_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary button
proc `fontstyle`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `handlename=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary button
proc `handlename`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `image=`*(ih: Button_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGE (non inheritable): Image name. If set before map defines
    ## the behavior of the button to contain an image. The natural
    ## size will be size of the image in pixels, plus the button
    ## borders. Use IupSetHandle or IupSetAttributeHandle to associate
    ## an image to a name. See also IupImage. If TITLE is also defined
    ## and not empty both will be shown (except in Motif). (GTK 2.6).
    ## Buttons always have borders, except when IMAGE and IMPRESS are
    ## both defined and IMPRESSBORDER=NO. In this case in Windows
    ## TITLE can also be defined.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: Button_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGE"))

proc `imageposition=`*(ih: Button_t, value: string) {.cdecl.} =
    ## IMAGEPOSITION (non inheritable): Position of the image relative
    ## to the text when both are displayed. Can be: LEFT, RIGHT, TOP,
    ## BOTTOM. Default: LEFT. (since 3.0) (GTK 2.10)
    SetAttribute(cast[PIhandle](ih), cstring("IMAGEPOSITION"), cstring(value))

proc `imageposition`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("IMAGEPOSITION"), cstring(value))

proc `imageposition`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEPOSITION"))

proc `iminactive=`*(ih: Button_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMINACTIVE (non inheritable): Image name of the element when
    ## inactive. If it is not defined then the IMAGE is used and the
    ## colors will be replaced by a modified version of the background
    ## color creating the disabled effect. GTK will also change the
    ## inactive image to look like other inactive objects. (GTK 2.6)
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMINACTIVE"), cast[PIhandle](handle))

proc `iminactive`*(ih: Button_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMINACTIVE"), cast[PIhandle](handle))

proc `iminactive`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMINACTIVE"))

proc `impress=`*(ih: Button_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMPRESS (non inheritable): Image name of the pressed button. If
    ## IMPRESS and IMAGE are defined, the button borders are not shown
    ## and not computed in natural size. When the button is clicked
    ## the pressed image does not offset. In Motif the button will
    ## lose its focus feedback also. (GTK 2.6). Buttons always have
    ## borders, except when IMAGE and IMPRESS are both defined and
    ## IMPRESSBORDER=NO. In this case in Windows TITLE can also be
    ## defined.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMPRESS"), cast[PIhandle](handle))

proc `impress`*(ih: Button_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMPRESS"), cast[PIhandle](handle))

proc `impress`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMPRESS"))

# TODO unknown: button IMPRESSBORDER Unknown Binary
proc `impressborder`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMPRESSBORDER"))

proc `markup=`*(ih: Button_t, value: string) {.cdecl.} =
    ## MARKUP [GTK only]: allows the title string to contains pango
    ## markup commands. Works only if a mnemonic is NOT defined in the
    ## title. Can be "YES" or "NO". Default: "NO".
    SetAttribute(cast[PIhandle](ih), cstring("MARKUP"), cstring(value))

proc `markup`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKUP"), cstring(value))

proc `markup=`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKUP"), cstring((if yes: "YES" else: "NO")))

proc `markup`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARKUP"), cstring((if yes: "YES" else: "NO")))

proc `markup`*(ih: Button_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MARKUP")) == "YES"

proc `maxsize=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary button
proc `name`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `normalizergroup=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary button
proc `normalizergroup`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary button
proc `ntheme`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `padding=`*(ih: Button_t, value: string) {.cdecl.} =
    ## PADDING: internal margin. Works just like the MARGIN attribute
    ## of the IupHbox and IupVbox containers, but uses a different
    ## name to avoid inheritance problems. Default value: "0x0". Value
    ## can be DEFAULTBUTTONPADDING, so the global attribute of this
    ## name will be used instead (since 3.29). (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(value))

proc `padding`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(value))

proc `padding=`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(&"{width}x{height}"))

proc `padding`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(&"{width}x{height}"))

proc `padding`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PADDING"))

# TODO unknown: button PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: button PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: Button_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Button_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: Button_t, value: string) {.cdecl.} =
    ## PROPAGATEFOCUS(non inheritable): enables the focus callback
    ## forwarding to the next native parent with FOCUS_CB defined.
    ## Default: NO. (since 3.23)
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Button_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: Button_t, value: string) {.cdecl.} =
    ## The buttons with image and text simultaneous have PADDING=5x5,
    ## the other buttons have no padding. The buttons with no text and
    ## BGCOLOR defined have their RASTERSIZE set. Motif Windows
    ## Classic Windows w/ Styles GTK
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `screenposition`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `size=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `spacing=`*(ih: Button_t, value: string) {.cdecl.} =
    ## SPACING (creation only): defines the spacing between the image
    ## associated and the button's text. Default: "2".
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(value))

proc `spacing`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(value))

proc `spacing=`*(ih: Button_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(&"{x}"))

proc `spacing`*(ih: Button_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(&"{x}"))

proc `spacing`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPACING"))

proc `theme=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary button
proc `theme`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary button
proc `tip`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: Button_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Button_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: Button_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Button_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: Button_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Button_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary button
proc `tipicon`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary button
proc `tipmarkup`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: Button_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Button_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Button_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `title=`*(ih: Button_t, value: string) {.cdecl.} =
    ## TITLE (non inheritable): Button's text. If IMAGE is not defined
    ## before map, then the default behavior is to contain only a
    ## text. The button behavior can not be changed after map. The
    ## natural size will be larger enough to include all the text in
    ## the selected font, even using multiple lines, plus the button
    ## borders. The '\n' character is accepted for line change. The
    ## "&" character can be used to define a mnemonic, the next
    ## character will be used as key. Use "&&" to show the "&"
    ## character instead on defining a mnemonic. The button can be
    ## activated from any control in the dialog using the "Alt+key"
    ## combination. In old Motif versions (2.1) using a '\n' causes an
    ## invalid memory access inside Motif. (mnemonic support since
    ## 3.0). Buttons always have borders, except when IMAGE and
    ## IMPRESS are both defined and IMPRESSBORDER=NO. In this case in
    ## Windows TITLE can also be defined.
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

proc `title`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

# TODO ??? String Binary button
proc `title`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLE"))

proc `usersize=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Button_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `visible=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Button_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Button_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

# TODO unknown: button XFONTID Unknown Binary
proc `xfontid`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `y`*(ih: Button_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `zorder=`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: Button_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `action=`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## ACTION ACTION Action generated when the element is activated.
    ## Affects each element differently. Callback int function(Ihandle
    ## \*ih); [in C] ih:action() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. In some
    ## elements, this callback may receive more parameters, apart from
    ## ih. Please refer to each element's documentation. Affects
    ## IupButton, IupItem, IupList, IupText, IupCanvas, IupMultiline,
    ## IupToggle
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION")))

proc `button_cb=`*(ih: Button_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `button_cb`*(ih: Button_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BUTTON_CB")))

proc `destroy_cb=`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `enterwindow_cb=`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `enterwindow_cb`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `getfocus_cb=`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `getfocus_cb`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `killfocus_cb=`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `killfocus_cb`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: Button_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `k_any`*(ih: Button_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `leavewindow_cb`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: Button_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Button_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Button_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Button_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

