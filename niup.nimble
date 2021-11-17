# Package

backend       = "c"
version       = "3.30.3"
author        = "Dario Lah"
description   = "IUP FFI bindings"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 1.6.0"

when defined(nimdistros):
  import distros
  if detectOs(Linux):
    foreignDep "libiup.so"
    foreignDep "libiupcd.so"
    foreignDep "libiupcontrols.so"
    foreignDep "libiupglcontrols.so"
    foreignDep "libiupgl.so"
    foreignDep "libiupimglib.so"
    foreignDep "libiupim.so"
    foreignDep "libiup_mglplot.so"
    foreignDep "libiup_plot.so"
    foreignDep "libiup_scintilla.so"
    foreignDep "libiuptuio.so"
    foreignDep "libiupweb.so"

  elif detectOs(Windows):
    foreignDep "libiup.dll"
    foreignDep "libiupcd.dll"
    foreignDep "libiupcontrols.dll"
    foreignDep "libiupglcontrols.dll"
    foreignDep "libiupgl.dll"
    foreignDep "libiupimglib.dll"
    foreignDep "libiupim.dll"
    foreignDep "libiup_mglplot.dll"
    foreignDep "libiup_plot.dll"
    foreignDep "libiup_scintilla.dll"
    foreignDep "libiuptuio.dll"
    foreignDep "libiupweb.dll"
  else:
    foreignDep "libiup.dylib"
    foreignDep "libiupcd.dylib"
    foreignDep "libiupcontrols.dylib"
    foreignDep "libiupglcontrols.dylib"
    foreignDep "libiupgl.dylib"
    foreignDep "libiupimglib.dylib"
    foreignDep "libiupim.dylib"
    foreignDep "libiup_mglplot.dylib"
    foreignDep "libiup_plot.dylib"
    foreignDep "libiup_scintilla.dylib"
    foreignDep "libiuptuio.dylib"
    foreignDep "libiupweb.dylib"
