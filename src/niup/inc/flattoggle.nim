when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: FlatToggle
##
## NIUP type: FlatToggle_t
##
## constructors
##
##    proc FlatToggle(title: string): FlatToggle_t
##

proc FlatToggle*(title: string): FlatToggle_t {.cdecl.} =
    ## Creates an interface element that is a toggle, but it does not
    ## have native decorations. When selected, this element activates
    ## a function in the application. Its visual presentation can
    ## contain a text and/or an image. It behaves just like an
    ## IupToggle, but since it is not a native control it has more
    ## flexibility for additional options. It inherits from IupCanvas.
    return FlatToggle_t(niupc.FlatToggle(cstring(title)))

proc `active=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## ACTIVE, FONT, EXPAND, SCREENPOSITION, POSITION, MINSIZE,
    ## MAXSIZE, WID, TIP, SIZE, RASTERSIZE, ZORDER, VISIBLE, THEME:
    ## also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `alignment=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## ALIGNMENT (non inheritable): horizontal and vertical alignment
    ## of the set image+text. Possible values: "ALEFT", "ACENTER" and
    ## "ARIGHT", combined to "ATOP", "ACENTER" and "ABOTTOM". Default:
    ## "ACENTER:ACENTER". Partial values are also accepted, like
    ## "ARIGHT" or ":ATOP", the other value will be obtained from the
    ## default value. Alignment does not includes the padding area.
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"))

proc `backimage=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## BACKIMAGE (non inheritable): image name to be used as
    ## background. Use IupSetHandle or IupSetAttributeHandle to
    ## associate an image to a name. See also IupImage.
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGE"), cast[PIhandle](handle))

proc `backimage`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGE"), cast[PIhandle](handle))

proc `backimage`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKIMAGE"))

proc `backimagehighlight=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## BACKIMAGEHIGHLIGHT (non inheritable): background image name of
    ## the element in highlight state. If it is not defined then the
    ## BACKIMAGE is used.
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `backimagehighlight`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `backimagehighlight`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEHIGHLIGHT"))

proc `backimageinactive=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## BACKIMAGEINACTIVE (non inheritable): background image name of
    ## the element when inactive. If it is not defined then the
    ## BACKIMAGE is used and its colors will be replaced by a modified
    ## version creating the disabled effect.
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGEINACTIVE"), cast[PIhandle](handle))

proc `backimageinactive`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGEINACTIVE"), cast[PIhandle](handle))

proc `backimageinactive`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEINACTIVE"))

proc `backimagepress=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## BACKIMAGEPRESS (non inheritable): background image name of the
    ## element in pressed state. If it is not defined then the
    ## BACKIMAGE is used.
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGEPRESS"), cast[PIhandle](handle))

proc `backimagepress`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("BACKIMAGEPRESS"), cast[PIhandle](handle))

proc `backimagepress`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEPRESS"))

proc `backimagezoom=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## BACKIMAGEZOOM (non inheritable): if set the back image will be
    ## zoomed to occupy the full background. Aspect ratio is NOT
    ## preserved. Can be Yes or No. Default: No. (since 3.25)
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring(value))

proc `backimagezoom`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring(value))

proc `backimagezoom=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring((if yes: "YES" else: "NO")))

proc `backimagezoom`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM"), cstring((if yes: "YES" else: "NO")))

proc `backimagezoom`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKIMAGEZOOM")) == "YES"

proc `backingstore=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring(value))

proc `backingstore`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring(value))

proc `backingstore=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring((if yes: "YES" else: "NO")))

proc `backingstore`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE"), cstring((if yes: "YES" else: "NO")))

proc `backingstore`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKINGSTORE")) == "YES"

proc `bgcolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## BGCOLOR: Background color. If text and image are not defined,
    ## the button is configured to simply show a color, in this case
    ## set the button size because the natural size will be very
    ## small. If not defined it will use the background color of the
    ## native parent.
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `border=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## BORDER (creation only): the default value is "NO". This is the
    ## IupCanvas border.
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDER")) == "YES"

proc `bordercolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## BORDERCOLOR: color used for borders. Default: "50 150 255".
    ## This is for the IupFlatToggle drawn border.
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(value))

proc `bordercolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(value))

proc `bordercolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bordercolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bordercolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERCOLOR"))

proc `borderhlcolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## BORDERHLCOLOR: color used for borders when highlighted. Default
    ## use BORDERCOLOR.
    SetAttribute(cast[PIhandle](ih), cstring("BORDERHLCOLOR"), cstring(value))

