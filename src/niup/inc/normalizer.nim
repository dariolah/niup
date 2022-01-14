when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Normalizer
##
## NIUP type: Normalizer_t
##
## constructors
##
##    macro Normalizer(args: varargs[untyped]): Normalizer_t
##

macro Normalizer*(args: varargs[untyped]): Normalizer_t =
    ## Creates a void container that does not affect the dialog
    ## layout. It acts by normalizing all the controls in a list so
    ## their natural size becomes the biggest natural size amongst
    ## them. All natural widths will be set to the biggest width, and
    ## all natural heights will be set to the biggest height. The
    ## controls of the list must be inside a valid container in the
    ## dialog.


    result = nnkCall.newTree(
        nnkDotExpr.newTree(
            newIdentNode("niup"),
            newIdentNode("Normalizer_t")
          ),
       )
    let inner = nnkCall.newTree(
            newIdentNode("Normalizer")
          )

    if args.len > 0:
        for i in 0 ..< args.len:
          inner.add nnkCast.newTree(newIdentNode("PIhandle"), args[i])
    inner.add newNilLit()
    result.add inner


# TODO unknown: normalizer ADDCONTROL Unknown Binary
proc `addcontrol_handle=`*(ih: Normalizer_t, handle: User_t) {.cdecl.} =
    ## ADDCONTROL_HANDLE (non inheritable, write-only): Adds a control
    ## to the normalizer. The value passed must be a handle of an
    ## element.
    SetAttributeHandle(cast[PIhandle](ih), cstring("ADDCONTROL_HANDLE"), cast[PIhandle](handle))

proc `addcontrol_handle`*(ih: Normalizer_t, handle: User_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("ADDCONTROL_HANDLE"), cast[PIhandle](handle))

# TODO unknown: normalizer DELCONTROL Unknown Binary
proc `delcontrol_handle=`*(ih: Normalizer_t, handle: User_t) {.cdecl.} =
    ## DELCONTROL_HANDLE (non inheritable, write-only): Removes a
    ## control from the normalizer. The value passed must be a handle
    ## of an element. (since 3.17)
    SetAttributeHandle(cast[PIhandle](ih), cstring("DELCONTROL_HANDLE"), cast[PIhandle](handle))

proc `delcontrol_handle`*(ih: Normalizer_t, handle: User_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DELCONTROL_HANDLE"), cast[PIhandle](handle))

proc `first_control_handle`*(ih: Normalizer_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FIRST_CONTROL_HANDLE"))

proc `next_control_handle`*(ih: Normalizer_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NEXT_CONTROL_HANDLE"))

# TODO unknown: normalizer NORMALIZE Unknown Binary
proc `normalize`*(ih: Normalizer_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZE"))

proc `destroy_cb=`*(ih: Normalizer_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Normalizer_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Normalizer_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `ldestroy_cb=`*(ih: Normalizer_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Normalizer_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Normalizer_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `map_cb=`*(ih: Normalizer_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Normalizer_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Normalizer_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: Normalizer_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Normalizer_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Normalizer_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: Normalizer_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Normalizer_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Normalizer_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

