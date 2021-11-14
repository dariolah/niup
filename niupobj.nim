import niup
import std/macros
import strformat

export PIhandle, Close, MainLoop, ShowXY, SetCallback

export
  IUP_ERROR, IUP_NOERROR, IUP_OPENED, IUP_INVALID, IUP_INVALID_ID, IUP_IGNORE,
  IUP_DEFAULT, IUP_CLOSE, IUP_CONTINUE, IUP_CENTER, IUP_LEFT, IUP_RIGHT,
  IUP_MOUSEPOS, IUP_CURRENT, IUP_CENTERPARENT, IUP_LEFTPARENT, IUP_RIGHTPARENT,
  IUP_TOP, IUP_BOTTOM, IUP_TOPPARENT, IUP_BOTTOMPARENT,
  IUP_ALEFT, IUP_ACENTER, IUP_ARIGHT, IUP_ATOP, IUP_ABOTTOM,
  IUP_YES, IUP_NO,
  IUP_HORIZONTAL, IUP_VERTICAL

proc Open*() =
  var argc:cint=0
  var argv:cstringArray=nil
  Open(argc, addr argv)
# CONTROLS
type
  Button_t* = PIhandle
  Label_t* = PIhandle

# CTORs
proc Button*(title:string, action:string):Button_t {.inline.} =
  return Button_t(niup.Button(title, action))

proc Button*(title:string):Button_t {.inline.} =
  return Button_t(niup.Button(title, nil))

proc Label*(title:string):Label_t {.inline.} =
  return Label_t(niup.Label(title))


# CONTAINERS
type
  Vbox_t* = PIhandle

# CTORs
template Vbox*(children: varargs[PIhandle]): Vbox_t =
  when varargsLen(callArgs) > 0:
    Vbox_t(unpackVarargs(niup.Vbox, children))
  else: Vbox_t(niup.Vbox(nil))

# DIALOGS
type
  Dialog_t* = PIhandle

# CTORs
proc Dialog*(child: PIhandle):Dialog_t {.inline.} =
  return Dialog_t(niup.Dialog(child))


# ATTRIBUTES
type GapTypes = Vbox_t
proc `gap=`*(control: GapTypes, value: string) {.inline.} =
  ## Defines a vertical space in pixels between the children, CGAP is in the same units of the SIZE attribute for the height. Default: "0". (CGAP since 3.0)
  SetAttribute(control, "GAP", value)
proc `gap`*(control: GapTypes): string {.inline.} =
  return $GetAttribute(control, "GAP")

type TitleTypes = Dialog_t
proc `title=`*(control: TitleTypes, value: string) {.inline.} =
  ## Element’s title. It is often used to modify some static text of the element (which cannot be changed by the user).
  ## Notes
  ## 
  ## The '\n'character usually is accepted for line change (except for menus).
  ## The "&"character can be used to define a MNEMONIC, use "&&"to show the "&"character instead on defining a mnemonic.
  ## If a mnemonic is defined then the character relative to it is underlined and a key is associated so that when pressed together with the Alt key activates the control.
  ## In GTk, if you define a mnemonic using "&"and the string has an underscore, then make sure that the mnemonic comes before the underscore.
  ## In GTK, if the MARKUP attribute is defined then the title string can contains pango markup commands. Works only if a mnemonic is NOT defined in the title. Not valid for menus.
  SetAttribute(control, "TITLE", value)
proc `title`*(control: TitleTypes): string {.inline.} =
  return $GetAttribute(control, "TITLE")

type AlignmentTypes = Vbox_t
proc `alignment=`*(control: AlignmentTypes, value: string) {.inline.} =
  ## (non inheritable): Horizontally aligns the elements. Possible values: "ALEFT", "ACENTER", "ARIGHT". Default: "ALEFT".
  SetAttribute(control, "ALIGNMENT", value)
proc `alignment`*(control: AlignmentTypes): string {.inline.} =
  return $GetAttribute(control, "ALIGNMENT")

type NgapTypes = Vbox_t
proc `ngap=`*(control: NgapTypes, value: string) {.inline.} =
  ## Same as GAP but are non inheritable. (since 3.0)
  SetAttribute(control, "NGAP", value)
proc `ngap`*(control: NgapTypes): string {.inline.} =
  return $GetAttribute(control, "NGAP")

type MarginTypes = Vbox_t
proc `margin=`*(control: MarginTypes, value: string) {.inline.} =
  ## Defines a margin in pixels, CMARGIN is in the same units of the SIZE attribute. Its value has the format "widthxheight", where width and height are integer values corresponding to the horizontal and vertical margins, respectively. Default: "0x0"(no margin). (CMARGIN since 3.0)
  SetAttribute(control, "MARGIN", value)
proc `margin`*(control: MarginTypes): string {.inline.} =
  return $GetAttribute(control, "MARGIN")
proc `margin=`*(control: MarginTypes, width:int; height:int) {.inline.} =
  SetAttribute(control, "MARGIN", &"{width}x{height}")

type CgapTypes = Vbox_t
proc `cgap=`*(control: CgapTypes, value: string) {.inline.} =
  ## Defines a vertical space in pixels between the children, CGAP is in the same units of the SIZE attribute for the height. Default: "0". (CGAP since 3.0)
  SetAttribute(control, "CGAP", value)
proc `cgap`*(control: CgapTypes): string {.inline.} =
  return $GetAttribute(control, "CGAP")

type NcgapTypes = Vbox_t
proc `ncgap=`*(control: NcgapTypes, value: string) {.inline.} =
  ## Same as GAP but are non inheritable. (since 3.0)
  SetAttribute(control, "NCGAP", value)
proc `ncgap`*(control: NcgapTypes): string {.inline.} =
  return $GetAttribute(control, "NCGAP")

# CALLBACKS
type Button_cbTypes = Button_t
proc `button_cb=`*(control: Button_cbTypes, cb: proc (a1: PIhandle; button: cint; pressed: cint; x: cint; y: cint; status: cstring): cint {.cdecl.}) {.inline.} =
  ## Action generated when any mouse button is pressed and when it is released. Both calls occur before the ACTION callback when button 1 is being used.
  SetCallback(control, "BUTTON_CB", cast[Icallback](cb))
proc `button_cb`*(control: Button_cbTypes): proc (a1: PIhandle; button: cint; pressed: cint; x: cint; y: cint; status: cstring): cint {.cdecl.} {.inline.} =
  return cast[proc (a1: PIhandle; button: cint; pressed: cint; x: cint; y: cint; status: cstring): cint {.cdecl.}](GetCallback(control, "BUTTON_CB"))

type ActionTypes = Button_t
proc `action=`*(control: ActionTypes, cb: proc (a1: PIhandle): cint {.cdecl.}) {.inline.} =
  ## Action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area.
  SetCallback(control, "ACTION", cast[Icallback](cb))
proc `action`*(control: ActionTypes): proc (a1: PIhandle): cint {.cdecl.} {.inline.} =
  return cast[proc (a1: PIhandle): cint {.cdecl.}](GetCallback(control, "ACTION"))

