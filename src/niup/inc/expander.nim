when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Expander
##
## NIUP type: Expander_t
##
## constructors
##
##    proc Expander(child: IUPhandle_t): Expander_t
##

proc Expander*(child: IUPhandle_t): Expander_t {.cdecl.} =
    ## Creates a void container that can interactively show or hide
    ## its child. It does not have a native representation, but it
    ## contains also several elements to implement the bar handler.
    return Expander_t(niupc.Expander(cast[PIhandle](child)))

proc `active=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Expander_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Expander_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Expander_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `animation=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## ANIMATION (non inheritable): enable animation during
    ## open/close. Works only for BARPOSITION=TOP and does not works
    ## for AUTOSHOW. Also the child must be a native container like
    ## IupTabs, IupFrame, IupBackgroundBox, or IupScrollBox, or it
    ## will not work accordantly. Values can be SLIDE (child controls
    ## slide down), CURTAIN (child controls appears as if a curtain is
    ## being pulled) or NO. Default: NO. ((since 3.14)
    SetAttribute(cast[PIhandle](ih), cstring("ANIMATION"), cstring(value))

proc `animation`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ANIMATION"), cstring(value))

proc `animation`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ANIMATION"))

# TODO unknown: expander AUTOSHOW Unknown Binary
proc `autoshow`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUTOSHOW"))

proc `backcolor=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## BACKCOLOR (non inheritable): background color of the bar
    ## handler. If not defined it will use the background color of the
    ## native parent. (since 3.9)
    SetAttribute(cast[PIhandle](ih), cstring("BACKCOLOR"), cstring(value))

proc `backcolor`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKCOLOR"), cstring(value))

proc `backcolor=`*(ih: Expander_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `backcolor`*(ih: Expander_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `backcolor`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKCOLOR"))

# TODO unknown: expander BARPOSITION Unknown Binary
proc `barposition`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BARPOSITION"))

proc `barsize=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## BARSIZE (non inheritable): controls the size of the bar
    ## handler. Default: the height or width that fits all its
    ## internal elements according to BARPOSITION.
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(value))

proc `barsize`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(value))

proc `barsize=`*(ih: Expander_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(&"{x}"))

