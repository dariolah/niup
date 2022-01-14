when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Separator
##
## NIUP type: Separator_t
##
## constructors
##
##    proc Separator(): Separator_t
##

proc Separator*(): Separator_t {.cdecl.} =
    ## Creates the separator interface element. It shows a line
    ## between two menu items.
    return Separator_t(niupc.Separator())

proc `name=`*(ih: Separator_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Separator_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary separator
proc `name`*(ih: Separator_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `wid`*(ih: Separator_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