proc `borderhlcolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERHLCOLOR"), cstring(value))

proc `borderhlcolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERHLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `borderhlcolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERHLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `borderhlcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERHLCOLOR"))

proc `borderpscolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## BORDERPSCOLOR: color used for borders when pressed or selected.
    ## Default use BORDERCOLOR.
    SetAttribute(cast[PIhandle](ih), cstring("BORDERPSCOLOR"), cstring(value))

proc `borderpscolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERPSCOLOR"), cstring(value))

proc `borderpscolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERPSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `borderpscolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERPSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `borderpscolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERPSCOLOR"))

proc `borderwidth=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## BORDERWIDTH: line width used for borders. Default: "1". Any
    ## borders can be hidden by simply setting this value to 0. This
    ## is for the IupFlatToggle drawn border. When the check box is
    ## shown the borders are not shown, and the background is not
    ## highlighted.
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(value))

proc `borderwidth`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(value))

proc `borderwidth=`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(&"{x}"))

proc `borderwidth`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"), cstring(&"{x}"))

proc `borderwidth`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERWIDTH"))

proc `canfocus=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## CANFOCUS (creation only) (non inheritable): enables the focus
    ## traversal of the control. In Windows the button will respect
    ## CANFOCUS in opposite to the other controls. Default: YES.
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

# TODO unknown: flattoggle CHECKALIGN Unknown Binary
proc `checkalign`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKALIGN"))

# TODO unknown: flattoggle CHECKBGCOLOR Unknown Binary
proc `checkbgcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKBGCOLOR"))

# TODO unknown: flattoggle CHECKFGCOLOR Unknown Binary
proc `checkfgcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKFGCOLOR"))

# TODO unknown: flattoggle CHECKHLCOLOR Unknown Binary
proc `checkhlcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKHLCOLOR"))

proc `checkimage=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## CHECKIMAGE (non inheritable): image name to be used as check
    ## box when VALUE=OFF, be sure the image size is equal to
    ## CHECKSIZE-2. Use IupSetHandle or IupSetAttributeHandle to
    ## associate an image to a name. See also IupImage. If this
    ## attribute is defined the check box is not drawn, the images
    ## will be used instead.
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGE"), cast[PIhandle](handle))

proc `checkimage`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGE"), cast[PIhandle](handle))

proc `checkimage`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGE"))

proc `checkimagehighlight=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## CHECKIMAGEHIGHLIGHT (non inheritable): check box image name of
    ## the element in highlight state when VALUE=OFF. If it is not
    ## defined then the CHECKIMAGE is used.
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `checkimagehighlight`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `checkimagehighlight`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGEHIGHLIGHT"))

proc `checkimageinactive=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## CHECKIMAGEINACTIVE (non inheritable): check box image name of
    ## the element when inactive and VALUE=OFF. If it is not defined
    ## then the CHECKIMAGE is used and its colors will be replaced by
    ## a modified version creating the disabled effect.
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEINACTIVE"), cast[PIhandle](handle))

proc `checkimageinactive`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEINACTIVE"), cast[PIhandle](handle))

proc `checkimageinactive`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGEINACTIVE"))

proc `checkimagenotdef=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEF"), cast[PIhandle](handle))

proc `checkimagenotdef`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEF"), cast[PIhandle](handle))

proc `checkimagenotdef`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEF"))

proc `checkimagenotdefhighlight=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEFHIGHLIGHT"), cast[PIhandle](handle))

proc `checkimagenotdefhighlight`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEFHIGHLIGHT"), cast[PIhandle](handle))

proc `checkimagenotdefhighlight`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEFHIGHLIGHT"))

proc `checkimagenotdefinactive=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEFINACTIVE"), cast[PIhandle](handle))

proc `checkimagenotdefinactive`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEFINACTIVE"), cast[PIhandle](handle))

proc `checkimagenotdefinactive`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEFINACTIVE"))

proc `checkimagenotdefpress=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEFPRESS"), cast[PIhandle](handle))

proc `checkimagenotdefpress`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEFPRESS"), cast[PIhandle](handle))

proc `checkimagenotdefpress`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGENOTDEFPRESS"))

proc `checkimageon=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEON"), cast[PIhandle](handle))

proc `checkimageon`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEON"), cast[PIhandle](handle))

proc `checkimageon`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGEON"))

