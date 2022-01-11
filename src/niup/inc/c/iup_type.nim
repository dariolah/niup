type
  Ihandle = object
  PIhandle* = ptr Ihandle
  uptr_t = clong
  sptr_t = clong
  Icallback* = proc (a1: PIhandle): cint {.cdecl.}

type
  Iparamcb* = proc (dialog: PIhandle; param_index: cint; user_data: pointer): cint {.
      cdecl.}

