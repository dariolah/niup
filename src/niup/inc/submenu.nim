when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Submenu
##
## NIUP type: Submenu_t
##
## constructors
##
##    proc Submenu(title: string; child: IUPhandle_t): Submenu_t
##

proc Submenu*(title: string; child: IUPhandle_t): Submenu_t {.cdecl.} =
    ## Creates a menu item that, when selected, opens another menu.
    return Submenu_t(niupc.Submenu(cstring(title), cast[PIhandle](child)))

proc `active=`*(ih: Submenu_t, value: string) {.cdecl.} =
    ## ACTIVE, THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Submenu_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Submenu_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Submenu_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `bgcolor=`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: Submenu_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Submenu_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Submenu_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `font=`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary submenu
proc `font`*(ih: Submenu_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `handlename=`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary submenu
proc `handlename`*(ih: Submenu_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `image=`*(ih: Submenu_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGE [Windows and GTK Only] (non inheritable): Image name of
    ## the submenu image. In Windows, an item in a menu bar cannot
    ## have a check mark. Ignored if submenu in a menu bar. A
    ## recommended size would be 16x16 to fit the image in the menu
    ## item. In Windows, if larger than the check mark area it will be
    ## cropped. (since 3.0)
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: Submenu_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: Submenu_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGE"))

proc `key=`*(ih: Submenu_t, value: string) {.cdecl.} =
    ## KEY (non inheritable): Underlines a key character in the
    ## submenu title. It is updated only when TITLE is updated.
    ## Deprecated, use the mnemonic support directly in the TITLE
    ## attribute.
    SetAttribute(cast[PIhandle](ih), cstring("KEY"), cstring(value))

proc `key`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("KEY"), cstring(value))

proc `key=`*(ih: Submenu_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("KEY"), cstring(&"{x}"))

proc `key`*(ih: Submenu_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("KEY"), cstring(&"{x}"))

proc `key`*(ih: Submenu_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("KEY"))

proc `name=`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary submenu
proc `name`*(ih: Submenu_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `title=`*(ih: Submenu_t, value: string) {.cdecl.} =
    ## TITLE (non inheritable): Submenu Text. The "&" character can be
    ## used to define a mnemonic, the next character will be used as
    ## key. Use "&&" to show the "&" character instead on defining a
    ## mnemonic.
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

proc `title`*(ih: Submenu_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

# TODO ??? String Binary submenu
proc `title`*(ih: Submenu_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLE"))

proc `wid`*(ih: Submenu_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `destroy_cb=`*(ih: Submenu_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Submenu_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Submenu_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `highlight_cb=`*(ih: Submenu_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HIGHLIGHT_CB HIGHLIGHT_CB Callback triggered every time the
    ## user selects an IupItem or IupSubmenu. Callback int
    ## function(Ihandle \*ih); [in C] elem:highlight_cb() -> (ret:
    ## number) [in Lua] ih: identifier of the element that activated
    ## the event. Affects IupItem, IupSubmenu
    SetCallback(cast[PIhandle](ih), cstring("HIGHLIGHT_CB"), cast[Icallback](cb))

proc `highlight_cb`*(ih: Submenu_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HIGHLIGHT_CB"), cast[Icallback](cb))

proc `highlight_cb`*(ih: Submenu_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HIGHLIGHT_CB")))

proc `ldestroy_cb=`*(ih: Submenu_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Submenu_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Submenu_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: Submenu_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Submenu_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Submenu_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: Submenu_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Submenu_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Submenu_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: Submenu_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Submenu_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Submenu_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

