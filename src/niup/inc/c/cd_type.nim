type
  cdContext* = object
  cdCanvas* = object
  cdState* = object
  cdImage* = object
  cdBitmap* {.bycopy.} = object
    w*: cint
    h*: cint
    `type`*: cint
    data*: pointer

type
  cdCallback* = proc (canvas: ptr cdCanvas): cint {.cdecl, varargs.}

type
  cdSizeCB* = proc (canvas: ptr cdCanvas; w: cint; h: cint; w_mm: cdouble; h_mm: cdouble): cint {.
      cdecl.}