proc `checkimageonhighlight=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEONHIGHLIGHT"), cast[PIhandle](handle))

proc `checkimageonhighlight`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEONHIGHLIGHT"), cast[PIhandle](handle))

proc `checkimageonhighlight`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGEONHIGHLIGHT"))

proc `checkimageoninactive=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEONINACTIVE"), cast[PIhandle](handle))

proc `checkimageoninactive`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEONINACTIVE"), cast[PIhandle](handle))

proc `checkimageoninactive`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGEONINACTIVE"))

proc `checkimageonpress=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEONPRESS"), cast[PIhandle](handle))

proc `checkimageonpress`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEONPRESS"), cast[PIhandle](handle))

proc `checkimageonpress`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGEONPRESS"))

proc `checkimagepress=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## CHECKIMAGEPRESS (non inheritable): check box image name of the
    ## element in pressed state when VALUE=OFF. If it is not defined
    ## then the CHECKIMAGE is used.
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEPRESS"), cast[PIhandle](handle))

proc `checkimagepress`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CHECKIMAGEPRESS"), cast[PIhandle](handle))

proc `checkimagepress`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKIMAGEPRESS"))

# TODO unknown: flattoggle CHECKPSCOLOR Unknown Binary
proc `checkpscolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKPSCOLOR"))

# TODO unknown: flattoggle CHECKRIGHT Unknown Binary
proc `checkright`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKRIGHT"))

# TODO unknown: flattoggle CHECKSIZE Unknown Binary
proc `checksize`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKSIZE"))

# TODO unknown: flattoggle CHECKSPACING Unknown Binary
proc `checkspacing`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHECKSPACING"))

proc `cpadding=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## CPADDING: same as PADDING but using the units of the SIZE
    ## attribute. It will actually set the PADDING attribute. (since
    ## 3.29)
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding=`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CPADDING"))

proc `cspacing=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## CSPACING: same as SPACING but using the units of the vertical
    ## part of the SIZE attribute. It will actually set the SPACING
    ## attribute. (since 3.29)
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(value))

proc `cspacing`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(value))

proc `cspacing=`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(&"{x}"))

proc `cspacing`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(&"{x}"))

proc `cspacing`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CSPACING"))

proc `cursor=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CURSOR"))

proc `dragdrop=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragsource=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary flattoggle
proc `dragtypes`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

# TODO unknown: flattoggle DRAWABLE Unknown Binary
proc `drawable`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWABLE"))

proc `drawbgcolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(value))

proc `drawbgcolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(value))

proc `drawbgcolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawbgcolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawbgcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWBGCOLOR"))

proc `drawcolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(value))

proc `drawcolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(value))

proc `drawcolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawcolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `drawcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWCOLOR"))

proc `drawdriver`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWDRIVER"))

proc `drawfont=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"), cstring(value))

proc `drawfont`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"), cstring(value))

# TODO ??? String Binary flattoggle
proc `drawfont`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWFONT"))

proc `drawlinewidth=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(value))

proc `drawlinewidth`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(value))

proc `drawlinewidth=`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(&"{x}"))

proc `drawlinewidth`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"), cstring(&"{x}"))

proc `drawlinewidth`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWLINEWIDTH"))

proc `drawmakeinactive=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring(value))

proc `drawmakeinactive`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring(value))

proc `drawmakeinactive=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `drawmakeinactive`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `drawmakeinactive`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWMAKEINACTIVE")) == "YES"

proc `drawsize`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWSIZE"))

proc `drawstyle=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"), cstring(value))

proc `drawstyle`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"), cstring(value))

proc `drawstyle`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWSTYLE"))

proc `drawtextalignment=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"), cstring(value))

proc `drawtextalignment`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"), cstring(value))

proc `drawtextalignment`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTALIGNMENT"))

proc `drawtextclip=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring(value))

proc `drawtextclip`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring(value))

proc `drawtextclip=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextclip`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextclip`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTCLIP")) == "YES"

proc `drawtextellipsis=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring(value))

proc `drawtextellipsis`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring(value))

proc `drawtextellipsis=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring((if yes: "YES" else: "NO")))

proc `drawtextellipsis`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS"), cstring((if yes: "YES" else: "NO")))

proc `drawtextellipsis`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTELLIPSIS")) == "YES"

proc `drawtextlayoutcenter=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring(value))

proc `drawtextlayoutcenter`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring(value))

