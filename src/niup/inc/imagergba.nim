when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: ImageRGBA
##
## NIUP type: ImageRGBA_t
##
## constructors
##
##    proc ImageRGBA(width: cint; height: cint; pixels: openArray[uint8]): ImageRGBA_t
##

proc ImageRGBA*(width: cint; height: cint; pixels: openArray[uint8]): ImageRGBA_t {.cdecl.} =
    return ImageRGBA_t(niupc.ImageRGBA(width, height, cast[ptr uint8](pixels)))

proc `autoscale=`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring(value))

proc `autoscale`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring(value))

proc `autoscale=`*(ih: ImageRGBA_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring((if yes: "YES" else: "NO")))

proc `autoscale`*(ih: ImageRGBA_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE"), cstring((if yes: "YES" else: "NO")))

proc `autoscale`*(ih: ImageRGBA_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUTOSCALE")) == "YES"

proc `bgcolor=`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: ImageRGBA_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: ImageRGBA_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `bpp`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BPP"))

proc `channels`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHANNELS"))

proc `clearcache=`*(ih: ImageRGBA_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLEARCACHE"), cstring(""))

proc `clearcache`*(ih: ImageRGBA_t, ) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLEARCACHE"), cstring(""))

# TODO unknown: imagergba DPI Unknown Binary
proc `dpi`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DPI"))

proc `handlename=`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary imagergba
proc `handlename`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `height`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HEIGHT"))

proc `hotspot=`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(value))

proc `hotspot`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(value))

proc `hotspot=`*(ih: ImageRGBA_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(&"{x}:{y}"))

proc `hotspot`*(ih: ImageRGBA_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"), cstring(&"{x}:{y}"))

proc `hotspot`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HOTSPOT"))

proc `originalscale`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ORIGINALSCALE"))

proc `rastersize`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `reshape=`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(value))

proc `reshape`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(value))

proc `reshape=`*(ih: ImageRGBA_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(&"{width}x{height}"))

proc `reshape`*(ih: ImageRGBA_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESHAPE"), cstring(&"{width}x{height}"))

proc `resize=`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize`*(ih: ImageRGBA_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize=`*(ih: ImageRGBA_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(&"{width}x{height}"))

proc `resize`*(ih: ImageRGBA_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(&"{width}x{height}"))

proc `scaled`*(ih: ImageRGBA_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCALED")) == "YES"

proc `wid`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `width`*(ih: ImageRGBA_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WIDTH"))

