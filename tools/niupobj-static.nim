import niup/niupc
import std/macros
import strformat

export niupc except Dialog

proc Open*() =
  var argc:cint=0
  var argv:cstringArray=nil
  Open(argc, addr argv)

