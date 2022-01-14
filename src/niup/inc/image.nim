when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Image
##
## NIUP type: Image_t
##
## constructors
##
##    proc Image(width: cint; height: cint; pixels: openArray[uint8]): Image_t
##

proc Image*(width: cint; height: cint; pixels: openArray[uint8]): Image_t {.cdecl.} =
    ## Creates an image to be shown on a label, button, toggle, or as
    ## a cursor. (IupImageRGB and IupImageRGBA, since 3.0)
    return Image_t(niupc.Image(width, height, cast[ptr uint8](pixels)))

proc `autoscale=`*(ih: Image_t, value: string) {.cdecl.} =
    ## AUTOSCALE: automatically scale the image by a given real
    ## factor. Can be "DPI" or a scale factor. If not defined the
    ## global attribute IMAGEAUTOSCALE will be used. Values are the
    ## same of the global attribute. The minimum resulted size when
    ## automatically resized is 24 pixels height (since 3.29). (since
    ## 3.16)
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring(value))

proc `autoscale`*(ih: Image_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring(value))

proc `autoscale=`*(ih: Image_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring((if yes: "YES" else: "NO")))

proc `autoscale`*(ih: Image_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring((if yes: "YES" else: "NO")))

proc `autoscale`*(ih: Image_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE")) == "YES"

proc `bgcolor=`*(ih: Image_t, value: string) {.cdecl.} =
    ## BGCOLOR: The color used for transparency. If not defined uses
    ## the BGCOLOR of the control that contains the image. In Motif,
    ## the alpha channel in RGBA images is always composed with the
    ## control BGCOLOR by IUP prior to setting the image at the
    ## control. In Windows and in GTK, the alpha channel is composed
    ## internally by the system. But in Windows for some controls the
    ## alpha must be composed a priori also, it includes: IupItem and
    ## IupSubmenu always; and IupToggle when NOT using Visual Styles.
    ## This implies that if the control background is not uniform then
    ## probably there will be a visible difference where it should be
    ## transparent.
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: Image_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: Image_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Image_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `bpp`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BPP"))

proc `channels`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHANNELS"))

proc `clearcache=`*(ih: Image_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLEARCACHE"), cstring(""))

proc `clearcache`*(ih: Image_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLEARCACHE"), cstring(""))

# TODO unknown: image DPI Unknown Binary
proc `dpi`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DPI"))

proc `handlename=`*(ih: Image_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Image_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary image
proc `handlename`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `height`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HEIGHT"))

proc `hotspot=`*(ih: Image_t, value: string) {.cdecl.} =
    ## HOTSPOT: Hotspot is the position inside a cursor image
    ## indicating the mouse-click spot. Its value is given by the x
    ## and y coordinates inside a cursor image. Its value has the
    ## format "x:y", where x and y are integers defining the
    ## coordinates in pixels. Default: "0:0".
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(value))

proc `hotspot`*(ih: Image_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(value))

proc `hotspot=`*(ih: Image_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(&"{x}:{y}"))

proc `hotspot`*(ih: Image_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(&"{x}:{y}"))

proc `hotspot`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"))

# TODO getter image IDVALUE
proc `originalscale`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIGINALSCALE"))

proc `rastersize`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `reshape=`*(ih: Image_t, value: string) {.cdecl.} =
    ## RESHAPE (write-only): given a new size if format
    ## "widthxheight", allocates enough memory for the new size and
    ## changes WIDTH and HEIGHT attributes. Image contents is ignored
    ## and it will contain trash after the reshape. (since 3.24)
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(value))

proc `reshape`*(ih: Image_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(value))

proc `reshape=`*(ih: Image_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(&"{width}x{height}"))

proc `reshape`*(ih: Image_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(&"{width}x{height}"))

proc `resize=`*(ih: Image_t, value: string) {.cdecl.} =
    ## RESIZE (write-only): given a new size if format "widthxheight",
    ## changes WIDTH and HEIGHT attributes, and resizes the image
    ## contents using bilinear interpolation for RGB and RGBA images
    ## and nearest neighborhood for 8 bits. (since 3.24)
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize`*(ih: Image_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize=`*(ih: Image_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(&"{width}x{height}"))

proc `resize`*(ih: Image_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(&"{width}x{height}"))

proc `scaled`*(ih: Image_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCALED")) == "YES"

proc `wid`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `width`*(ih: Image_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WIDTH"))

