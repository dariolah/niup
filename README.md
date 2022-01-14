# IUP FFI bindings for Nim

IUP is a multi-platform toolkit for building graphical user interfaces.

Easy to use API for building desktop applications. Same code runs on Linux and Windows.

Tested with Nim 1.6.0 and IUP 3.30
- Linux, GTK
- Windows on Linux (cross-compiling, mingw, wine)
- Windows (reported working)

#### Table of Contents

- [Installation](#installation)
- [QuickStart](#quickstart)
- [NIUPC module](#niupc-module)
- [NIUPEXT module](#niupext-module)
- [Documentation](#documentation)
- [Examples](#examples)
- [screenshots](#screenshots)

## Installation

**Prerequisites**

Install IUP libraries...

Pre-built binaries:
https://sourceforge.net/projects/iup/files/

Download tips:
https://webserver2.tecgraf.puc-rio.br/iup/en/download_tips.html

Compile from source:
https://webserver2.tecgraf.puc-rio.br/iup/en/guide.html#buildlib

**NIUP package for Nim**
```
nimble install niup
```

## QuickStart
hello.nim

```Nim
import niup

proc btn_exit_cb(ih:PIhandle):cint {.cdecl.} =
  # Exits the main loop
  return IUP_CLOSE

proc mainProc =
  Open()

  var
    label = Label("Hello world from IUP.")
    button = Button("OK")
    vbox = Vbox(label, button)

  vbox.alignment = IUP_ACENTER
  vbox.gap(10)
  vbox.margin(10, 10)

  var dlg = Dialog(vbox)
  dlg.title = "Hello World"

  # callbacks
  button.action = btn_exit_cb

  ShowXY(dlg, IUP_CENTER, IUP_CENTER)

  MainLoop()
  Close()

if isMainModule:
  mainProc()
```

## NIUP module

NIUP module is strong typed API, wrapper around NIUPC.  
API is generated with help of <https://github.com/batiati/IUPMetadata>

## C-like API using 'niupc' module

helloworldcb.nim

```Nim
import niup/niupc
import niup/niupext

proc btn_exit_cb(ih:PIhandle):cint {.cdecl.}=
  # Exits the main loop
  return IUP_CLOSE

proc mainProc =
  Open()

  var
    label =  Label("Hello world from IUP.")
    button = Button("OK", nil)

  var vbox = Vbox(label, button, nil)
  withPIhandle vbox:
    "ALIGNMENT" "ACENTER"
    "GAP"       "10"
    "MARGIN"    "10x10"

  var dlg = Dialog(vbox)
  SetAttribute(dlg, "TITLE", "Hello World with callback")

  # Registers callbacks
  SetCallback(button, "ACTION", btn_exit_cb)

  ShowXY(dlg, IUP_CENTER, IUP_CENTER)

  MainLoop()
  Close()

if isMainModule:
  mainProc()
```

Program **helloworldcb.nim** displays ``Dialog`` with ``Label`` and ``Button``. Click on button activates callback ``btn_exit_cb`` which terminates program.
``PIhandle`` (``Ihandle`` in C) is type for IUP objects. ``SetAttribute`` (``IupSetAttribute`` in C) sets values to propertie labels. This method for setting options is used for everything: numeric and text properties, options, callback functions. ``ShowXY`` (``IupShowXY`` in C) displays a dialog in a given position on the screen. ``MainLoop`` (``IupMainLoop`` in C) executes the user interaction until a callback returns ``IUP_CLOSE``, ``ExitLoop`` (``IupExitLoop`` in C) is called, or hiding the last visible dialog.

## NIUPC module

**NIUPC** is low level wrapper for IUP libraries. API is very similiar to C.

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

Focus is mainly on using Nim types.

It doesn't wrapp IUP objects into Nim types. When interfacing with IUP, __take care about object visibility and life time__.

## Documentation

Main guide to IUP and detailed documentation is at <https://www.tecgraf.puc-rio.br/iup/>. It's focused on C but matches Nim API with very few exceptions.

API docs: <https://dariolah.github.io/niup>

## Examples

Examples are at <https://github.com/dariolah/nim-iup-examples>

## screenshots

[![screenshots](https://raw.githubusercontent.com/dariolah/niup/master/screenshots.gif)](#screenshots)

[![version](https://raw.githubusercontent.com/dariolah/niup/master/version.png)](#version)