proc `drawtextlayoutcenter=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring((if yes: "YES" else: "NO")))

proc `drawtextlayoutcenter`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER"), cstring((if yes: "YES" else: "NO")))

proc `drawtextlayoutcenter`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTLAYOUTCENTER")) == "YES"

proc `drawtextorientation=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(value))

proc `drawtextorientation`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(value))

proc `drawtextorientation=`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(&"{x}"))

proc `drawtextorientation`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"), cstring(&"{x}"))

proc `drawtextorientation`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTORIENTATION"))

proc `drawtextwrap=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring(value))

proc `drawtextwrap`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring(value))

proc `drawtextwrap=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextwrap`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP"), cstring((if yes: "YES" else: "NO")))

proc `drawtextwrap`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAWTEXTWRAP")) == "YES"

proc `dropfilestarget=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary flattoggle
proc `droptypes`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `dx=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(value))

proc `dx`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(value))

proc `dx=`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(&"{x}"))

proc `dx`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DX"), cstring(&"{x}"))

proc `dx`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DX"))

proc `dy=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(value))

proc `dy`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(value))

proc `dy=`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(&"{x}"))

proc `dy`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DY"), cstring(&"{x}"))

proc `dy`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DY"))

proc `expand=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## EXPAND (non inheritable): The default value is "NO".
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `fgcolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## FGCOLOR: Text color. Default: the global attribute DLGFGCOLOR.
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"))

proc `fittobackimage=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## FITTOBACKIMAGE (non inheritable): enable the natural size to be
    ## computed from the BACKIMAGE. If BACKIMAGE is not defined will
    ## be ignored. Can be Yes or No. Default: No.
    SetAttribute(cast[PIhandle](ih), cstring("FITTOBACKIMAGE"), cstring(value))

proc `fittobackimage`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FITTOBACKIMAGE"), cstring(value))

proc `fittobackimage=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FITTOBACKIMAGE"), cstring((if yes: "YES" else: "NO")))

proc `fittobackimage`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FITTOBACKIMAGE"), cstring((if yes: "YES" else: "NO")))

proc `fittobackimage`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FITTOBACKIMAGE")) == "YES"

proc `floating=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `focusfeedback=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## FOCUSFEEDBACK (non inheritable): draw the focus feedback. Can
    ## be Yes or No. Default: Yes. (since 3.26)
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring(value))

proc `focusfeedback`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring(value))

proc `focusfeedback=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring((if yes: "YES" else: "NO")))

proc `focusfeedback`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK"), cstring((if yes: "YES" else: "NO")))

proc `focusfeedback`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FOCUSFEEDBACK")) == "YES"

proc `font=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary flattoggle
proc `font`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary flattoggle
proc `fontface`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary flattoggle
proc `fontstyle`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `frontimage=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## FRONTIMAGE (non inheritable): image name to be used as
    ## foreground. The foreground image is drawn in the same position
    ## as the background, but it is drawn at last. Use IupSetHandle or
    ## IupSetAttributeHandle to associate an image to a name. See also
    ## IupImage.
    SetAttributeHandle(cast[PIhandle](ih), cstring("FRONTIMAGE"), cast[PIhandle](handle))

proc `frontimage`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("FRONTIMAGE"), cast[PIhandle](handle))

proc `frontimage`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FRONTIMAGE"))

proc `frontimagehighlight=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## FRONTIMAGEHIGHLIGHT (non inheritable): foreground image name of
    ## the element in highlight state. If it is not defined then the
    ## FRONTIMAGE is used.
    SetAttributeHandle(cast[PIhandle](ih), cstring("FRONTIMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `frontimagehighlight`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("FRONTIMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `frontimagehighlight`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FRONTIMAGEHIGHLIGHT"))

proc `frontimageinactive=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## FRONTIMAGEINACTIVE (non inheritable): foreground image name of
    ## the element when inactive. If it is not defined then the
    ## FRONTIMAGE is used and its colors will be replaced by a
    ## modified version creating the disabled effect.
    SetAttributeHandle(cast[PIhandle](ih), cstring("FRONTIMAGEINACTIVE"), cast[PIhandle](handle))

proc `frontimageinactive`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("FRONTIMAGEINACTIVE"), cast[PIhandle](handle))

proc `frontimageinactive`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FRONTIMAGEINACTIVE"))

proc `frontimagepress=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## FRONTIMAGEPRESS (non inheritable): foreground image name of the
    ## element in pressed state. If it is not defined then the
    ## FRONTIMAGE is used.
    SetAttributeHandle(cast[PIhandle](ih), cstring("FRONTIMAGEPRESS"), cast[PIhandle](handle))

proc `frontimagepress`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("FRONTIMAGEPRESS"), cast[PIhandle](handle))

proc `frontimagepress`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FRONTIMAGEPRESS"))

proc `handlename=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary flattoggle
proc `handlename`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `hasfocus`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HASFOCUS")) == "YES"

proc `highlighted`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIGHLIGHTED")) == "YES"

proc `hlcolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## HLCOLOR: background color used to indicate a highlight state.
    ## Pre-defined to "200 225 245". Can be set to NULL. If NULL
    ## BGCOLOR will be used instead.
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(value))

