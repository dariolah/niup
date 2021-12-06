import niup/niupc
import std/macros
import strformat

export niupc except Dialog

proc Open*(utf8Mode: bool = false) =
  var argc:cint=0
  var argv:cstringArray=nil
  Open(argc, addr argv)

  if utf8Mode:
    SetGlobal("UTF8MODE", "Yes")


macro unpackVarargs_pihandle*(callee: untyped; args: varargs[untyped]): untyped =
  result = newCall(callee)
  for i in 0 ..< args.len:
    result.add nnkCast.newTree(newIdentNode("PIhandle"), args[i])

# Text, MultiLine aux
proc TextConvertLinColToPos(ih: PIhandle, lin, col: int, pos: var int) =
  niupc.TextConvertLinColToPos(ih, cint(lin), cint(col), cast[var cint](pos))

proc TextConvertPosToLinCol(ih: PIhandle, pos: int, lin, col: var int) =
  niupc.TextConvertPosToLinCol(ih, cint(pos), cast[var cint](lin), cast[var cint](col))

