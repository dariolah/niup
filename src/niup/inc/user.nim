when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: User
##
## NIUP type: User_t
##
## constructors
##
##    proc User(): User_t
##

proc User*(): User_t {.cdecl.} =
    ## Creates a user element in IUP, which is not associated to any
    ## interface element. It is used to map an external element to a
    ## IUP element. Its use is usually for additional elements, but
    ## you can use it to create an Ihandle\* to store private
    ## attributes. It is also a void container. Its children can be
    ## dynamically added using IupAppend or IupInsert.
    return User_t(niupc.User())

# TODO unknown: user CLEARATTRIBUTES Unknown Binary
proc `alignment=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(cstring(value)))

proc `alignment`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(cstring(value)))

proc `bgcolor=`*(ih: User_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: User_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bulk=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BULK"), cstring(cstring(value)))

proc `bulk`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BULK"), cstring(cstring(value)))

proc `cleanout=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLEANOUT"), cstring(cstring(value)))

proc `cleanout`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLEANOUT"), cstring(cstring(value)))

proc `clearattributes=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLEARATTRIBUTES"), cstring(cstring(value)))

proc `clearattributes`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLEARATTRIBUTES"), cstring(cstring(value)))

proc `disabled=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DISABLED"), cstring(cstring(value)))

proc `disabled`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DISABLED"), cstring(cstring(value)))

proc `fgcolor=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(cstring(value)))

proc `fgcolor`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(cstring(value)))

proc `fontface=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(cstring(value)))

proc `fontface`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(cstring(value)))

proc `fontscale=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSCALE"), cstring(cstring(value)))

proc `fontscale`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSCALE"), cstring(cstring(value)))

proc `fontsize=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(cstring(value)))

proc `fontsize`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(cstring(value)))

proc `indent=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("INDENT"), cstring(cstring(value)))

proc `indent`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("INDENT"), cstring(cstring(value)))

proc `italic=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ITALIC"), cstring(cstring(value)))

proc `italic`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ITALIC"), cstring(cstring(value)))

proc `italic=`*(ih: User_t, yes: bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ITALIC"), cstring((if yes: "YES" else: "NO")))

proc `italic`*(ih: User_t, yes: bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ITALIC"), cstring((if yes: "YES" else: "NO")))

proc `language=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LANGUAGE"), cstring(cstring(value)))

proc `language`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LANGUAGE"), cstring(cstring(value)))

proc `linespacing=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINESPACING"), cstring(cstring(value)))

proc `linespacing`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("LINESPACING"), cstring(cstring(value)))

proc `name=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(cstring(value)))

proc `name`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(cstring(value)))

proc `numbering=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NUMBERING"), cstring(cstring(value)))

proc `numbering`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NUMBERING"), cstring(cstring(value)))

proc `numberingstyle=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NUMBERINGSTYLE"), cstring(cstring(value)))

proc `numberingstyle`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NUMBERINGSTYLE"), cstring(cstring(value)))

proc `numberingtab=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NUMBERINGTAB"), cstring(cstring(value)))

proc `numberingtab`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NUMBERINGTAB"), cstring(cstring(value)))

proc `protected=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROTECTED"), cstring(cstring(value)))

proc `protected`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROTECTED"), cstring(cstring(value)))

proc `rise=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RISE"), cstring(cstring(value)))

proc `rise`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RISE"), cstring(cstring(value)))

proc `selection=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(cstring(value)))

proc `selection`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(cstring(value)))

proc `selectionpos=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(cstring(value)))

proc `selectionpos`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(cstring(value)))

proc `smallcaps=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SMALLCAPS"), cstring(cstring(value)))

proc `smallcaps`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SMALLCAPS"), cstring(cstring(value)))

proc `spaceafter=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACEAFTER"), cstring(cstring(value)))

proc `spaceafter`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACEAFTER"), cstring(cstring(value)))

proc `spacebefore=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACEBEFORE"), cstring(cstring(value)))

proc `spacebefore`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACEBEFORE"), cstring(cstring(value)))

proc `stretch=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STRETCH"), cstring(cstring(value)))

proc `stretch`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STRETCH"), cstring(cstring(value)))

proc `strikeout=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STRIKEOUT"), cstring(cstring(value)))

proc `strikeout`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STRIKEOUT"), cstring(cstring(value)))

proc `strikeout=`*(ih: User_t, yes: bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STRIKEOUT"), cstring((if yes: "YES" else: "NO")))

proc `strikeout`*(ih: User_t, yes: bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STRIKEOUT"), cstring((if yes: "YES" else: "NO")))

proc `tabsarray=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TABSARRAY"), cstring(cstring(value)))

proc `tabsarray`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TABSARRAY"), cstring(cstring(value)))

proc `underline=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("UNDERLINE"), cstring(cstring(value)))

proc `underline`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("UNDERLINE"), cstring(cstring(value)))

proc `units=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("UNITS"), cstring(cstring(value)))

proc `units`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("UNITS"), cstring(cstring(value)))

proc `weight=`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WEIGHT"), cstring(cstring(value)))

proc `weight`*(ih: User_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WEIGHT"), cstring(cstring(value)))

proc `destroy_cb=`*(ih: User_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: User_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: User_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `ldestroy_cb=`*(ih: User_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: User_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: User_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: User_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: User_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: User_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: User_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: User_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: User_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: User_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: User_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: User_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

