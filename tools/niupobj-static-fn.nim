proc `[]`*(ih: IUPhandle_t, attribute: string): string =
  return $GetAttribute(ih, attribute)

proc `[]=`*(ih: IUPhandle_t, attribute, value: string) =
  SetAttribute(cast[PIhandle](ih), cstring(attribute), cstring(value))

proc SetHandle*(name: string, handle: IUPhandle_t ) =
  SetHandle(name, cast[PIhandle](handle))

proc ShowXY*(ih: IUPhandle_t, x, y: cint | int) =
  ShowXY(cast[PIhandle](ih), x, y)