proc `hlcolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(value))

proc `hlcolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `hlcolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `hlcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HLCOLOR"))

proc `ignoreradio=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## IGNORERADIO (non inheritable): when set the toggle will not
    ## behave as a radio when inside an IupRadio hierarchy.
    SetAttribute(cast[PIhandle](ih), cstring("IGNORERADIO"), cstring(value))

proc `ignoreradio`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("IGNORERADIO"), cstring(value))

proc `ignoreradio=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("IGNORERADIO"), cstring((if yes: "YES" else: "NO")))

proc `ignoreradio`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("IGNORERADIO"), cstring((if yes: "YES" else: "NO")))

proc `ignoreradio`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IGNORERADIO")) == "YES"

proc `image=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGE (non inheritable): Image name. Use IupSetHandle or
    ## IupSetAttributeHandle to associate an image to a name. See also
    ## IupImage.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGE"))

proc `imagehighlight=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGEHIGHLIGHT (non inheritable): Image name of the element in
    ## highlight state. If it is not defined then the IMAGE is used.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `imagehighlight`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEHIGHLIGHT"), cast[PIhandle](handle))

proc `imagehighlight`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEHIGHLIGHT"))

proc `imageinactive=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGEINACTIVE (non inheritable): Image name of the element when
    ## inactive. If it is not defined then the IMAGE is used and its
    ## colors will be replaced by a modified version creating the
    ## disabled effect. Finally notice that the name of the secondary
    ## image attributes are different (for instance IMINACTIVE is
    ## IMAGEINACTIVE, IMPRESS is IMAGEPRESS, and so on).
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEINACTIVE"), cast[PIhandle](handle))

proc `imageinactive`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEINACTIVE"), cast[PIhandle](handle))

proc `imageinactive`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEINACTIVE"))

proc `imageposition=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## IMAGEPOSITION (non inheritable): Position of the image relative
    ## to the text when both are displayed. Can be: LEFT, RIGHT, TOP,
    ## BOTTOM. Default: LEFT.
    SetAttribute(cast[PIhandle](ih), cstring("IMAGEPOSITION"), cstring(value))

proc `imageposition`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("IMAGEPOSITION"), cstring(value))

proc `imageposition`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEPOSITION"))

proc `imagepress=`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGEPRESS (non inheritable): Image name of the element in
    ## pressed state. If it is not defined then the IMAGE is used.
    ## Finally notice that the name of the secondary image attributes
    ## are different (for instance IMINACTIVE is IMAGEINACTIVE,
    ## IMPRESS is IMAGEPRESS, and so on).
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEPRESS"), cast[PIhandle](handle))

proc `imagepress`*(ih: FlatToggle_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGEPRESS"), cast[PIhandle](handle))

proc `imagepress`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEPRESS"))

proc `linex=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(value))

proc `linex`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(value))

proc `linex=`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(&"{x}"))

proc `linex`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEX"), cstring(&"{x}"))

proc `linex`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINEX"))

proc `liney=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(value))

proc `liney`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(value))

proc `liney=`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(&"{x}"))

proc `liney`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINEY"), cstring(&"{x}"))

proc `liney`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINEY"))

proc `maxsize=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `name=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary flattoggle
proc `name`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `normalizergroup=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary flattoggle
proc `normalizergroup`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary flattoggle
proc `ntheme`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `padding=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## PADDING: internal margin. Works just like the MARGIN attribute
    ## of the IupHbox and IupVbox containers, but uses a different
    ## name to avoid inheritance problems. Alignment does not includes
    ## the padding area. Default value: "0x0". Value can be
    ## DEFAULTBUTTONPADDING, so the global attribute of this name will
    ## be used instead (since 3.29). The natural size will be a
    ## combination of the size of the image and the title, if any,
    ## plus PADDING and SPACING (if both image and title are present),
    ## and the check box if visible.
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(value))

