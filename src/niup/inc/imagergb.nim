when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: ImageRGB
##
## NIUP type: ImageRGB_t
##
## constructors
##
##    proc ImageRGB(width: cint; height: cint; pixels: openArray[uint8]): ImageRGB_t
##

proc ImageRGB*(width: cint; height: cint; pixels: openArray[uint8]): ImageRGB_t {.cdecl.} =
    return ImageRGB_t(niupc.ImageRGB(width, height, cast[ptr uint8](pixels)))

proc `autoscale=`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring(value))

proc `autoscale`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring(value))

proc `autoscale=`*(ih: ImageRGB_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring((if yes: "YES" else: "NO")))

proc `autoscale`*(ih: ImageRGB_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring((if yes: "YES" else: "NO")))

proc `autoscale`*(ih: ImageRGB_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE")) == "YES"

proc `bgcolor=`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: ImageRGB_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: ImageRGB_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `bpp`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BPP"))

proc `channels`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHANNELS"))

proc `clearcache=`*(ih: ImageRGB_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLEARCACHE"), cstring(""))

proc `clearcache`*(ih: ImageRGB_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLEARCACHE"), cstring(""))

# TODO unknown: imagergb DPI Unknown Binary
proc `dpi`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DPI"))

proc `handlename=`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary imagergb
proc `handlename`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `height`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HEIGHT"))

proc `hotspot=`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(value))

proc `hotspot`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(value))

proc `hotspot=`*(ih: ImageRGB_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(&"{x}:{y}"))

proc `hotspot`*(ih: ImageRGB_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(&"{x}:{y}"))

proc `hotspot`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"))

proc `originalscale`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIGINALSCALE"))

proc `rastersize`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `reshape=`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(value))

proc `reshape`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(value))

proc `reshape=`*(ih: ImageRGB_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(&"{width}x{height}"))

proc `reshape`*(ih: ImageRGB_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(&"{width}x{height}"))

proc `resize=`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize`*(ih: ImageRGB_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize=`*(ih: ImageRGB_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(&"{width}x{height}"))

proc `resize`*(ih: ImageRGB_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(&"{width}x{height}"))

proc `scaled`*(ih: ImageRGB_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCALED")) == "YES"

proc `wid`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `width`*(ih: ImageRGB_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WIDTH"))

