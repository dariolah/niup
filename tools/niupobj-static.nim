import niup/niupc
import std/macros
import strformat

export niupc except Dialog

proc Open*() =
  var argc:cint=0
  var argv:cstringArray=nil
  Open(argc, addr argv)

proc `[]`*(ih: PIhandle, attribute: string): string =
  return $GetAttribute(ih, attribute)

proc `[]=`*(ih: PIhandle, attribute: string, value: string) =
  SetAttribute(ih, attribute, value)

# Text, MultiLine aux
proc TextConvertLinColToPos(ih: PIhandle, lin, col: int, pos: var int) =
  niupc.TextConvertLinColToPos(ih, cint(lin), cint(col), cast[var cint](pos))

proc TextConvertPosToLinCol(ih: PIhandle, pos: int, lin, col: var int) =
  niupc.TextConvertPosToLinCol(ih, cint(pos), cast[var cint](lin), cast[var cint](col))