proc `padding`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(value))

proc `padding=`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(&"{width}x{height}"))

proc `padding`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(&"{width}x{height}"))

proc `padding`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PADDING"))

# TODO unknown: flattoggle PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: flattoggle PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: FlatToggle_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: FlatToggle_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `posx=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(value))

proc `posx`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(value))

proc `posx=`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(&"{x}"))

proc `posx`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSX"), cstring(&"{x}"))

proc `posx`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSX"))

proc `posy=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(value))

proc `posy`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(value))

proc `posy=`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(&"{x}"))

proc `posy`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSY"), cstring(&"{x}"))

proc `posy`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSY"))

proc `pressed`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PRESSED")) == "YES"

proc `propagatefocus=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## PROPAGATEFOCUS (non inheritable): enables the focus callback
    ## forwarding to the next native parent with FOCUS_CB defined.
    ## Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `pscolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## PSCOLOR: background color used to indicate a press state. Pre-
    ## defined to "150 200 235". Can be set to NULL. If NULL BGCOLOR
    ## will be used instead.
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(value))

proc `pscolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(value))

proc `pscolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `pscolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `pscolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PSCOLOR"))

proc `radio`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RADIO")) == "YES"

proc `rastersize=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `sb_resize`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SB_RESIZE"))

proc `screenposition`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `scrollbar=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR")) == "YES"

# TODO unknown: flattoggle SELECTEDNOTIFY Unknown Binary
proc `selectednotify`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SELECTEDNOTIFY"))

proc `showborder=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## SHOWBORDER: by default borders are drawn only when the button
    ## is highlighted, if SHOWBORDER=Yes borders are always show. When
    ## SHOWBORDER=Yes and BGCOLOR is not defined, the actual BGCOLOR
    ## will be a darker version of the background color of the native
    ## parent.
    SetAttribute(cast[PIhandle](ih), cstring("SHOWBORDER"), cstring(value))

proc `showborder`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWBORDER"), cstring(value))

proc `showborder=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWBORDER"), cstring((if yes: "YES" else: "NO")))

proc `showborder`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWBORDER"), cstring((if yes: "YES" else: "NO")))

proc `showborder`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWBORDER")) == "YES"

proc `size=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `spacing=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## SPACING (non inheritable): spacing between the image and the
    ## text. Default: "2". The natural size will be a combination of
    ## the size of the image and the title, if any, plus PADDING and
    ## SPACING (if both image and title are present), and the check
    ## box if visible.
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(value))

proc `spacing`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(value))

proc `spacing=`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(&"{x}"))

proc `spacing`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(&"{x}"))

proc `spacing`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPACING"))

proc `textalignment=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## TEXTALIGNMENT (non inheritable): Horizontal text alignment for
    ## multiple lines. Can be: ALEFT, ARIGHT or ACENTER. Default:
    ## ALEFT.
    SetAttribute(cast[PIhandle](ih), cstring("TEXTALIGNMENT"), cstring(value))

proc `textalignment`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTALIGNMENT"), cstring(value))

proc `textalignment`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TEXTALIGNMENT"))

# TODO unknown: flattoggle TEXTCLIP Unknown Binary
proc `textclip`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TEXTCLIP"))

proc `textellipsis=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## TEXTELLIPSIS (non inheritable): If the text is larger that its
    ## box, an ellipsis ("...") will be placed near the last visible
    ## part of the text and replace the invisible part. It will be
    ## ignored when TEXTWRAP=Yes. (since 3.25)
    SetAttribute(cast[PIhandle](ih), cstring("TEXTELLIPSIS"), cstring(value))

proc `textellipsis`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTELLIPSIS"), cstring(value))

proc `textellipsis=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTELLIPSIS"), cstring((if yes: "YES" else: "NO")))

proc `textellipsis`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTELLIPSIS"), cstring((if yes: "YES" else: "NO")))

proc `textellipsis`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TEXTELLIPSIS")) == "YES"

proc `texthlcolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## TEXTHLCOLOR: text color used to indicate a highlight state. If
    ## not defined FGCOLOR will be used instead. (since 3.26)
    SetAttribute(cast[PIhandle](ih), cstring("TEXTHLCOLOR"), cstring(value))

proc `texthlcolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTHLCOLOR"), cstring(value))

proc `texthlcolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTHLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `texthlcolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTHLCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `texthlcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TEXTHLCOLOR"))