proc `barsize`*(ih: Expander_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BARSIZE"), cstring(&"{x}"))

proc `barsize`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BARSIZE"))

proc `canfocus=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: Expander_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Expander_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Expander_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `clientoffset`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `expand=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## EXPAND (non inheritable): the default value is "YES".
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: Expander_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Expander_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `extrabuttons=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## EXTRABUTTONS (non inheritable) (creation only): sets the number
    ## of extra image buttons at right when BARPOSITION=TOP. The
    ## maximum number of buttons is 3. See the EXTRABUTTON_CB
    ## callback. Default: 0. (since 3.11)
    SetAttribute(cast[PIhandle](ih), cstring("EXTRABUTTONS"), cstring(value))

proc `extrabuttons`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXTRABUTTONS"), cstring(value))

proc `extrabuttons=`*(ih: Expander_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXTRABUTTONS"), cstring(&"{x}"))

proc `extrabuttons`*(ih: Expander_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXTRABUTTONS"), cstring(&"{x}"))

proc `extrabuttons`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXTRABUTTONS"))

proc `floating=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## FONT, SIZE, RASTERSIZE, CLIENTSIZE, CLIENTOFFSET, POSITION,
    ## MINSIZE, MAXSIZE, THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary expander
proc `font`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary expander
proc `fontface`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: Expander_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Expander_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary expander
proc `fontstyle`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `forecolor=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## FORECOLOR (non inheritable): title text color. Default: the
    ## global attribute DLGFGCOLOR. (since 3.9)
    SetAttribute(cast[PIhandle](ih), cstring("FORECOLOR"), cstring(value))

proc `forecolor`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORECOLOR"), cstring(value))

proc `forecolor=`*(ih: Expander_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORECOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `forecolor`*(ih: Expander_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORECOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `forecolor`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FORECOLOR"))

proc `frame=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## FRAME (non inheritable): enables the frame line around the bar
    ## area. Default: No. (since 3.23)
    SetAttribute(cast[PIhandle](ih), cstring("FRAME"), cstring(value))

proc `frame`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAME"), cstring(value))

proc `frame=`*(ih: Expander_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAME"), cstring((if yes: "YES" else: "NO")))

proc `frame`*(ih: Expander_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAME"), cstring((if yes: "YES" else: "NO")))

proc `frame`*(ih: Expander_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FRAME")) == "YES"

proc `framecolor=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## FRAMECOLOR (non inheritable): frame line color. Default: the
    ## global attribute DLGFGCOLOR. (since 3.23)
    SetAttribute(cast[PIhandle](ih), cstring("FRAMECOLOR"), cstring(value))

proc `framecolor`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAMECOLOR"), cstring(value))

proc `framecolor=`*(ih: Expander_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAMECOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `framecolor`*(ih: Expander_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAMECOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `framecolor`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FRAMECOLOR"))

proc `frametime=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAMETIME"), cstring(value))

proc `frametime`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAMETIME"), cstring(value))

proc `frametime=`*(ih: Expander_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAMETIME"), cstring(&"{x}"))

proc `frametime`*(ih: Expander_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAMETIME"), cstring(&"{x}"))

proc `frametime`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FRAMETIME"))

proc `framewidth=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## FRAMEWIDTH (non inheritable): frame line width. Default: 1.
    ## (since 3.23)
    SetAttribute(cast[PIhandle](ih), cstring("FRAMEWIDTH"), cstring(value))

proc `framewidth`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAMEWIDTH"), cstring(value))

proc `framewidth=`*(ih: Expander_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAMEWIDTH"), cstring(&"{x}"))

proc `framewidth`*(ih: Expander_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FRAMEWIDTH"), cstring(&"{x}"))

proc `framewidth`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FRAMEWIDTH"))

proc `handlename=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary expander
proc `handlename`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `highcolor=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## HIGHCOLOR (non inheritable): title text color when highlighted.
    ## Works only when TITLEEXPAND=Yes. Defaults to the FORECOLOR if
    ## not defined. (since 3.14)
    SetAttribute(cast[PIhandle](ih), cstring("HIGHCOLOR"), cstring(value))

proc `highcolor`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIGHCOLOR"), cstring(value))

proc `highcolor=`*(ih: Expander_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIGHCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `highcolor`*(ih: Expander_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIGHCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `highcolor`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIGHCOLOR"))

proc `image=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGE (non inheritable): image name to replace the arrow image
    ## by a custom image when STATE=CLOSE. Works only when
    ## BARPOSITION=TOP. Use IupSetHandle or IupSetAttributeHandle to
    ## associate an image to a name. See also IupImage. (since 3.11)
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGE"))

proc `imageextra1=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRA1"), cast[PIhandle](handle))

proc `imageextra1`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRA1"), cast[PIhandle](handle))

proc `imageextra1`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEEXTRA1"))

proc `imageextra2=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRA2"), cast[PIhandle](handle))

proc `imageextra2`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRA2"), cast[PIhandle](handle))

proc `imageextra2`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEEXTRA2"))

proc `imageextra3=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRA3"), cast[PIhandle](handle))

proc `imageextra3`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRA3"), cast[PIhandle](handle))

proc `imageextra3`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEEXTRA3"))

proc `imageextrahighlight1=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAHIGHLIGHT1"), cast[PIhandle](handle))

proc `imageextrahighlight1`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAHIGHLIGHT1"), cast[PIhandle](handle))

proc `imageextrahighlight1`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEEXTRAHIGHLIGHT1"))

proc `imageextrahighlight2=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAHIGHLIGHT2"), cast[PIhandle](handle))

proc `imageextrahighlight2`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAHIGHLIGHT2"), cast[PIhandle](handle))

proc `imageextrahighlight2`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEEXTRAHIGHLIGHT2"))

proc `imageextrahighlight3=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAHIGHLIGHT3"), cast[PIhandle](handle))

proc `imageextrahighlight3`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAHIGHLIGHT3"), cast[PIhandle](handle))

proc `imageextrahighlight3`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEEXTRAHIGHLIGHT3"))

proc `imageextrapress1=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAPRESS1"), cast[PIhandle](handle))

proc `imageextrapress1`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAPRESS1"), cast[PIhandle](handle))

proc `imageextrapress1`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEEXTRAPRESS1"))

proc `imageextrapress2=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAPRESS2"), cast[PIhandle](handle))

proc `imageextrapress2`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAPRESS2"), cast[PIhandle](handle))

proc `imageextrapress2`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEEXTRAPRESS2"))

proc `imageextrapress3=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAPRESS3"), cast[PIhandle](handle))

proc `imageextrapress3`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEEXTRAPRESS3"), cast[PIhandle](handle))

proc `imageextrapress3`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEEXTRAPRESS3"))

proc `imagehighlight=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `imagehighlight`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `imagehighlight`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEHIGHLIGHT"))

proc `imageopen=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGEOPEN: image name used when STATE=OPEN. IMAGEHIGHLIGHT:
    ## image name used when mouse is over the bar handler and
    ## STATE=CLOSE.IMAGEOPENHIGHLIGHT: image name used when mouse is
    ## over the bar handler and STATE=OPEN.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEOPEN"), cast[PIhandle](handle))

proc `imageopen`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEOPEN"), cast[PIhandle](handle))

proc `imageopen`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEOPEN"))

proc `imageopenhighlight=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEOPENHIGHLIGHT"), cast[PIhandle](handle))

proc `imageopenhighlight`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEOPENHIGHLIGHT"), cast[PIhandle](handle))

proc `imageopenhighlight`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEOPENHIGHLIGHT"))

proc `maxsize=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: Expander_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Expander_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: Expander_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Expander_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary expander
proc `name`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `normalizergroup=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary expander
proc `normalizergroup`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary expander
proc `ntheme`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

# TODO unknown: expander NUMFRAMES Unknown Binary
proc `numframes`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NUMFRAMES"))

# TODO unknown: expander OPENCOLOR Unknown Binary
proc `opencolor`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OPENCOLOR"))

# TODO unknown: expander PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: expander PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: Expander_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Expander_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: Expander_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Expander_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Expander_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: Expander_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Expander_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `size=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: Expander_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Expander_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `state=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## STATE (non inheritable): Show or hide the container elements.
    ## Possible values: "OPEN" (expanded) or "CLOSE" (collapsed).
    ## Default: OPEN. Setting this attribute will automatically change
    ## the layout of the entire dialog so the child can be recomposed.
    SetAttribute(cast[PIhandle](ih), cstring("STATE"), cstring(value))

proc `state`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STATE"), cstring(value))

proc `state`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("STATE"))

# TODO unknown: expander STATEREFRESH Unknown Binary
proc `staterefresh`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("STATEREFRESH"))

proc `theme=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary expander
proc `theme`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `title=`*(ih: Expander_t, value: string) {.cdecl.} =
    ## TITLE (non inheritable): title text, shown in the bar handler
    ## near the expand/collapse button. When set it will reset
    ## TITLEIMAGE. Shown only when BARPOSITION=TOP. When the TITLE is
    ## defined and BARPOSITION=TOP then the expand/collapse button is
    ## left aligned. In all other situations the expand/collapse
    ## button is centered.
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

proc `title`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

# TODO ??? String Binary expander
proc `title`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLE"))

# TODO unknown: expander TITLEEXPAND Unknown Binary
proc `titleexpand`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLEEXPAND"))

proc `titleimage=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## TITLEIMAGE (non inheritable): title image, shown in the bar
    ## handler near the expand/collapse button. When set it will reset
    ## TITLE (image and text title are mutually exclusive). Shown only
    ## when BARPOSITION=TOP. (since 3.14)
    SetAttributeHandle(cast[PIhandle](ih), cstring("TITLEIMAGE"), cast[PIhandle](handle))

proc `titleimage`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TITLEIMAGE"), cast[PIhandle](handle))

proc `titleimage`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLEIMAGE"))

proc `titleimagehighlight=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TITLEIMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `titleimagehighlight`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TITLEIMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `titleimagehighlight`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLEIMAGEHIGHLIGHT"))

proc `titleimageopen=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## TITLEIMAGEOPEN: image name used when STATE=OPEN.
    ## TITLEIMAGEHIGHLIGHT: image name used when mouse is over the
    ## title image and STATE=CLOSE.TITLEIMAGEOPENHIGHLIGHT: image name
    ## used when mouse is over the title image and STATE=OPEN.
    SetAttributeHandle(cast[PIhandle](ih), cstring("TITLEIMAGEOPEN"), cast[PIhandle](handle))

proc `titleimageopen`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TITLEIMAGEOPEN"), cast[PIhandle](handle))

proc `titleimageopen`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLEIMAGEOPEN"))

proc `titleimageopenhighlight=`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TITLEIMAGEOPENHIGHLIGHT"), cast[PIhandle](handle))

proc `titleimageopenhighlight`*(ih: Expander_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TITLEIMAGEOPENHIGHLIGHT"), cast[PIhandle](handle))

proc `titleimageopenhighlight`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLEIMAGEOPENHIGHLIGHT"))

proc `usersize=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: Expander_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Expander_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `visible=`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: Expander_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: Expander_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Expander_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Expander_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

# TODO unknown: expander XFONTID Unknown Binary
proc `xfontid`*(ih: Expander_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `action=`*(ih: Expander_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## ACTION ACTION Action generated when the element is activated.
    ## Affects each element differently. Callback int function(Ihandle
    ## \*ih); [in C] ih:action() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. In some
    ## elements, this callback may receive more parameters, apart from
    ## ih. Please refer to each element's documentation. Affects
    ## IupButton, IupItem, IupList, IupText, IupCanvas, IupMultiline,
    ## IupToggle
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: Expander_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: Expander_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION")))

proc `destroy_cb=`*(ih: Expander_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Expander_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Expander_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `extrabutton_cb=`*(ih: Expander_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    ## EXTRABUTTON_CB: Action generated when any mouse button is
    ## pressed or released. (since 3.11) int function(Ihandle\* ih, int
    ## button, int pressed); [in C] ih:extrabutton_cb(button, pressed:
    ## number) -> (ret: number) [in Lua] ih: identifies the element
    ## that activated the event. button: identifies the extra button.
    ## can be 1, 2 or 3. (this is not the same as BUTTON_CB)pressed:
    ## indicates the state of the button: 0 - mouse button was
    ## released; 1 - mouse button was pressed.
    SetCallback(cast[PIhandle](ih), cstring("EXTRABUTTON_CB"), cast[Icallback](cb))

proc `extrabutton_cb`*(ih: Expander_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EXTRABUTTON_CB"), cast[Icallback](cb))

proc `extrabutton_cb`*(ih: Expander_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("EXTRABUTTON_CB")))

proc `ldestroy_cb=`*(ih: Expander_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Expander_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Expander_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: Expander_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Expander_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Expander_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `openclose_cb=`*(ih: Expander_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    ## OPENCLOSE_CB: Action generated before the expander state is
    ## interactively changed. (Since 3.11) int function(Ihandle\* ih,
    ## int state); [in C]ih:openclose_cb(state: number) -> (ret:
    ## number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("OPENCLOSE_CB"), cast[Icallback](cb))

proc `openclose_cb`*(ih: Expander_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("OPENCLOSE_CB"), cast[Icallback](cb))

proc `openclose_cb`*(ih: Expander_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("OPENCLOSE_CB")))

proc `postmessage_cb=`*(ih: Expander_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Expander_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Expander_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: Expander_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Expander_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Expander_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

