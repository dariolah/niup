when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Thread
##
## NIUP type: Thread_t
##
## constructors
##
##    proc Thread(): Thread_t
##

proc Thread*(): Thread_t {.cdecl.} =
    ## Creates a thread element in IUP, which is not associated to any
    ## interface element. It is a very simple support to create and
    ## manage threads in a multithread environment. It inherits from
    ## IupUser. In non Windows systems uses the pthreads library.
    return Thread_t(niupc.Thread())

# TODO unknown: thread EXIT Unknown Binary
proc `iscurrent`*(ih: Thread_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ISCURRENT"))

# TODO unknown: thread JOIN Unknown Binary
# TODO unknown: thread LOCK Unknown Binary
proc `lock`*(ih: Thread_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LOCK"))

proc `start=`*(ih: Thread_t, value: string) {.cdecl.} =
    ## START (write-only, non inheritable): starts the thread and
    ## calls the callback. Can be YES only. The thread exits when the
    ## callback is terminated.
    SetAttribute(cast[PIhandle](ih), cstring("START"), cstring(value))

proc `start`*(ih: Thread_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("START"), cstring(value))

proc `start=`*(ih: Thread_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("START"), cstring((if yes: "YES" else: "NO")))

proc `start`*(ih: Thread_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("START"), cstring((if yes: "YES" else: "NO")))

# TODO unknown: thread YIELD Unknown Binary
proc `thread_cb=`*(ih: Thread_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## THREAD_CB: Action generated when the thread is started. If this
    ## callback returns or does not exist the thread is terminated.
    ## int function(Ihandle\* ih); [in C]ih:thread_cb() -> (ret:
    ## number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("THREAD_CB"), cast[Icallback](cb))

proc `thread_cb`*(ih: Thread_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("THREAD_CB"), cast[Icallback](cb))

proc `thread_cb`*(ih: Thread_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("THREAD_CB")))