proc `textorientation=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## TEXTORIENTATION (non inheritable): text angle in degrees and
    ## counterclockwise. The text size will adapt to include the
    ## rotated space. (since 3.25)
    SetAttribute(cast[PIhandle](ih), cstring("TEXTORIENTATION"), cstring(value))

proc `textorientation`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTORIENTATION"), cstring(value))

proc `textorientation=`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTORIENTATION"), cstring(&"{x}"))

proc `textorientation`*(ih: FlatToggle_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTORIENTATION"), cstring(&"{x}"))

proc `textorientation`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TEXTORIENTATION"))

proc `textpscolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## TEXTPSCOLOR: text color used to indicate a press state. If not
    ## defined FGCOLOR will be used instead. (since 3.26)
    SetAttribute(cast[PIhandle](ih), cstring("TEXTPSCOLOR"), cstring(value))

proc `textpscolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTPSCOLOR"), cstring(value))

proc `textpscolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTPSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `textpscolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTPSCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `textpscolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TEXTPSCOLOR"))

proc `textwrap=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## TEXTWRAP (non inheritable): For single line texts if the text
    ## is larger than its box the line will be automatically broken in
    ## multiple lines. Notice that this is done internally by the
    ## system, the element natural size will still use only a single
    ## line. For the remaining lines to be visible the element should
    ## use EXPAND=VERTICAL or set a SIZE/RASTERSIZE with enough height
    ## for the wrapped lines. (since 3.25)
    SetAttribute(cast[PIhandle](ih), cstring("TEXTWRAP"), cstring(value))

proc `textwrap`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTWRAP"), cstring(value))

proc `textwrap=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTWRAP"), cstring((if yes: "YES" else: "NO")))

proc `textwrap`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXTWRAP"), cstring((if yes: "YES" else: "NO")))

proc `textwrap`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TEXTWRAP")) == "YES"

proc `theme=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary flattoggle
proc `theme`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary flattoggle
proc `tip`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: FlatToggle_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary flattoggle
proc `tipicon`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary flattoggle
proc `tipmarkup`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: FlatToggle_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: FlatToggle_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `title=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## TITLE (non inheritable): toggle text. The '\n' character is
    ## accepted for line change.
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

proc `title`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

# TODO ??? String Binary flattoggle
proc `title`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLE"))

proc `touch=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring(value))

proc `touch`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring(value))

proc `touch=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring((if yes: "YES" else: "NO")))

proc `touch`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOUCH"), cstring((if yes: "YES" else: "NO")))

proc `touch`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOUCH")) == "YES"

proc `usersize=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: FlatToggle_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `value=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    ## VALUE (non inheritable): Toggle's state. Values can be "ON",
    ## "OFF" or "TOGGLE". If 3STATE=YES then can also be "NOTDEF".
    ## Default: "OFF". The TOGGLE option will invert the current
    ## state. Can only be set to ON if the toggle is inside a radio,
    ## it will automatically set to OFF the previous toggle that was
    ## ON in the radio.
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

# TODO ??? String Binary flattoggle
proc `value`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `visible=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wheeldropfocus=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring(value))

proc `wheeldropfocus`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring(value))

proc `wheeldropfocus=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `wheeldropfocus`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `wheeldropfocus`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WHEELDROPFOCUS")) == "YES"

proc `wid`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

proc `xautohide=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring(value))

proc `xautohide`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring(value))

proc `xautohide=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `xautohide`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `xautohide`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XAUTOHIDE")) == "YES"

proc `xdisplay`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XDISPLAY"))

# TODO unknown: flattoggle XFONTID Unknown Binary
proc `xfontid`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `xhidden`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XHIDDEN")) == "YES"

proc `xmax=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(value))

proc `xmax`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(value))

proc `xmax=`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(&"{x}"))

proc `xmax`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMAX"), cstring(&"{x}"))

proc `xmax`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XMAX"))

proc `xmin=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(value))

proc `xmin`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(value))

proc `xmin=`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(&"{x}"))

proc `xmin`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("XMIN"), cstring(&"{x}"))

proc `xmin`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XMIN"))

# TODO unknown: flattoggle XWINDOW Unknown Binary
proc `xwindow`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XWINDOW"))

