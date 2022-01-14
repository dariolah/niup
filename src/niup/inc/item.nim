when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Item
##
## NIUP type: Item_t
##
## constructors
##
##    proc Item(title: string; action: string): Item_t
##

proc Item*(title: string; action: string): Item_t {.cdecl.} =
    ## Creates an item of the menu interface element. When selected,
    ## it generates an action.
    return Item_t(niupc.Item(cstring(title), cstring(action)))

proc `active=`*(ih: Item_t, value: string) {.cdecl.} =
    ## ACTIVE, THEME: also accepted.
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Item_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Item_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Item_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `autotoggle=`*(ih: Item_t, value: string) {.cdecl.} =
    ## AUTOTOGGLE (non inheritable): enables the automatic toggle of
    ## VALUE state when the item is activated. Default: NO. (since
    ## 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("AUTOTOGGLE"), cstring(value))

proc `autotoggle`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOTOGGLE"), cstring(value))

proc `autotoggle=`*(ih: Item_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOTOGGLE"), cstring((if yes: "YES" else: "NO")))

proc `autotoggle`*(ih: Item_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOTOGGLE"), cstring((if yes: "YES" else: "NO")))

proc `autotoggle`*(ih: Item_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUTOTOGGLE")) == "YES"

proc `bgcolor=`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: Item_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Item_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `font=`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary item
proc `font`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `handlename=`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary item
proc `handlename`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `hidemark=`*(ih: Item_t, value: string) {.cdecl.} =
    ## HIDEMARK [Motif and GTK Only]: If enabled the item cannot be
    ## checked, since the check box will not be shown. If all items in
    ## a menu enable it, then no empty space will be shown in front of
    ## the items. Normally the unmarked check box will not be shown,
    ## but since GTK 2.14 the unmarked check box is always shown. If
    ## your item will not be marked you must set HIDEMARK=YES, since
    ## this is the most common case we changed the default value to
    ## YES for this version of GTK, but if VALUE is defined the
    ## default goes back to NO. Default: NO. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("HIDEMARK"), cstring(value))

proc `hidemark`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDEMARK"), cstring(value))

# TODO ??? String Binary item
proc `hidemark`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDEMARK"))

proc `image=`*(ih: Item_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMAGE [Windows and GTK Only] (non inheritable): Image name of
    ## the check mark image when VALUE=OFF. In Windows, an item in a
    ## menu bar cannot have a check mark. Ignored if item in a menu
    ## bar. A recommended size would be 16x16 to fit the image in the
    ## menu item. In Windows, if larger than the check mark area it
    ## will be cropped.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: Item_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMAGE"), cast[PIhandle](handle))

proc `image`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMAGE"))

proc `impress=`*(ih: Item_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## IMPRESS [Windows and GTK Only] (non inheritable): Image name of
    ## the check mark image when VALUE=ON.
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMPRESS"), cast[PIhandle](handle))

proc `impress`*(ih: Item_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("IMPRESS"), cast[PIhandle](handle))

proc `impress`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("IMPRESS"))

proc `key=`*(ih: Item_t, value: string) {.cdecl.} =
    ## KEY (non inheritable): Underlines a key character in the
    ## submenu title. It is updated only when TITLE is updated.
    ## Deprecated (since 3.0), use the mnemonic support directly in
    ## the TITLE attribute.
    SetAttribute(cast[PIhandle](ih), cstring("KEY"), cstring(value))

proc `key`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("KEY"), cstring(value))

proc `key=`*(ih: Item_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("KEY"), cstring(&"{x}"))

proc `key`*(ih: Item_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("KEY"), cstring(&"{x}"))

proc `key`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("KEY"))

proc `name=`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary item
proc `name`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `title=`*(ih: Item_t, value: string) {.cdecl.} =
    ## TITLE (non inheritable): Item text. The "&" character can be
    ## used to define a mnemonic, the next character will be used as
    ## key. Use "&&" to show the "&" character instead on defining a
    ## mnemonic. When in a menu bar an item that has a mnemonic can be
    ## activated from any control in the dialog using the "Alt+key"
    ## combination.
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

proc `title`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

# TODO ??? String Binary item
proc `title`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLE"))

proc `titleimage=`*(ih: Item_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## TITLEIMAGE (non inheritable): Image name of the title image. In
    ## Windows, it appears before of the title text and after the
    ## check mark area (so both title and title image can be visible).
    ## In Motif, it must be at least defined during map, it replaces
    ## the text, and only images will be possible to set (TITLE will
    ## be hidden). In GTK, it will appear on the check mark area.
    ## (since 3.0)
    SetAttributeHandle(cast[PIhandle](ih), cstring("TITLEIMAGE"), cast[PIhandle](handle))

proc `titleimage`*(ih: Item_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TITLEIMAGE"), cast[PIhandle](handle))

proc `titleimage`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLEIMAGE"))

proc `value=`*(ih: Item_t, value: string) {.cdecl.} =
    ## VALUE (non inheritable): Indicates the item's state. When the
    ## value is ON, a mark will be displayed to the left of the item.
    ## Default: OFF. An item in a menu bar cannot have a check mark.
    ## When IMAGE is used, the checkmark is not shown. See the item
    ## AUTOTOGGLE attribute and the menu RADIO attribute. Since GTK
    ## 2.14 to have a menu item that can be marked you must set the
    ## VALUE attribute to ON or OFF, or set HIDEMARK=NO, before
    ## mapping the control.
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: Item_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `wid`*(ih: Item_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `action=`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## ACTION ACTION Action generated when the element is activated.
    ## Affects each element differently. Callback int function(Ihandle
    ## \*ih); [in C] ih:action() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. In some
    ## elements, this callback may receive more parameters, apart from
    ## ih. Please refer to each element's documentation. Affects
    ## IupButton, IupItem, IupList, IupText, IupCanvas, IupMultiline,
    ## IupToggle
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: Item_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION")))

proc `destroy_cb=`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Item_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `help_cb=`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Item_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `highlight_cb=`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HIGHLIGHT_CB HIGHLIGHT_CB Callback triggered every time the
    ## user selects an IupItem or IupSubmenu. Callback int
    ## function(Ihandle \*ih); [in C] elem:highlight_cb() -> (ret:
    ## number) [in Lua] ih: identifier of the element that activated
    ## the event. Affects IupItem, IupSubmenu
    SetCallback(cast[PIhandle](ih), cstring("HIGHLIGHT_CB"), cast[Icallback](cb))

proc `highlight_cb`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HIGHLIGHT_CB"), cast[Icallback](cb))

proc `highlight_cb`*(ih: Item_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HIGHLIGHT_CB")))

proc `ldestroy_cb=`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Item_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Item_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: Item_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Item_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Item_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Item_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Item_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

