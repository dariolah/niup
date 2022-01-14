when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Clipboard
##
## NIUP type: Clipboard_t
##
## constructors
##
##    proc Clipboard(): Clipboard_t
##

proc Clipboard*(): Clipboard_t {.cdecl.} =
    ## Creates an element that allows access to the clipboard. Each
    ## clipboard should be destroyed using IupDestroy, but you can use
    ## only one for the entire application because it does not store
    ## any data inside. Or you can simply create and destroy every
    ## time you need to copy or paste.
    return Clipboard_t(niupc.Clipboard())

# TODO unknown: clipboard ADDFORMAT Unknown Binary
proc `format=`*(ih: Clipboard_t, value: string) {.cdecl.} =
    ## FORMAT: set the current format to be used by the
    ## FORMATAVAILABLE and FORMATDATA attributes. This is a custom
    ## format string. The application copy and paste functions must
    ## know what it is copying and pasting in FORMATDATA based on that
    ## string. (since 3.7)
    SetAttribute(cast[PIhandle](ih), cstring("FORMAT"), cstring(value))

proc `format`*(ih: Clipboard_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORMAT"), cstring(value))

# TODO ??? String Binary clipboard
proc `format`*(ih: Clipboard_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FORMAT"))

proc `formatavailable`*(ih: Clipboard_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FORMATAVAILABLE"))

# TODO unknown: clipboard FORMATDATA Unknown Binary
proc `formatdata`*(ih: Clipboard_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FORMATDATA"))

# TODO unknown: clipboard FORMATDATASIZE Unknown Binary
proc `formatdatasize`*(ih: Clipboard_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FORMATDATASIZE"))

# TODO unknown: clipboard FORMATDATASTRING Unknown Binary
proc `formatdatastring`*(ih: Clipboard_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FORMATDATASTRING"))

proc `image=`*(ih: Clipboard_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGE (write-only): name of an image to copy to the clipboard.
    ## If set to NULL clears the clipboard data. (GTK 2.6)
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: Clipboard_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `imageavailable`*(ih: Clipboard_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGEAVAILABLE"))

# TODO unknown: clipboard NATIVEIMAGE Unknown Binary
proc `nativeimage`*(ih: Clipboard_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATIVEIMAGE"))

proc `text=`*(ih: Clipboard_t, value: string) {.cdecl.} =
    ## TEXT: copy or paste text to or from the clipboard. If set to
    ## NULL clears the clipboard data.
    SetAttribute(cast[PIhandle](ih), cstring("TEXT"), cstring(value))

proc `text`*(ih: Clipboard_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TEXT"), cstring(value))

# TODO ??? String Binary clipboard
proc `text`*(ih: Clipboard_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TEXT"))

proc `textavailable`*(ih: Clipboard_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TEXTAVAILABLE"))