proc `y`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `yautohide=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring(value))

proc `yautohide`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring(value))

proc `yautohide=`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `yautohide`*(ih: FlatToggle_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `yautohide`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YAUTOHIDE")) == "YES"

proc `yhidden`*(ih: FlatToggle_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YHIDDEN")) == "YES"

proc `ymax=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(value))

proc `ymax`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(value))

proc `ymax=`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(&"{x}"))

proc `ymax`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMAX"), cstring(&"{x}"))

proc `ymax`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YMAX"))

proc `ymin=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(value))

proc `ymin`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(value))

proc `ymin=`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(&"{x}"))

proc `ymin`*(ih: FlatToggle_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("YMIN"), cstring(&"{x}"))

proc `ymin`*(ih: FlatToggle_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("YMIN"))

proc `zorder=`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: FlatToggle_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `action=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cfloat, arg3: cfloat): cint {.cdecl.}) {.cdecl.} =
    ## ACTION ACTION Action generated when the element is activated.
    ## Affects each element differently. Callback int function(Ihandle
    ## \*ih); [in C] ih:action() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. In some
    ## elements, this callback may receive more parameters, apart from
    ## ih. Please refer to each element's documentation. Affects
    ## IupButton, IupItem, IupList, IupText, IupCanvas, IupMultiline,
    ## IupToggle
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cfloat, arg3: cfloat): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION")))

proc `button_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `button_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BUTTON_CB")))

proc `destroy_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragend_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropfiles_cb=`*(ih: FlatToggle_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `dropfiles_cb`*(ih: FlatToggle_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `enterwindow_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `enterwindow_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `flat_action=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    ## FLAT_ACTION: Action generated when the button 1 (usually left)
    ## is selected. This callback is called only after the mouse is
    ## released and when it is released inside the button area. int
    ## function(Ihandle\* ih, int state); [in C]ih:action(state:
    ## number) -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("FLAT_ACTION"), cast[Icallback](cb))

proc `flat_action`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_ACTION"), cast[Icallback](cb))

proc `flat_action`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_ACTION")))

proc `flat_button_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_BUTTON_CB"), cast[Icallback](cb))

proc `flat_button_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_BUTTON_CB"), cast[Icallback](cb))

proc `flat_button_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_BUTTON_CB")))

proc `flat_enterwindow_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_ENTERWINDOW_CB"), cast[Icallback](cb))

proc `flat_enterwindow_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_ENTERWINDOW_CB"), cast[Icallback](cb))

proc `flat_enterwindow_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_ENTERWINDOW_CB")))

proc `flat_focus_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_FOCUS_CB"), cast[Icallback](cb))

proc `flat_focus_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_FOCUS_CB"), cast[Icallback](cb))

proc `flat_focus_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_FOCUS_CB")))

proc `flat_leavewindow_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `flat_leavewindow_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `flat_leavewindow_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_LEAVEWINDOW_CB")))

proc `flat_motion_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_MOTION_CB"), cast[Icallback](cb))

proc `flat_motion_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FLAT_MOTION_CB"), cast[Icallback](cb))

proc `flat_motion_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FLAT_MOTION_CB")))

proc `focus_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FOCUS_CB")))

proc `getfocus_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `getfocus_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `keypress_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, c, press: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `keypress_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, c, press: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KEYPRESS_CB"), cast[Icallback](cb))

proc `keypress_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KEYPRESS_CB")))

proc `killfocus_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `killfocus_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `k_any`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `leavewindow_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `motion_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `motion_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MOTION_CB"), cast[Icallback](cb))

proc `motion_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MOTION_CB")))

proc `postmessage_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `resize_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `resize_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RESIZE_CB"), cast[Icallback](cb))

proc `resize_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RESIZE_CB")))

proc `scroll_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.}) {.cdecl.} =
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

proc `scroll_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SCROLL_CB"), cast[Icallback](cb))

proc `scroll_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SCROLL_CB")))

proc `unmap_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `valuechanged_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## VALUECHANGED_CB: Called after the value was interactively
    ## changed by the user. Called after the ACTION callback, but
    ## under the same context. int function(Ihandle \*ih); [in
    ## C]ih:valuechanged_cb() -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB")))

proc `wheel_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `wheel_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("WHEEL_CB"), cast[Icallback](cb))

proc `wheel_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("WHEEL_CB")))

proc `wom_cb=`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `wom_cb`*(ih: FlatToggle_t, cb: proc (ih: PIhandle, arg2: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("WOM_CB"), cast[Icallback](cb))

proc `wom_cb`*(ih: FlatToggle_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("WOM_CB")))

