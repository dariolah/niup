# IUP FFI bindings for Nim

IUP is a multi-platform toolkit for building graphical user interfaces.

#### Table of Contents

- [QuickStart](#quickstart)
- [NIUP module](#niupmodule)
- [NIUPEXT module](#niupextmodule)


## QuickStart

helloworld.nim
```Nim
import niup

proc mainProc =
  var argc:cint=0
  var argv:cstringArray=nil
  Open(argc, addr argv)
  Message("Hello World", "Hello World from IUP.")
  Close()

if isMainModule:
  mainProc()
```

Program **helloworld.nim** displays popup message. Function ``Open`` (``IupOpen`` in C) initializes IUP library. ``Message`` (``IupMessage`` in C) displays a dialog centralized on the screen, showing message and the **OK** button. ``Close`` (``IupClose`` IN C) ends the IUP toolkit and releases internal memory. It will also automatically destroy all dialogs and all elements that have names.

helloworldcb.nim

```Nim
import niup
import niupext

proc btn_exit_cb(ih:PIhandle):cint {.cdecl.}=
  # Exits the main loop
  return IUP_CLOSE

proc mainProc =
  var dlg, button, label, vbox: PIhandle

  # template from niupext module, calls Open(argc,argv)
  Open()

  label =  Label("Hello world from IUP.")
  button = Button("OK", nil)

  vbox = Vbox(label, button, nil)
  SetAttribute(vbox, "ALIGNMENT", "ACENTER")
  SetAttribute(vbox, "GAP", "10")
  SetAttribute(vbox, "MARGIN", "10x10")

  dlg = Dialog(vbox)
  SetAttribute(dlg, "TITLE", "Hello World with callback")

  # Registers callbacks
  SetCallback(button, "ACTION", cast[ICallback](btn_exit_cb))

  ShowXY(dlg, IUP_CENTER, IUP_CENTER)

  MainLoop()

  Close()

if isMainModule:
  mainProc()
```

Program **helloworldcb.nim** displays ``Dialog`` with ``Label`` and ``Button``. Click on button activates callback ``btn_exit_cb`` which terminates program.
``PIhandle`` (``Ihandle`` in C) is type for IUP objects. ``SetAttribute`` (``IupSetAttribute`` in C) sets values to propertie labels. This method for setting options is used for everything: numeric and text properties, options, callback functions. ``ShowXY`` (``IupShowXY`` in C) displays a dialog in a given position on the screen. ``MainLoop`` (``IupMainLoop`` in C) executes the user interaction until a callback returns ``IUP_CLOSE``, ``ExitLoop`` (``IupExitLoop`` in C) is called, or hiding the last visible dialog.

## NIUP module

**NIUP** is low level wrapper for IUP libraries. API is very similiar to C.

### Differences: Nim vs C API

#### Naming convenction

IUP is main library which depends on IM (image library) and CD (canvas draw library). Each library prefixes functions with ``Iup``, ``im`` or ``cd``.

Main difference with C API is that functions from IUP don't have prefix ``Iup``. I'ts ``SetAttribute`` instead ``IupSetAttribute``. IM and CD function have same names as in C.

#### Callbacks

This is low level API so for callbacks Nim binary compatible types should be used.
| C  | Nim |
| --- | --- |
| Ihandle* | PIhandle  |
| char* | cstring |
| int | cint |

## NIUPEXT module

**NIUPEXT** is set of templates, functions and macros to provide better Nim API and simplify coding.

### Documentation

Main guide to IUP and detailed documentation is at <https://www.tecgraf.puc-rio.br/iup/>. It's focused on C but matches Nim API with very few exceptions.

Nim examples are at <https://github.com/dariolah/nim-iup-examples>

