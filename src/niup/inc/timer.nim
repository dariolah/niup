when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Timer
##
## NIUP type: Timer_t
##
## constructors
##
##    proc Timer(): Timer_t
##

proc Timer*(): Timer_t {.cdecl.} =
    ## Creates a timer which periodically invokes a callback when the
    ## time is up. Each timer should be destroyed using IupDestroy.
    return Timer_t(niupc.Timer())

# TODO unknown: timer RUN Unknown Binary
proc `run`*(ih: Timer_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RUN"))

# TODO unknown: timer TIME Unknown Binary
proc `time`*(ih: Timer_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIME"))

proc `wid`*(ih: Timer_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `run=`*(ih: Timer_t, yes: bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RUN"), cstring((if yes: "YES" else: "NO")))

proc `run`*(ih: Timer_t, yes: bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RUN"), cstring((if yes: "YES" else: "NO")))

proc `time=`*(ih: Timer_t, miliseconds: int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIME"), cstring(&"{miliseconds}"))

proc `time`*(ih: Timer_t, miliseconds: int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIME"), cstring(&"{miliseconds}"))

proc `action_cb=`*(ih: Timer_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## ACTION_CB: Called every time the defined time interval is
    ## reached. To stop the callback from being called simply stop de
    ## timer with RUN=NO. Inside the callback the attribute
    ## ELAPSEDTIME returns the time elapsed since the timer was
    ## started in milliseconds (since 3.15). int function(Ihandle
    ## \*ih); [in C] ih:action_cb() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. Returns:
    ## IUP_CLOSE will be processed.
    SetCallback(cast[PIhandle](ih), cstring("ACTION_CB"), cast[Icallback](cb))

proc `action_cb`*(ih: Timer_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION_CB"), cast[Icallback](cb))

proc `action_cb`*(ih: Timer_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION_CB")))

