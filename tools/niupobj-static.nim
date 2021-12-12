import niup/niupc
import std/macros
import strformat

export niupc except Dialog, Timer, User

proc Open*(utf8Mode: bool = false, imageLib: bool = false) {.cdecl.} =
  var argc:cint=0
  var argv:cstringArray=nil
  Open(argc, addr argv)

  if utf8Mode:
    SetGlobal("UTF8MODE", "Yes")

  if imageLib:
    ImageLibOpen()

