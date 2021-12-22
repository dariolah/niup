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

# CONTROLS
type
  Button_t* = distinct PIhandle
  Canvas_t* = distinct PIhandle
  Frame_t* = distinct PIhandle
  Image_t* = distinct PIhandle
  ImageRGB_t* = distinct PIhandle
  ImageRGBA_t* = distinct PIhandle
  Label_t* = distinct PIhandle
  List_t* = distinct PIhandle
  MultiLine_t* = distinct PIhandle
  Text_t* = distinct PIhandle
  Toggle_t* = distinct PIhandle
  Timer_t* = distinct PIhandle

type IUPControls_t* = Button_t | Canvas_t | Frame_t | Image_t | ImageRGB_t | ImageRGBA_t | Label_t | List_t | MultiLine_t | Text_t | Toggle_t | Timer_t

# CONTAINERS
type
  BackgroundBox_t* = distinct PIhandle
  Hbox_t* = distinct PIhandle
  User_t* = distinct PIhandle
  Vbox_t* = distinct PIhandle

type IUPContainers_t* = BackgroundBox_t | Hbox_t | User_t | Vbox_t

# DIALOGS
type
  Dialog_t* = distinct PIhandle

type IUPDialogs_t* = Dialog_t

type IUPhandle_t* = IUPControls_t | IUPContainers_t | IUPDialogs_t

# CTORs
proc Button*(title:string, action:string):Button_t {.cdecl.} =
  ## Buttons with images and/or texts can not change its behavior after mapped. This is a creation dependency. But after creation the image can be changed for another image, and the text for another text.
  ## Buttons are activated using Enter or Space keys.
  ## Buttons are not activated if the user clicks inside the button but moves the cursor and releases outside the button area. Also in Windows the highlight feedback when that happens is different if the button has CANFOCUS enabled or not.
  ## Buttons always have borders, except when IMAGE and IMPRESS are both defined and IMPRESSBORDER=NO. In this case in Windows TITLE can also be defined.
  ## Usually toolbar buttons have FLAT=Yes and CANFOCUS=NO.
  ## In GTK uses GtkButton/GtkImage, in Windows uses WC_BUTTON, and in Motif uses xmPushButton.
  return Button_t(niupc.Button(title, action))

proc Button*(title:string):Button_t {.cdecl.} =
  return Button_t(niupc.Button(title, nil))

proc Canvas*():Canvas_t {.cdecl.} =
  ## Creates an interface element that is a canvas - a drawing area for your application.
  ## Notes
  ## Note that some keys might remove the focus from the canvas. To avoid this, return IGNORE in the K_ANY callback.
  ## The mouse cursor position can be programmatically controlled using the global attribute CURSORPOS.
  ## When the canvas is displayed for the first time, the callback call order is always:
  ## MAP_CB()
  ## RESIZE_CB()
  ## ACTION()
  ## When the canvas is resized the ACTION callback is always called after the RESIZE_CB callback.
  ## The IupDraw API can be used to draw in the canvas. But the ACTION callback function can NOT be called manually from inside the application, it must be invoked by the system, so if you need to redraw then call IupRedraw or IupUpdate.
  ## In GTK uses GtkFixed, in Windows uses a custom window class called "IupCanvas", and in Motif uses xmDrawingArea.
  return Canvas_t(niupc.Canvas(nil))

proc Frame*(child: IUPhandle_t):Frame_t {.cdecl.} =
  ## Creates a native container, which draws a frame with a title around its child.
  ## Child: Identifier of an interface element which will receive the frame around. It can be NULL (nil in Lua), or empty in LED.
  ## Returns: the identifier of the created element, or NULL if an error occurs.
  ## Notes
  ## In Windows, a Frame with TITLE==NULL is not the same control as then TITLE!=NULL. When TITLE==NULL it does not have Visual Styles and uses a sharp rectangle border. When TITLE!=NULL it has Visual Styles and the border is a rounded rectangle. To always use Visual Styles set the title to ""before mapping, but be aware that a vertical space for the title will be always reserved at the top border.
  ## The frame can be created with no elements and be dynamic filled using IupAppend or IupInsert.
  ## In GTK uses GtkFrame, in Windows uses WC_BUTTON, and in Motif uses xmFrame.
  return Frame_t(niupc.Frame(cast[PIhandle](child)))

proc Image*(width, height: cint, pixels: openArray[uint8]):Image_t {.cdecl.} =
  ## Creates an image to be shown on a label, button, toggle, or as a cursor.
  ## width: Image width in pixels.
  ## height: Image height in pixels.
  ## pixels: Vector containing the value of each pixel. IupImage uses 1 value per pixel, IupImageRGB uses 3 values and  IupImageRGBA uses 4 values per pixel. Each value is always 8 bit. Origin is at the top-left corner and data is oriented top to bottom, and left to right. The pixels array is duplicated internally so you can discard it after the call.
  ## pixel0, pixel1, pixel2, ...: Value of the pixels. But for IupImageRGB and IupImageRGBA in fact will be one value for each color channel (pixel_r_0, pixel_g_0, pixel_b_0, pixel_r_1, pixel_g_1, pixel_b_1, pixel_r_2, pixel_g_2, pixel_b_2, ...).
  ## line0, line1: unnamed tables, one for each line containing pixels values. See Notes below.
  ## Colors: table named colors containing the colors indices.
  ## 
  ## Returns: the identifier of the created element, or NULL if an error occurs.
  return Image_t(niupc.Image(width, height, cast[ptr uint8](pixels)))

proc ImageRGB*(width, height: cint, pixels: openArray[uint8]):ImageRGB_t {.cdecl.} =
  return ImageRGB_t(niupc.ImageRGB(width, height, cast[ptr uint8](pixels)))

proc ImageRGBA*(width, height: cint, pixels: openArray[uint8]):ImageRGBA_t {.cdecl.} =
  return ImageRGBA_t(niupc.ImageRGBA(width, height, cast[ptr uint8](pixels)))

proc Label*(title:string):Label_t {.cdecl.} =
  ## Labels with images, texts or line separator can not change its behavior after mapped. But after map the image can be changed for another image, and the text for another text.
  ## In GTK uses GtkSeparator(GtkHSeparator/GtkVSeparator in GTK 2)/GtkImage/GtkLabel, in Windows uses WC_STATIC, and in Motif uses xmSeparator/xmLabel.
  return Label_t(niupc.Label(title))

proc List*():List_t {.cdecl.} =
  ## Creates an interface element that displays a list of items. The list can be visible or can be dropped down. It also can have an edit box for text input. So it is a 4 in 1 element. In native systems the dropped down case is called Combo Box.
  ## 
  ## Notes
  ## Text is always left aligned.
  ## 
  ## When the list has focus use the arrow keys to move focus from one item to another. When DROPDOWN=Yes use the Alt+Down key combination to show the dropdown list. While the dropdown is shown the arrow key may change the current value depending on the system, on Windows will directly change the current value, on GTK will change the current value only if Enter is pressed. In all systems the dropdown list is closed by using the Alt+Up key combination, or by pressing Enter or Esc keys (while the dropdown list is shown the DEFAULTENTER and DEFAULTESC buttons will not be called (fixed in 3.14)).
  ## 
  ## The GETFOCUS_CB and KILLFOCUS_CB callbacks behave differently depending on the list configuration and on the native system:
  ## If DROPDOWN=NO and EDITBOX=YES, then the list never gets the focus, the callbacks are called only when the edit box is clicked.
  ## In Motif if DROPDOWN=YES then when the dropdown button is clicked the list looses its focus and when the dropped list is closed the list regain the focus, also when that happen if the list looses its focus to another control the kill focus callback is not called.
  ## In GTK, if DROPDOWN=YES and EDITBOX=NO, both callbacks are called only when navigating with the keyboard (tip: if you need those callbacks with mouse navigation set EDITBOX=YES and READONLY=YES). Also in GTK, if DROPDOWN=YES and EDITBOX=YES then when the dropdown button is clicked the list looses its focus and it gets it back only if the edit box is clicked.
  ## 
  ## In Windows, if EDITBOX=YES then the tooltips are shown only when the cursor is near the control border or at the dropdown arrow. Also the selection and caret attributes are not preserved if the list loses its focus, or in other words these attributes are only useful in Windows if the list has the focus.
  ## 
  ## IMPORTANT: In Windows when DROPDOWN=Yes the vertical size is controlled by the system, and has the height just right to include the borders and the text. So the User height from RASTERSIZE or SIZE will be always ignored.
  ## In Windows, list items are limited to 255 pixels height.
  ## In GTK older than 2.12, the editbox of a dropdown will not follow the list attributes: FONT, BGCOLOR, FGCOLOR and SPACING.
  ## Clicking and dragging a item: if SHOWDRAGDROP=Yes starts a drag. When mouse is released, the DRAGDROP_CB callback is called. If the callback does not exist or if it returns IUP_CONTINUE then the item is moved to the new position. If Ctrl is pressed then the node is copied instead of moved. In Windows and GTK, drag is performed with the left mouse button. In Motif, the middle mouse button is used to drag. (since 3.7)
  ## In GTK uses GtkComboBox/GtkTreeView, in Windows uses COMBOBOX/LISTBOX, and in Motif uses xmComboBox/xmList.
  return List_t(niupc.List(nil))

proc MultiLine*():MultiLine_t {.cdecl.} =
  ## Creates an editable field with one or more lines.
  ## Since IUP 3.0, IupText has support for multiple lines when the MULTILINE attribute is set to YES. Now when a IupMultiline element is created in fact a IupText element with MULTILINE=YES is created.
  return MultiLine_t(niupc.MultiLine(nil))

proc Text*():Text_t {.cdecl.} =
  ## Creates an editable text field.
  return Text_t(niupc.Text(nil))

proc Toggle*(title:string):Toggle_t {.cdecl.} =
  ## Creates the toggle interface element. It is a two-state (on/off) button that, when selected, generates an action that activates a function in the associated application. Its visual representation can contain a text or an image.
  ## Notes
  ## Toggle with image or text can not change its behavior after mapped. This is a creation attribute. But after creation the image can be changed for another image, and the text for another text.
  ## Toggles are activated using the Space key.
  ## To build a set of mutual exclusive toggles, insert them in an IupRadio container. They must be inserted before creation, and their behavior can not be changed. If you need to dynamically remove toggles that belongs to a radio in Windows, then put the radio inside an IupFrame that has a title.
  ## A toggle that is a child of an IupRadio automatically receives a name when its is mapped into the native system. (since 3.16)
  ## In GTK uses GtkRadioButton/GtkCheckButton/GtkToggleButton, in Windows uses WC_BUTTON, and in Motif uses xmToggleButton.
  return Toggle_t(niupc.Toggle(title, nil))

proc Timer*():Timer_t {.cdecl.} =
  ## Creates a timer which periodically invokes a callback when the time is up. Each timer should be destroyed using IupDestroy.
  ## In GTK uses g_timeout_add, in Windows uses SetTimer, and in Motif uses XtAppAddTimeOut.
  return Timer_t(niupc.Timer())


# CTORs
proc BackgroundBox*(child: IUPhandle_t):BackgroundBox_t {.cdecl.} =
  ## Creates a simple native container with no decorations. Useful for controlling children visibility for IupZbox or IupExpander. It inherits from IupCanvas.
  ## The box can be created with no elements and be dynamic filled using IupAppend or IupInsert.
  ## The ACTION callback can be defined and the application can draw bellow other children inside the BackgroundBox, but only with the IupDraw API. To avoid overlapping the drawing areas it is recommended that children must be inside native containers.
  return BackgroundBox_t(niupc.BackgroundBox(cast[PIhandle](child)))

macro Hbox*(args: varargs[untyped]): Hbox_t =
  ## The box can be created with no elements and be dynamic filled using IupAppend or IupInsert.
  ## The box will NOT expand its children, it will allow its children to expand according to the space left in the box parent. So for the expansion to occur, the children must be expandable with EXPAND!=NO, and there must be room in the box parent.
  ## Also the hbox will not reduce its children beyond their horizontal natural size even if SHRINK=Yes at the dialog.
  result = nnkCall.newTree(
            nnkDotExpr.newTree(
                newIdentNode("niup"),
                newIdentNode("Hbox_t")
              ),
           )
  let inner = nnkCall.newTree(
                nnkDotExpr.newTree(
                  newIdentNode("niupc"),
                  newIdentNode("Hbox")
                )
              )

  if args.len > 0:
    for i in 0 ..< args.len:
      inner.add nnkCast.newTree(newIdentNode("PIhandle"), args[i])
  inner.add newNilLit()
  result.add inner
proc User*():User_t {.cdecl.} =
  ## Creates a user element in IUP, which is not associated to any interface element. It is used to map an external element to a IUP element. Its use is usually for additional elements, but you can use it to create an Ihandle* to store private attributes.
  ## It is also a void container. Its children can be dynamically added using IupAppend or IupInsert.
  return User_t(niupc.User())

macro Vbox*(args: varargs[untyped]): Vbox_t =
  ## The box can be created with no elements and be dynamic filled using IupAppend or IupInsert.
  ## The box will NOT expand its children, it will allow its children to expand according to the space left in the box parent. So for the expansion to occur, the children must be expandable with EXPAND!=NO, and there must be room in the box parent.
  ## Also the vbox will not reduce its children beyond their vertical natural size even if SHRINK=Yes at the dialog.
  result = nnkCall.newTree(
            nnkDotExpr.newTree(
                newIdentNode("niup"),
                newIdentNode("Vbox_t")
              ),
           )
  let inner = nnkCall.newTree(
                nnkDotExpr.newTree(
                  newIdentNode("niupc"),
                  newIdentNode("Vbox")
                )
              )

  if args.len > 0:
    for i in 0 ..< args.len:
      inner.add nnkCast.newTree(newIdentNode("PIhandle"), args[i])
  inner.add newNilLit()
  result.add inner

# CTORs
proc Dialog*(child: IUPhandle_t):Dialog_t {.cdecl.} =
  ## Do not associate an IupDialog with the native "dialog"nomenclature in Windows, GTK or Motif. IupDialog use native standard windows in all drivers.
  ## Except for the menu, all other elements must be inside a dialog to interact with the user. Therefore, an interface element will only be visible if its dialog is also visible.
  ## The order of callback calling is system dependent. For instance, the RESIZE_CB and the SHOW_CB are called in a different order in Win32 and in X-Windows when the dialog is shown for the first time.
  ## In Windows, when all decorations are removed the window icon is not displayed on the task bar, when minimized a small rectangular window will be positioned above the task bar on the bottom-left corner of the desktop.
  ## In GTK uses a GtkWindow, in Windows uses a custom windows class called "IupDialog", and in Motif uses topLevelShellWidgetClass.
  return Dialog_t(niupc.Dialog(cast[PIhandle](child)))


# ATTRIBUTES
type ActiveTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `active=`*(ih: ActiveTypes, value: string) {.cdecl.} =
  ## Activates or inhibits user interaction.
  SetAttribute(cast[PIhandle](ih), "ACTIVE", value)

proc `active`*(ih: ActiveTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ACTIVE", value)

proc `active`*(ih: ActiveTypes): bool {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ACTIVE") == "YES"

proc `active=`*(ih: ActiveTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ACTIVE", cstring((if active: "YES" else: "NO")))

proc `active`*(ih: ActiveTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ACTIVE", cstring((if active: "YES" else: "NO")))

type ActivewindowTypes* = Dialog_t
proc `activewindow`*(ih: ActivewindowTypes): string {.cdecl.} =
  ## [Windows and GTK Only] (read-only): informs if the dialog is the active window (the window with focus). Can be Yes or No. (since 3.4)
  return $GetAttribute(cast[PIhandle](ih), "ACTIVEWINDOW")


type AddformattagTypes* = Text_t | MultiLine_t
proc `addformattag=`*(ih: AddformattagTypes, value: string) {.cdecl.} =
  ## [write only] (non inheritable)
  ## Name of a format tag element to be added to the IupText. The name is associated in C using IupSetHandle. The name association must be done before setting the attribute. It will set the ADDFORMATTAG_HANDLE with the associated handle.
  SetAttribute(cast[PIhandle](ih), "ADDFORMATTAG", value)

proc `addformattag`*(ih: AddformattagTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ADDFORMATTAG", value)


type Addformattag_handleTypes* = Text_t | MultiLine_t
proc `addformattag_handle=`*(ih: Addformattag_handleTypes, value: string) {.cdecl.} =
  ## [write only] (non inheritable)
  ## Handle of a format tag element to be added to the IupText. The tag element will be automatically destroyed when the IupText is mapped. If the IupText is already mapped, the format tag is immediately destroyed when the attribute is set. The format tag can NOT be reused.
  SetAttribute(cast[PIhandle](ih), "ADDFORMATTAG_HANDLE", value)

proc `addformattag_handle`*(ih: Addformattag_handleTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ADDFORMATTAG_HANDLE", value)

proc `addformattag_handle=`*(ih: Addformattag_handleTypes, handle: User_t) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ADDFORMATTAG_HANDLE", cstring(cast[cstring](handle)))

proc `addformattag_handle`*(ih: Addformattag_handleTypes, handle: User_t) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ADDFORMATTAG_HANDLE", cstring(cast[cstring](handle)))

type AlignmentTypes* = Button_t | Label_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `alignment=`*(ih: AlignmentTypes, value: string) {.cdecl.} =
  ## (non inheritable): Horizontally aligns the elements. Possible values: "ALEFT", "ACENTER", "ARIGHT". Default: "ALEFT".
  SetAttribute(cast[PIhandle](ih), "ALIGNMENT", value)

proc `alignment`*(ih: AlignmentTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ALIGNMENT", value)

proc `alignment`*(ih: AlignmentTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ALIGNMENT")


type AlignmenttxtfmtTypes* = User_t
proc `alignment=`*(ih: AlignmenttxtfmtTypes, value: string) {.cdecl.} =
  ## Can be JUSTIFY, RIGHT, CENTER and LEFT. Default: LEFT.
  SetAttribute(cast[PIhandle](ih), "ALIGNMENT", value)

proc `alignment`*(ih: AlignmenttxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ALIGNMENT", value)

proc `alignment`*(ih: AlignmenttxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ALIGNMENT")


type AlignmenttogTypes* = Toggle_t
proc `alignment=`*(ih: AlignmenttogTypes, value: string) {.cdecl.} =
  ## (non inheritable): horizontal and vertical alignment when IMAGE is defined. Possible values: "ALEFT", "ACENTER"and "ARIGHT", combined to "ATOP", "ACENTER"and "ABOTTOM". Default: "ACENTER:ACENTER". Partial values are also accepted, like "ARIGHT"or ":ATOP", the other value will be obtained from the default value. In Motif, vertical alignment is restricted to "ACENTER". In Windows works only when Visual Styles is active. Text is always left aligned. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "ALIGNMENT", value)

proc `alignment`*(ih: AlignmenttogTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ALIGNMENT", value)

proc `alignment`*(ih: AlignmenttogTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ALIGNMENT")


type AppendTypes* = List_t | Text_t | MultiLine_t
proc `append=`*(ih: AppendTypes, value: string) {.cdecl.} =
  ## (write-only): Inserts a text at the end of the current text. In the Multiline, if APPENDNEWLINE=YES, a "\n"character will be automatically inserted before the appended text if the current text is not empty(APPENDNEWLINE default is YES). Ignored if set before map.
  SetAttribute(cast[PIhandle](ih), "APPEND", value)

proc `append`*(ih: AppendTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "APPEND", value)


type AppenditemTypes* = List_t
proc `appenditem=`*(ih: AppenditemTypes, value: string) {.cdecl.} =
  ## (write-only): inserts an item after the last item. Ignored if set before map. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "APPENDITEM", value)

proc `appenditem`*(ih: AppenditemTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "APPENDITEM", value)

proc `appenditem`*(ih: AppenditemTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "APPENDITEM")


type AutohideTypes* = List_t
proc `autohide=`*(ih: AutohideTypes, value: string) {.cdecl.} =
  ## scrollbars are shown only if they are necessary. Default: "YES".
  SetAttribute(cast[PIhandle](ih), "AUTOHIDE", value)

proc `autohide`*(ih: AutohideTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "AUTOHIDE", value)

proc `autohide`*(ih: AutohideTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "AUTOHIDE")


type AutoredrawTypes* = List_t
proc `autoredraw=`*(ih: AutoredrawTypes, value: string) {.cdecl.} =
  ## [Windows] (non inheritable): automatically redraws the list when something has change. Set to NO to add many items to the list without updating the display. Default: "YES". (since 3.3)
  SetAttribute(cast[PIhandle](ih), "AUTOREDRAW", value)

proc `autoredraw`*(ih: AutoredrawTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "AUTOREDRAW", value)

proc `autoredraw`*(ih: AutoredrawTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "AUTOREDRAW")


type AutoscaleTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `autoscale=`*(ih: AutoscaleTypes, value: string) {.cdecl.} =
  ## automatically scale the image by a given real factor. Can be "DPI"or a scale factor. If not defined the global attribute IMAGEAUTOSCALE will be used. Values are the same of the global attribute. The minimum resulted size when automatically resized is 24 pixels height (since 3.29). (since 3.16)
  SetAttribute(cast[PIhandle](ih), "AUTOSCALE", value)

proc `autoscale`*(ih: AutoscaleTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "AUTOSCALE", value)

proc `autoscale`*(ih: AutoscaleTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "AUTOSCALE")


type BackgroundTypes* = Dialog_t
proc `background=`*(ih: BackgroundTypes, value: string) {.cdecl.} =
  ## (non inheritable): Dialog background color or image. Can be a non inheritable alternative to BGCOLOR or can be the name of an image to be tiled on the background. See also the screenshots of the sample.c results with normal background, changing the dialog BACKGROUND, the dialog BGCOLOR and the children BGCOLOR. Not working in GTK 3. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "BACKGROUND", value)

proc `background`*(ih: BackgroundTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BACKGROUND", value)

proc `background`*(ih: BackgroundTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BACKGROUND")


type BgcolorTypes* = Button_t | Label_t | List_t | Dialog_t | Image_t | ImageRGB_t | ImageRGBA_t | Text_t | MultiLine_t | Toggle_t
proc `bgcolor=`*(ih: BgcolorTypes, value: string) {.cdecl.} =
  ## Background color. If text and image are not defined, the button is configured to simply show a color, in this case set the button size because the natural size will be very small. In Windows and in GTK 3, the BGCOLOR attribute is ignored if text or image is defined. Default: the global attribute DLGBGCOLOR. BGCOLOR is ignored when FLAT=YES because it will be used the background from the native parent.
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", value)

proc `bgcolor`*(ih: BgcolorTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", value)

proc `bgcolor`*(ih: BgcolorTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BGCOLOR")

proc `bgcolor`*(ih: BgcolorTypes, red, green, blue:int, alpha:int = 255) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", cstring(&"{red} {green} {blue} {alpha}"))

type BgcolortxtfmtTypes* = User_t
proc `bgcolor=`*(ih: BgcolortxtfmtTypes, value: string) {.cdecl.} =
  ## string containing a color in the format "rrr ggg bbb"for the background of the text.
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", value)

proc `bgcolor`*(ih: BgcolortxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", value)

proc `bgcolor`*(ih: BgcolortxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BGCOLOR")

proc `bgcolor`*(ih: BgcolortxtfmtTypes, red, green, blue:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", cstring(&"{red} {green} {blue}"))

type BgcolorfrmTypes* = Frame_t
proc `bgcolor=`*(ih: BgcolorfrmTypes, value: string) {.cdecl.} =
  ## ignored, transparent in all systems. Will use the background color of the native parent. Except if TITLE is not defined and BGCOLOR is defined before map (can be changed later), then the frame will have a color background.
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", value)

proc `bgcolor`*(ih: BgcolorfrmTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", value)

proc `bgcolor`*(ih: BgcolorfrmTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BGCOLOR")


type BgcolorcanvasTypes* = Canvas_t
proc `bgcolor=`*(ih: BgcolorcanvasTypes, value: string) {.cdecl.} =
  ## Background color. The background is painted only if the ACTION callback is not defined. If the callback is defined the application must draw all the canvas contents. In GTK or Motif if you set the ACTION callback after map then you should also set BGCOLOR to any value just after setting the callback or the first redraw will be lost. Default: "255 255 255".
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", value)

proc `bgcolor`*(ih: BgcolorcanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", value)

proc `bgcolor`*(ih: BgcolorcanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BGCOLOR")

proc `bgcolor`*(ih: BgcolorcanvasTypes, red, green, blue:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", cstring(&"{red} {green} {blue}"))

type BorderTypes* = Canvas_t | Dialog_t | Text_t | MultiLine_t
proc `border=`*(ih: BorderTypes, value: string) {.cdecl.} =
  ## (non inheritable) (creation only): Shows a resize border around the dialog. Default: "YES". BORDER=NO is useful only when RESIZE=NO, MAXBOX=NO, MINBOX=NO, MENUBOX=NO and TITLE=NULL, if any of these are defined there will be always some border.
  SetAttribute(cast[PIhandle](ih), "BORDER", value)

proc `border`*(ih: BorderTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BORDER", value)

proc `border`*(ih: BorderTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BORDER")


type BordersizeTypes* = Dialog_t
proc `bordersize`*(ih: BordersizeTypes): string {.cdecl.} =
  ## (non inheritable) (read only): returns the border size. (since 3.18)
  return $GetAttribute(cast[PIhandle](ih), "BORDERSIZE")


type BppTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `bpp`*(ih: BppTypes): string {.cdecl.} =
  ## (read-only): returns the number of bits per pixel in the image. Images created with IupImage returns 8, with IupImageRGB returns 24 and with IupImageRGBA returns 32. (since 3.0)
  return $GetAttribute(cast[PIhandle](ih), "BPP")


type BringfrontTypes* = Dialog_t
proc `bringfront=`*(ih: BringfrontTypes, value: string) {.cdecl.} =
  ## [Windows Only] (write-only): makes the dialog the foreground window. Use "YES"to activate it. Useful for multithreaded applications.
  SetAttribute(cast[PIhandle](ih), "BRINGFRONT", value)

proc `bringfront`*(ih: BringfrontTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BRINGFRONT", value)


type BulktxtfmtTypes* = User_t
proc `bulk=`*(ih: BulktxtfmtTypes, value: string) {.cdecl.} =
  ## 
  SetAttribute(cast[PIhandle](ih), "BULK", value)

proc `bulk`*(ih: BulktxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BULK", value)

proc `bulk`*(ih: BulktxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BULK")


type CanfocusTypes* = Button_t | Canvas_t | List_t | Text_t | MultiLine_t | Toggle_t
proc `canfocus=`*(ih: CanfocusTypes, value: string) {.cdecl.} =
  ## (creation only) (non inheritable): enables the focus traversal of the control. In Windows the button will respect CANFOCUS differently to some other controls. Default: YES. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "CANFOCUS", value)

proc `canfocus`*(ih: CanfocusTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CANFOCUS", value)

proc `canfocus`*(ih: CanfocusTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CANFOCUS")


type CaretTypes* = List_t | Text_t | MultiLine_t
proc `caret=`*(ih: CaretTypes, value: string) {.cdecl.} =
  ## (non inheritable): Character position of the insertion point. Its format depends in MULTILINE=YES. The first position, lin or col, is "1".
  ## 
  ## For multiple lines: a string with the "lin,col"format, where lin and col are integer numbers corresponding to the caret's position.
  ## 
  ## For single line: a string in the "col"format, where col is an integer number corresponding to the caret's position.
  ## 
  ## When lin is greater than the number of lines, the caret is placed at the last line. When col is greater than the number of characters in the given line, the caret is placed after the last character of the line.
  ## 
  ## If the caret is not visible the text is scrolled to make it visible.
  ## 
  ## In Windows, if the element does not have the focus the returned value is the position of the first character of the current selection. The caret is only displayed if the element has the keyboard focus, but its position can be changed even if not visible. When changed it will also change the selection but the text will be scrolled only when it receives the focus.
  ## 
  ## See the Notes below if using UTF-8 strings in GTK.
  SetAttribute(cast[PIhandle](ih), "CARET", value)

proc `caret`*(ih: CaretTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CARET", value)

proc `caret`*(ih: CaretTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CARET")


type CaretposTypes* = List_t | Text_t | MultiLine_t
proc `caretpos=`*(ih: CaretposTypes, value: string) {.cdecl.} =
  ## (non inheritable): Also the character position of the insertion point, but using a zero based character unique index "pos". Useful for indexing the VALUE string. See the Notes below if using UTF-8 strings in GTK. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "CARETPOS", value)

proc `caretpos`*(ih: CaretposTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CARETPOS", value)

proc `caretpos`*(ih: CaretposTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CARETPOS")


type CgapTypes* = Vbox_t | Hbox_t
proc `cgap=`*(ih: CgapTypes, value: string) {.cdecl.} =
  ## Defines a vertical space in pixels between the children, CGAP is in the same units of the SIZE attribute for the height. Default: "0". (CGAP since 3.0)
  SetAttribute(cast[PIhandle](ih), "CGAP", value)

proc `cgap`*(ih: CgapTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CGAP", value)

proc `cgap`*(ih: CgapTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CGAP")


type ChangecaseTypes* = Text_t | MultiLine_t
proc `changecase=`*(ih: ChangecaseTypes, value: string) {.cdecl.} =
  ## (non inheritable): Change case according to given conversion. Can be UPPER, LOWER, TOGGLE, or TITLE. TITLE case change first letter of words separated by spaces to upper case others to lower case, but first letter is changed only if word has more than 3 characters, for instance: "Best of the World". Supports Latin-1 encoding only, even when using UTF-8. Does not depends on current locale. (since 3.28)
  SetAttribute(cast[PIhandle](ih), "CHANGECASE", value)

proc `changecase`*(ih: ChangecaseTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CHANGECASE", value)

proc `changecase`*(ih: ChangecaseTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CHANGECASE")


type ChannelsTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `channels`*(ih: ChannelsTypes): string {.cdecl.} =
  ## returns the number of channels in the image. Images created with IupImage returns 1, with IupImageRGB returns 3 and with IupImageRGBA returns 4. (since 3.0)
  return $GetAttribute(cast[PIhandle](ih), "CHANNELS")


type CharsizeTypes* = Button_t
proc `charsize`*(ih: CharsizeTypes): string {.cdecl.} =
  ## (read-only, non inheritable) Returns the average character size of the current FONT attribute. This is the factor used by the SIZE attribute to convert its units to pixels.
  return $GetAttribute(cast[PIhandle](ih), "CHARSIZE")


type ChildoffsetTypes* = Frame_t | Dialog_t
proc `childoffset=`*(ih: ChildoffsetTypes, value: string) {.cdecl.} =
  ## Allow to specify a position offset for the child. Available for native containers only. It will not affect the natural size, and allows to position controls outside the client area. Format "dxxdy", where dx and dy are integer values corresponding to the horizontal and vertical offsets, respectively, in pixels. Default: 0x0. (since 3.14)
  SetAttribute(cast[PIhandle](ih), "CHILDOFFSET", value)

proc `childoffset`*(ih: ChildoffsetTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CHILDOFFSET", value)

proc `childoffset`*(ih: ChildoffsetTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CHILDOFFSET")

proc `childoffset`*(ih: ChildoffsetTypes, dx, dy:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CHILDOFFSET", cstring(&"{dx}x{dy}"))

type CleanouttxtfmtTypes* = User_t
proc `cleanout=`*(ih: CleanouttxtfmtTypes, value: string) {.cdecl.} =
  ## 
  SetAttribute(cast[PIhandle](ih), "CLEANOUT", value)

proc `cleanout`*(ih: CleanouttxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CLEANOUT", value)

proc `cleanout`*(ih: CleanouttxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CLEANOUT")


type ClearattributesTypes* = User_t
proc `clearattributes=`*(ih: ClearattributesTypes, value: string) {.cdecl.} =
  ## (write-only, non inheritable): it will clear all attributes stored internally and remove all references. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "CLEARATTRIBUTES", value)

proc `clearattributes`*(ih: ClearattributesTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CLEARATTRIBUTES", value)


type ClearcacheTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `clearcache=`*(ih: ClearcacheTypes, value: string) {.cdecl.} =
  ## clears the internal native image cache, so WID can be dynamically changed. (since 3.24)
  SetAttribute(cast[PIhandle](ih), "CLEARCACHE", value)

proc `clearcache`*(ih: ClearcacheTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CLEARCACHE", value)


type ClientoffsetTypes* = Frame_t | Dialog_t | Vbox_t | Hbox_t | BackgroundBox_t
proc `clientoffset`*(ih: ClientoffsetTypes): string {.cdecl.} =
  ## Returns the native container internal offset to the Client area, see the Layout Guide. Useful for IupFrame, IupTabs and IupDialog that have decorations. Can also be consulted in other containers, it will simply return "0x0".
  ## This attribute can be used in conjunction with the POSITION attribute of a child so the coordinates of a child relative to the native parent top-left corner can be obtained.
  ## 
  ## Value
  ## "dxxdy", where dx and dy are integer values corresponding to the horizontal and vertical offsets, respectively, in pixels.
  ## 
  ## Affects
  ## All elements that are containers, except menus.
  ## 
  ## Notes
  ## In GTK and Motif, for the IupDialog, the dy value is negative when there is a menu. This occurs because in those systems the menu is placed inside the Client Area and all children must be placed below the menu. In Windows it will return 0x0, except when CUSTOMFRAMEDRAW is used.
  ## In Windows, for the IupFrame, the value is always "0x0"the position of the child is still relative to the top-left corner of the frame. This is automatically compensated in calculation of the POSITION attribute.
  return $GetAttribute(cast[PIhandle](ih), "CLIENTOFFSET")


type ClientsizeTypes* = Frame_t | Dialog_t | Vbox_t | Hbox_t | BackgroundBox_t
proc `clientsize`*(ih: ClientsizeTypes): string {.cdecl.} =
  ## Returns the client area size of a container. It is the space available for positioning and sizing children, see the Layout Guide. It is the container Current size excluding the decorations (if any).
  ## 
  ## Value
  ## "widthxheight", where width and height are integer values corresponding to the horizontal and vertical size, respectively, in pixels. If both values are 0 then "0x0"is returned.
  ## 
  ## Affects
  ## All elements that are containers, except menus.
  ## 
  ## Notes
  ## (*) For IupDialog is NOT read-only, and it will re-define RASTERSIZE by adding the decorations to the given Client size. (Since 3.3)
  ## For IupHbox, IupVbox and IupGridBox it consider the MARGIN attribute as a decoration.
  ## For IupSplit returns the total area available for the two children.
  return $GetAttribute(cast[PIhandle](ih), "CLIENTSIZE")


type ClipboardTypes* = List_t | Text_t | MultiLine_t
proc `clipboard=`*(ih: ClipboardTypes, value: string) {.cdecl.} =
  ## (write-only): clear, cut, copy or paste the selection to or from the clipboard. Values: "CLEAR", "CUT", "COPY"or "PASTE". In Windows UNDO is also available, and REDO is available when FORMATTING=YES. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "CLIPBOARD", value)

proc `clipboard`*(ih: ClipboardTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CLIPBOARD", value)


type CliprectTypes* = Canvas_t
proc `cliprect=`*(ih: CliprectTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only] (only during ACTION): Specifies a rectangle that has its region invalidated for painting, it could be used for clipping. Format: "%d %d %d %d"="x1 y1 x2 y2".
  SetAttribute(cast[PIhandle](ih), "CLIPRECT", value)

proc `cliprect`*(ih: CliprectTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CLIPRECT", value)

proc `cliprect`*(ih: CliprectTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CLIPRECT")

proc `cliprect`*(ih: CliprectTypes, x1, y1, x2, y2: int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CLIPRECT", cstring(&"{x1} {y1} {x2} {y2}"))

type CmarginTypes* = Vbox_t | Hbox_t
proc `cmargin=`*(ih: CmarginTypes, value: string) {.cdecl.} =
  ## Defines a margin in pixels, CMARGIN is in the same units of the SIZE attribute. Its value has the format "widthxheight", where width and height are integer values corresponding to the horizontal and vertical margins, respectively. Default: "0x0"(no margin). (CMARGIN since 3.0)
  SetAttribute(cast[PIhandle](ih), "CMARGIN", value)

proc `cmargin`*(ih: CmarginTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CMARGIN", value)

proc `cmargin`*(ih: CmarginTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CMARGIN")

proc `cmargin`*(ih: CmarginTypes, width, height:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CMARGIN", cstring(&"{width}x{height}"))

type CompositedTypes* = Dialog_t
proc `composited=`*(ih: CompositedTypes, value: string) {.cdecl.} =
  ## [Windows Only] (creation only): controls if the window will have an automatic double buffer for all children. Default is "NO". In Windows Vista it is NOT working as expected. It is NOT compatible with IupCanvas and all derived IUP controls such as IupFlat*, IupGL*, IupPlot and IupMatrix, because IupCanvas uses CS_OWNDC in the window class.
  SetAttribute(cast[PIhandle](ih), "COMPOSITED", value)

proc `composited`*(ih: CompositedTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "COMPOSITED", value)

proc `composited`*(ih: CompositedTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "COMPOSITED")


type ControlTypes* = Dialog_t
proc `control=`*(ih: ControlTypes, value: string) {.cdecl.} =
  ## Windows only. Whether the dialog is embedded inside the parent window or has a window of its own.
  ## 
  ## Value
  ## YES or NO. If the value is YES, the dialog will appear embedded inside its parent window (you must set a parent, either with PARENTDIALOG or NATIVEPARENT, or this setting will be ignored). If the value is NO, the dialog will have its own window.
  ## 
  ## Notes
  ## This is useful for implementing ActiveX controls, with the help of the LuaCOM library. ActiveX controls run embedded inside another window. LuaCOM will send a window creation event the the control, passing a handle to the parent window and the size of the control. You can use this to set the dialog's NATIVEPARENT and RASTERSIZE attributes. See the LuaCOM documentation for more information.
  SetAttribute(cast[PIhandle](ih), "CONTROL", value)

proc `control`*(ih: ControlTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CONTROL", value)

proc `control`*(ih: ControlTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CONTROL")


type CountTypes* = Text_t | MultiLine_t
proc `count`*(ih: CountTypes): string {.cdecl.} =
  ## (read-only): returns the number of characters in the text, including the line breaks. (since 3.5)
  return $GetAttribute(cast[PIhandle](ih), "COUNT")


type CountlstTypes* = List_t
proc `count`*(ih: CountlstTypes): string {.cdecl.} =
  ## (read-only) (non inheritable): returns the number of items. Before mapping it counts the number of non NULL items before the first NULL item. (since 3.0)
  return $GetAttribute(cast[PIhandle](ih), "COUNT")


type CpaddingTypes* = Button_t | Label_t | Text_t | MultiLine_t
proc `cpadding=`*(ih: CpaddingTypes, value: string) {.cdecl.} =
  ## same as PADDING but using the units of the SIZE attribute. It will actually set the PADDING attribute. (since 3.29)
  SetAttribute(cast[PIhandle](ih), "CPADDING", value)

proc `cpadding`*(ih: CpaddingTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CPADDING", value)

proc `cpadding`*(ih: CpaddingTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CPADDING")


type CspacingTypes* = Button_t | List_t
proc `cspacing=`*(ih: CspacingTypes, value: string) {.cdecl.} =
  ## same as SPACING but using the units of the vertical part of the SIZE attribute. It will actually set the SPACING attribute. (since 3.29)
  SetAttribute(cast[PIhandle](ih), "CSPACING", value)

proc `cspacing`*(ih: CspacingTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CSPACING", value)

proc `cspacing`*(ih: CspacingTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CSPACING")


type CuebannerTypes* = List_t | Text_t | MultiLine_t
proc `cuebanner=`*(ih: CuebannerTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only] (non inheritable): a text that is displayed when there is no text at the control. It works as a textual cue, or tip to prompt the user for input. Valid only for MULTILINE=NO, and works only when Visual Styles are enabled. (since 3.0) [GTK 3.2] (GTK support added in IUP 3.20)
  SetAttribute(cast[PIhandle](ih), "CUEBANNER", value)

proc `cuebanner`*(ih: CuebannerTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CUEBANNER", value)

proc `cuebanner`*(ih: CuebannerTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CUEBANNER")


type CursorTypes* = Canvas_t | Dialog_t
proc `cursor=`*(ih: CursorTypes, value: string) {.cdecl.} =
  ## Defines the element's cursor.ValueName of a cursor.It will check first for the following predefined names: "NONE"or "NULL"--- "APPSTARTING"(Windows Only)"ARROW""BUSY""CROSS""HAND""HELP""MOVE"--- "NO"(Windows Only)"PEN"(*)"RESIZE_N""RESIZE_S""RESIZE_NS""RESIZE_W""RESIZE_E""RESIZE_WE""RESIZE_NE""RESIZE_SW""RESIZE_NW""RESIZE_SE""SPLITTER_HORIZ""SPLITTER_VERT""TEXT""UPARROW"Default: "ARROW"(*) To use this cursor on Windows, the iup.rc file, provided with IUP, must be linked with the application (except when using the IUP DLL).The Windows SDK recommends that cursors and icons should be implemented as resources rather than created at run time.The GTK cursors have the same appearance of the X-Windows cursors. Althought GTK cursors can have more than 2 colors depending on the X-Server.If it is not a pre-defined name, then will check for other system cursors. In Windows the value will be used to load a cursor form the application resources. In Motif the value will be used as a X-Windows cursor number, see definitions in the X11 header "cursorfont.h". In GTK the value will be used as a cursor name, see the GDK documentation on Cursors.If no system cursors were found then the value will be used to try to find an IUP image with the same name. Use IupSetHandle to define a name for an IupImage. But the image will need an extra attribute and some specific characteristics, see notes below.NotesFor an image to represent a cursor, it should has the attribute "HOTSPOT"to define the cursor hotspot (place where the mouse click is actually effective). The default value is "0:0".Usually only color indices 0, 1 and 2 can be used in a cursor, where 0 will be transparent (must be "BGCOLOR"). The RGB colors corresponding to indices 1 and 2 are defined just as in regular images. In Windows and GTK the cursor can have more than 2 colors. Cursor sizes are usually less than or equal to 32x32.The cursor will only change when the interface system regains control or when IupFlush is called.The Windows SDK recommends that cursors and icons should be implemented as resources rather than created at run time.When the cursor image is no longer necessary, it must be destroyed through function IupDestroy. Attention: the cursor cannot be in use when it is destroyed.
  SetAttribute(cast[PIhandle](ih), "CURSOR", value)

proc `cursor`*(ih: CursorTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CURSOR", value)

proc `cursor`*(ih: CursorTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CURSOR")


type CustomframeTypes* = Dialog_t
proc `customframe=`*(ih: CustomframeTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only] (non inheritable): allows the application to customize the dialog frame elements (the title and its buttons) by using IUP controls for its elements like caption, minimize button, maximize button, and close buttons. The custom frame support uses the native system support for custom frames. The application is responsible for leaving space for the borders. One drawback is that menu bars will not work. For the dialog to be able to be moved an IupLabel or an IupCanvas must be at the top of the dialog and must have the NAME attribute set to CUSTOMFRAMECAPTION (since 3.22). Native custom frames are supported only in Windows and in GTK version 3.10, so for older GTK versions we have to simulate the support using CUSTOMFRAMESIMULATE. (since 3.18) (renamed in 3.22) (GTK support since 3.22) See the Custom Frame notes bellow.
  SetAttribute(cast[PIhandle](ih), "CUSTOMFRAME", value)

proc `customframe`*(ih: CustomframeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CUSTOMFRAME", value)

proc `customframe`*(ih: CustomframeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CUSTOMFRAME")


type CustomframecaptionheightTypes* = Dialog_t
proc `customframecaptionheight=`*(ih: CustomframecaptionheightTypes, value: string) {.cdecl.} =
  ## [Windows Only] (non inheritable): height of the caption area. If not defined it will use the system size. (since 3.18) (renamed in 3.22)
  SetAttribute(cast[PIhandle](ih), "CUSTOMFRAMECAPTIONHEIGHT", value)

proc `customframecaptionheight`*(ih: CustomframecaptionheightTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CUSTOMFRAMECAPTIONHEIGHT", value)

proc `customframecaptionheight`*(ih: CustomframecaptionheightTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CUSTOMFRAMECAPTIONHEIGHT")


type CustomframecaptionlimitsTypes* = Dialog_t
proc `customframecaptionlimits=`*(ih: CustomframecaptionlimitsTypes, value: string) {.cdecl.} =
  ## [Windows Only] (non inheritable): limits of the caption area at left and at right. The caption area is always expanded inside the limits when the dialog is resized. Format is "left:right"or in C "%d:%d". Default: "0:0". This will allow the dialog to be moved by the system when the user click and drag the caption area. If not defined but CUSTOMFRAMECAPTION is defined, then it will use the caption element horizontal position and size for the limits (since 3.22). (since 3.18)
  SetAttribute(cast[PIhandle](ih), "CUSTOMFRAMECAPTIONLIMITS", value)

proc `customframecaptionlimits`*(ih: CustomframecaptionlimitsTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CUSTOMFRAMECAPTIONLIMITS", value)

proc `customframecaptionlimits`*(ih: CustomframecaptionlimitsTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CUSTOMFRAMECAPTIONLIMITS")


type CustomframedrawTypes* = Dialog_t
proc `customframedraw=`*(ih: CustomframedrawTypes, value: string) {.cdecl.} =
  ## [Windows Only] (non inheritable): allows the application to customize the dialog frame elements (the title and its buttons) by drawing them with the CUSTOMFRAMEDRAW_CB callback. Can be Yes or No. The Window client area is expanded to include the whole window. Notice that the dialog attributes like BORDER, RESIZE, MAXBOX, MINBOX and TITLE must still be defined. But maximize, minimize and close buttons must be manually implemented in the BUTTON_CB callback. One drawback is that menu bars will not work. (since 3.18) (renamed in 3.22)
  SetAttribute(cast[PIhandle](ih), "CUSTOMFRAMEDRAW", value)

proc `customframedraw`*(ih: CustomframedrawTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CUSTOMFRAMEDRAW", value)

proc `customframedraw`*(ih: CustomframedrawTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CUSTOMFRAMEDRAW")


type CustomframesimulateTypes* = Dialog_t
proc `customframesimulate=`*(ih: CustomframesimulateTypes, value: string) {.cdecl.} =
  ## allows the application to customize the dialog frame elements (the title and its buttons) by using IUP controls for its elements like caption, minimize button, maximize button, and close buttons. The custom frame support is entirely simulated by IUP, no native support for custom frame is used (this seems to have less drawbacks on the application behavior). The application is responsible for leaving space for the borders. One drawback is that menu bars will not work. For the dialog to be able to be moved an IupLabel, or a IupFlatLabel or an IupCanvas must be at the top of the dialog and must have the NAME attribute set to CUSTOMFRAMECAPTION. See the Custom Frame notes bellow. (since 3.28)
  ## 
  ## By setting this attribute the following attributes will be set:
  ## RESIZE=NO
  ## MENUBOX=NO
  ## MAXBOX=NO
  ## MINBOX=NO
  ## BORDER=NO
  ## TITLE=NULL
  ## MENU=NULL
  ## TASKBARBUTTON=SHOW
  ## 
  ## The BUTTON_CB and MOTION_CB callbacks of the dialog will be set too, so the dialog can be resized. The BUTTON_CB and MOTION_CB callbacks of the element with NAME=CUSTOMFRAMECAPTION  will also be changed so the dialog can be moved and maximized with double click. Its the application responsibility to implement the minimize, maximize and close buttons.
  SetAttribute(cast[PIhandle](ih), "CUSTOMFRAMESIMULATE", value)

proc `customframesimulate`*(ih: CustomframesimulateTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CUSTOMFRAMESIMULATE", value)

proc `customframesimulate`*(ih: CustomframesimulateTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CUSTOMFRAMESIMULATE")


type DefaultenterTypes* = Dialog_t
proc `defaultenter=`*(ih: DefaultenterTypes, value: string) {.cdecl.} =
  ## Name of the button activated when the user press Enter when focus is in another control of the dialog. Use IupSetHandle or IupSetAttributeHandle to associate a button to a name.
  SetAttribute(cast[PIhandle](ih), "DEFAULTENTER", value)

proc `defaultenter`*(ih: DefaultenterTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DEFAULTENTER", value)

proc `defaultenter=`*(ih: DefaultenterTypes, value: Button_t) {.cdecl.} =
  SetAttributeHandle(cast[PIhandle](ih), "DEFAULTENTER", cast[PIhandle](value))

proc `defaultenter`*(ih: DefaultenterTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DEFAULTENTER")


type DefaultescTypes* = Dialog_t
proc `defaultesc=`*(ih: DefaultescTypes, value: string) {.cdecl.} =
  ## Name of the button activated when the user press Esc when focus is in another control of the dialog. Use IupSetHandle or IupSetAttributeHandle to associate a button to a name.
  SetAttribute(cast[PIhandle](ih), "DEFAULTESC", value)

proc `defaultesc`*(ih: DefaultescTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DEFAULTESC", value)

proc `defaultesc=`*(ih: DefaultescTypes, value: Button_t) {.cdecl.} =
  SetAttributeHandle(cast[PIhandle](ih), "DEFAULTESC", cast[PIhandle](value))

proc `defaultesc`*(ih: DefaultescTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DEFAULTESC")


type DialogframeTypes* = Dialog_t
proc `dialogframe=`*(ih: DialogframeTypes, value: string) {.cdecl.} =
  ## Set the common decorations for modal dialogs. This means RESIZE=NO, MINBOX=NO and MAXBOX=NO. In Windows, if the PARENTDIALOG is defined then the MENUBOX is also removed, but the Close button remains.
  SetAttribute(cast[PIhandle](ih), "DIALOGFRAME", value)

proc `dialogframe`*(ih: DialogframeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DIALOGFRAME", value)

proc `dialogframe`*(ih: DialogframeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DIALOGFRAME")


type DialoghintTypes* = Dialog_t
proc `dialoghint=`*(ih: DialoghintTypes, value: string) {.cdecl.} =
  ## [GTK Only] (creation-only): if enabled sets the window type hint to a dialog hint.
  SetAttribute(cast[PIhandle](ih), "DIALOGHINT", value)

proc `dialoghint`*(ih: DialoghintTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DIALOGHINT", value)

proc `dialoghint`*(ih: DialoghintTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DIALOGHINT")


type DisabledtxtfmtTypes* = User_t
proc `disabled=`*(ih: DisabledtxtfmtTypes, value: string) {.cdecl.} =
  ## [Windows Only]: Can be YES or NO. Default NO. Set the visual appearance to disabled.
  SetAttribute(cast[PIhandle](ih), "DISABLED", value)

proc `disabled`*(ih: DisabledtxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DISABLED", value)

proc `disabled`*(ih: DisabledtxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DISABLED")


type DpiTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `dpi=`*(ih: DpiTypes, value: string) {.cdecl.} =
  ## resolution expected for display. Used when AUTOSCALE=DPI. If not defined the global attribute IMAGESDPI will be used. (since 3.23)
  SetAttribute(cast[PIhandle](ih), "DPI", value)

proc `dpi`*(ih: DpiTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DPI", value)

proc `dpi`*(ih: DpiTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DPI")


type DragcursorTypes* = Canvas_t | Label_t | List_t | Dialog_t
proc `dragcursor=`*(ih: DragcursorTypes, value: string) {.cdecl.} =
  ## (non inheritable): name of an image to be used as cursor during drag. Use IupSetHandle or IupSetAttributeHandle to associate an image to a name. See also IupImage. (since 3.11)
  SetAttribute(cast[PIhandle](ih), "DRAGCURSOR", value)

proc `dragcursor`*(ih: DragcursorTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DRAGCURSOR", value)

proc `dragcursor`*(ih: DragcursorTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DRAGCURSOR")


type DragdroplistTypes* = List_t
proc `dragdroplist=`*(ih: DragdroplistTypes, value: string) {.cdecl.} =
  ## (non inheritable): prepare the Drag &Drop callbacks to support drag and drop of items between lists (IupList or IupFlatList), in the same IUP application. Drag &Drop attributes still need to be set in order to activate the drag &drop support, so the application can control if this list will be source and/or target. Default: NO. (since 3.10)
  SetAttribute(cast[PIhandle](ih), "DRAGDROPLIST", value)

proc `dragdroplist`*(ih: DragdroplistTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DRAGDROPLIST", value)

proc `dragdroplist`*(ih: DragdroplistTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DRAGDROPLIST")


type DragsourceTypes* = Canvas_t | Label_t | List_t | Dialog_t
proc `dragsource=`*(ih: DragsourceTypes, value: string) {.cdecl.} =
  ## (non inheritable): Set up a control as a source for drag operations. Default: NO.
  SetAttribute(cast[PIhandle](ih), "DRAGSOURCE", value)

proc `dragsource`*(ih: DragsourceTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DRAGSOURCE", value)

proc `dragsource`*(ih: DragsourceTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DRAGSOURCE")


type DragsourcemoveTypes* = Canvas_t | Label_t | List_t | Dialog_t
proc `dragsourcemove=`*(ih: DragsourcemoveTypes, value: string) {.cdecl.} =
  ## (non inheritable): Enables the move action. Default: NO (only copy is enabled).
  SetAttribute(cast[PIhandle](ih), "DRAGSOURCEMOVE", value)

proc `dragsourcemove`*(ih: DragsourcemoveTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DRAGSOURCEMOVE", value)

proc `dragsourcemove`*(ih: DragsourcemoveTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DRAGSOURCEMOVE")


type DragtypesTypes* = Canvas_t | Label_t | List_t | Dialog_t
proc `dragtypes=`*(ih: DragtypesTypes, value: string) {.cdecl.} =
  ## (non inheritable): A list of data types that are supported by the source. Accepts a string with one or more names separated by commas. See Notes bellow for a list of known names. Must be set.
  ## 
  ## Notes
  ## 
  ## Drag and Drop support can be set independently. A control can have drop without drag support and vice-versa.
  ## Here are some common Drag&Drop types defined by existing applications:
  ## "TEXT"used for regular text without formatting. Automatically translated to CF_TEXT in Windows.
  ## content MIME types, like "text/uri-list", "text/html", "image/png", "image/jpeg", "image/bmp"and "image/gif".
  ## "UTF8_STRING"in GTK and "UNICODETEXT"in Windows.
  ## "COMPOUND_TEXT"in GTK and "Rich Text Format"in Windows.
  ## "BITMAP"and "DIB"in Windows. Automatically translated to CF_BITMAP and CF_DIB.
  SetAttribute(cast[PIhandle](ih), "DRAGTYPES", value)

proc `dragtypes`*(ih: DragtypesTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DRAGTYPES", value)

proc `dragtypes`*(ih: DragtypesTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DRAGTYPES")


type DrawdriverTypes* = Canvas_t
proc `drawdriver`*(ih: DrawdriverTypes): string {.cdecl.} =
  ## (read-only): returns the name of the draw driver in use by the IupDraw API. Can be: X11 (Motif), GDK (GTK), Cairo (GTK), D2D (Windows), GDI+ (Windows) or GDI (Windows). (since 3.25)
  return $GetAttribute(cast[PIhandle](ih), "DRAWDRIVER")


type DrawsizeTypes* = Canvas_t
proc `drawsize=`*(ih: DrawsizeTypes, value: string) {.cdecl.} =
  ## (non inheritable): The size of the drawing area in pixels. This size is also used in the RESIZE_CB callback.
  ## Notice that the drawing area size is not the same as RASTERSIZE. The SCROLLBAR and BORDER attributes affect the size of the drawing area.
  SetAttribute(cast[PIhandle](ih), "DRAWSIZE", value)

proc `drawsize`*(ih: DrawsizeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DRAWSIZE", value)

proc `drawsize`*(ih: DrawsizeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DRAWSIZE")


type DrawusegdiTypes* = Canvas_t
proc `drawusegdi=`*(ih: DrawusegdiTypes, value: string) {.cdecl.} =
  ## [Windows Only] (non inheritable): force the use of the old GDI driver, instead of the new DirectD2 driver. Used in the IupGauge, IupMatrix and Flat Scrollbars for better performance and backward compatibility. (since 3.26)
  SetAttribute(cast[PIhandle](ih), "DRAWUSEGDI", value)

proc `drawusegdi`*(ih: DrawusegdiTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DRAWUSEGDI", value)

proc `drawusegdi`*(ih: DrawusegdiTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DRAWUSEGDI")


type DropdownTypes* = List_t
proc `dropdown=`*(ih: DropdownTypes, value: string) {.cdecl.} =
  ## (creation only): Changes the appearance of the list for the user: only the selected item is shown beside a button with the image of an arrow pointing down. To select another option, the user must press this button, which displays all items in the list. Can be "YES"or "NO". Default "NO".
  SetAttribute(cast[PIhandle](ih), "DROPDOWN", value)

proc `dropdown`*(ih: DropdownTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DROPDOWN", value)

proc `dropdown`*(ih: DropdownTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DROPDOWN")


type DropexpandTypes* = List_t
proc `dropexpand=`*(ih: DropexpandTypes, value: string) {.cdecl.} =
  ## [Windows Only]: When DROPDOWN=Yes the size of the dropped list will expand to include the largest text. Can be "YES"or "NO". Default: "YES".
  SetAttribute(cast[PIhandle](ih), "DROPEXPAND", value)

proc `dropexpand`*(ih: DropexpandTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DROPEXPAND", value)

proc `dropexpand`*(ih: DropexpandTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DROPEXPAND")


type DropfilestargetTypes* = Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `dropfilestarget=`*(ih: DropfilestargetTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only] (non inheritable): Enable or disable the drop of files. Default: NO, but if DROPFILES_CB is defined when the element is mapped then it will be automatically enabled. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "DROPFILESTARGET", value)

proc `dropfilestarget`*(ih: DropfilestargetTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DROPFILESTARGET", value)

proc `dropfilestarget`*(ih: DropfilestargetTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DROPFILESTARGET")


type DroptargetTypes* = Canvas_t | Label_t | List_t | Dialog_t
proc `droptarget=`*(ih: DroptargetTypes, value: string) {.cdecl.} =
  ## (non inheritable): Set up a control as a destination for drop operations. Default: NO.
  SetAttribute(cast[PIhandle](ih), "DROPTARGET", value)

proc `droptarget`*(ih: DroptargetTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DROPTARGET", value)

proc `droptarget`*(ih: DroptargetTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DROPTARGET")


type DroptypesTypes* = Canvas_t | Label_t | List_t | Dialog_t
proc `droptypes=`*(ih: DroptypesTypes, value: string) {.cdecl.} =
  ## (non inheritable): A list of data types that are supported by the target. Accepts a string with one or more names separated by commas. See Notes bellow for a list of known names. Must be set.
  ## 
  ## Notes
  ## 
  ## Drag and Drop support can be set independently. A control can have drop without drag support and vice-versa.
  ## Here are some common Drag&Drop types defined by existing applications:
  ## "TEXT"used for regular text without formatting. Automatically translated to CF_TEXT in Windows.
  ## content MIME types, like "text/uri-list", "text/html", "image/png", "image/jpeg", "image/bmp"and "image/gif".
  ## "UTF8_STRING"in GTK and "UNICODETEXT"in Windows.
  ## "COMPOUND_TEXT"in GTK and "Rich Text Format"in Windows.
  ## "BITMAP"and "DIB"in Windows. Automatically translated to CF_BITMAP and CF_DIB.
  SetAttribute(cast[PIhandle](ih), "DROPTYPES", value)

proc `droptypes`*(ih: DroptypesTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DROPTYPES", value)

proc `droptypes`*(ih: DroptypesTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DROPTYPES")


type DxcanvasTypes* = Canvas_t
proc `dx=`*(ih: DxcanvasTypes, value: string) {.cdecl.} =
  ## Size of the thumb in the horizontal scrollbar. Also the horizontal page size. Default: "0.1".
  SetAttribute(cast[PIhandle](ih), "DX", value)

proc `dx`*(ih: DxcanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DX", value)

proc `dx`*(ih: DxcanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DX")


type DycanvasTypes* = Canvas_t
proc `dy=`*(ih: DycanvasTypes, value: string) {.cdecl.} =
  ## Size of the thumb in the vertical scrollbar. Also the vertical page size. Default: "0.1".
  SetAttribute(cast[PIhandle](ih), "DY", value)

proc `dy`*(ih: DycanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DY", value)

proc `dy`*(ih: DycanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DY")


type EditboxTypes* = List_t
proc `editbox=`*(ih: EditboxTypes, value: string) {.cdecl.} =
  ## (creation only): Adds an edit box to the list. Can be "YES"or "NO". Default "NO".
  SetAttribute(cast[PIhandle](ih), "EDITBOX", value)

proc `editbox`*(ih: EditboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "EDITBOX", value)

proc `editbox`*(ih: EditboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "EDITBOX")


type EllipsisTypes* = Label_t
proc `ellipsis=`*(ih: EllipsisTypes, value: string) {.cdecl.} =
  ## [Windows and GTK only]: add an ellipsis: "..."to the text if there is not enough space to render the entire string. Can be "YES"or "NO". Default: "NO". (since 3.0) (GTK 2.6)
  SetAttribute(cast[PIhandle](ih), "ELLIPSIS", value)

proc `ellipsis`*(ih: EllipsisTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ELLIPSIS", value)

proc `ellipsis`*(ih: EllipsisTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ELLIPSIS")


type ExpandTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `expand=`*(ih: ExpandTypes, value: string) {.cdecl.} =
  ## Allows the element to expand, fulfilling empty spaces inside its container.
  ## It is a non inheritable attribute, but a container inherit its parents EXPAND attribute. In other words, although EXPAND is non inheritable, it is inheritable for containers. So if you set it at a container it will not affect its children, except for those who are containers.
  ## The expansion is done equally for all expandable elements in the same container.
  ## For a container, the actual EXPAND value will be always a combination of its own value and the value of its children. In the sense that a container can only expand if its children can expand too in the same direction.
  ## The HORIZONTALFREE and VERTICALFREE values will not behave as normal expansion. These values will NOT affect the expansion of the container when set at its children, the children will simply expand to the available free space at the container. (Since 3.11)
  ## See the Layout Guide for more details on sizes.
  SetAttribute(cast[PIhandle](ih), "EXPAND", value)

proc `expand`*(ih: ExpandTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "EXPAND", value)

proc `expand`*(ih: ExpandTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "EXPAND")


type ExpandchildrenTypes* = Vbox_t | Hbox_t
proc `expandchildren=`*(ih: ExpandchildrenTypes, value: string) {.cdecl.} =
  ## (non inheritable): forces all children to expand horizontally and to fully occupy its space available inside the box. Default: "NO". This has the same effect as setting EXPAND=HORIZONTAL on each child. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "EXPANDCHILDREN", value)

proc `expandchildren`*(ih: ExpandchildrenTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "EXPANDCHILDREN", value)

proc `expandchildren`*(ih: ExpandchildrenTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "EXPANDCHILDREN")


type FgcolorTypes* = Button_t | Label_t | List_t | Text_t | MultiLine_t | Toggle_t
proc `fgcolor=`*(ih: FgcolorTypes, value: string) {.cdecl.} =
  ## Text color. Default: the global attribute DLGFGCOLOR.
  SetAttribute(cast[PIhandle](ih), "FGCOLOR", value)

proc `fgcolor`*(ih: FgcolorTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FGCOLOR", value)

proc `fgcolor`*(ih: FgcolorTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FGCOLOR")

proc `fgcolor`*(ih: FgcolorTypes, red, green, blue:int, alpha:int = 255) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FGCOLOR", cstring(&"{red} {green} {blue} {alpha}"))

type FgcolortxtfmtTypes* = User_t
proc `fgcolor=`*(ih: FgcolortxtfmtTypes, value: string) {.cdecl.} =
  ## string containing a color in the format "rrr ggg bbb"for the text.
  SetAttribute(cast[PIhandle](ih), "FGCOLOR", value)

proc `fgcolor`*(ih: FgcolortxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FGCOLOR", value)

proc `fgcolor`*(ih: FgcolortxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FGCOLOR")

proc `fgcolor`*(ih: FgcolortxtfmtTypes, red, green, blue:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FGCOLOR", cstring(&"{red} {green} {blue}"))

type FgcolorfrmTypes* = Frame_t
proc `fgcolor=`*(ih: FgcolorfrmTypes, value: string) {.cdecl.} =
  ## Text title color. Not available in Windows when using Windows Visual Styles. Default: the global attribute DLGFGCOLOR.
  SetAttribute(cast[PIhandle](ih), "FGCOLOR", value)

proc `fgcolor`*(ih: FgcolorfrmTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FGCOLOR", value)

proc `fgcolor`*(ih: FgcolorfrmTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FGCOLOR")


type FilterTypes* = List_t | Text_t | MultiLine_t
proc `filter=`*(ih: FilterTypes, value: string) {.cdecl.} =
  ## [Windows Only] (non inheritable): allows a custom filter to process the characters: Can be LOWERCASE, UPPERCASE or NUMBER (only numbers allowed). (since 3.0)
  SetAttribute(cast[PIhandle](ih), "FILTER", value)

proc `filter`*(ih: FilterTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FILTER", value)

proc `filter`*(ih: FilterTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FILTER")


type FlatTypes* = Button_t | Toggle_t
proc `flat=`*(ih: FlatTypes, value: string) {.cdecl.} =
  ## (creation only): Hides the button borders until the mouse cursor enters the button area. The border space is always there. Can be YES or NO. Default: NO.
  SetAttribute(cast[PIhandle](ih), "FLAT", value)

proc `flat`*(ih: FlatTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FLAT", value)

proc `flat`*(ih: FlatTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FLAT")


type FontTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `font=`*(ih: FontTypes, value: string) {.cdecl.} =
  ## Value
  ## 
  ## Font description containing typeface, style and size. Default: the global attribute DEFAULTFONT.
  ## The common format definition is similar to the the Pango library Font Description, used by GTK+. It is defined as having 3 parts: "<font face>, <font styles><font size>".
  ## Font face is the font face name, and can be any name. Although only names recognized by the system will be actually used. The names Helvetica, Courier and Times are always accepted in all systems.
  ## The supported font style is a combination of: Bold, Italic, Underline and Strikeout. The Pango format include many other definitions not supported by the common format, they are supported only by the GTK driver. Unsupported values are simply ignored. The names must be in the same case describe here.
  ## Font size is in points (1/72 inch) or in pixels (using negative values).
  ## Returned values will be the same value when changing the attribute, except for the old font names that will be converted to the new common format definition.
  ## 
  ## Windows
  ## The DEFAULTFONT is retrieved from the System Settings (see below), if this failed then "Tahoma, 10"for Windows XP, or "Segoe UI, 9"since Windows Vista, is assumed.
  ## The native handle can be obtained using the "HFONT"attribute.
  ## In "Control Panel", open the "Display Properties"then click on "Advanced"and select "Message Box"and change its Font to affect the default font for applications. In Vista go to "Window Color and Appearance", then "Open Classic Appearance", then Advanced.
  ## 
  ## Motif
  ## The DEFAULTFONT is retrieved from the user resource file (see below), if failed then "Fixed, 11"is assumed.
  ## The X-Windows Logical Font Description format (XLFD) is also supported.
  ## The native handle can be obtained using the "XMFONTLIST"and "XFONTSTRUCT"attributes. The selected X Logical Font Description string can be obtained from the attribute "XLFD".
  ## You can use the xfontsel program to obtain a string in the X-Windows Logical Font Description format (XLFD). Noticed that the first size entry of the X-Windows font string format (pxlsz) is in pixels and the next one (ptSz) is in deci-points (multiply the value in points by 10).
  ## Be aware that the resource files ".Xdefaults"and "Iup"in the user home folder can affect the default font and many others visual appearance features in Motif.
  ## 
  ## GTK
  ## The DEFAULTFONT is retrieved from the style defined by GNOME (see below), if failed "Sans, 10"is assumed.
  ## The X-Windows Logical Font Description format (XLFD) is also supported.
  ## The native handle can be obtained using the "PANGOFONTDESC"attribute.
  ## Font face can be a list of fonts face names in GTK. For example "Arial,Helvetica, 12". Not accepted in the other drivers.
  ## Style can also be a combination of: Small-Caps, [Ultra-Light|Light|Medium|Semi-Bold|Bold|Ultra-Bold|Heavy], [Ultra-Condensed|Extra-Condensed|Condensed|Semi-Condensed|Semi-Expanded|Expanded|Extra-Expanded|Ultra-Expanded]. Those values can be used only when the string is a full Pango compliant font, i.e. no underline, no strikeout and size>0.
  ## In GNOME, go to the "Appearance Preferences"tool, then in the Fonts tab change the Applications Font to affect the default font.
  ## 
  ## Notes
  ## 
  ## When FONT is changed and SIZE is set, then RASTERSIZE is also updated.
  ## Since font face names are not a standard between Windows, Motif and GTK, a few names are specially handled to improve application portability. If you want to use names that work for all systems we recommend using: Courier, Times and Helvetica (same as Motif). Those names always have a native system name equivalent. If you use those names IUP will automatically map to the native system equivalent. See the table below:
  ## Recommended/Motif | Windows | GTK | Description
  ## Helvetica | Arial | Sans | without serif, variable spacing
  ## Courier | Courier New  | Monospace | with serif, fixed spacing
  ## Times | Times New Roman | Serif | with serif, variable spacing
  ## 
  ## Since version 3.9, IUP supports also the UTF-8 (ISO10646-1) encoding in the GTK and Windows drivers. To specify a string in UTF-8 encoding set the global attribute "UTF8MODE"to "Yes".
  SetAttribute(cast[PIhandle](ih), "FONT", value)

proc `font`*(ih: FontTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FONT", value)

proc `font`*(ih: FontTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FONT")


type FontfaceTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `fontface=`*(ih: FontfaceTypes, value: string) {.cdecl.} =
  ## (non inheritable) Replaces or returns the face name of the current FONT attribute.
  SetAttribute(cast[PIhandle](ih), "FONTFACE", value)

proc `fontface`*(ih: FontfaceTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FONTFACE", value)

proc `fontface`*(ih: FontfaceTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FONTFACE")


type FontfacetxtfmtTypes* = User_t
proc `fontface=`*(ih: FontfacetxtfmtTypes, value: string) {.cdecl.} =
  ## the face name of the font.
  SetAttribute(cast[PIhandle](ih), "FONTFACE", value)

proc `fontface`*(ih: FontfacetxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FONTFACE", value)

proc `fontface`*(ih: FontfacetxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FONTFACE")


type FontscaletxtfmtTypes* = User_t
proc `fontscale=`*(ih: FontscaletxtfmtTypes, value: string) {.cdecl.} =
  ## a size scale relative to the selected or current size. Values greatter than 1 will increase the font. Values smaller than 1 will shirnk the font. Default: 1.0. The following values are also accpeted: "XX-SMALL"(0.58), "X-SMALL"(0.64), "SMALL"(0.83), "MEDIUM"(1.0), "LARGE"(1.2), "X-LARGE"(1.44), "XX-LARGE"(1.73).
  SetAttribute(cast[PIhandle](ih), "FONTSCALE", value)

proc `fontscale`*(ih: FontscaletxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FONTSCALE", value)

proc `fontscale`*(ih: FontscaletxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FONTSCALE")


type FontsizeTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `fontsize=`*(ih: FontsizeTypes, value: string) {.cdecl.} =
  ## (non inheritable) Replaces or returns the size of the current FONT attribute.
  SetAttribute(cast[PIhandle](ih), "FONTSIZE", value)

proc `fontsize`*(ih: FontsizeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FONTSIZE", value)

proc `fontsize`*(ih: FontsizeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FONTSIZE")


type FontsizetxtfmtTypes* = User_t
proc `fontsize=`*(ih: FontsizetxtfmtTypes, value: string) {.cdecl.} =
  ## the size of the font in pixels or points. Pixel size uses negative values.
  SetAttribute(cast[PIhandle](ih), "FONTSIZE", value)

proc `fontsize`*(ih: FontsizetxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FONTSIZE", value)

proc `fontsize`*(ih: FontsizetxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FONTSIZE")


type FontstyleTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `fontstyle=`*(ih: FontstyleTypes, value: string) {.cdecl.} =
  ## (non inheritable) Replaces or returns the style of the current FONT attribute. Since font styles are case sensitive, this attribute is also case sensitive.
  SetAttribute(cast[PIhandle](ih), "FONTSTYLE", value)

proc `fontstyle`*(ih: FontstyleTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FONTSTYLE", value)

proc `fontstyle`*(ih: FontstyleTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FONTSTYLE")


type FormattingTypes* = Text_t | MultiLine_t
proc `formatting=`*(ih: FormattingTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only] (non inheritable): When enabled allow the use of text formatting attributes. In GTK is always enabled, but only when MULTILINE=YES. Default: NO. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "FORMATTING", value)

proc `formatting`*(ih: FormattingTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FORMATTING", value)

proc `formatting`*(ih: FormattingTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FORMATTING")

proc `formatting=`*(ih: FormattingTypes, yes:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FORMATTING", cstring((if yes: "YES" else: "NO")))

proc `formatting`*(ih: FormattingTypes, yes:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FORMATTING", cstring((if yes: "YES" else: "NO")))

type FoundryTypes* = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `foundry=`*(ih: FoundryTypes, value: string) {.cdecl.} =
  ## [Motif Only] (non inheritable) Allows to select a foundry for the FONT being selected. Must be set before setting the FONT attribute.
  SetAttribute(cast[PIhandle](ih), "FOUNDRY", value)

proc `foundry`*(ih: FoundryTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FOUNDRY", value)

proc `foundry`*(ih: FoundryTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "FOUNDRY")


type FullscreenTypes* = Dialog_t
proc `fullscreen=`*(ih: FullscreenTypes, value: string) {.cdecl.} =
  ## Makes the dialog occupy the whole screen over any system bars in the main monitor. All dialog details, such as title bar, borders, maximize button, etc, are removed. Possible values: YES, NO. In Motif you may have to click in the dialog to set its focus. In Motif if set to YES when the dialog is hidden, then it can not be changed after it is visible.
  SetAttribute(cast[PIhandle](ih), "FULLSCREEN", value)

proc `fullscreen`*(ih: FullscreenTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FULLSCREEN", value)

proc `fullscreen`*(ih: FullscreenTypes): bool {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ACTIVE") == "YES"

proc `fullscreen=`*(ih: FullscreenTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FULLSCREEN", cstring((if active: "YES" else: "NO")))

proc `fullscreen`*(ih: FullscreenTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "FULLSCREEN", cstring((if active: "YES" else: "NO")))

type GapTypes* = Dialog_t | Vbox_t | Hbox_t
proc `gap=`*(ih: GapTypes, value: string) {.cdecl.} =
  ## Defines a vertical space in pixels between the children, CGAP is in the same units of the SIZE attribute for the height. Default: "0". (CGAP since 3.0)
  SetAttribute(cast[PIhandle](ih), "GAP", value)

proc `gap`*(ih: GapTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "GAP", value)

proc `gap`*(ih: GapTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "GAP")

proc `gap=`*(ih: GapTypes, size: int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "GAP", cstring(&"{size}"))

proc `gap`*(ih: GapTypes, size: int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "GAP", cstring(&"{size}"))

type HeightTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `height`*(ih: HeightTypes): string {.cdecl.} =
  ## (read-only): Image height in pixels.
  return $GetAttribute(cast[PIhandle](ih), "HEIGHT")


type HelpbuttonTypes* = Dialog_t
proc `helpbutton=`*(ih: HelpbuttonTypes, value: string) {.cdecl.} =
  ## [Windows Only] (creation only): Inserts a help button in the same place of the maximize button. It can only be used for dialogs without the minimize and maximize buttons, and with the menu box. For the next interaction of the user with a control in the dialog, the callback HELP_CB will be called instead of the control defined ACTION callback. Possible values: YES, NO. Default: NO.
  SetAttribute(cast[PIhandle](ih), "HELPBUTTON", value)

proc `helpbutton`*(ih: HelpbuttonTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "HELPBUTTON", value)

proc `helpbutton`*(ih: HelpbuttonTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "HELPBUTTON")


type HidetaskbarTypes* = Dialog_t
proc `hidetaskbar=`*(ih: HidetaskbarTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only] (write-only): Action attribute that when set to "YES", hides the dialog, but does not decrement the visible dialog count, does not call SHOW_CB and does not mark the dialog as hidden inside IUP. It is usually used to hide the dialog and keep the tray icon working without closing the main loop. It has the same effect as setting LOCKLOOP=Yes and normally hiding the dialog. IMPORTANT: when you hide using HIDETASKBAR, you must show using HIDETASKBAR also. Possible values: YES, NO.
  SetAttribute(cast[PIhandle](ih), "HIDETASKBAR", value)

proc `hidetaskbar`*(ih: HidetaskbarTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "HIDETASKBAR", value)


type HidetitlebarTypes* = Dialog_t
proc `hidetitlebar=`*(ih: HidetitlebarTypes, value: string) {.cdecl.} =
  ## [GTK Only] (non inheritable): hides the title bar with al its elements. (since 3.20) (GTK 3.10)
  SetAttribute(cast[PIhandle](ih), "HIDETITLEBAR", value)

proc `hidetitlebar`*(ih: HidetitlebarTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "HIDETITLEBAR", value)

proc `hidetitlebar`*(ih: HidetitlebarTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "HIDETITLEBAR")


type HomogeneousTypes* = Vbox_t | Hbox_t
proc `homogeneous=`*(ih: HomogeneousTypes, value: string) {.cdecl.} =
  ## (non inheritable): forces all children to get equal vertical space. The space height will be based on the highest child. Default: "NO". Notice that this does not changes the children size, only the available space for each one of them to expand. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "HOMOGENEOUS", value)

proc `homogeneous`*(ih: HomogeneousTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "HOMOGENEOUS", value)

proc `homogeneous`*(ih: HomogeneousTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "HOMOGENEOUS")


type HotspotTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `hotspot=`*(ih: HotspotTypes, value: string) {.cdecl.} =
  ## Hotspot is the position inside a cursor image indicating the mouse-click spot. Its value is given by the x and y coordinates inside a cursor image. Its value has the format "x:y", where x and y are integers defining the coordinates in pixels. Default: "0:0".
  SetAttribute(cast[PIhandle](ih), "HOTSPOT", value)

proc `hotspot`*(ih: HotspotTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "HOTSPOT", value)

proc `hotspot`*(ih: HotspotTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "HOTSPOT")

proc `hotspot`*(ih: HotspotTypes, x, y:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "HOTSPOT", cstring(&"{x}:{y}"))

type HwndTypes* = Canvas_t | Dialog_t
proc `hwnd`*(ih: HwndTypes): string {.cdecl.} =
  ## [Windows Only] (non inheritable, read-only): Returns the Windows Window handle. Available in the Windows driver or in the GTK driver in Windows.
  return $GetAttribute(cast[PIhandle](ih), "HWND")


type IconTypes* = Dialog_t
proc `icon=`*(ih: IconTypes, value: string) {.cdecl.} =
  ## Dialog's icon. This icon will be used when the dialog is minimized among other places by the native system.
  ## 
  ## Value
  ## Name of a IUP image.
  ## Default: NULL
  ## 
  ## Notes
  ## Icon sizes are usually less than or equal to 32x32.
  ## The Windows SDK recommends that cursors and icons should be implemented as resources rather than created at run time. We suggest using an icon with at least 3 images: 16x16 32bpp, 32x32 32 bpp and 48x48 32 bpp.
  ## On Motif, it only works with some window managers, like mwm and gnome. Icon colors can have the BGCOLOR values, but it works better if it is at index 0.
  ## Use IupSetHandle or IupSetAttributeHandle to associate an image to a name.
  SetAttribute(cast[PIhandle](ih), "ICON", value)

proc `icon`*(ih: IconTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ICON", value)

proc `icon`*(ih: IconTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ICON")


type IgnoreradioTypes* = Toggle_t
proc `ignoreradio=`*(ih: IgnoreradioTypes, value: string) {.cdecl.} =
  ## (non inheritable): when set the toggle will not behave as a radio when inside an IupRadio hierarchy. (since 3.21)
  SetAttribute(cast[PIhandle](ih), "IGNORERADIO", value)

proc `ignoreradio`*(ih: IgnoreradioTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "IGNORERADIO", value)

proc `ignoreradio`*(ih: IgnoreradioTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "IGNORERADIO")


type ImageTypes* = Button_t | Label_t | Toggle_t
proc `image=`*(ih: ImageTypes, value: string) {.cdecl.} =
  ## (non inheritable): Image name. If set before map defines the behavior of the button to contain an image. The natural size will be size of the image in pixels, plus the button borders. Use IupSetHandle or IupSetAttributeHandle to associate an image to a name. See also IupImage. If TITLE is also defined and not empty both will be shown (except in Motif). (GTK 2.6)
  SetAttribute(cast[PIhandle](ih), "IMAGE", value)

proc `image`*(ih: ImageTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "IMAGE", value)

proc `image=`*(ih: ImageTypes, value: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
  SetAttributeHandle(cast[PIhandle](ih), "IMAGE", cast[PIhandle](value))

proc `image`*(ih: ImageTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "IMAGE")


type ImagepositionTypes* = Button_t
proc `imageposition=`*(ih: ImagepositionTypes, value: string) {.cdecl.} =
  ## (non inheritable): Position of the image relative to the text when both are displayed. Can be: LEFT, RIGHT, TOP, BOTTOM. Default: LEFT. (since 3.0) (GTK 2.10)
  SetAttribute(cast[PIhandle](ih), "IMAGEPOSITION", value)

proc `imageposition`*(ih: ImagepositionTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "IMAGEPOSITION", value)

proc `imageposition`*(ih: ImagepositionTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "IMAGEPOSITION")


type IminactiveTypes* = Button_t | Label_t | Toggle_t
proc `iminactive=`*(ih: IminactiveTypes, value: string) {.cdecl.} =
  ## non inheritable): Image name of the element when inactive. If it is not defined then the IMAGE is used and the colors will be replaced by a modified version of the background color creating the disabled effect. GTK will also change the inactive image to look like other inactive objects. (GTK 2.6)
  SetAttribute(cast[PIhandle](ih), "IMINACTIVE", value)

proc `iminactive`*(ih: IminactiveTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "IMINACTIVE", value)

proc `iminactive=`*(ih: IminactiveTypes, value: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
  SetAttributeHandle(cast[PIhandle](ih), "IMINACTIVE", cast[PIhandle](value))

proc `iminactive`*(ih: IminactiveTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "IMINACTIVE")


type ImpressTypes* = Button_t | Toggle_t
proc `impress=`*(ih: ImpressTypes, value: string) {.cdecl.} =
  ## (non inheritable): Image name of the pressed button. If IMPRESS and IMAGE are defined, the button borders are not shown and not computed in natural size. When the button is clicked the pressed image does not offset. In Motif the button will lose its focus feedback also. (GTK 2.6)
  SetAttribute(cast[PIhandle](ih), "IMPRESS", value)

proc `impress`*(ih: ImpressTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "IMPRESS", value)

proc `impress=`*(ih: ImpressTypes, value: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
  SetAttributeHandle(cast[PIhandle](ih), "IMPRESS", cast[PIhandle](value))

proc `impress`*(ih: ImpressTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "IMPRESS")


type ImpressborderTypes* = Button_t
proc `impressborder=`*(ih: ImpressborderTypes, value: string) {.cdecl.} =
  ## (non inheritable): if enabled the button borders will be shown and computed even if IMPRESS is defined. Can be "YES"or "NO". Default: "NO".
  SetAttribute(cast[PIhandle](ih), "IMPRESSBORDER", value)

proc `impressborder`*(ih: ImpressborderTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "IMPRESSBORDER", value)

proc `impressborder`*(ih: ImpressborderTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "IMPRESSBORDER")


type IndenttxtfmtTypes* = User_t
proc `indent=`*(ih: IndenttxtfmtTypes, value: string) {.cdecl.} =
  ## paragraph indentation, the distance between the margin and the paragraph. In Windows the right indentation, and the indentation of the second and subsequent lines (relative to the indentation of the first line) can be independently set using the INDENTRIGHT and INDENTOFFSET attributes, but only when INDENT is set.
  SetAttribute(cast[PIhandle](ih), "INDENT", value)

proc `indent`*(ih: IndenttxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "INDENT", value)

proc `indent`*(ih: IndenttxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "INDENT")


type InsertTypes* = List_t | Text_t | MultiLine_t
proc `insert=`*(ih: InsertTypes, value: string) {.cdecl.} =
  ## (write-only): Inserts a text in the caret's position, also replaces the current selection if any. Ignored if set before map.
  SetAttribute(cast[PIhandle](ih), "INSERT", value)

proc `insert`*(ih: InsertTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "INSERT", value)


type ItalictxtfmtTypes* = User_t
proc `italic=`*(ih: ItalictxtfmtTypes, value: string) {.cdecl.} =
  ## Can be YES or NO. Default NO.
  SetAttribute(cast[PIhandle](ih), "ITALIC", value)

proc `italic`*(ih: ItalictxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ITALIC", value)

proc `italic`*(ih: ItalictxtfmtTypes): bool {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ITALIC") == "YES"

proc `italic=`*(ih: ItalictxtfmtTypes, yes: bool = true) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ITALIC", cstring(if yes: "YES" else: "NO"))

proc `italic`*(ih: ItalictxtfmtTypes, yes: bool = true) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ITALIC", cstring(if yes: "YES" else: "NO"))

type LanguagetxtfmtTypes* = User_t
proc `language=`*(ih: LanguagetxtfmtTypes, value: string) {.cdecl.} =
  ## [GTK Only]: A text with a description of the text language. The same value can be used in the "SYSTEMLANGUAGE"global attribute.
  SetAttribute(cast[PIhandle](ih), "LANGUAGE", value)

proc `language`*(ih: LanguagetxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "LANGUAGE", value)

proc `language`*(ih: LanguagetxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "LANGUAGE")


type LinecountTypes* = Text_t | MultiLine_t
proc `linecount`*(ih: LinecountTypes): string {.cdecl.} =
  ## (read-only): returns the number of lines in the text. When MULTILINE=NO returns always "1". (since 3.5)
  return $GetAttribute(cast[PIhandle](ih), "LINECOUNT")


type LinespacingtxtfmtTypes* = User_t
proc `linespacing=`*(ih: LinespacingtxtfmtTypes, value: string) {.cdecl.} =
  ## the distance between lines of the same paragraph. In Windows, the values SINGLE, ONEHALF and DOUBLE can be used.
  SetAttribute(cast[PIhandle](ih), "LINESPACING", value)

proc `linespacing`*(ih: LinespacingtxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "LINESPACING", value)

proc `linespacing`*(ih: LinespacingtxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "LINESPACING")


type LinevalueTypes* = Text_t | MultiLine_t
proc `linevalue`*(ih: LinevalueTypes): string {.cdecl.} =
  ## (read-only): returns the text of the line where the caret is. It does not include the "\n"character. When MULTILINE=NO returns the same as VALUE. (since 3.5)
  return $GetAttribute(cast[PIhandle](ih), "LINEVALUE")


type LinexcanvasTypes* = Canvas_t
proc `linex=`*(ih: LinexcanvasTypes, value: string) {.cdecl.} =
  ## The amount the thumb moves when an horizontal step is performed. Default: 1/10th of DX. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "LINEX", value)

proc `linex`*(ih: LinexcanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "LINEX", value)

proc `linex`*(ih: LinexcanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "LINEX")


type LineycanvasTypes* = Canvas_t
proc `liney=`*(ih: LineycanvasTypes, value: string) {.cdecl.} =
  ## The amount the thumb moves when a vertical step is performed. Default: 1/10th of DY. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "LINEY", value)

proc `liney`*(ih: LineycanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "LINEY", value)

proc `liney`*(ih: LineycanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "LINEY")


type LoadrtfTypes* = Text_t | MultiLine_t
proc `loadrtf=`*(ih: LoadrtfTypes, value: string) {.cdecl.} =
  ## (write-only) [Windows Only]: loads formatted text from a Rich Text Format file given its filename. The attribute LOADRTFSTATUS is set to OK or FAILED after the file is loaded. (since 3.28)
  SetAttribute(cast[PIhandle](ih), "LOADRTF", value)

proc `loadrtf`*(ih: LoadrtfTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "LOADRTF", value)


type LoadrtfstatusTypes* = Text_t | MultiLine_t
proc `loadrtfstatus`*(ih: LoadrtfstatusTypes): string {.cdecl.} =
  ## The attribute LOADRTFSTATUS is set to OK or FAILED after the file is loaded. (since 3.28)
  return $GetAttribute(cast[PIhandle](ih), "LOADRTFSTATUS")


type MarginTypes* = Dialog_t | Vbox_t | Hbox_t
proc `margin=`*(ih: MarginTypes, value: string) {.cdecl.} =
  ## Defines a margin in pixels, CMARGIN is in the same units of the SIZE attribute. Its value has the format "widthxheight", where width and height are integer values corresponding to the horizontal and vertical margins, respectively. Default: "0x0"(no margin). (CMARGIN since 3.0)
  SetAttribute(cast[PIhandle](ih), "MARGIN", value)

proc `margin`*(ih: MarginTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MARGIN", value)

proc `margin`*(ih: MarginTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MARGIN")

proc `margin`*(ih: MarginTypes, width, height:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MARGIN", cstring(&"{width}x{height}"))

type MarkupTypes* = Button_t | Label_t | Toggle_t
proc `markup=`*(ih: MarkupTypes, value: string) {.cdecl.} =
  ## [GTK only]: allows the title string to contains pango markup commands. Works only if a mnemonic is NOT defined in the title. Can be "YES"or "NO". Default: "NO".
  SetAttribute(cast[PIhandle](ih), "MARKUP", value)

proc `markup`*(ih: MarkupTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MARKUP", value)

proc `markup`*(ih: MarkupTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MARKUP")


type MaskTypes* = List_t | Text_t | MultiLine_t
proc `mask=`*(ih: MaskTypes, value: string) {.cdecl.} =
  ## (non inheritable): Defines a mask that will filter interactive text input.
  SetAttribute(cast[PIhandle](ih), "MASK", value)

proc `mask`*(ih: MaskTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MASK", value)

proc `mask`*(ih: MaskTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MASK")


type MaxboxTypes* = Dialog_t
proc `maxbox=`*(ih: MaxboxTypes, value: string) {.cdecl.} =
  ## (creation only): Requires a maximize button from the window manager. If RESIZE=NO then MAXBOX will be set to NO. Default: YES. In Motif the decorations are controlled by the Window Manager and may not be possible to be changed from IUP. In Windows MAXBOX is hidden only if MINBOX is hidden as well, or else it will be just disabled.
  SetAttribute(cast[PIhandle](ih), "MAXBOX", value)

proc `maxbox`*(ih: MaxboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MAXBOX", value)

proc `maxbox`*(ih: MaxboxTypes): bool {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ACTIVE") == "YES"

proc `maxbox=`*(ih: MaxboxTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MAXBOX", cstring((if active: "YES" else: "NO")))

proc `maxbox`*(ih: MaxboxTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MAXBOX", cstring((if active: "YES" else: "NO")))

type MaximizeatparentTypes* = Dialog_t
proc `maximizeatparent=`*(ih: MaximizeatparentTypes, value: string) {.cdecl.} =
  ## [Windows Only]: when using multiple monitors, maximize the dialog in the same monitor that the parent dialog is. (since 3.28)
  SetAttribute(cast[PIhandle](ih), "MAXIMIZEATPARENT", value)

proc `maximizeatparent`*(ih: MaximizeatparentTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MAXIMIZEATPARENT", value)

proc `maximizeatparent`*(ih: MaximizeatparentTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MAXIMIZEATPARENT")


type MaximizedTypes* = Dialog_t
proc `maximized=`*(ih: MaximizedTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only] (read-only): indicates if the dialog is maximized. Can be YES or NO. (since 3.12)
  SetAttribute(cast[PIhandle](ih), "MAXIMIZED", value)

proc `maximized`*(ih: MaximizedTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MAXIMIZED", value)

proc `maximized`*(ih: MaximizedTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MAXIMIZED")


type MaxsizeTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `maxsize=`*(ih: MaxsizeTypes, value: string) {.cdecl.} =
  ## Specifies the element maximum size in pixels during the layout process.
  ## See the Layout Guide for more details on sizes.
  ## 
  ## Value
  ## "widthxheight", where width and height are integer values corresponding to the horizontal and vertical size, respectively, in pixels.
  ## You can also set only one of the parameters by removing the other one and maintaining the separator "x", but this is equivalent of setting the other value to 65535. For example: "x40"(height only = "65535x40") or "40x"(width only = "40x65535").
  ## Default: 65535x65535
  ## 
  ## Affects
  ## All, except menus.
  ## 
  ## Notes
  ## The limits are applied during the layout computation. It will limit the Natural size and the Current size.
  ## If the element can be expanded, then its empty space will NOT be occupied by other controls although its size will be limited.
  ## In the IupDialog will also limit the interactive resize of the dialog.
  ## See the Layout Guide for mode details on sizes.
  SetAttribute(cast[PIhandle](ih), "MAXSIZE", value)

proc `maxsize`*(ih: MaxsizeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MAXSIZE", value)

proc `maxsize`*(ih: MaxsizeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MAXSIZE")

proc `maxsize`*(ih: MaxsizeTypes, width, height:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MAXSIZE", cstring(&"{width}x{height}"))

type MdiactivateTypes* = Dialog_t
proc `mdiactivate=`*(ih: MdiactivateTypes, value: string) {.cdecl.} =
  ## [Windows Only] (write-only): Name of a MDI child window to be activated. If value is "NEXT"will activate the next window after the current active window. If value is "PREVIOUS"will activate the previous one.
  SetAttribute(cast[PIhandle](ih), "MDIACTIVATE", value)

proc `mdiactivate`*(ih: MdiactivateTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MDIACTIVATE", value)


type MdiactiveTypes* = Dialog_t
proc `mdiactive`*(ih: MdiactiveTypes): string {.cdecl.} =
  ## Windows Only] (read-only): Returns the name of the current active MDI child. Use IupGetAttributeHandle to directly retrieve the child handle.
  return $GetAttribute(cast[PIhandle](ih), "MDIACTIVE")


type MdiarrangeTypes* = Dialog_t
proc `mdiarrange=`*(ih: MdiarrangeTypes, value: string) {.cdecl.} =
  ## [Windows Only] (write-only): Action to arrange MDI child windows. Possible values: TILEHORIZONTAL, TILEVERTICAL, CASCADE and ICON (arrange the minimized icons).
  SetAttribute(cast[PIhandle](ih), "MDIARRANGE", value)

proc `mdiarrange`*(ih: MdiarrangeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MDIARRANGE", value)


type MdichildTypes* = Dialog_t
proc `mdichild=`*(ih: MdichildTypes, value: string) {.cdecl.} =
  ## (creation only) [Windows Only]: Configure this dialog to be a MDI child. Can be YES or NO. The PARENTDIALOG attribute must also be defined. Each MDI child is automatically named if it does not have one. Default: NO.
  SetAttribute(cast[PIhandle](ih), "MDICHILD", value)

proc `mdichild`*(ih: MdichildTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MDICHILD", value)

proc `mdichild`*(ih: MdichildTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MDICHILD")


type MdiclientTypes* = Dialog_t
proc `mdiclient=`*(ih: MdiclientTypes, value: string) {.cdecl.} =
  ## (creation only) [Windows Only] (non inheritable): Configure the canvas as a MDI client. Can be YES or NO. No callbacks will be called. This canvas will be used internally only by the MDI Frame and its MDI Children. The MDI frame must have one and only one MDI client. Default: NO.
  SetAttribute(cast[PIhandle](ih), "MDICLIENT", value)

proc `mdiclient`*(ih: MdiclientTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MDICLIENT", value)

proc `mdiclient`*(ih: MdiclientTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MDICLIENT")


type MdicloseallTypes* = Dialog_t
proc `mdicloseall=`*(ih: MdicloseallTypes, value: string) {.cdecl.} =
  ## [Windows Only] (write-only): Action to close and destroy all MDI child windows. The CLOSE_CB callback will be called for each child.
  ## IMPORTANT: When a MDI child window is closed it is automatically destroyed. The application can override this returning IUP_IGNORE in CLOSE_CB.
  SetAttribute(cast[PIhandle](ih), "MDICLOSEALL", value)

proc `mdicloseall`*(ih: MdicloseallTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MDICLOSEALL", value)


type MdiframeTypes* = Dialog_t
proc `mdiframe=`*(ih: MdiframeTypes, value: string) {.cdecl.} =
  ## (creation only) [Windows Only] (non inheritable): Configure this dialog as a MDI frame. Can be YES or NO. Default: NO.
  SetAttribute(cast[PIhandle](ih), "MDIFRAME", value)

proc `mdiframe`*(ih: MdiframeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MDIFRAME", value)

proc `mdiframe`*(ih: MdiframeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MDIFRAME")


type MdimenuTypes* = Dialog_t
proc `mdimenu=`*(ih: MdimenuTypes, value: string) {.cdecl.} =
  ## (creation only) [Windows Only]: Name of a IupMenu to be used as the Window list of a MDI frame. The system will automatically add the list of MDI child windows there.
  SetAttribute(cast[PIhandle](ih), "MDIMENU", value)

proc `mdimenu`*(ih: MdimenuTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MDIMENU", value)

proc `mdimenu`*(ih: MdimenuTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MDIMENU")


type MdinextTypes* = Dialog_t
proc `mdinext`*(ih: MdinextTypes): string {.cdecl.} =
  ## [Windows Only] (read-only): Returns the name of the next available MDI child. Use IupGetAttributeHandle to directly retrieve the child handle. Must use MDIACTIVE to retrieve the first child. If the application is going to destroy the child retrieve the next child before destroying the current.
  return $GetAttribute(cast[PIhandle](ih), "MDINEXT")


type MenuTypes* = Dialog_t
proc `menu=`*(ih: MenuTypes, value: string) {.cdecl.} =
  ## Name of a menu. Associates a menu to the dialog as a menu bar. The previous menu, if any, is unmapped. Use IupSetHandle or IupSetAttributeHandle to associate a menu to a name. See also IupMenu.
  SetAttribute(cast[PIhandle](ih), "MENU", value)

proc `menu`*(ih: MenuTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MENU", value)

proc `menu`*(ih: MenuTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MENU")


type MenuboxTypes* = Dialog_t
proc `menubox=`*(ih: MenuboxTypes, value: string) {.cdecl.} =
  ## (creation only): Requires a system menu box from the window manager. If hidden will also remove the Close button. Default: YES. In Motif the decorations are controlled by the Window Manager and may not be possible to be changed from IUP. In Windows if hidden will hide also MAXBOX and MINBOX.
  SetAttribute(cast[PIhandle](ih), "MENUBOX", value)

proc `menubox`*(ih: MenuboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MENUBOX", value)

proc `menubox`*(ih: MenuboxTypes): bool {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ACTIVE") == "YES"

proc `menubox=`*(ih: MenuboxTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MENUBOX", cstring((if active: "YES" else: "NO")))

proc `menubox`*(ih: MenuboxTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MENUBOX", cstring((if active: "YES" else: "NO")))

type MinboxTypes* = Dialog_t
proc `minbox=`*(ih: MinboxTypes, value: string) {.cdecl.} =
  ## (creation only): Requires a minimize button from the window manager. Default: YES. In Motif the decorations are controlled by the Window Manager and may not be possible to be changed from IUP. In Windows MINBOX is hidden only if MAXBOX is hidden as well, or else it will be just disabled.
  SetAttribute(cast[PIhandle](ih), "MINBOX", value)

proc `minbox`*(ih: MinboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MINBOX", value)

proc `minbox`*(ih: MinboxTypes): bool {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "ACTIVE") == "YES"

proc `minbox=`*(ih: MinboxTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MINBOX", cstring((if active: "YES" else: "NO")))

proc `minbox`*(ih: MinboxTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MINBOX", cstring((if active: "YES" else: "NO")))

type MinimizedTypes* = Dialog_t
proc `minimized=`*(ih: MinimizedTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only] (read-only): indicates if the dialog is minimized. Can be YES or NO. (since 3.15)
  SetAttribute(cast[PIhandle](ih), "MINIMIZED", value)

proc `minimized`*(ih: MinimizedTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MINIMIZED", value)

proc `minimized`*(ih: MinimizedTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MINIMIZED")


type MinsizeTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `minsize=`*(ih: MinsizeTypes, value: string) {.cdecl.} =
  ## Specifies the element minimum size in pixels during the layout process.
  ## See the Layout Guide for more details on sizes.
  ## 
  ## Value
  ## "widthxheight", where width and height are integer values corresponding to the horizontal and vertical size, respectively, in pixels.
  ## You can also set only one of the parameters by removing the other one and maintaining the separator "x", but this is equivalent of setting the other value to 0. For example: "x40"(height only = "0x40") or "40x"(width only = "40x0").
  ## Default: 0x0
  ## 
  ## Affects
  ## All, except menus.
  ## 
  ## Notes
  ## The limits are applied during the layout computation. It will limit the Natural size and the Current size.
  ## If the element can be expanded, then its empty space will NOT be occupied by other controls although its size will be limited.
  ## In the IupDialog will also limit the interactive resize of the dialog.
  ## See the Layout Guide for mode details on sizes.
  SetAttribute(cast[PIhandle](ih), "MINSIZE", value)

proc `minsize`*(ih: MinsizeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MINSIZE", value)

proc `minsize`*(ih: MinsizeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MINSIZE")

proc `minsize`*(ih: MinsizeTypes, width, height:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MINSIZE", cstring(&"{width}x{height}"))

type ModalTypes* = Dialog_t
proc `modal`*(ih: ModalTypes): string {.cdecl.} =
  ## (read-only): Returns the popup state. It is "YES"if the dialog was shown using IupPopup. It is "NO"if IupShow was used or it is not visible. At the first time the dialog is shown, MODAL is not set yet when SHOW_CB is called. (since 3.0)
  return $GetAttribute(cast[PIhandle](ih), "MODAL")


type MultilineTypes* = Text_t | MultiLine_t
proc `multiline=`*(ih: MultilineTypes, value: string) {.cdecl.} =
  ## (creation only) (non inheritable): allows the edition of multiple lines. In single line mode some characters are invalid, like "\t", "\r"and "\n". Default: NO. When set to Yes will also reset the SCROLLBAR attribute to Yes.
  SetAttribute(cast[PIhandle](ih), "MULTILINE", value)

proc `multiline`*(ih: MultilineTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MULTILINE", value)

proc `multiline`*(ih: MultilineTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MULTILINE")


type MultipleTypes* = List_t
proc `multiple=`*(ih: MultipleTypes, value: string) {.cdecl.} =
  ## (creation only): Allows selecting several items simultaneously (multiple list). Default: "NO". Only valid when EDITBOX=NO and DROPDOWN=NO.
  SetAttribute(cast[PIhandle](ih), "MULTIPLE", value)

proc `multiple`*(ih: MultipleTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "MULTIPLE", value)

proc `multiple`*(ih: MultipleTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "MULTIPLE")


type NactiveTypes* = Dialog_t
proc `nactive=`*(ih: NactiveTypes, value: string) {.cdecl.} =
  ## (non inheritable): same as ACTIVE but does not affects the controls inside the dialog. (since 3.13)
  SetAttribute(cast[PIhandle](ih), "NACTIVE", value)

proc `nactive`*(ih: NactiveTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NACTIVE", value)

proc `nactive`*(ih: NactiveTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NACTIVE")


type NameTypes* = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t | Image_t | ImageRGB_t | ImageRGBA_t | Text_t | MultiLine_t | User_t | Toggle_t
proc `name=`*(ih: NameTypes, value: string) {.cdecl.} =
  ## Name of the control inside the dialog. Not releated to IupSetHandle.
  ## Notes
  ## The NAME value will be used by IupGetDialogChild to find a child inside a dialog.
  SetAttribute(cast[PIhandle](ih), "NAME", value)

proc `name`*(ih: NameTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NAME", value)

proc `name`*(ih: NameTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NAME")


type NativeparentTypes* = Dialog_t
proc `nativeparent=`*(ih: NativeparentTypes, value: string) {.cdecl.} =
  ## (creation only): Native handle of a dialog to be used as parent. Used only if PARENTDIALOG is not defined.
  SetAttribute(cast[PIhandle](ih), "NATIVEPARENT", value)

proc `nativeparent`*(ih: NativeparentTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NATIVEPARENT", value)

proc `nativeparent`*(ih: NativeparentTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NATIVEPARENT")


type NcTypes* = List_t | Text_t | MultiLine_t
proc `nc=`*(ih: NcTypes, value: string) {.cdecl.} =
  ## Maximum number of characters allowed for keyboard input, larger text can still be set using attributes. The maximum value is the limit of the VALUE attribute. The "0"value is the same as maximum. Default: maximum.
  SetAttribute(cast[PIhandle](ih), "NC", value)

proc `nc`*(ih: NcTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NC", value)

proc `nc`*(ih: NcTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NC")


type NcgapTypes* = Vbox_t | Hbox_t
proc `ncgap=`*(ih: NcgapTypes, value: string) {.cdecl.} =
  ## Same as GAP but are non inheritable. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "NCGAP", value)

proc `ncgap`*(ih: NcgapTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NCGAP", value)

proc `ncgap`*(ih: NcgapTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NCGAP")


type NcmarginTypes* = Vbox_t | Hbox_t
proc `ncmargin=`*(ih: NcmarginTypes, value: string) {.cdecl.} =
  ## (non inheritable): Same as MARGIN but are non inheritable. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "NCMARGIN", value)

proc `ncmargin`*(ih: NcmarginTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NCMARGIN", value)

proc `ncmargin`*(ih: NcmarginTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NCMARGIN")


type NgapTypes* = Vbox_t | Hbox_t
proc `ngap=`*(ih: NgapTypes, value: string) {.cdecl.} =
  ## Same as GAP but are non inheritable. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "NGAP", value)

proc `ngap`*(ih: NgapTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NGAP", value)

proc `ngap`*(ih: NgapTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NGAP")


type NmarginTypes* = Vbox_t | Hbox_t
proc `nmargin=`*(ih: NmarginTypes, value: string) {.cdecl.} =
  ## (non inheritable): Same as MARGIN but are non inheritable. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "NMARGIN", value)

proc `nmargin`*(ih: NmarginTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NMARGIN", value)

proc `nmargin`*(ih: NmarginTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NMARGIN")


type NohideselTypes* = Text_t | MultiLine_t
proc `nohidesel=`*(ih: NohideselTypes, value: string) {.cdecl.} =
  ## [Windows Only]: do not hide the selection when the control loses its focus. Default: Yes. (since 3.16)
  SetAttribute(cast[PIhandle](ih), "NOHIDESEL", value)

proc `nohidesel`*(ih: NohideselTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NOHIDESEL", value)

proc `nohidesel`*(ih: NohideselTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NOHIDESEL")


type NormalizesizeTypes* = Vbox_t | Hbox_t
proc `normalizesize=`*(ih: NormalizesizeTypes, value: string) {.cdecl.} =
  ## non inheritable): normalizes all children natural size to be the biggest natural size among them. All natural width will be set to the biggest width, and all natural height will be set to the biggest height according to is value. Can be NO, HORIZONTAL, VERTICAL or BOTH. Default: "NO". Same as using IupNormalizer. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "NORMALIZESIZE", value)

proc `normalizesize`*(ih: NormalizesizeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NORMALIZESIZE", value)

proc `normalizesize`*(ih: NormalizesizeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NORMALIZESIZE")


type NumberingtxtfmtTypes* = User_t
proc `numbering=`*(ih: NumberingtxtfmtTypes, value: string) {.cdecl.} =
  ## [Windows Only]: Can be BULLET (bullet symbol), ARABIC (arabic numbers - 1,2,3...), LCLETTER (lower case letters - a,b,c...), UCLETTER (upper case letters - A,B,C...), LCROMAN (lower case Roman numerals - i,ii,iii...), UCROMAN (upper case Roman numerals - I,II,III...) and NONE. Default: NONE.
  SetAttribute(cast[PIhandle](ih), "NUMBERING", value)

proc `numbering`*(ih: NumberingtxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NUMBERING", value)

proc `numbering`*(ih: NumberingtxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NUMBERING")


type NumberingstyletxtfmtTypes* = User_t
proc `numberingstyle=`*(ih: NumberingstyletxtfmtTypes, value: string) {.cdecl.} =
  ## [Windows Only]: Can be RIGHTPARENTHESIS "a)", PARENTHESES "(a)", PERIOD "a.", NONUMBER (it will skip the numbering or bullet for the item) and NONE "". Default: NONE.
  SetAttribute(cast[PIhandle](ih), "NUMBERINGSTYLE", value)

proc `numberingstyle`*(ih: NumberingstyletxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NUMBERINGSTYLE", value)

proc `numberingstyle`*(ih: NumberingstyletxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NUMBERINGSTYLE")


type NumberingtabtxtfmtTypes* = User_t
proc `numberingtab=`*(ih: NumberingtabtxtfmtTypes, value: string) {.cdecl.} =
  ## [Windows Only]: Minimum distance from a paragraph numbering or bullet to the paragraph text.
  SetAttribute(cast[PIhandle](ih), "NUMBERINGTAB", value)

proc `numberingtab`*(ih: NumberingtabtxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "NUMBERINGTAB", value)

proc `numberingtab`*(ih: NumberingtabtxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "NUMBERINGTAB")


type OpacityTypes* = Dialog_t
proc `opacity=`*(ih: OpacityTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only]: sets the dialog transparency alpha value. Valid values range from 0 (completely transparent) to 255 (opaque). In Windows must be set before map so the native window would be properly initialized when mapped (since 3.16). (GTK 2.12)
  SetAttribute(cast[PIhandle](ih), "OPACITY", value)

proc `opacity`*(ih: OpacityTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "OPACITY", value)

proc `opacity`*(ih: OpacityTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "OPACITY")


type OpacityimageTypes* = Dialog_t
proc `opacityimage=`*(ih: OpacityimageTypes, value: string) {.cdecl.} =
  ## [Windows Only]: sets an RGBA image as the dialog background so it is possible to create a non rectangle window with transparency, but it can not have children. Used usually for splash screens. It must be set before map so the native window would be properly initialized when mapped. Works also for GTK but as the SHAPEIMAGE attribute. (since 3.16)
  SetAttribute(cast[PIhandle](ih), "OPACITYIMAGE", value)

proc `opacityimage`*(ih: OpacityimageTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "OPACITYIMAGE", value)

proc `opacityimage`*(ih: OpacityimageTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "OPACITYIMAGE")


type OrientationTypes* = Vbox_t | Hbox_t
proc `orientation`*(ih: OrientationTypes): string {.cdecl.} =
  ## (read-only) (non inheritable)
  return $GetAttribute(cast[PIhandle](ih), "ORIENTATION")


type OriginalscaleTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `originalscale`*(ih: OriginalscaleTypes): string {.cdecl.} =
  ## (read-only): returns the width and height before the image was scaled. (since 3.25)
  return $GetAttribute(cast[PIhandle](ih), "ORIGINALSCALE")


type OverwriteTypes* = Text_t | MultiLine_t
proc `overwrite=`*(ih: OverwriteTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only] (non inheritable): turns the overwrite mode ON or OFF. Works only when FORMATTING=YES. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "OVERWRITE", value)

proc `overwrite`*(ih: OverwriteTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "OVERWRITE", value)

proc `overwrite`*(ih: OverwriteTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "OVERWRITE")


type PaddingTypes* = Button_t | Label_t | List_t | Text_t | MultiLine_t | Toggle_t
proc `padding=`*(ih: PaddingTypes, value: string) {.cdecl.} =
  ## internal margin. Works just like the MARGIN attribute of the IupHbox and IupVbox containers, but uses a different name to avoid inheritance problems. Default value: "0x0". Value can be DEFAULTBUTTONPADDING, so the global attribute of this name will be used instead (since 3.29). (since 3.0)
  SetAttribute(cast[PIhandle](ih), "PADDING", value)

proc `padding`*(ih: PaddingTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "PADDING", value)

proc `padding`*(ih: PaddingTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "PADDING")


type ParentdialogTypes* = Dialog_t
proc `parentdialog=`*(ih: ParentdialogTypes, value: string) {.cdecl.} =
  ## The parent dialog of a dialog.
  ## 
  ## Value
  ## Name of a dialog to be used as parent.
  ## Default: NULL.
  ## 
  ## Notes
  ## This dialog will be always in front of the parent dialog. If the parent is minimized, this dialog is automatically minimized. The parent dialog must be mapped before mapping the child dialog.
  ## If PARENTDIALOG is not defined then the NATIVEPARENT attribute is consulted. This one must be a native handle of an existing dialog.
  ## Can be changed after the dialog is mapped, but only if already set before map. (since 3.21)
  ## Use IupSetHandle or IupSetAttributeHandle to associate a dialog to a name.
  ## IMPORTANT: When the parent is destroyed the child dialog is also destroyed, BUT the CLOSE_CB callback of the child dialog is NOT called. The application must take care of destroying the child dialogs before destroying the parent. This is usually done when CLOSE_CB of the parent dialog is called.
  SetAttribute(cast[PIhandle](ih), "PARENTDIALOG", value)

proc `parentdialog`*(ih: ParentdialogTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "PARENTDIALOG", value)

proc `parentdialog`*(ih: ParentdialogTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "PARENTDIALOG")


type PasswordTypes* = Text_t | MultiLine_t
proc `password=`*(ih: PasswordTypes, value: string) {.cdecl.} =
  ## (creation only) [Windows and GTK Only] (non inheritable): Hide the typed character using an "*". Default: "NO".
  SetAttribute(cast[PIhandle](ih), "PASSWORD", value)

proc `password`*(ih: PasswordTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "PASSWORD", value)

proc `password`*(ih: PasswordTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "PASSWORD")


type PlacementTypes* = Dialog_t
proc `placement=`*(ih: PlacementTypes, value: string) {.cdecl.} =
  ## (creation only): Name of a dialog to be used as parent.
  SetAttribute(cast[PIhandle](ih), "PLACEMENT", value)

proc `placement`*(ih: PlacementTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "PLACEMENT", value)

proc `placement`*(ih: PlacementTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "PLACEMENT")


type PositionTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `position=`*(ih: PositionTypes, value: string) {.cdecl.} =
  ## The position of the element relative to the origin of the Client area of the native parent. If you add the CLIENTOFFSET attribute of the native parent, you can obtain the coordinates relative to the Window area of the native parent. See the Layout Guide.
  ## It will be changed during the layout computation, except when FLOATING=YES or when used inside a concrete layout container.
  ## 
  ## Value
  ## "x,y", where x and y are integer values corresponding to the horizontal and vertical position, respectively, in pixels.
  ## 
  ## Affects
  ## All, except menus.
  SetAttribute(cast[PIhandle](ih), "POSITION", value)

proc `position`*(ih: PositionTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "POSITION", value)

proc `position`*(ih: PositionTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "POSITION")

proc `position`*(ih: PositionTypes, x, y:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "POSITION", cstring(&"{x},{y}"))

type PosxcanvasTypes* = Canvas_t
proc `posx=`*(ih: PosxcanvasTypes, value: string) {.cdecl.} =
  ## Position of the thumb in the horizontal scrollbar. Default: "0.0".
  SetAttribute(cast[PIhandle](ih), "POSX", value)

proc `posx`*(ih: PosxcanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "POSX", value)

proc `posx`*(ih: PosxcanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "POSX")


type PosycanvasTypes* = Canvas_t
proc `posy=`*(ih: PosycanvasTypes, value: string) {.cdecl.} =
  ## Position of the thumb in the vertical scrollbar. Default: "0.0".
  SetAttribute(cast[PIhandle](ih), "POSY", value)

proc `posy`*(ih: PosycanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "POSY", value)

proc `posy`*(ih: PosycanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "POSY")


type PropagatefocusTypes* = Button_t | Canvas_t | List_t | Text_t | MultiLine_t | Toggle_t
proc `propagatefocus=`*(ih: PropagatefocusTypes, value: string) {.cdecl.} =
  ## (non inheritable): enables the focus callback forwarding to the next native parent with FOCUS_CB defined. Default: NO. (since 3.23)
  SetAttribute(cast[PIhandle](ih), "PROPAGATEFOCUS", value)

proc `propagatefocus`*(ih: PropagatefocusTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "PROPAGATEFOCUS", value)

proc `propagatefocus`*(ih: PropagatefocusTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "PROPAGATEFOCUS")


type ProtectedtxtfmtTypes* = User_t
proc `protected=`*(ih: ProtectedtxtfmtTypes, value: string) {.cdecl.} =
  ## Can be YES or NO. Default NO. When set to YES the selected text can NOT be edited.
  SetAttribute(cast[PIhandle](ih), "PROTECTED", value)

proc `protected`*(ih: ProtectedtxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "PROTECTED", value)

proc `protected`*(ih: ProtectedtxtfmtTypes): bool {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "PROTECTED") == "YES"

proc `protected=`*(ih: ProtectedtxtfmtTypes, yes:bool = true) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "PROTECTED", cstring((if yes: "YES" else: "NO")))

proc `protected`*(ih: ProtectedtxtfmtTypes, yes:bool = true) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "PROTECTED", cstring((if yes: "YES" else: "NO")))

type RadioTypes* = Toggle_t
proc `radio`*(ih: RadioTypes): string {.cdecl.} =
  ## (read-only): returns if the toggle is inside a radio. Can be "YES"or "NO". Valid only after the element is mapped, before returns NULL. (since 3.0)
  return $GetAttribute(cast[PIhandle](ih), "RADIO")


type RastersizeTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Vbox_t | Hbox_t | Image_t | ImageRGB_t | ImageRGBA_t | Text_t | MultiLine_t
proc `rastersize=`*(ih: RastersizeTypes, value: string) {.cdecl.} =
  ## Specifies the element User size, and returns the Current size, in pixels.
  ## See the Layout Guide for more details on sizes.
  ## 
  ## Value
  ## "widthxheight", where width and height are integer values corresponding to the horizontal and vertical size, respectively, in pixels.
  ## You can also set only one of the parameters by removing the other one and maintaining the separator "x", but this is equivalent of setting the other value to 0. For example: "x40"(height only = "0x40") or "40x"(width only = "40x0").
  ## When this attribute is consulted the Current size of the control is returned. If both values are 0 then NULL is returned.
  ## 
  ## Affects
  ## All, except menus.
  ## 
  ## Notes
  ## When this attribute is set, it resets the SIZE attribute. So changes to the FONT attribute will not affect the User size of the element.
  ## To obtain the last computed Natural size of the control in pixels, use the read-only attribute NATURALSIZE. (Since 3.6)
  ## To obtain the User size of the element in pixels after it is mapped, use the attribute USERSIZE. (Since 3.12)
  ## A User size of "0x0"can be set, it can also be set using NULL. If both values are 0 then NULL is returned.
  ## If you wish to use the User size only as an initial size, change this attribute to NULL after the control is mapped, the returned size in IupGetAttribute will still be the Current size.
  ## The element is NOT immediately repositioned. Call IupRefresh to update the dialog layout.
  ## IupMap also updates the dialog layout even if it is already mapped, so calling it or calling IupShow, IupShowXY or IupPopup (they all call IupMap) will also update the dialog layout.
  ## See the Layout Guide for mode details on sizes.
  SetAttribute(cast[PIhandle](ih), "RASTERSIZE", value)

proc `rastersize`*(ih: RastersizeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RASTERSIZE", value)

proc `rastersize`*(ih: RastersizeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "RASTERSIZE")

proc `rastersize`*(ih: RastersizeTypes, width, height:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RASTERSIZE", cstring(&"{width}x{height}"))

type ReadonlyTypes* = List_t | Text_t | MultiLine_t
proc `readonly=`*(ih: ReadonlyTypes, value: string) {.cdecl.} =
  ## Allows the user only to read the contents, without changing it. Restricts keyboard input only, text value can still be changed using attributes. Navigation keys are still available. Possible values: "YES", "NO". Default: NO.
  SetAttribute(cast[PIhandle](ih), "READONLY", value)

proc `readonly`*(ih: ReadonlyTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "READONLY", value)

proc `readonly`*(ih: ReadonlyTypes): bool {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "READONLY") == "YES"

proc `readonly=`*(ih: ReadonlyTypes, ro:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "READONLY", cstring((if ro: "YES" else: "NO")))

proc `readonly`*(ih: ReadonlyTypes, ro:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "READONLY", cstring((if ro: "YES" else: "NO")))

type RemoveformattingTypes* = Text_t | MultiLine_t
proc `removeformatting=`*(ih: RemoveformattingTypes, value: string) {.cdecl.} =
  ## [write only] (non inheritable)
  ## Removes the formatting of the current selection if Yes or NULL, and from all text if ALL is used.
  SetAttribute(cast[PIhandle](ih), "REMOVEFORMATTING", value)

proc `removeformatting`*(ih: RemoveformattingTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "REMOVEFORMATTING", value)


type RemoveitemTypes* = List_t
proc `removeitem=`*(ih: RemoveitemTypes, value: string) {.cdecl.} =
  ## (write-only): removes the given value. value starts at 1. If value is NULL or "ALL"removes all the items. Ignored if set before map. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "REMOVEITEM", value)

proc `removeitem`*(ih: RemoveitemTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "REMOVEITEM", value)


type ReshapeTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `reshape=`*(ih: ReshapeTypes, value: string) {.cdecl.} =
  ## (write-only): given a new size if format "widthxheight", allocates enough memory for the new size and changes WIDTH and HEIGHT attributes. Image contents is ignored and it will contain trash after the reshape. (since 3.24)
  SetAttribute(cast[PIhandle](ih), "RESHAPE", value)

proc `reshape`*(ih: ReshapeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RESHAPE", value)


type ResizeTypes* = Dialog_t
proc `resize=`*(ih: ResizeTypes, value: string) {.cdecl.} =
  ## (creation only): Allows interactively changing the dialog’s size. Default: YES. If RESIZE=NO then MAXBOX will be set to NO. In Motif the decorations are controlled by the Window Manager and may not be possible to be changed from IUP.
  SetAttribute(cast[PIhandle](ih), "RESIZE", value)

proc `resize`*(ih: ResizeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RESIZE", value)

proc `resize`*(ih: ResizeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "RESIZE")

proc `resize=`*(ih: ResizeTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RESIZE", cstring((if active: "YES" else: "NO")))

proc `resize`*(ih: ResizeTypes, active:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RESIZE", cstring((if active: "YES" else: "NO")))

type Resize2Types* = Image_t | ImageRGB_t | ImageRGBA_t
proc `resize=`*(ih: Resize2Types, value: string) {.cdecl.} =
  ## (write-only): given a new size if format "widthxheight", changes WIDTH and HEIGHT attributes, and resizes the image contents using bilinear interpolation for RGB and RGBA images and nearest neighborhood for 8 bits. (since 3.24)
  SetAttribute(cast[PIhandle](ih), "RESIZE", value)

proc `resize`*(ih: Resize2Types, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RESIZE", value)

proc `resize`*(ih: Resize2Types, width, height:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RESIZE", cstring(&"{width}x{height}"))

type RightbuttonTypes* = Toggle_t
proc `rightbutton=`*(ih: RightbuttonTypes, value: string) {.cdecl.} =
  ## (Windows Only) (creation only): place the check button at the right of the text. Can be "YES"or "NO". Default: "NO".
  SetAttribute(cast[PIhandle](ih), "RIGHTBUTTON", value)

proc `rightbutton`*(ih: RightbuttonTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RIGHTBUTTON", value)

proc `rightbutton`*(ih: RightbuttonTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "RIGHTBUTTON")


type RisetxtfmtTypes* = User_t
proc `rise=`*(ih: RisetxtfmtTypes, value: string) {.cdecl.} =
  ## the distance, positive or negative from the base line. Can also use the values SUPERSCRIPT and SUBSCRIPT, but this values will also reduce the size of the font.
  SetAttribute(cast[PIhandle](ih), "RISE", value)

proc `rise`*(ih: RisetxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RISE", value)

proc `rise`*(ih: RisetxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "RISE")


type RunTypes* = Timer_t
proc `run=`*(ih: RunTypes, value: string) {.cdecl.} =
  ## Starts and stops the timer. Possible values: "YES"or "NO". Returns the current timer state. If you have multiple threads start the timer in the main thread.
  SetAttribute(cast[PIhandle](ih), "RUN", value)

proc `run`*(ih: RunTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RUN", value)

proc `run`*(ih: RunTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "RUN")

proc `run=`*(ih: RunTypes, run:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RUN", cstring((if run: "YES" else: "NO")))

proc `run`*(ih: RunTypes, run:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "RUN", cstring((if run: "YES" else: "NO")))

type SavertfTypes* = Text_t | MultiLine_t
proc `savertf=`*(ih: SavertfTypes, value: string) {.cdecl.} =
  ## (write-only) [Windows Only]: saves formatted text to a Rich Text Format file given its filename. The attribute SAVERTFSTATUS is set to OK or FAILED after the file is saved. (since 3.28)
  SetAttribute(cast[PIhandle](ih), "SAVERTF", value)

proc `savertf`*(ih: SavertfTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SAVERTF", value)


type SavertfstatusTypes* = Text_t | MultiLine_t
proc `savertfstatus`*(ih: SavertfstatusTypes): string {.cdecl.} =
  ## The attribute SAVERTFSTATUS is set to OK or FAILED after the file is saved. (since 3.28)
  return $GetAttribute(cast[PIhandle](ih), "SAVERTFSTATUS")


type SaveunderTypes* = Dialog_t
proc `saveunder=`*(ih: SaveunderTypes, value: string) {.cdecl.} =
  ## [Windows and Motif Only] (creation only): When this attribute is true (YES), the dialog stores the original image of the desktop region it occupies (if the system has enough memory to store the image). In this case, when the dialog is closed or moved, a redrawing event is not generated for the windows that were shadowed by it. Its default value is YES if the dialog has a parent dialog (since 3.24). To save memory disable it for your main dialog. Not available in GTK.
  SetAttribute(cast[PIhandle](ih), "SAVEUNDER", value)

proc `saveunder`*(ih: SaveunderTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SAVEUNDER", value)

proc `saveunder`*(ih: SaveunderTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SAVEUNDER")


type ScaledTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `scaled`*(ih: ScaledTypes): string {.cdecl.} =
  ## (read-only): returns Yes if the image has been resized. (since 3.25)
  return $GetAttribute(cast[PIhandle](ih), "SCALED")


type ScreenpositionTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `screenposition=`*(ih: ScreenpositionTypes, value: string) {.cdecl.} =
  ## Returns the absolute horizontal and/or vertical position of the top-left corner of the client area relative to the origin of the main screen in pixels. It is similar to POSITION but relative to the origin of the main screen, instead of the origin of the client area. The origin of the main screen is at the top-left corner, in Windows it is affected by the position of the Start Menu when it is at the top or left side of the screen.
  ## IMPORTANT: For the dialog, it is the position of the top-left corner of the window, NOT the client area. It is the same position used in IupShowXY and IupPopup. In GTK, if the dialog is hidden the values can be outdated.
  ## 
  ## Value
  ## "x,y", where x and y are integer values corresponding to the horizontal and vertical position, respectively, in pixels. When X or Y are used a single value is returned.
  SetAttribute(cast[PIhandle](ih), "SCREENPOSITION", value)

proc `screenposition`*(ih: ScreenpositionTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SCREENPOSITION", value)

proc `screenposition`*(ih: ScreenpositionTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SCREENPOSITION")

proc `screenposition`*(ih: ScreenpositionTypes, x, y:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SCREENPOSITION", cstring(&"{x},{y}"))

type ScrollbarTypes* = Text_t | MultiLine_t
proc `scrollbar=`*(ih: ScrollbarTypes, value: string) {.cdecl.} =
  ## (creation only): Valid only when MULTILINE=YES. Associates an automatic horizontal and/or vertical scrollbar to the multiline. Can be: "VERTICAL", "HORIZONTAL", "YES"(both) or "NO"(none). Default: "YES". For all systems, when SCROLLBAR!=NO the natural size will always include its size even if the native system hides the scrollbar. If AUTOHIDE=YES scrollbars are visible only if they are necessary, by default AUTOHIDE=NO. In Windows when FORMATTING=NO, AUTOHIDE is not supported. In Motif AUTOHIDE is not supported.
  SetAttribute(cast[PIhandle](ih), "SCROLLBAR", value)

proc `scrollbar`*(ih: ScrollbarTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SCROLLBAR", value)

proc `scrollbar`*(ih: ScrollbarTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SCROLLBAR")


type ScrollbarlstTypes* = List_t
proc `scrollbar=`*(ih: ScrollbarlstTypes, value: string) {.cdecl.} =
  ## (creation only): Associates automatic scrollbars to the list when DROPDOWN=NO. Can be: "YES"or "NO"(none). Default: "YES". For all systems, when SCROLLBAR=YES the natural size will always include its size even if the native system hides the scrollbars. If AUTOHIDE=YES scrollbars are shown only if they are necessary, by default AUTOHIDE=YES. In Motif, SCROLLBAR=NO is not supported and if EDITBOX=YES the horizontal scrollbar is never shown.
  ## 
  ## When DROPDOWN=YES the scrollbars are system dependent, and do NOT depend on the SCROLLBAR or AUTOHIDE attributes. Usually the scrollbars are shown if necessary. In GTK, scrollbars are never shown and all items are always visible. In Motif, the horizontal scrollbar is never shown. In Windows, if DROPEXPAND=YES then the horizontal scrollbar is never shown.
  SetAttribute(cast[PIhandle](ih), "SCROLLBAR", value)

proc `scrollbar`*(ih: ScrollbarlstTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SCROLLBAR", value)

proc `scrollbar`*(ih: ScrollbarlstTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SCROLLBAR")


type ScrollbarcanvasTypes* = Canvas_t
proc `scrollbar=`*(ih: ScrollbarcanvasTypes, value: string) {.cdecl.} =
  ## Associates a horizontal and/or vertical scrollbar to the element.
  ## The scrollbar allows you to create a virtual space associated to the element.
  ## Hence you can clearly deduce that POSX is limited to XMIN and XMAX-DX, or  XMIN<=POSX<=XMAX-DX.
  ## 
  ## Usually applications configure XMIN and XMAX to a region in World coordinates, and set DX to the canvas visible area in World coordinates. Since the canvas can have scrollbars and borders, its visible area in pixel coordinates can be easily obtained using the DRAWSIZE attribute.
  ## 
  ## IMPORTANT: the LINEX, XMAX and XMIN attributes are only updated in the scrollbar when the DX attribute is updated.
  ## 
  ## IMPORTANT: when working with a virtual space with integer coordinates, set XMAX to the integer size of the virtual space, NOT to "width-1", or the last pixel of the virtual space will never be visible. If you decide to let XMAX with the default value of 1.0 and to control only DX, then use the formula DX=visible_width/width.
  ## 
  ## IMPORTANT: When the virtual space has the same size as the canvas, i.e. when DX >= XMAX-XMIN, the scrollbar is automatically hidden if XAUTOHIDE=Yes. The width of the vertical scrollbar (the same as the height of the horizontal scrollbar) can be obtained using the SCROLLBARSIZE global attribute (since 3.9).
  ## 
  ## The same is valid for YMIN, YMAX, DY and POSY. But remember that the Y axis is oriented from top to bottom in IUP. So if you want to consider YMIN and YMAX as bottom-up oriented, then the actual YPOS must be obtained using YMAX-DY-POSY.
  ## IMPORTANT: Changes in the scrollbar parameters do NOT generate ACTION nor SCROLL_CB callback events. If you need to update the canvas contents call your own action callback or call IupUpdate. But a change in the DX attribute may generate a RESIZE_CB callback event if XAUTOHIDE=Yes.
  SetAttribute(cast[PIhandle](ih), "SCROLLBAR", value)

proc `scrollbar`*(ih: ScrollbarcanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SCROLLBAR", value)

proc `scrollbar`*(ih: ScrollbarcanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SCROLLBAR")


type ScrolltoTypes* = List_t | Text_t | MultiLine_t
proc `scrollto=`*(ih: ScrolltoTypes, value: string) {.cdecl.} =
  ## (non inheritable, write only): Scroll the text to make the given character position visible. It uses the same format and reference of the CARET attribute ("lin:col"or "col"starting at 1). In Windows, when FORMATTING=Yes "col"is ignored. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "SCROLLTO", value)

proc `scrollto`*(ih: ScrolltoTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SCROLLTO", value)

proc `scrollto`*(ih: ScrolltoTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SCROLLTO")


type ScrolltoposTypes* = List_t | Text_t | MultiLine_t
proc `scrolltopos=`*(ih: ScrolltoposTypes, value: string) {.cdecl.} =
  ## (non inheritable, write only): Scroll the text to make the given character position visible. It uses the same format and reference of the CARETPOS attribute ("pos"starting at 0). (since 3.0)
  SetAttribute(cast[PIhandle](ih), "SCROLLTOPOS", value)

proc `scrolltopos`*(ih: ScrolltoposTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SCROLLTOPOS", value)

proc `scrolltopos`*(ih: ScrolltoposTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SCROLLTOPOS")


type SelectedtextTypes* = List_t | Text_t | MultiLine_t
proc `selectedtext=`*(ih: SelectedtextTypes, value: string) {.cdecl.} =
  ## (non inheritable): Selection text. Returns NULL if there is no selection. When changed replaces the current selection. Similar to INSERT, but does nothing if there is no selection.
  SetAttribute(cast[PIhandle](ih), "SELECTEDTEXT", value)

proc `selectedtext`*(ih: SelectedtextTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SELECTEDTEXT", value)

proc `selectedtext`*(ih: SelectedtextTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SELECTEDTEXT")


type SelectionTypes* = List_t | Text_t | MultiLine_t
proc `selection=`*(ih: SelectionTypes, value: string) {.cdecl.} =
  ## non inheritable): Selection interval in characters. Returns NULL if there is no selection. Its format depends in MULTILINE=YES. The first position, lin or col, is "1".
  ## 
  ## For multiple lines: a string in the "lin1,col1:lin2,col2"format, where lin1, col1, lin2 and col2 are integer numbers corresponding to the selection's interval. col2 correspond to the character after the last selected character.
  ## 
  ## For single line: a string in the "col1:col2"format, where col1 and col2 are integer numbers corresponding to the selection's interval. col2 correspond to the character after the last selected character.
  ## 
  ## In Windows, when changing the selection the caret position is also changed.
  ## 
  ## The values ALL and NONE are also accepted independently of MULTILINE (since 3.0).
  ## 
  ## See the Notes below if using UTF-8 strings in GTK.
  SetAttribute(cast[PIhandle](ih), "SELECTION", value)

proc `selection`*(ih: SelectionTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SELECTION", value)

proc `selection`*(ih: SelectionTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SELECTION")


type SelectiontxtfmtTypes* = User_t
proc `selection=`*(ih: SelectiontxtfmtTypes, value: string) {.cdecl.} =
  ## 
  SetAttribute(cast[PIhandle](ih), "SELECTION", value)

proc `selection`*(ih: SelectiontxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SELECTION", value)

proc `selection`*(ih: SelectiontxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SELECTION")


type SelectionposTypes* = List_t | Text_t | MultiLine_t
proc `selectionpos=`*(ih: SelectionposTypes, value: string) {.cdecl.} =
  ## (non inheritable): Same as SELECTION but using a zero based character index "pos1:pos2". Useful for indexing the VALUE string. The values ALL and NONE are also accepted. See the Notes below if using UTF-8 strings in GTK. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "SELECTIONPOS", value)

proc `selectionpos`*(ih: SelectionposTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SELECTIONPOS", value)

proc `selectionpos`*(ih: SelectionposTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SELECTIONPOS")


type SelectionpostxtfmtTypes* = User_t
proc `selectionpos=`*(ih: SelectionpostxtfmtTypes, value: string) {.cdecl.} =
  ## 
  SetAttribute(cast[PIhandle](ih), "SELECTIONPOS", value)

proc `selectionpos`*(ih: SelectionpostxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SELECTIONPOS", value)

proc `selectionpos`*(ih: SelectionpostxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SELECTIONPOS")


type SeparatorTypes* = Label_t
proc `separator=`*(ih: SeparatorTypes, value: string) {.cdecl.} =
  ## (creation only) (non inheritable): Turns the label into a line separator. Possible values: "HORIZONTAL"or "VERTICAL". When changed before mapping the EXPAND attribute is set to "HORIZONTALFREE"or "VERTICALFREE"accordingly. (Since 3.11 changed to FREE based expand)
  SetAttribute(cast[PIhandle](ih), "SEPARATOR", value)

proc `separator`*(ih: SeparatorTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SEPARATOR", value)

proc `separator`*(ih: SeparatorTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SEPARATOR")


type ShapeimageTypes* = Dialog_t
proc `shapeimage=`*(ih: ShapeimageTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only]: sets a RGBA image as the dialog shape so it is possible to create a non rectangle window with children. (GTK 2.12) Only the fully transparent pixels will be transparent. The pixels colors will be ignored, only the alpha channel is used. (since 3.26)
  SetAttribute(cast[PIhandle](ih), "SHAPEIMAGE", value)

proc `shapeimage`*(ih: ShapeimageTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SHAPEIMAGE", value)

proc `shapeimage`*(ih: ShapeimageTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SHAPEIMAGE")


type ShowdragdropTypes* = List_t
proc `showdragdrop=`*(ih: ShowdragdropTypes, value: string) {.cdecl.} =
  ## (creation only) (non inheritable): enables the internal drag and drop of items in the same list, and enables the DRAGDROP_CB callback. Default: "NO". Works only if DROPDOWN=NO and MULTIPLE=NO. Drag &Drop attributes are NOT used. (since 3.7)
  SetAttribute(cast[PIhandle](ih), "SHOWDRAGDROP", value)

proc `showdragdrop`*(ih: ShowdragdropTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SHOWDRAGDROP", value)

proc `showdragdrop`*(ih: ShowdragdropTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SHOWDRAGDROP")


type ShowdropdownTypes* = List_t
proc `showdropdown=`*(ih: ShowdropdownTypes, value: string) {.cdecl.} =
  ## (write-only): opens or closes the dropdown list. Can be "YES"or "NO". Valid only when DROPDOWN=YES. Ignored if set before map.
  SetAttribute(cast[PIhandle](ih), "SHOWDROPDOWN", value)

proc `showdropdown`*(ih: ShowdropdownTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SHOWDROPDOWN", value)


type ShowimageTypes* = List_t
proc `showimage=`*(ih: ShowimageTypes, value: string) {.cdecl.} =
  ## (creation only) [Windows and GTK Only]: enables the use of an image for each item. Can be "YES"or "NO". Ignored if set after map. (since 3.6)
  SetAttribute(cast[PIhandle](ih), "SHOWIMAGE", value)

proc `showimage`*(ih: ShowimageTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SHOWIMAGE", value)

proc `showimage`*(ih: ShowimageTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SHOWIMAGE")


type ShownofocusTypes* = Dialog_t
proc `shownofocus=`*(ih: ShownofocusTypes, value: string) {.cdecl.} =
  ## do not set focus after show. (since 3.30)
  SetAttribute(cast[PIhandle](ih), "SHOWNOFOCUS", value)

proc `shownofocus`*(ih: ShownofocusTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SHOWNOFOCUS", value)

proc `shownofocus`*(ih: ShownofocusTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SHOWNOFOCUS")


type ShrinkTypes* = Dialog_t
proc `shrink=`*(ih: ShrinkTypes, value: string) {.cdecl.} =
  ## Allows changing the elements’ distribution when the dialog is smaller than the minimum size. Default: NO.
  SetAttribute(cast[PIhandle](ih), "SHRINK", value)

proc `shrink`*(ih: ShrinkTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SHRINK", value)

proc `shrink`*(ih: ShrinkTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SHRINK")

proc `shrink=`*(ih: ShrinkTypes, shrink:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SHRINK", cstring((if shrink: "YES" else: "NO")))

proc `shrink`*(ih: ShrinkTypes, shrink:bool) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SHRINK", cstring((if shrink: "YES" else: "NO")))

type SimulatemodalTypes* = Dialog_t
proc `simulatemodal=`*(ih: SimulatemodalTypes, value: string) {.cdecl.} =
  ## (write-only): disable all other visible dialogs, just like when the dialog is made modal. (since 3.21)
  SetAttribute(cast[PIhandle](ih), "SIMULATEMODAL", value)

proc `simulatemodal`*(ih: SimulatemodalTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SIMULATEMODAL", value)


type SizeTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Vbox_t | Hbox_t | Text_t | MultiLine_t
proc `size=`*(ih: SizeTypes, value: string) {.cdecl.} =
  ## Specifies the element User size, and returns the Current size, in units proportional to the size of a character.
  ## See the Layout Guide for more details on sizes.
  ## 
  ## Value
  ## "widthxheight", where width and height are integer values corresponding to the horizontal and vertical size, respectively, in characters fraction unit (see Notes below).
  ## You can also set only one of the parameters by removing the other one and maintaining the separator "x", but this is equivalent of setting the other value to 0. For example: "x40"(height only = "0x40") or "40x"(width only = "40x0").
  ## When this attribute is consulted the Current size of the control is returned. If both values are 0 then NULL is returned.
  ## 
  ## Notes
  ## The size units observes the following heuristics:
  ## Width in 1/4's of the average width of a character for the current FONT of each control.
  ## Height in 1/8's of the average height of a character for the current FONT of each control.
  ## So, a SIZE="4x8"means 1 character width and 1 character height.
  ## 
  ## Notice that this is the average character size, the space occupied by a specific string is always different than its number of character times its average character size, except when using a monospaced font like Courier. Usually for common strings this size is smaller than the actual size, so it is a good practice to leave more room than expected if you use the SIZE attribute. For smaller font sizes this difference is more noticeable than for larger font sizes.
  ## 
  ## When this attribute is changed, the RASTERSIZE attribute is automatically updated.
  ## SIZE depends on FONT, so when FONT is changed and SIZE is set, then RASTERSIZE is also updated.
  ## The average character size of the current FONT can be obtained from the CHARSIZE attribute.
  ## To obtain the last computed Natural size of the element in pixels, use the read-only attribute NATURALSIZE. (Since 3.6)
  ## To obtain the User size of the element in pixels after it is mapped, use the attribute USERSIZE. (Since 3.12)
  ## 
  ## A User size of "0x0"can be set, it can also be set using NULL. If both values are 0 then NULL is returned.
  ## If you wish to use the User size only as an initial size, change this attribute to NULL after the control is mapped, the returned size in IupGetAttribute will still be the Current size.
  ## The element is NOT immediately repositioned. Call IupRefresh to update the dialog layout.
  ## IupMap also updates the dialog layout even if it is already mapped, so calling it or calling IupShow, IupShowXY or IupPopup (they all call IupMap) will also update the dialog layout.
  ## See the Layout Guide for mode details on sizes.
  ## 
  ## Affects
  ## All, except menus.
  SetAttribute(cast[PIhandle](ih), "SIZE", value)

proc `size`*(ih: SizeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SIZE", value)

proc `size`*(ih: SizeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SIZE")

proc `size`*(ih: SizeTypes, width:int, height:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SIZE", cstring(&"{width}x{height}"))

type SmallcapstxtfmtTypes* = User_t
proc `smallcaps=`*(ih: SmallcapstxtfmtTypes, value: string) {.cdecl.} =
  ## [GTK Only]: Can be YES or NO. Default NO. (Does not work always, depends on the font)
  SetAttribute(cast[PIhandle](ih), "SMALLCAPS", value)

proc `smallcaps`*(ih: SmallcapstxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SMALLCAPS", value)

proc `smallcaps`*(ih: SmallcapstxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SMALLCAPS")


type SortTypes* = List_t
proc `sort=`*(ih: SortTypes, value: string) {.cdecl.} =
  ## (creation only): force the list to be alphabetically sorted. When using INSERTITEMn or APPENDITEM the position will be ignored. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "SORT", value)

proc `sort`*(ih: SortTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SORT", value)

proc `sort`*(ih: SortTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SORT")


type SpaceaftertxtfmtTypes* = User_t
proc `spaceafter=`*(ih: SpaceaftertxtfmtTypes, value: string) {.cdecl.} =
  ## distance left empty above the paragraph.
  SetAttribute(cast[PIhandle](ih), "SPACEAFTER", value)

proc `spaceafter`*(ih: SpaceaftertxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPACEAFTER", value)

proc `spaceafter`*(ih: SpaceaftertxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPACEAFTER")


type SpacebeforetxtfmtTypes* = User_t
proc `spacebefore=`*(ih: SpacebeforetxtfmtTypes, value: string) {.cdecl.} =
  ## distance left empty below the paragraph.
  SetAttribute(cast[PIhandle](ih), "SPACEBEFORE", value)

proc `spacebefore`*(ih: SpacebeforetxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPACEBEFORE", value)

proc `spacebefore`*(ih: SpacebeforetxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPACEBEFORE")


type SpacingTypes* = Button_t
proc `spacing=`*(ih: SpacingTypes, value: string) {.cdecl.} =
  ## (creation only): defines the spacing between the image associated and the button's text. Default: "2".
  SetAttribute(cast[PIhandle](ih), "SPACING", value)

proc `spacing`*(ih: SpacingTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPACING", value)

proc `spacing`*(ih: SpacingTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPACING")


type SpacinglstTypes* = List_t
proc `spacing=`*(ih: SpacinglstTypes, value: string) {.cdecl.} =
  ## internal padding for each item. Notice that vertically the distance between each item will be actually 2x the spacing. It also affects the horizontal margin of the item. In Windows, the text is aligned at the top left of the item always. Valid only when DROPDOWN=NO. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "SPACING", value)

proc `spacing`*(ih: SpacinglstTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPACING", value)

proc `spacing`*(ih: SpacinglstTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPACING")


type SpinTypes* = Text_t | MultiLine_t
proc `spin=`*(ih: SpinTypes, value: string) {.cdecl.} =
  ## (non inheritable, creation only): enables a spin control attached to the element. Default: NO. The spin increments and decrements an integer number. The editing in the element is still available. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "SPIN", value)

proc `spin`*(ih: SpinTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPIN", value)

proc `spin`*(ih: SpinTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPIN")


type SpinalignTypes* = Text_t | MultiLine_t
proc `spinalign=`*(ih: SpinalignTypes, value: string) {.cdecl.} =
  ## (creation only): the position of the spin. Can be LEFT or RIGHT. Default: RIGHT. In GTK is always RIGHT.
  SetAttribute(cast[PIhandle](ih), "SPINALIGN", value)

proc `spinalign`*(ih: SpinalignTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPINALIGN", value)

proc `spinalign`*(ih: SpinalignTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPINALIGN")


type SpinautoTypes* = Text_t | MultiLine_t
proc `spinauto=`*(ih: SpinautoTypes, value: string) {.cdecl.} =
  ## creation only): enables the automatic update of the text contents. Default: YES. Use SPINAUTO=NO and the VALUE attribute during SPIN_CB to control the text contents when the spin is incremented.
  SetAttribute(cast[PIhandle](ih), "SPINAUTO", value)

proc `spinauto`*(ih: SpinautoTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPINAUTO", value)

proc `spinauto`*(ih: SpinautoTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPINAUTO")


type SpinincTypes* = Text_t | MultiLine_t
proc `spininc=`*(ih: SpinincTypes, value: string) {.cdecl.} =
  ## (non inheritable): the increment value. Default: 1.
  SetAttribute(cast[PIhandle](ih), "SPININC", value)

proc `spininc`*(ih: SpinincTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPININC", value)

proc `spininc`*(ih: SpinincTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPININC")


type SpinmaxTypes* = Text_t | MultiLine_t
proc `spinmax=`*(ih: SpinmaxTypes, value: string) {.cdecl.} =
  ## (non inheritable): the maximum value. Default: 100.
  SetAttribute(cast[PIhandle](ih), "SPINMAX", value)

proc `spinmax`*(ih: SpinmaxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPINMAX", value)

proc `spinmax`*(ih: SpinmaxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPINMAX")


type SpinminTypes* = Text_t | MultiLine_t
proc `spinmin=`*(ih: SpinminTypes, value: string) {.cdecl.} =
  ## (non inheritable): the minimum value. Default: 0.
  SetAttribute(cast[PIhandle](ih), "SPINMIN", value)

proc `spinmin`*(ih: SpinminTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPINMIN", value)

proc `spinmin`*(ih: SpinminTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPINMIN")


type SpinvalueTypes* = Text_t | MultiLine_t
proc `spinvalue=`*(ih: SpinvalueTypes, value: string) {.cdecl.} =
  ## (non inheritable): the current value of the spin. The value is limited to the minimum and maximum values.
  SetAttribute(cast[PIhandle](ih), "SPINVALUE", value)

proc `spinvalue`*(ih: SpinvalueTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPINVALUE", value)

proc `spinvalue`*(ih: SpinvalueTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPINVALUE")


type SpinwrapTypes* = Text_t | MultiLine_t
proc `spinwrap=`*(ih: SpinwrapTypes, value: string) {.cdecl.} =
  ## (creation only): if the position reach a limit it continues from the opposite limit. Default: NO.
  SetAttribute(cast[PIhandle](ih), "SPINWRAP", value)

proc `spinwrap`*(ih: SpinwrapTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SPINWRAP", value)

proc `spinwrap`*(ih: SpinwrapTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SPINWRAP")


type StartfocusTypes* = Dialog_t
proc `startfocus=`*(ih: StartfocusTypes, value: string) {.cdecl.} =
  ## Name of the element that must receive the focus right after the dialog is shown using IupShow or IupPopup. If not defined then the first control than can receive the focus is selected (same effect of calling IupNextField for the dialog). Updated after SHOW_CB is called and only if the focus was not changed during the callback.
  SetAttribute(cast[PIhandle](ih), "STARTFOCUS", value)

proc `startfocus`*(ih: StartfocusTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "STARTFOCUS", value)

proc `startfocus`*(ih: StartfocusTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "STARTFOCUS")


type StretchtxtfmtTypes* = User_t
proc `stretch=`*(ih: StretchtxtfmtTypes, value: string) {.cdecl.} =
  ## [GTK Only]: Can be EXTRA_CONDENSED, CONDENSED, SEMI_CONDENSED, NORMAL, SEMI_EXPANDED, EXPANDED and EXTRA_EXPANDED. Default NORMAL. (Does not work always, depends on the font)
  SetAttribute(cast[PIhandle](ih), "STRETCH", value)

proc `stretch`*(ih: StretchtxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "STRETCH", value)

proc `stretch`*(ih: StretchtxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "STRETCH")


type StrikeouttxtfmtTypes* = User_t
proc `strikeout=`*(ih: StrikeouttxtfmtTypes, value: string) {.cdecl.} =
  ## Can be YES or NO. Default NO.
  SetAttribute(cast[PIhandle](ih), "STRIKEOUT", value)

proc `strikeout`*(ih: StrikeouttxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "STRIKEOUT", value)

proc `strikeout`*(ih: StrikeouttxtfmtTypes): bool {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "STRIKEOUT") == "YES"

proc `strikeout=`*(ih: StrikeouttxtfmtTypes, yes:bool = true) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "STRIKEOUT", cstring((if yes: "YES" else: "NO")))

proc `strikeout`*(ih: StrikeouttxtfmtTypes, yes:bool = true) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "STRIKEOUT", cstring((if yes: "YES" else: "NO")))

type SunkenfrmTypes* = Frame_t
proc `sunken=`*(ih: SunkenfrmTypes, value: string) {.cdecl.} =
  ## When not using a title, the frame line defines a sunken area (lowered area). Valid values: YES or NO. Default: NO.
  SetAttribute(cast[PIhandle](ih), "SUNKEN", value)

proc `sunken`*(ih: SunkenfrmTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "SUNKEN", value)

proc `sunken`*(ih: SunkenfrmTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "SUNKEN")


type TabsarraytxtfmtTypes* = User_t
proc `tabsarray=`*(ih: TabsarraytxtfmtTypes, value: string) {.cdecl.} =
  ## a sequence of tab positions and alignment up to 32 tabs. It uses the format:"pos align pos align pos align...". Position is the distance relative to the left margin and alignment can be LEFT, CENTER, RIGHT and DECIMAL. In GTK only LEFT is currently supported. When DECIMAL alignment is used, the text is aligned according to a decimal point or period in the text, it is normally used to align numbers.
  SetAttribute(cast[PIhandle](ih), "TABSARRAY", value)

proc `tabsarray`*(ih: TabsarraytxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TABSARRAY", value)

proc `tabsarray`*(ih: TabsarraytxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TABSARRAY")


type TabsizeTypes* = Text_t | MultiLine_t
proc `tabsize=`*(ih: TabsizeTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only]: Valid only when MULTILINE=YES. Controls the number of characters for a tab stop. Default: 8.
  SetAttribute(cast[PIhandle](ih), "TABSIZE", value)

proc `tabsize`*(ih: TabsizeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TABSIZE", value)

proc `tabsize`*(ih: TabsizeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TABSIZE")


type TaskbarbuttonTypes* = Dialog_t
proc `taskbarbutton=`*(ih: TaskbarbuttonTypes, value: string) {.cdecl.} =
  ## [Windows Only]: If set to SHOW force the application button to be shown on the taskbar even if the dialog does not have decorations. If set to HIDE force the application button to be hidden from the taskbar, but also in this case the system menu, the maximize and minimize buttons will be hidden. (since 3.28)
  SetAttribute(cast[PIhandle](ih), "TASKBARBUTTON", value)

proc `taskbarbutton`*(ih: TaskbarbuttonTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TASKBARBUTTON", value)

proc `taskbarbutton`*(ih: TaskbarbuttonTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TASKBARBUTTON")


type TaskbarprogressTypes* = Dialog_t
proc `taskbarprogress=`*(ih: TaskbarprogressTypes, value: string) {.cdecl.} =
  ## [Windows Only] (write-only): this functionality enables the use of progress bar on a taskbar button (Windows 7 or earlier version) (Available only for Visual C++ 10 and above). Default: NO (since 3.10).
  SetAttribute(cast[PIhandle](ih), "TASKBARPROGRESS", value)

proc `taskbarprogress`*(ih: TaskbarprogressTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TASKBARPROGRESS", value)


type TaskbarprogressstateTypes* = Dialog_t
proc `taskbarprogressstate=`*(ih: TaskbarprogressstateTypes, value: string) {.cdecl.} =
  ## [Windows Only] (write-only): sets the type and state of the progress indicator displayed on a taskbar button. Possible values: NORMAL (a green bar), PAUSED (a yellow bar), ERROR (a red bar), INDETERMINATE (a green marquee) and NOPROGRESS (no bar). Default: NORMAL (since 3.10).
  SetAttribute(cast[PIhandle](ih), "TASKBARPROGRESSSTATE", value)

proc `taskbarprogressstate`*(ih: TaskbarprogressstateTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TASKBARPROGRESSSTATE", value)


type TaskbarprogressvalueTypes* = Dialog_t
proc `taskbarprogressvalue=`*(ih: TaskbarprogressvalueTypes, value: string) {.cdecl.} =
  ## [Windows Only] (write-only): updates a progress bar hosted in a taskbar button to show the specific percentage completed of the full operation. The value must be between 0 and 100 (since 3.10).
  SetAttribute(cast[PIhandle](ih), "TASKBARPROGRESSVALUE", value)

proc `taskbarprogressvalue`*(ih: TaskbarprogressvalueTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TASKBARPROGRESSVALUE", value)


type ThemeTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Vbox_t | Hbox_t | Text_t | MultiLine_t | BackgroundBox_t
proc `theme=`*(ih: ThemeTypes, value: string) {.cdecl.} =
  ## Applies a set of attributes to a control. The THEME attribute in inheritable and the NTHEME attribute is NOT inheritable.
  SetAttribute(cast[PIhandle](ih), "THEME", value)

proc `theme`*(ih: ThemeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "THEME", value)

proc `theme`*(ih: ThemeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "THEME")


type TimeTypes* = Timer_t
proc `time=`*(ih: TimeTypes, value: string) {.cdecl.} =
  ## The time interval in milliseconds. In Windows the minimum value is 10ms.
  SetAttribute(cast[PIhandle](ih), "TIME", value)

proc `time`*(ih: TimeTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIME", value)

proc `time`*(ih: TimeTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIME")

proc `time=`*(ih: TimeTypes, ms: int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIME", cstring(&"{ms}"))

proc `time`*(ih: TimeTypes, ms: int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIME", cstring(&"{ms}"))

type TipTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tip=`*(ih: TipTypes, value: string) {.cdecl.} =
  ## Text to be shown when the mouse lies over the element.
  SetAttribute(cast[PIhandle](ih), "TIP", value)

proc `tip`*(ih: TipTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIP", value)

proc `tip`*(ih: TipTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIP")


type TipballoonTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tipballoon=`*(ih: TipballoonTypes, value: string) {.cdecl.} =
  ## [Windows Only]: The tip window will have the appearance of a cartoon "balloon"with rounded corners and a stem pointing to the item. Default: NO.
  SetAttribute(cast[PIhandle](ih), "TIPBALLOON", value)

proc `tipballoon`*(ih: TipballoonTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPBALLOON", value)

proc `tipballoon`*(ih: TipballoonTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPBALLOON")


type TipballoontitleTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tipballoontitle=`*(ih: TipballoontitleTypes, value: string) {.cdecl.} =
  ## [Windows Only]: When using the balloon format, the tip can also has a title in a separate area.
  SetAttribute(cast[PIhandle](ih), "TIPBALLOONTITLE", value)

proc `tipballoontitle`*(ih: TipballoontitleTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPBALLOONTITLE", value)

proc `tipballoontitle`*(ih: TipballoontitleTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPBALLOONTITLE")


type TipballoontitleiconTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tipballoontitleicon=`*(ih: TipballoontitleiconTypes, value: string) {.cdecl.} =
  ## [Windows Only]: When using the balloon format, the tip can also has a pre-defined icon in the title area. Values can be:
  ## "0"- No icon (default)
  ## "1"- Info icon
  ## "2"- Warning icon
  ## "3"- Error Icon
  SetAttribute(cast[PIhandle](ih), "TIPBALLOONTITLEICON", value)

proc `tipballoontitleicon`*(ih: TipballoontitleiconTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPBALLOONTITLEICON", value)

proc `tipballoontitleicon`*(ih: TipballoontitleiconTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPBALLOONTITLEICON")


type TipbgcolorTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tipbgcolor=`*(ih: TipbgcolorTypes, value: string) {.cdecl.} =
  ## [Windows and Motif Only]: The tip background color. Default: "255 255 225"(Light Yellow)
  SetAttribute(cast[PIhandle](ih), "TIPBGCOLOR", value)

proc `tipbgcolor`*(ih: TipbgcolorTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPBGCOLOR", value)

proc `tipbgcolor`*(ih: TipbgcolorTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPBGCOLOR")


type TipdelayTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tipdelay=`*(ih: TipdelayTypes, value: string) {.cdecl.} =
  ## [Windows and Motif Only]: Time the tip will remain visible. Default: "5000". In Windows the maximum value is 32767 milliseconds.
  SetAttribute(cast[PIhandle](ih), "TIPDELAY", value)

proc `tipdelay`*(ih: TipdelayTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPDELAY", value)

proc `tipdelay`*(ih: TipdelayTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPDELAY")


type TipfgcolorTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tipfgcolor=`*(ih: TipfgcolorTypes, value: string) {.cdecl.} =
  ## [Windows and Motif Only]: The tip text color. Default: "0 0 0"(Black)
  SetAttribute(cast[PIhandle](ih), "TIPFGCOLOR", value)

proc `tipfgcolor`*(ih: TipfgcolorTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPFGCOLOR", value)

proc `tipfgcolor`*(ih: TipfgcolorTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPFGCOLOR")


type TipfontTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tipfont=`*(ih: TipfontTypes, value: string) {.cdecl.} =
  ## [Windows and Motif Only]: The font for the tip text. If not defined the font used for the text is the same as the FONT attribute for the element. If the value is SYSTEM then, no font is selected and the default system font for the tip will be used.
  SetAttribute(cast[PIhandle](ih), "TIPFONT", value)

proc `tipfont`*(ih: TipfontTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPFONT", value)

proc `tipfont`*(ih: TipfontTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPFONT")


type TipiconTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tipicon=`*(ih: TipiconTypes, value: string) {.cdecl.} =
  ## [GTK only]: name of an image to be displayed in the TIP. See IupImage. (GTK 2.12)
  SetAttribute(cast[PIhandle](ih), "TIPICON", value)

proc `tipicon`*(ih: TipiconTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPICON", value)

proc `tipicon`*(ih: TipiconTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPICON")


type TipmarkupTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tipmarkup=`*(ih: TipmarkupTypes, value: string) {.cdecl.} =
  ## [GTK only]: allows the tip string to contains Pango markup commands. Can be "YES"or "NO". Default: "NO". Must be set before setting the TIP attribute. (GTK 2.12)
  SetAttribute(cast[PIhandle](ih), "TIPMARKUP", value)

proc `tipmarkup`*(ih: TipmarkupTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPMARKUP", value)

proc `tipmarkup`*(ih: TipmarkupTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPMARKUP")


type TiprectTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tiprect=`*(ih: TiprectTypes, value: string) {.cdecl.} =
  ## (non inheritable): Specifies a rectangle inside the element where the tip will be activated. Format: "%d %d %d %d"="x1 y1 x2 y2". Default: all the element area. (GTK 2.12)
  SetAttribute(cast[PIhandle](ih), "TIPRECT", value)

proc `tiprect`*(ih: TiprectTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPRECT", value)

proc `tiprect`*(ih: TiprectTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPRECT")


type TipvisibleTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `tipvisible=`*(ih: TipvisibleTypes, value: string) {.cdecl.} =
  ## Shows or hides the tip under the mouse cursor. Use values "YES"or "NO". Returns the current visible state. (GTK 2.12) (since 3.5)
  SetAttribute(cast[PIhandle](ih), "TIPVISIBLE", value)

proc `tipvisible`*(ih: TipvisibleTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TIPVISIBLE", value)

proc `tipvisible`*(ih: TipvisibleTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TIPVISIBLE")


type TitleTypes* = Label_t | Dialog_t
proc `title=`*(ih: TitleTypes, value: string) {.cdecl.} =
  ## Element’s title. It is often used to modify some static text of the element (which cannot be changed by the user).
  ## Notes
  ## 
  ## The '\n'character usually is accepted for line change (except for menus).
  ## The "&"character can be used to define a MNEMONIC, use "&&"to show the "&"character instead on defining a mnemonic.
  ## If a mnemonic is defined then the character relative to it is underlined and a key is associated so that when pressed together with the Alt key activates the control.
  ## In GTk, if you define a mnemonic using "&"and the string has an underscore, then make sure that the mnemonic comes before the underscore.
  ## In GTK, if the MARKUP attribute is defined then the title string can contains pango markup commands. Works only if a mnemonic is NOT defined in the title. Not valid for menus.
  SetAttribute(cast[PIhandle](ih), "TITLE", value)

proc `title`*(ih: TitleTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TITLE", value)

proc `title`*(ih: TitleTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TITLE")


type TitletogTypes* = Toggle_t
proc `title=`*(ih: TitletogTypes, value: string) {.cdecl.} =
  ## (non inheritable): Toggle's text. If IMAGE is not defined before map, then the default behavior is to contain a text. The button behavior can not be changed after map. The natural size will be larger enough to include all the text in the selected font, even using multiple lines, plus the button borders or check box if any. The '\n'character is accepted for line change. The "&"character can be used to define a mnemonic, the next character will be used as key. Use "&&"to show the "&"character instead on defining a mnemonic. The toggle can be activated from any control in the dialog using the "Alt+key"combination. (mnemonic support since 3.0)
  SetAttribute(cast[PIhandle](ih), "TITLE", value)

proc `title`*(ih: TitletogTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TITLE", value)

proc `title`*(ih: TitletogTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TITLE")


type TitlefrmTypes* = Frame_t
proc `title=`*(ih: TitlefrmTypes, value: string) {.cdecl.} =
  ## (non inheritable): Text the user will see at the top of the frame. If not defined during creation it can not be added lately, to be changed it must be at least ""during creation.
  SetAttribute(cast[PIhandle](ih), "TITLE", value)

proc `title`*(ih: TitlefrmTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TITLE", value)

proc `title`*(ih: TitlefrmTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TITLE")


type ToolboxTypes* = Dialog_t
proc `toolbox=`*(ih: ToolboxTypes, value: string) {.cdecl.} =
  ## [Windows Only] (creation only): makes the dialog look like a toolbox with a smaller title bar. It is only valid if the PARENTDIALOG or NATIVEPARENT attribute is also defined. Default: NO.
  SetAttribute(cast[PIhandle](ih), "TOOLBOX", value)

proc `toolbox`*(ih: ToolboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TOOLBOX", value)

proc `toolbox`*(ih: ToolboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TOOLBOX")


type TopitemTypes* = List_t
proc `topitem=`*(ih: TopitemTypes, value: string) {.cdecl.} =
  ## (write-only): position the given item at the top of the list or near to make it visible. Valid only when DROPDOWN=NO. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "TOPITEM", value)

proc `topitem`*(ih: TopitemTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TOPITEM", value)


type TopmostTypes* = Dialog_t
proc `topmost=`*(ih: TopmostTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only]: puts the dialog always in front of all other dialogs in all applications. Default: NO.
  SetAttribute(cast[PIhandle](ih), "TOPMOST", value)

proc `topmost`*(ih: TopmostTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TOPMOST", value)

proc `topmost`*(ih: TopmostTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TOPMOST")


type TouchTypes* = Canvas_t
proc `touch=`*(ih: TouchTypes, value: string) {.cdecl.} =
  ## [Windows 7 Only]: enable the multi-touch events processing. (since 3.3)
  SetAttribute(cast[PIhandle](ih), "TOUCH", value)

proc `touch`*(ih: TouchTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TOUCH", value)

proc `touch`*(ih: TouchTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TOUCH")


type TrayTypes* = Dialog_t
proc `tray=`*(ih: TrayTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only]: When set to "YES", displays an icon on the system tray. (GTK 2.10 and GTK <3.14)
  SetAttribute(cast[PIhandle](ih), "TRAY", value)

proc `tray`*(ih: TrayTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TRAY", value)

proc `tray`*(ih: TrayTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TRAY")


type TrayimageTypes* = Dialog_t
proc `trayimage=`*(ih: TrayimageTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only]: Name of a IUP image to be used as the tray icon. The Windows SDK recommends that cursors and icons should be implemented as resources rather than created at run time. (GTK 2.10 and GTK <3.14)
  SetAttribute(cast[PIhandle](ih), "TRAYIMAGE", value)

proc `trayimage`*(ih: TrayimageTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TRAYIMAGE", value)

proc `trayimage`*(ih: TrayimageTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TRAYIMAGE")


type TraytipTypes* = Dialog_t
proc `traytip=`*(ih: TraytipTypes, value: string) {.cdecl.} =
  ## [Windows and GTK Only]: Tray icon's tooltip text. (GTK 2.10 and GTK <3.14)
  SetAttribute(cast[PIhandle](ih), "TRAYTIP", value)

proc `traytip`*(ih: TraytipTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TRAYTIP", value)

proc `traytip`*(ih: TraytipTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TRAYTIP")


type TraytipballoonTypes* = Dialog_t
proc `traytipballoon=`*(ih: TraytipballoonTypes, value: string) {.cdecl.} =
  ## [Windows Only]: The tip window will have the appearance of a cartoon "balloon"with rounded corners and a stem pointing to the item. Default: NO. Must be set before setting the TRAYTIP attribute. (since 3.6)
  SetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOON", value)

proc `traytipballoon`*(ih: TraytipballoonTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOON", value)

proc `traytipballoon`*(ih: TraytipballoonTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOON")


type TraytipballoondelayTypes* = Dialog_t
proc `traytipballoondelay=`*(ih: TraytipballoondelayTypes, value: string) {.cdecl.} =
  ## [Windows Only]: Time the tip will remain visible. Default is system dependent. The minimum and maximum values are 10000 and 30000 milliseconds. Must be set before setting the TRAYTIP attribute. (since 3.6)
  SetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOONDELAY", value)

proc `traytipballoondelay`*(ih: TraytipballoondelayTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOONDELAY", value)

proc `traytipballoondelay`*(ih: TraytipballoondelayTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOONDELAY")


type TraytipballoontitleTypes* = Dialog_t
proc `traytipballoontitle=`*(ih: TraytipballoontitleTypes, value: string) {.cdecl.} =
  ## [Windows Only]: When using the balloon format, the tip can also has a title in a separate area. Must be set before setting the TRAYTIP attribute. (since 3.6)
  SetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOONTITLE", value)

proc `traytipballoontitle`*(ih: TraytipballoontitleTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOONTITLE", value)

proc `traytipballoontitle`*(ih: TraytipballoontitleTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOONTITLE")


type TraytipballoontitleiconTypes* = Dialog_t
proc `traytipballoontitleicon=`*(ih: TraytipballoontitleiconTypes, value: string) {.cdecl.} =
  ## [Windows Only]: When using the balloon format, the tip can also has a pre-defined icon in the title area. Must be set before setting the TRAYTIP attribute. (since 3.6)
  ## Values can be:
  ## "0"- No icon (default)
  ## "1"- Info icon
  ## "2"- Warning icon
  ## "3"- Error Icon
  SetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOONTITLEICON", value)

proc `traytipballoontitleicon`*(ih: TraytipballoontitleiconTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOONTITLEICON", value)

proc `traytipballoontitleicon`*(ih: TraytipballoontitleiconTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TRAYTIPBALLOONTITLEICON")


type TraytipmarkupTypes* = Dialog_t
proc `traytipmarkup=`*(ih: TraytipmarkupTypes, value: string) {.cdecl.} =
  ## GTK Only]: allows the tip string to contains Pango markup commands. Can be "YES"or "NO". Default: "NO". Must be set before setting the TRAYTIP attribute. (GTK 2.16) (since 3.6)
  SetAttribute(cast[PIhandle](ih), "TRAYTIPMARKUP", value)

proc `traytipmarkup`*(ih: TraytipmarkupTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "TRAYTIPMARKUP", value)

proc `traytipmarkup`*(ih: TraytipmarkupTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "TRAYTIPMARKUP")


type UnderlinetxtfmtTypes* = User_t
proc `underline=`*(ih: UnderlinetxtfmtTypes, value: string) {.cdecl.} =
  ## Can be SINGLE, DOUBLE, DOTTED or NONE. Default NONE. DOTTED is supported only in Windows.
  SetAttribute(cast[PIhandle](ih), "UNDERLINE", value)

proc `underline`*(ih: UnderlinetxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "UNDERLINE", value)

proc `underline`*(ih: UnderlinetxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "UNDERLINE")


type UnitstxtfmtTypes* = User_t
proc `units=`*(ih: UnitstxtfmtTypes, value: string) {.cdecl.} =
  ## [Windows Only]: By default all distance units are integers in pixels, but in Windows you can also specify integer units in TWIPs (one twip is 1/1440 of an inch). Can be TWIP or PIXELS. Default: PIXELS.
  SetAttribute(cast[PIhandle](ih), "UNITS", value)

proc `units`*(ih: UnitstxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "UNITS", value)

proc `units`*(ih: UnitstxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "UNITS")


type ValueTypes* = Text_t | MultiLine_t
proc `value=`*(ih: ValueTypes, value: string) {.cdecl.} =
  ## (non inheritable): Text entered by the user. The '\n'character indicates a new line, valid only when MULTILINE=YES. After the element is mapped and if there is no text will return the empty string "".
  SetAttribute(cast[PIhandle](ih), "VALUE", value)

proc `value`*(ih: ValueTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VALUE", value)

proc `value`*(ih: ValueTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VALUE")


type ValuetogTypes* = Toggle_t
proc `value=`*(ih: ValuetogTypes, value: string) {.cdecl.} =
  ## (non inheritable): Toggle's state. Values can be "ON", "OFF"or "TOGGLE". If 3STATE=YES then can also be "NOTDEF". Default: "OFF". The TOGGLE option will invert the current state (since 3.7). In GTK if you change the state of a radio, the unchecked toggle will receive an ACTION callback notification. Can only be set to ON if the toggle is inside a radio, it will automatically set to OFF the previous toggle that was ON in the radio.
  SetAttribute(cast[PIhandle](ih), "VALUE", value)

proc `value`*(ih: ValuetogTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VALUE", value)

proc `value`*(ih: ValuetogTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VALUE")


type ValuelstTypes* = List_t
proc `value=`*(ih: ValuelstTypes, value: string) {.cdecl.} =
  ## (non inheritable): Depends on the DROPDOWN+EDITBOX combination:
  ## EDITBOX=YES: Text entered by the user.
  ## MULTIPLE=YES: Sequence of '+'and '-'symbols indicating the state of each item. When setting this value, the user must provide the same amount of '+'and '-'symbols as the amount of items in the list, otherwise the specified items will be deselected.
  ## Others: Integer number representing the selected item in the list (begins at 1). It can be zero if there is no selected item. (In Motif when DROPDOWN=YES there is always an item selected, except when the list is empty).
  ## Should return a non NULL value, even when the list is empty or the text box is empty. It can be NULL when no item selected (since 3.0).
  SetAttribute(cast[PIhandle](ih), "VALUE", value)

proc `value`*(ih: ValuelstTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VALUE", value)

proc `value`*(ih: ValuelstTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VALUE")


type ValuemaskedTypes* = Text_t | MultiLine_t
proc `valuemasked=`*(ih: ValuemaskedTypes, value: string) {.cdecl.} =
  ## (non inheritable) (write-only): sets VALUE but first checks if it is validated by MASK. If not does nothing. (since 3.4)
  SetAttribute(cast[PIhandle](ih), "VALUEMASKED", value)

proc `valuemasked`*(ih: ValuemaskedTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VALUEMASKED", value)


type ValuemaskedlstTypes* = List_t
proc `valuemasked=`*(ih: ValuemaskedlstTypes, value: string) {.cdecl.} =
  ## (non inheritable) (write-only): sets VALUE but first checks if it is validated by MASK. If not does nothing. Works only when EDITBOX=YES. (since 3.13)
  SetAttribute(cast[PIhandle](ih), "VALUEMASKED", value)

proc `valuemasked`*(ih: ValuemaskedlstTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VALUEMASKED", value)

proc `valuemasked`*(ih: ValuemaskedlstTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VALUEMASKED")


type ValuestringlstTypes* = List_t
proc `valuestring=`*(ih: ValuestringlstTypes, value: string) {.cdecl.} =
  ## (non inheritable): changes or retrieves the value attribute using a string of an item. Works only when EDITBOX=NO and DROPDOWN=YES, or DROPDOWN=NO and MULTIPLE=NO. When set it will search for the first item with the same string. (since 3.12)
  SetAttribute(cast[PIhandle](ih), "VALUESTRING", value)

proc `valuestring`*(ih: ValuestringlstTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VALUESTRING", value)

proc `valuestring`*(ih: ValuestringlstTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VALUESTRING")


type VisibleTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `visible=`*(ih: VisibleTypes, value: string) {.cdecl.} =
  ## Shows or hides the element.
  ## 
  ## Value
  ## "YES"(visible), "NO"(hidden).
  ## Default: "YES"
  ## 
  ## Notes
  ## An interface element is only visible if its native parent is also visible.
  ## 
  ## Affects
  ## All controls that have visual representation, except menus.
  SetAttribute(cast[PIhandle](ih), "VISIBLE", value)

proc `visible`*(ih: VisibleTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VISIBLE", value)

proc `visible`*(ih: VisibleTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VISIBLE")


type VisiblecollumnslstTypes* = List_t
proc `visiblecollumns=`*(ih: VisiblecollumnslstTypes, value: string) {.cdecl.} =
  ## Defines the number of visible columns for the Natural Size, this means that will act also as minimum number of visible columns. It uses a wider character size then the one used for the SIZE attribute so strings will fit better without the need of extra columns. Set this attribute to speed Natural Size computation for very large lists. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "VISIBLECOLLUMNS", value)

proc `visiblecollumns`*(ih: VisiblecollumnslstTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VISIBLECOLLUMNS", value)

proc `visiblecollumns`*(ih: VisiblecollumnslstTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VISIBLECOLLUMNS")


type VisiblecolumnsTypes* = Text_t | MultiLine_t
proc `visiblecolumns=`*(ih: VisiblecolumnsTypes, value: string) {.cdecl.} =
  ## Defines the number of visible columns for the Natural Size, this means that will act also as minimum number of visible columns. It uses a wider character size than the one used for the SIZE attribute so strings will fit better without the need of extra columns. As for SIZE you can set to NULL after map to use it as an initial value. Default: 5 (since 3.0)
  SetAttribute(cast[PIhandle](ih), "VISIBLECOLUMNS", value)

proc `visiblecolumns`*(ih: VisiblecolumnsTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VISIBLECOLUMNS", value)

proc `visiblecolumns`*(ih: VisiblecolumnsTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VISIBLECOLUMNS")


type VisibleitemslstTypes* = List_t
proc `visibleitems=`*(ih: VisibleitemslstTypes, value: string) {.cdecl.} =
  ## [Windows and Motif Only]: Number of items that are visible when DROPDOWN=YES is used for the dropdown list. Default: 5.
  SetAttribute(cast[PIhandle](ih), "VISIBLEITEMS", value)

proc `visibleitems`*(ih: VisibleitemslstTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VISIBLEITEMS", value)

proc `visibleitems`*(ih: VisibleitemslstTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VISIBLEITEMS")


type VisiblelinesTypes* = Text_t | MultiLine_t
proc `visiblelines=`*(ih: VisiblelinesTypes, value: string) {.cdecl.} =
  ## When MULTILINE=YES defines the number of visible lines for the Natural Size, this means that will act also as minimum number of visible lines. As for SIZE you can set to NULL after map to use it as an initial value. Default: 1 (since 3.0)
  SetAttribute(cast[PIhandle](ih), "VISIBLELINES", value)

proc `visiblelines`*(ih: VisiblelinesTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VISIBLELINES", value)

proc `visiblelines`*(ih: VisiblelinesTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VISIBLELINES")


type VisiblelineslstTypes* = List_t
proc `visiblelines=`*(ih: VisiblelineslstTypes, value: string) {.cdecl.} =
  ## When DROPDOWN=NO defines the number of visible lines for the Natural Size, this means that will act also as minimum number of visible lines. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "VISIBLELINES", value)

proc `visiblelines`*(ih: VisiblelineslstTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "VISIBLELINES", value)

proc `visiblelines`*(ih: VisiblelineslstTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "VISIBLELINES")


type WeighttxtfmtTypes* = User_t
proc `weight=`*(ih: WeighttxtfmtTypes, value: string) {.cdecl.} =
  ## Can be EXTRALIGHT, LIGHT, NORMAL, SEMIBOLD, BOLD, EXTRABOLD and HEAVY. Default: NORMAL.
  SetAttribute(cast[PIhandle](ih), "WEIGHT", value)

proc `weight`*(ih: WeighttxtfmtTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "WEIGHT", value)

proc `weight`*(ih: WeighttxtfmtTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "WEIGHT")


type WheeldropfocusTypes* = Canvas_t
proc `wheeldropfocus=`*(ih: WheeldropfocusTypes, value: string) {.cdecl.} =
  ## (non inheritable): when the wheel is used the focus control receives a SHOWDROPDOWN=No. (since 3.28)
  SetAttribute(cast[PIhandle](ih), "WHEELDROPFOCUS", value)

proc `wheeldropfocus`*(ih: WheeldropfocusTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "WHEELDROPFOCUS", value)

proc `wheeldropfocus`*(ih: WheeldropfocusTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "WHEELDROPFOCUS")


type WidTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Vbox_t | Hbox_t | Image_t | ImageRGB_t | ImageRGBA_t | Text_t | MultiLine_t | Timer_t
proc `wid`*(ih: WidTypes): string {.cdecl.} =
  ## Element identifier in the native interface system.
  ## 
  ## Value
  ## In Motif, returns the Widget handle.
  ## In Windows, returns the HWND handle.
  ## In GTK, return the GtkWidget* handle.
  ## 
  ## Notes
  ## Verification-only attribute, available after the control is mapped.
  ## For elements that do not have a native representation, NULL is returned.
  return $GetAttribute(cast[PIhandle](ih), "WID")


type WidthTypes* = Image_t | ImageRGB_t | ImageRGBA_t
proc `width`*(ih: WidthTypes): string {.cdecl.} =
  ## (read-only): Image width in pixels.
  return $GetAttribute(cast[PIhandle](ih), "WIDTH")


type WordwrapTypes* = Label_t | Text_t | MultiLine_t
proc `wordwrap=`*(ih: WordwrapTypes, value: string) {.cdecl.} =
  ## [Windows and GTK only]: enables or disable the wrapping of lines that does not fits in the label. Can be "YES"or "NO". Default: "NO". Can only set WORDWRAP=YES if ALIGNMENT=ALEFT. (since 3.0)
  SetAttribute(cast[PIhandle](ih), "WORDWRAP", value)

proc `wordwrap`*(ih: WordwrapTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "WORDWRAP", value)

proc `wordwrap`*(ih: WordwrapTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "WORDWRAP")


type XautohidecanvasTypes* = Canvas_t
proc `xautohide=`*(ih: XautohidecanvasTypes, value: string) {.cdecl.} =
  ## When enabled, if DX >= XMAX-XMIN then the horizontal scrollbar is hidden. Default: "YES". (since 3.0)
  SetAttribute(cast[PIhandle](ih), "XAUTOHIDE", value)

proc `xautohide`*(ih: XautohidecanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "XAUTOHIDE", value)

proc `xautohide`*(ih: XautohidecanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "XAUTOHIDE")


type XdisplayTypes* = Canvas_t
proc `xdisplay`*(ih: XdisplayTypes): string {.cdecl.} =
  ## [UNIX Only](non inheritable, read-only): Returns the X-Windows Display. Available in the Motif driver or in the GTK driver in UNIX.
  return $GetAttribute(cast[PIhandle](ih), "XDISPLAY")


type XmaxcanvasTypes* = Canvas_t
proc `xmax=`*(ih: XmaxcanvasTypes, value: string) {.cdecl.} =
  ## Maximum value of the horizontal scrollbar. Default: "1.0".
  SetAttribute(cast[PIhandle](ih), "XMAX", value)

proc `xmax`*(ih: XmaxcanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "XMAX", value)

proc `xmax`*(ih: XmaxcanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "XMAX")


type XmincanvasTypes* = Canvas_t
proc `xmin=`*(ih: XmincanvasTypes, value: string) {.cdecl.} =
  ## Minimum value of the horizontal scrollbar. Default: "0.0".
  SetAttribute(cast[PIhandle](ih), "XMIN", value)

proc `xmin`*(ih: XmincanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "XMIN", value)

proc `xmin`*(ih: XmincanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "XMIN")


type XwindowTypes* = Canvas_t | Dialog_t
proc `xwindow`*(ih: XwindowTypes): string {.cdecl.} =
  ## [UNIX Only] (non inheritable, read-only): Returns the X-Windows Window (Drawable). Available in the Motif driver or in the GTK driver in UNIX.
  return $GetAttribute(cast[PIhandle](ih), "XWINDOW")


type YautohidecanvasTypes* = Canvas_t
proc `yautohide=`*(ih: YautohidecanvasTypes, value: string) {.cdecl.} =
  ## When enabled, if DY >= YMAX-YMIN then the vertical scrollbar is hidden. Default: "YES". (since 3.0)
  SetAttribute(cast[PIhandle](ih), "YAUTOHIDE", value)

proc `yautohide`*(ih: YautohidecanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "YAUTOHIDE", value)

proc `yautohide`*(ih: YautohidecanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "YAUTOHIDE")


type YmaxcanvasTypes* = Canvas_t
proc `ymax=`*(ih: YmaxcanvasTypes, value: string) {.cdecl.} =
  ## Maximum value of the vertical scrollbar. Default: "1.0".
  SetAttribute(cast[PIhandle](ih), "YMAX", value)

proc `ymax`*(ih: YmaxcanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "YMAX", value)

proc `ymax`*(ih: YmaxcanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "YMAX")


type YmincanvasTypes* = Canvas_t
proc `ymin=`*(ih: YmincanvasTypes, value: string) {.cdecl.} =
  ## Minimum value of the vertical scrollbar. Default: "0.0".
  SetAttribute(cast[PIhandle](ih), "YMIN", value)

proc `ymin`*(ih: YmincanvasTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "YMIN", value)

proc `ymin`*(ih: YmincanvasTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "YMIN")


type ZorderTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t
proc `zorder=`*(ih: ZorderTypes, value: string) {.cdecl.} =
  ## Change the ZORDER of a dialog or control. It is commonly used for dialogs, but it can be used to control the z-order of controls in a dialog.
  ## 
  ## Value
  ## Can be "TOP"or "BOTTOM".
  ## 
  ## Affects
  ## All controls that have visual representation.
  SetAttribute(cast[PIhandle](ih), "ZORDER", value)

proc `zorder`*(ih: ZorderTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "ZORDER", value)


type BackimagebgboxTypes* = BackgroundBox_t
proc `backimage=`*(ih: BackimagebgboxTypes, value: string) {.cdecl.} =
  ## (non inheritable): image name to be used as background. Use IupSetHandle or IupSetAttributeHandle to associate an image to a name. See also IupImage. When defined the ACTION callback of the IupCanvas will be defined. (since 3.26)
  SetAttribute(cast[PIhandle](ih), "BACKIMAGE", value)

proc `backimage`*(ih: BackimagebgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BACKIMAGE", value)

proc `backimage`*(ih: BackimagebgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BACKIMAGE")


type BackimagezoombgboxTypes* = BackgroundBox_t
proc `backimagezoom=`*(ih: BackimagezoombgboxTypes, value: string) {.cdecl.} =
  ## (non inheritable): if set the back image will be zoomed to occupy the full background. Aspect ratio is NOT preserved. Can be Yes or No. Default: No. (since 3.26)
  SetAttribute(cast[PIhandle](ih), "BACKIMAGEZOOM", value)

proc `backimagezoom`*(ih: BackimagezoombgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BACKIMAGEZOOM", value)

proc `backimagezoom`*(ih: BackimagezoombgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BACKIMAGEZOOM")


type BackcolorbgboxTypes* = BackgroundBox_t
proc `backcolor=`*(ih: BackcolorbgboxTypes, value: string) {.cdecl.} =
  ## (non inheritable): if defined used to fill the background color when BACKIMAGE is defined. If not defined BGCOLOR is used. (since 3.26)
  SetAttribute(cast[PIhandle](ih), "BACKCOLOR", value)

proc `backcolor`*(ih: BackcolorbgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BACKCOLOR", value)

proc `backcolor`*(ih: BackcolorbgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BACKCOLOR")


type BgcolorbgboxTypes* = BackgroundBox_t
proc `bgcolor=`*(ih: BgcolorbgboxTypes, value: string) {.cdecl.} =
  ## by default will use the background color of the native parent, but can be set to a custom value (since 3.11).
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", value)

proc `bgcolor`*(ih: BgcolorbgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", value)

proc `bgcolor`*(ih: BgcolorbgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BGCOLOR")

proc `bgcolor`*(ih: BgcolorbgboxTypes, red, green, blue:int, alpha:int = 255) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BGCOLOR", cstring(&"{red} {green} {blue} {alpha}"))

type BorderbgboxTypes* = BackgroundBox_t
proc `border=`*(ih: BorderbgboxTypes, value: string) {.cdecl.} =
  ## (creation only): the default value is "NO".
  SetAttribute(cast[PIhandle](ih), "BORDER", value)

proc `border`*(ih: BorderbgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "BORDER", value)

proc `border`*(ih: BorderbgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "BORDER")


type CanvasboxbgboxTypes* = BackgroundBox_t
proc `canvasbox=`*(ih: CanvasboxbgboxTypes, value: string) {.cdecl.} =
  ## (non inheritable): enable the behavior of a canvas box instead of a regular container. This will affect the EXPAND attribute, the Natural size computation, and children layout distribution. Can be Yes or No. Default: No. (since 3.19)
  SetAttribute(cast[PIhandle](ih), "CANVASBOX", value)

proc `canvasbox`*(ih: CanvasboxbgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CANVASBOX", value)

proc `canvasbox`*(ih: CanvasboxbgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CANVASBOX")


type ChildoffsetbgboxTypes* = BackgroundBox_t
proc `childoffset=`*(ih: ChildoffsetbgboxTypes, value: string) {.cdecl.} =
  ## (non inheritable): Allow to specify a position offset for the child. Available for native containers only. It will not affect the natural size, and allows to position controls outside the client area. Format "dxxdy", where dx and dy are integer values corresponding to the horizontal and vertical offsets, respectively, in pixels. Default: 0x0. (since 3.14)
  SetAttribute(cast[PIhandle](ih), "CHILDOFFSET", value)

proc `childoffset`*(ih: ChildoffsetbgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CHILDOFFSET", value)

proc `childoffset`*(ih: ChildoffsetbgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CHILDOFFSET")

proc `childoffset`*(ih: ChildoffsetbgboxTypes, x, y:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CHILDOFFSET", cstring(&"{x}x{y}"))

type DecorationbgboxTypes* = BackgroundBox_t
proc `decoration=`*(ih: DecorationbgboxTypes, value: string) {.cdecl.} =
  ## (non inheritable): Enable a decoration area around the child. Can be Yes or No. Default No. (since 3.20)
  SetAttribute(cast[PIhandle](ih), "DECORATION", value)

proc `decoration`*(ih: DecorationbgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DECORATION", value)

proc `decoration`*(ih: DecorationbgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DECORATION")


type DecorsizebgboxTypes* = BackgroundBox_t
proc `decorsize=`*(ih: DecorsizebgboxTypes, value: string) {.cdecl.} =
  ## (non inheritable): total size of the decoration in the format "WidthxHeight"(in C "%dx%d). Used only when DECORATION=Yes. (since 3.20)
  SetAttribute(cast[PIhandle](ih), "DECORSIZE", value)

proc `decorsize`*(ih: DecorsizebgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DECORSIZE", value)

proc `decorsize`*(ih: DecorsizebgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DECORSIZE")

proc `decorsize`*(ih: DecorsizebgboxTypes, width, height:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DECORSIZE", cstring(&"{width}x{height}"))

type DecoroffsetbgboxTypes* = BackgroundBox_t
proc `decoroffset=`*(ih: DecoroffsetbgboxTypes, value: string) {.cdecl.} =
  ## (non inheritable): decoration offset from left border and top border in the format "XxY"(in C "%dx%d). Used only when DECORATION=Yes. (since 3.20)
  SetAttribute(cast[PIhandle](ih), "DECOROFFSET", value)

proc `decoroffset`*(ih: DecoroffsetbgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DECOROFFSET", value)

proc `decoroffset`*(ih: DecoroffsetbgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "DECOROFFSET")

proc `decoroffset`*(ih: DecoroffsetbgboxTypes, x, y:int) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "DECOROFFSET", cstring(&"{x}x{y}"))

type ExpandbgboxTypes* = BackgroundBox_t
proc `expand=`*(ih: ExpandbgboxTypes, value: string) {.cdecl.} =
  ## (non inheritable): behaves as a container. See CANVASBOX attribute.
  SetAttribute(cast[PIhandle](ih), "EXPAND", value)

proc `expand`*(ih: ExpandbgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "EXPAND", value)

proc `expand`*(ih: ExpandbgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "EXPAND")


type CanfocusbgboxTypes* = BackgroundBox_t
proc `canfocus=`*(ih: CanfocusbgboxTypes, value: string) {.cdecl.} =
  ## (non inheritable): the default is changed to NO. But it can receive the focus (since 3.19).
  SetAttribute(cast[PIhandle](ih), "CANFOCUS", value)

proc `canfocus`*(ih: CanfocusbgboxTypes, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), "CANFOCUS", value)

proc `canfocus`*(ih: CanfocusbgboxTypes): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), "CANFOCUS")


# CALLBACKS
type ActionTypes* = Button_t
proc `action=`*(control: ActionTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area.
  SetCallback(cast[PIhandle](control), "ACTION", cast[Icallback](cb))
proc `action`*(control: ActionTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "ACTION"))

type Action2Types* = Text_t | MultiLine_t
proc `action=`*(control: Action2Types, cb: proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.}) =
  ## Action generated when the text is edited, but before its value is actually changed. Can be generated when using the keyboard, undo system or from the clipboard.
  ## 
  ## ih: identifier of the element that activated the event.
  ## c: valid alpha numeric character or 0.
  ## new_value: Represents the new text value.
  ## 
  ## Returns: IUP_CLOSE will be processed, but the change will be ignored. If IUP_IGNORE, the system will ignore the new value. If c is valid and returns a valid alpha numeric character, this new character will be used instead. The VALUE attribute can be changed only if IUP_IGNORE is returned.
  SetCallback(cast[PIhandle](control), "ACTION", cast[Icallback](cb))
proc `action`*(control: Action2Types): proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "ACTION"))

type ActiontogTypes* = Toggle_t
proc `action=`*(control: ActiontogTypes, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) =
  ## Action generated when the toggle's state (on/off) was changed. The callback also receives the toggle's state.
  ## ih: identifier of the element that activated the event.
  ## state: 1 if the toggle's state was shifted to on; 0 if it was shifted to off.
  SetCallback(cast[PIhandle](control), "ACTION", cast[Icallback](cb))
proc `action`*(control: ActiontogTypes): proc (ih: PIhandle, state: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, state: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "ACTION"))

type ActionlstTypes* = List_t
proc `action=`*(control: ActionlstTypes, cb: proc (ih: PIhandle, text: cstring, item, state: cint): cint {.cdecl.}) =
  ## Action generated when the state of an item in the list is changed. Also provides information on the changed item:
  ## ih: identifier of the element that activated the event.
  ## text: Text of the changed item.
  ## item: Number of the changed item starting at 1.
  ## state: Equal to 1 if the option was selected or to 0 if the option was deselected.
  ## The state=0 is simulated internally by IUP in all systems. If you add or remove items to/from the list and you count on the state=0 value, then after adding/removing items set the VALUE attribute to ensure proper state=0 value.
  SetCallback(cast[PIhandle](control), "ACTION", cast[Icallback](cb))
proc `action`*(control: ActionlstTypes): proc (ih: PIhandle, text: cstring, item, state: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, text: cstring, item, state: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "ACTION"))

type ActioncanvasTypes* = Canvas_t | BackgroundBox_t
proc `action=`*(control: ActioncanvasTypes, cb: proc (ih: PIhandle, posx, posy: cfloat): cint {.cdecl.}) =
  ## Action generated when the canvas needs to be redrawn.
  ## ih: identifier of the element that activated the event.
  ## posx: thumb position in the horizontal scrollbar. The POSX attribute value. Old parameter in float format, use POSX attribute to get the value in double format.
  ## Posy: thumb position in the vertical scrollbar. The POSY attribute value. Old parameter in float format, use POSX attribute to get the value in double format.
  SetCallback(cast[PIhandle](control), "ACTION", cast[Icallback](cb))
proc `action`*(control: ActioncanvasTypes): proc (ih: PIhandle, posx, posy: cfloat): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, posx, posy: cfloat): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "ACTION"))

type Action_cbtimeTypes* = Timer_t
proc `action_cb=`*(control: Action_cbtimeTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called every time the defined time interval is reached. To stop the callback from being called simply stop de timer with RUN=NO. Inside the callback the attribute ELAPSEDTIME returns the time elapsed since the timer was started in milliseconds (since 3.15).
  ## Returns: IUP_CLOSE will be processed.
  SetCallback(cast[PIhandle](control), "ACTION_CB", cast[Icallback](cb))
proc `action_cb`*(control: Action_cbtimeTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "ACTION_CB"))

type Button_cbTypes* = Button_t | Canvas_t | Label_t | Text_t | MultiLine_t | BackgroundBox_t
proc `button_cb=`*(control: Button_cbTypes, cb: proc (ih: PIhandle; button, pressed, x, y: cint; status: cstring): cint {.cdecl.}) =
  ## Action generated when any mouse button is pressed and when it is released. Both calls occur before the ACTION callback when button 1 is being used.
  SetCallback(cast[PIhandle](control), "BUTTON_CB", cast[Icallback](cb))
proc `button_cb`*(control: Button_cbTypes): proc (ih: PIhandle; button, pressed, x, y: cint; status: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle; button, pressed, x, y: cint; status: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "BUTTON_CB"))

type Button_cblstTypes* = List_t
proc `button_cb=`*(control: Button_cblstTypes, cb: proc (ih: PIhandle; button, pressed, x, y: cint; status: cstring): cint {.cdecl.}) =
  ## Action generated when any mouse button is pressed or released inside the list. Called only when DROPDOWN=NO. If the list has an editbox the message is called when cursor is at the listbox only (ignored at the editbox). Use IupConvertXYToPos to convert (x,y) coordinates in item position. (since 3.0)
  SetCallback(cast[PIhandle](control), "BUTTON_CB", cast[Icallback](cb))
proc `button_cb`*(control: Button_cblstTypes): proc (ih: PIhandle; button, pressed, x, y: cint; status: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle; button, pressed, x, y: cint; status: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "BUTTON_CB"))

type Caret_cbTypes* = List_t | Text_t | MultiLine_t
proc `caret_cb=`*(control: Caret_cbTypes, cb: proc (ih: PIhandle, lin, col, pos: cint): cint {.cdecl.}) =
  ## Action generated when the caret/cursor position is changed.
  ## h: identifier of the element that activated the event.
  ## lin, col: line and column number (start at 1).
  ## Pos: 0 based character position.
  ## For single line controls lin is always 1, and pos is always "col-1"
  SetCallback(cast[PIhandle](control), "CARET_CB", cast[Icallback](cb))
proc `caret_cb`*(control: Caret_cbTypes): proc (ih: PIhandle, lin, col, pos: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, lin, col, pos: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "CARET_CB"))

type Close_cbTypes* = Dialog_t
proc `close_cb=`*(control: Close_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called just before a dialog is closed when the user clicks the close button of the title bar or an equivalent action.
  ## Returns: if IUP_IGNORE, it prevents the dialog from being closed. If you destroy the dialog in this callback, you must return IUP_IGNORE. IUP_CLOSE will be processed.
  SetCallback(cast[PIhandle](control), "CLOSE_CB", cast[Icallback](cb))
proc `close_cb`*(control: Close_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "CLOSE_CB"))

type Copydata_cbTypes* = Dialog_t
proc `copydata_cb=`*(control: Copydata_cbTypes, cb: proc (ph: PIhandle, cmdLine: cstring, size: cint): cint {.cdecl.}) =
  ## [Windows Only]: Called at the first instance, when a second instance is running. Must set the global attribute SINGLEINSTANCE to be called. (since 3.2)
  ## Ih: identifier of the element that activated the event.
  ## cmdLine: command line of the second instance.
  ## size: size of the command line string including the null character.
  SetCallback(cast[PIhandle](control), "COPYDATA_CB", cast[Icallback](cb))
proc `copydata_cb`*(control: Copydata_cbTypes): proc (ph: PIhandle, cmdLine: cstring, size: cint): cint {.cdecl.} =
  return cast[proc (ph: PIhandle, cmdLine: cstring, size: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "COPYDATA_CB"))

type Customframe_cbTypes* = Dialog_t
proc `customframe_cb=`*(control: Customframe_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## [Windows Only]: Called when the dialog must be redraw. Although it is designed for drawing the frame elements, all the dialog must be painted. Works only when CUSTOMFRAME or CUSTOMFRAMEEX is defined. The dialog can be used just like an IupCanvas to draw its elements, the HDC_WMPAINT and CLIPRECT attributes are defined during the callback. For mouse callbacks use the same callbacks as IupCanvas, such as BUTTON_CB and MOTION_CB. (since 3.18)
  SetCallback(cast[PIhandle](control), "CUSTOMFRAME_CB", cast[Icallback](cb))
proc `customframe_cb`*(control: Customframe_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "CUSTOMFRAME_CB"))

type Customframeactivate_cbTypes* = Dialog_t
proc `customframeactivate_cb=`*(control: Customframeactivate_cbTypes, cb: proc (ih: PIhandle, active: cint): cint {.cdecl.}) =
  ## [Windows Only]: Called when the dialog active state is changed (for instance the user Alt+Tab to another application, or clicked in another window). Works only when CUSTOMFRAME or CUSTOMFRAMEEX is defined. (since 3.23)
  ## Ih: identifier of the element that activated the event.
  ## active: is non zero if the dialog is active or zero if it is inactive.
  SetCallback(cast[PIhandle](control), "CUSTOMFRAMEACTIVATE_CB", cast[Icallback](cb))
proc `customframeactivate_cb`*(control: Customframeactivate_cbTypes): proc (ih: PIhandle, active: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, active: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "CUSTOMFRAMEACTIVATE_CB"))

type Dblclick_cbTypes* = List_t
proc `dblclick_cb=`*(control: Dblclick_cbTypes, cb: proc (ih: PIhandle, item: cint, text: cstring): cint {.cdecl.}) =
  ## Action generated when the user double click an item. Called only when DROPDOWN=NO. (since 3.0)
  ## ih: identifier of the element that activated the event.
  ## item: Number of the selected item starting at 1.
  ## Text: Text of the selected item.
  SetCallback(cast[PIhandle](control), "DBLCLICK_CB", cast[Icallback](cb))
proc `dblclick_cb`*(control: Dblclick_cbTypes): proc (ih: PIhandle, item: cint, text: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, item: cint, text: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DBLCLICK_CB"))

type Destroy_cbTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | Toggle_t | BackgroundBox_t
proc `destroy_cb=`*(control: Destroy_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called right before an element is destroyed.
  SetCallback(cast[PIhandle](control), "DESTROY_CB", cast[Icallback](cb))
proc `destroy_cb`*(control: Destroy_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DESTROY_CB"))

type Dragbegin_cbTypes* = Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | BackgroundBox_t
proc `dragbegin_cb=`*(control: Dragbegin_cbTypes, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) =
  ## notifies source that drag started. It is called when the mouse starts a drag operation.
  ## ih: identifier of the element that activated the event.
  ## x, y: cursor position relative to the top-left corner of the element.
  ## 
  ## Returns: If IUP_IGNORE is returned the drag is aborted.
  SetCallback(cast[PIhandle](control), "DRAGBEGIN_CB", cast[Icallback](cb))
proc `dragbegin_cb`*(control: Dragbegin_cbTypes): proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DRAGBEGIN_CB"))

type Dragdata_cbTypes* = Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | BackgroundBox_t
proc `dragdata_cb=`*(control: Dragdata_cbTypes, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) =
  ## request for drag data from source. It is called when the data is dropped.
  ## Ih: identifier of the element that activated the event.
  ## type: type of the data. It is one of the registered types in DRAGTYPES.
  ## data: buffer to be filled by the application. In Lua is a light userdata. If your data is a string you can use iup.CopyString2UserData(str, data, size) to copy the string into the user data (since 3.27).
  ## size: buffer size in bytes. The same value returned by DRAGDATASIZE_CB.
  SetCallback(cast[PIhandle](control), "DRAGDATA_CB", cast[Icallback](cb))
proc `dragdata_cb`*(control: Dragdata_cbTypes): proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DRAGDATA_CB"))

type Dragdatasize_cbTypes* = Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | BackgroundBox_t
proc `dragdatasize_cb=`*(control: Dragdatasize_cbTypes, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) =
  ## request for size of drag data from source. It is called when the data is dropped, before the DRAGDATA_CB callback.
  ## ih: identifier of the element that activated the event.
  ## type: type of the data. It is one of the registered types in DRAGTYPES.
  ## 
  ## Returns: the size in bytes for the data. It will be used to allocate the buffer size for the data in transfer.
  SetCallback(cast[PIhandle](control), "DRAGDATASIZE_CB", cast[Icallback](cb))
proc `dragdatasize_cb`*(control: Dragdatasize_cbTypes): proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DRAGDATASIZE_CB"))

type Dragdrop_cblstTypes* = Canvas_t | List_t | BackgroundBox_t
proc `dragdrop_cb=`*(control: Dragdrop_cblstTypes, cb: proc (ih: PIhandle, drag_id, drop_id, isshift, iscontrol: cint): cint {.cdecl.}) =
  ## Action generated when an internal drag and drop is executed. Only active if SHOWDRAGDROP=YES. (since 3.7)
  ## ih: identifier of the element that activated the event.
  ## drag_id: Identifier of the clicked item where the drag start.
  ## drop_id: Identifier of the clicked item where the drop were executed. -1 indicates a drop in a blank area.
  ## isshift: flag indicating the shift key state.
  ## iscontrol: flag indicating the control key state.
  ## Returns: if returns IUP_CONTINUE, or if the callback is not defined and SHOWDRAGDROP=YES, then the item is moved to the new position. If Ctrl is pressed then the item is copied instead of moved.
  SetCallback(cast[PIhandle](control), "DRAGDROP_CB", cast[Icallback](cb))
proc `dragdrop_cb`*(control: Dragdrop_cblstTypes): proc (ih: PIhandle, drag_id, drop_id, isshift, iscontrol: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, drag_id, drop_id, isshift, iscontrol: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DRAGDROP_CB"))

type Dragend_cbTypes* = Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | BackgroundBox_t
proc `dragend_cb=`*(control: Dragend_cbTypes, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) =
  ## notifies source that drag is done. The only drag callback that is optional. It is called after the data has been dropped.
  ## ih: identifier of the element that activated the event.
  ## action: action performed by the operation (1 = move, 0 = copy, -1 = drag failed or aborted)
  ## 
  ## If action is 1 it is responsibility of the application to remove the data from source.
  SetCallback(cast[PIhandle](control), "DRAGEND_CB", cast[Icallback](cb))
proc `dragend_cb`*(control: Dragend_cbTypes): proc (ih: PIhandle, action: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, action: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DRAGEND_CB"))

type Dropdata_cbTypes* = Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | BackgroundBox_t
proc `dropdata_cb=`*(control: Dropdata_cbTypes, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) =
  ## source has sent target the requested data. It is called when the data is dropped. If both drag and drop would be in the same application it would be called after the DRAGDATA_CB callback.
  ## ih: identifier of the element that activated the event.
  ## type: type of the data. It is one of the registered types in DROPTYPES.
  ## data: content data received in the drop operation.  In Lua is a light userdata. If your data is a string you can use "str = iup.CopyUserData2String(data, size)"to copy the user data into a string (since 3.27).
  ## size: data size in bytes.
  ## x, y: cursor position relative to the top-left corner of the element.
  SetCallback(cast[PIhandle](control), "DROPDATA_CB", cast[Icallback](cb))
proc `dropdata_cb`*(control: Dropdata_cbTypes): proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DROPDATA_CB"))

type Dropdown_cbTypes* = Canvas_t | List_t | BackgroundBox_t
proc `dropdown_cb=`*(control: Dropdown_cbTypes, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) =
  ## Action generated when the list of a dropdown is shown or hidden. Called only when DROPDOWN=YES. (since 3.0)
  ## ih: identifier of the element that activated the event.
  ## State: state of the list 1=shown, 0=hidden.
  SetCallback(cast[PIhandle](control), "DROPDOWN_CB", cast[Icallback](cb))
proc `dropdown_cb`*(control: Dropdown_cbTypes): proc (ih: PIhandle, state: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, state: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DROPDOWN_CB"))

type Dropfiles_cbTypes* = Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | BackgroundBox_t
proc `dropfiles_cb=`*(control: Dropfiles_cbTypes, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) =
  ## [Windows and GTK Only]: Action generated when one or more files are dropped in the element. (since 3.3)
  ## filename: Name of the dropped file.
  ## num: Number index of the dropped file. If several files are dropped, num is the index of the dropped file starting from "total-1"to "0".
  ## x: X coordinate of the point where the user released the mouse button.
  ## y: Y coordinate of the point where the user released the mouse button.
  ## 
  ## Returns: If IUP_IGNORE is returned the callback will NOT be called for the next dropped files, and the processing of dropped files will be interrupted.
  SetCallback(cast[PIhandle](control), "DROPFILES_CB", cast[Icallback](cb))
proc `dropfiles_cb`*(control: Dropfiles_cbTypes): proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.} =
  return cast[proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DROPFILES_CB"))

type Dropmotion_cbTypes* = Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | BackgroundBox_t
proc `dropmotion_cb=`*(control: Dropmotion_cbTypes, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) =
  ## notifies destination about drag pointer motion. The only drop callback that is optional. It is called when the mouse moves over any valid drop site.
  ## Ih: identifier of the element that activated the event.
  ## x, y: position in the canvas where the event has occurred, in pixels.
  ## status: status of mouse buttons and certain keyboard keys at the moment the event was generated. The same macros used for BUTTON_CB can be used for this status.
  SetCallback(cast[PIhandle](control), "DROPMOTION_CB", cast[Icallback](cb))
proc `dropmotion_cb`*(control: Dropmotion_cbTypes): proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "DROPMOTION_CB"))

type Edit_cbTypes* = List_t
proc `edit_cb=`*(control: Edit_cbTypes, cb: proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.}) =
  ## Action generated when the text in the text box is manually changed by the user, but before its value is actually updated. Valid only when EDITBOX=YES.
  ## ih: identifier of the element that activated the event.
  ## c: valid alpha numeric character or 0.
  ## new_value: Represents the new text value.
  ## Returns: IUP_CLOSE will be processed, but the change will be ignored. If IUP_IGNORE, the system will ignore the new value. If c is valid and returns a valid alpha numeric character, this new character will be used instead. The VALUE attribute can be changed only if IUP_IGNORE is returned.
  ## This is the same ACTION callback definition as for the IupText.
  SetCallback(cast[PIhandle](control), "EDIT_CB", cast[Icallback](cb))
proc `edit_cb`*(control: Edit_cbTypes): proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "EDIT_CB"))

type Enterwindow_cbTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | Toggle_t | BackgroundBox_t
proc `enterwindow_cb=`*(control: Enterwindow_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when the mouse enters the native element.
  ## 
  ## Notes
  ## When the cursor is moved from one element to another, the call order in all platforms will be first the LEAVEWINDOW_CB callback of the old control followed by the ENTERWINDOW_CB callback of the new control. (since 3.14)
  ## If the mouse button is hold pressed and the cursor moves outside the element the behavior is system dependent. In Windows the LEAVEWINDOW_CB/ENTERWINDOW_CB callbacks are NOT called, in GTK the callbacks are called.
  SetCallback(cast[PIhandle](control), "ENTERWINDOW_CB", cast[Icallback](cb))
proc `enterwindow_cb`*(control: Enterwindow_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "ENTERWINDOW_CB"))

type Focus_cbTypes* = Canvas_t | Frame_t | BackgroundBox_t
proc `focus_cb=`*(control: Focus_cbTypes, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) =
  ## Called when a child of the container gets or looses the focus. It is called only if PROPAGATEFOCUS is defined in the child. (since 3.23)
  ## ih: identifier of the element that activated the event.
  ## Focus: is non zero if the canvas is getting the focus, is zero if it is loosing the focus.
  SetCallback(cast[PIhandle](control), "FOCUS_CB", cast[Icallback](cb))
proc `focus_cb`*(control: Focus_cbTypes): proc (ih: PIhandle, focus: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, focus: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "FOCUS_CB"))

type Getfocus_cbTypes* = Button_t | Canvas_t | List_t | Dialog_t | Text_t | MultiLine_t | Toggle_t | BackgroundBox_t
proc `getfocus_cb=`*(control: Getfocus_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus.
  SetCallback(cast[PIhandle](control), "GETFOCUS_CB", cast[Icallback](cb))
proc `getfocus_cb`*(control: Getfocus_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "GETFOCUS_CB"))

type Help_cbTypes* = Button_t | Canvas_t | List_t | Dialog_t | Text_t | MultiLine_t | Toggle_t | BackgroundBox_t
proc `help_cb=`*(control: Help_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when the user press F1 at a control. In Motif is also activated by the Help button in some workstations keyboard.
  SetCallback(cast[PIhandle](control), "HELP_CB", cast[Icallback](cb))
proc `help_cb`*(control: Help_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "HELP_CB"))

type K_anyTypes* = Button_t | Canvas_t | List_t | Dialog_t | Text_t | MultiLine_t | Toggle_t | BackgroundBox_t
proc `k_any=`*(control: K_anyTypes, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  ## Action generated when a keyboard event occurs.
  ## ih: identifier of the element that activated the event.
  ## c: identifier of typed key. Please refer to the Keyboard Codes table for a list of possible values.
  ## Returns: If IUP_IGNORE is returned the key is ignored and not processed by the control and not propagated. If returns IUP_CONTINUE, the key will be processed and the event will be propagated to the parent of the element receiving it, this is the default behavior. If returns IUP_DEFAULT the key is processed but it is not propagated. IUP_CLOSE will be processed.
  ## 
  ## Notes
  ## Keyboard callbacks depend on the keyboard usage of the control with the focus. So if you return IUP_IGNORE the control will usually not process the key. But be aware that sometimes the control process the key in another event so even returning IUP_IGNORE the key can get processed. Although it will not be propagated.
  ## 
  ## IMPORTANT: The callbacks "K_\*"of the dialog or native containers depend on the IUP_CONTINUE return value to work while the control is in focus.
  ## If the callback does not exists it is automatically propagated to the parent of the element.
  ## 
  ## K_* callbacks
  ## All defined keys are also callbacks of any element, called when the respective key is activated. For example: "K_cC"is also a callback activated when the user press Ctrl+C, when the focus is at the element or at a children with focus. This is the way an application can create shortcut keys, also called hot keys. These callbacks are not available in IupLua.
  SetCallback(cast[PIhandle](control), "K_ANY", cast[Icallback](cb))
proc `k_any`*(control: K_anyTypes): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ANY"))

type Keypress_cbcanvasTypes* = Canvas_t | BackgroundBox_t
proc `keypress_cb=`*(control: Keypress_cbcanvasTypes, cb: proc (ih: PIhandle, c, press: cint): cint {.cdecl.}) =
  ## Action generated when a key is pressed or released. If the key is pressed and held several calls will occur. It is called after the callback K_ANY is processed.
  ## ih: identifier of the element that activated the event.
  ## c: identifier of typed key. Please refer to the Keyboard Codes table for a list of possible values.
  ## press: 1 is the user pressed the key or 0 otherwise.
  ## Returns: If IUP_IGNORE is returned the key is ignored by the system. IUP_CLOSE will be processed.
  SetCallback(cast[PIhandle](control), "KEYPRESS_CB", cast[Icallback](cb))
proc `keypress_cb`*(control: Keypress_cbcanvasTypes): proc (ih: PIhandle, c, press: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c, press: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "KEYPRESS_CB"))

type Killfocus_cbTypes* = Button_t | Canvas_t | List_t | Dialog_t | Text_t | MultiLine_t | Toggle_t | BackgroundBox_t
proc `killfocus_cb=`*(control: Killfocus_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus.
  SetCallback(cast[PIhandle](control), "KILLFOCUS_CB", cast[Icallback](cb))
proc `killfocus_cb`*(control: Killfocus_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "KILLFOCUS_CB"))

type Leavewindow_cbTypes* = Button_t | Canvas_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | Toggle_t | BackgroundBox_t
proc `leavewindow_cb=`*(control: Leavewindow_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when the mouse leaves the native element.
  ## 
  ## Notes
  ## When the cursor is moved from one element to another, the call order in all platforms will be first the LEAVEWINDOW_CB callback of the old control followed by the ENTERWINDOW_CB callback of the new control. (since 3.14)
  ## If the mouse button is hold pressed and the cursor moves outside the element the behavior is system dependent. In Windows the LEAVEWINDOW_CB/ENTERWINDOW_CB callbacks are NOT called, in GTK the callbacks are called.
  SetCallback(cast[PIhandle](control), "LEAVEWINDOW_CB", cast[Icallback](cb))
proc `leavewindow_cb`*(control: Leavewindow_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "LEAVEWINDOW_CB"))

type Map_cbTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | Toggle_t | BackgroundBox_t
proc `map_cb=`*(control: Map_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called right after an element is mapped and its attributes updated in IupMap.
  ## When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB (since 3.14).
  SetCallback(cast[PIhandle](control), "MAP_CB", cast[Icallback](cb))
proc `map_cb`*(control: Map_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "MAP_CB"))

type Mdiactivate_cbTypes* = Dialog_t
proc `mdiactivate_cb=`*(control: Mdiactivate_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## [Windows Only]: Called when a MDI child window is activated. Only the MDI child receive this message. It is not called when the child is shown for the first time.
  SetCallback(cast[PIhandle](control), "MDIACTIVATE_CB", cast[Icallback](cb))
proc `mdiactivate_cb`*(control: Mdiactivate_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "MDIACTIVATE_CB"))

type Motion_cbTypes* = Canvas_t | Label_t | Text_t | MultiLine_t | BackgroundBox_t
proc `motion_cb=`*(control: Motion_cbTypes, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) =
  ## Action generated when the mouse is moved. (since 3.20)
  ## X, y: position in the canvas where the event has occurred, in pixels.
  ## status: status of mouse buttons and certain keyboard keys at the moment the event was generated. The same macros used for BUTTON_CB can be used for this status.
  SetCallback(cast[PIhandle](control), "MOTION_CB", cast[Icallback](cb))
proc `motion_cb`*(control: Motion_cbTypes): proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "MOTION_CB"))

type Motion_cblstTypes* = List_t
proc `motion_cb=`*(control: Motion_cblstTypes, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) =
  ## Action generated when the mouse is moved over the list. Called only when DROPDOWN=NO. If the list has an editbox the message is called when cursor is at the listbox only (ignored at the editbox). Use IupConvertXYToPos to convert (x,y) coordinates in item position. (since 3.0)
  SetCallback(cast[PIhandle](control), "MOTION_CB", cast[Icallback](cb))
proc `motion_cb`*(control: Motion_cblstTypes): proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "MOTION_CB"))

type Move_cbTypes* = Dialog_t
proc `move_cb=`*(control: Move_cbTypes, cb: proc (ih: PIhandle, x, y: cint): cint {.cdecl.}) =
  ## [Windows and GTK Only]: Called after the dialog was moved on screen. The coordinates are the same as the SCREENPOSITION attribute. (since 3.0)
  ## x, y: coordinates of the new position.
  SetCallback(cast[PIhandle](control), "MOVE_CB", cast[Icallback](cb))
proc `move_cb`*(control: Move_cbTypes): proc (ih: PIhandle, x, y: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x, y: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "MOVE_CB"))

type Multiselect_cbTypes* = List_t
proc `multiselect_cb=`*(control: Multiselect_cbTypes, cb: proc (ih: PIhandle, value: cstring): cint {.cdecl.}) =
  ## Action generated when the state of an item in the multiple selection list is changed. But it is called only when the interaction is over.
  ## ih: identifier of the element that activated the event.
  ## value: Similar to the VALUE attribute for a multiple selection list. Items selected are marked with '+', items deselected are marked with '-', and non changed items are marked with an 'x'.
  ## This callback is called only when MULTIPLE=YES. If this callback is defined the ACTION callback will not be called.
  ## The non changed items marked with 'x'are simulated internally by IUP in all systems. If you add or remove items to/from the list and you count on the 'x'values, then after adding/removing items set the VALUE attribute to ensure proper 'x'values.
  SetCallback(cast[PIhandle](control), "MULTISELECT_CB", cast[Icallback](cb))
proc `multiselect_cb`*(control: Multiselect_cbTypes): proc (ih: PIhandle, value: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, value: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "MULTISELECT_CB"))

type Multitouch_cbTypes* = Canvas_t | BackgroundBox_t
proc `multitouch_cb=`*(control: Multitouch_cbTypes, cb: proc (ih: PIhandle, count: cint, pid, px, py, pstate: ptr cint): cint {.cdecl.}) =
  ## [Windows 7 Only]: Action generated when multiple touch events occurred. Must set TOUCH=Yes to receive this event. (Since 3.3)
  ## ih: identifier of the element that activated the event.
  ## count: Number of touch points in the array.
  ## pid: Array of touch point ids.
  ## px: Array of touch point x coordinates in pixels, relative to the top-left corner of the canvas.
  ## py: Array of touch point y coordinates in pixels, relative to the top-left corner of the canvas.
  ## pstate: Array of touch point states. Can be 'D'(DOWN), 'U'(UP) or 'M'(MOVE).
  ## Returns: IUP_CLOSE will be processed.
  SetCallback(cast[PIhandle](control), "MULTITOUCH_CB", cast[Icallback](cb))
proc `multitouch_cb`*(control: Multitouch_cbTypes): proc (ih: PIhandle, count: cint, pid, px, py, pstate: ptr cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, count: cint, pid, px, py, pstate: ptr cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "MULTITOUCH_CB"))

type Resize_cbTypes* = Canvas_t | Dialog_t | BackgroundBox_t
proc `resize_cb=`*(control: Resize_cbTypes, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) =
  ## Action generated when the canvas or dialog size is changed.
  ## ih: identifier of the element that activated the event.
  ## width: the width of the internal element size in pixels not considering the decorations (client size)
  ## height: the height of the internal element size in pixels not considering the decorations (client size)
  ## 
  ## Notes
  ## For the dialog, this action is also generated when the dialog is mapped, after the map and before the show.
  ## When XAUTOHIDE=Yes or YAUTOHIDE=Yes, if the canvas scrollbar is hidden/shown after changing the DX or DY attributes from inside the callback, the size of the drawing area will immediately change, so the parameters with and height will be invalid. To update the parameters consult the DRAWSIZE attribute. Also activate the drawing toolkit only after updating the DX or DY attributes.
  SetCallback(cast[PIhandle](control), "RESIZE_CB", cast[Icallback](cb))
proc `resize_cb`*(control: Resize_cbTypes): proc (ih: PIhandle, width, height: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, width, height: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "RESIZE_CB"))

type Scroll_cbTypes* = Canvas_t | BackgroundBox_t
proc `scroll_cb=`*(control: Scroll_cbTypes, cb: proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.}) =
  ## Called when some manipulation is made to the scrollbar. The canvas is automatically redrawn only if this callback is NOT defined.
  ## (GTK 2.8) Also the POSX and POSY values will not be correctly updated for older GTK versions.
  ## In Ubuntu, when liboverlay-scrollbar is enabled (the new tiny auto-hide scrollbar) only the IUP_SBPOSV and IUP_SBPOSH codes are used.
  ## ih: identifier of the element that activated the event.
  ## op: indicates the operation performed on the scrollbar.
  ## If the manipulation was made on the vertical scrollbar, it can have the following values:
  ## IUP_SBUP - line up
  ## IUP_SBDN - line down
  ## IUP_SBPGUP - page up
  ## IUP_SBPGDN - page down
  ## IUP_SBPOSV - vertical positioning
  ## IUP_SBDRAGV - vertical drag
  ## 
  ## If it was on the horizontal scrollbar, the following values are valid:
  ## IUP_SBLEFT - column left
  ## IUP_SBRIGHT - column right
  ## IUP_SBPGLEFT - page left
  ## IUP_SBPGRIGHT - page right
  ## IUP_SBPOSH - horizontal positioning
  ## IUP_SBDRAGH - horizontal drag
  ## 
  ## posx, posy: the same as the ACTION canvas callback (corresponding to the values of attributes POSX and POSY).
  ## 
  ## Notes
  ## IUP_SBDRAGH and IUP_SBDRAGV are not supported in GTK. During drag IUP_SBPOSH and IUP_SBPOSV are used.
  ## In Windows, after a drag when mouse is released IUP_SBPOSH or IUP_SBPOSV are called.
  SetCallback(cast[PIhandle](control), "SCROLL_CB", cast[Icallback](cb))
proc `scroll_cb`*(control: Scroll_cbTypes): proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, op: cint, posx, posy: cfloat): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "SCROLL_CB"))

type Show_cbTypes* = Dialog_t
proc `show_cb=`*(control: Show_cbTypes, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) =
  ## Called right after the dialog is showed, hidden, maximized, minimized or restored from minimized/maximized. This callback is called when those actions were performed by the user or programmatically by the application.
  ## ih: identifier of the element that activated the event.
  ## state: indicates which of the following situations generated the event:
  ## IUP_HIDE (since 3.0)
  ## IUP_SHOW
  ## IUP_RESTORE (was minimized or maximized)
  ## IUP_MINIMIZE
  ## IUP_MAXIMIZE (since 3.0) (not received in Motif when activated from the maximize button)
  ## Returns: IUP_CLOSE will be processed.
  SetCallback(cast[PIhandle](control), "SHOW_CB", cast[Icallback](cb))
proc `show_cb`*(control: Show_cbTypes): proc (ih: PIhandle, state: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, state: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "SHOW_CB"))

type Spin_cbTypes* = Text_t | MultiLine_t
proc `spin_cb=`*(control: Spin_cbTypes, cb: proc (ih: PIhandle, pos: cint): cint {.cdecl.}) =
  ## Action generated when a spin button is pressed. Valid only when SPIN=YES. When this callback is called the ACTION callback is not called. The VALUE attribute can be changed during this callback only if SPINAUTO=NO. (since 3.0)
  ## ih: identifier of the element that activated the event.
  ## pos: the value of the spin (after it was incremented).
  ## Returns: IUP_IGNORE is processed in Windows and Motif.
  SetCallback(cast[PIhandle](control), "SPIN_CB", cast[Icallback](cb))
proc `spin_cb`*(control: Spin_cbTypes): proc (ih: PIhandle, pos: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, pos: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "SPIN_CB"))

type Tips_cbTypes* = Button_t
proc `tips_cb=`*(control: Tips_cbTypes, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) =
  ## Action before a tip is displayed.
  SetCallback(cast[PIhandle](control), "TIPS_CB", cast[Icallback](cb))
proc `tips_cb`*(control: Tips_cbTypes): proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "TIPS_CB"))

type Touch_cbTypes* = Canvas_t | BackgroundBox_t
proc `touch_cb=`*(control: Touch_cbTypes, cb: proc (ih: PIhandle, id, x, y: cint, state: cstring): cint {.cdecl.}) =
  ## [Windows 7 Only]: Action generated when a touch event occurred. Multiple touch events will trigger several calls. Must set TOUCH=Yes to receive this event. (Since 3.3)
  ## ih: identifies the element that activated the event.
  ## id: identifies the touch point.
  ## x, y: position in pixels, relative to the top-left corner of the canvas.
  ## state: the touch point state. Can be: DOWN, MOVE or UP. If the point is a "primary"point then "-PRIMARY"is appended to the string.
  ## Returns: IUP_CLOSE will be processed.
  SetCallback(cast[PIhandle](control), "TOUCH_CB", cast[Icallback](cb))
proc `touch_cb`*(control: Touch_cbTypes): proc (ih: PIhandle, id, x, y: cint, state: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, id, x, y: cint, state: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "TOUCH_CB"))

type Trayclick_cbTypes* = Dialog_t
proc `trayclick_cb=`*(control: Trayclick_cbTypes, cb: proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.}) =
  ## [Windows and GTK Only]: Called right after the mouse button is pressed or released over the tray icon. (GTK 2.10)
  ## ih: identifier of the element that activated the event.
  ## but: identifies the activated mouse button. Can be: 1, 2 or 3. Note that this is different from the BUTTON_CB canvas callback definition. GTK does not get button=2 messages.
  ## pressed: indicates the state of the button. Always 1 in GTK.
  ## dclick: indicates a double click. In GTK double click is simulated.
  ## Returns: IUP_CLOSE will be processed.
  SetCallback(cast[PIhandle](control), "TRAYCLICK_CB", cast[Icallback](cb))
proc `trayclick_cb`*(control: Trayclick_cbTypes): proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "TRAYCLICK_CB"))

type Unmap_cbTypes* = Button_t | Canvas_t | Frame_t | Label_t | List_t | Dialog_t | Text_t | MultiLine_t | Toggle_t | BackgroundBox_t
proc `unmap_cb=`*(control: Unmap_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called right before an element is unmapped.
  SetCallback(cast[PIhandle](control), "UNMAP_CB", cast[Icallback](cb))
proc `unmap_cb`*(control: Unmap_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "UNMAP_CB"))

type Valuechanged_cbTypes* = List_t | Text_t | MultiLine_t
proc `valuechanged_cb=`*(control: Valuechanged_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called after the value was interactively changed by the user. (since 3.0)
  SetCallback(cast[PIhandle](control), "VALUECHANGED_CB", cast[Icallback](cb))
proc `valuechanged_cb`*(control: Valuechanged_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "VALUECHANGED_CB"))

type Wheel_cbTypes* = Canvas_t | BackgroundBox_t
proc `wheel_cb=`*(control: Wheel_cbTypes, cb: proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.}) =
  ## Action generated when the mouse wheel is rotated. If this callback is not defined the wheel will automatically scroll the canvas in the vertical direction by some lines, the SCROLL_CB callback if defined will be called with the IUP_SBDRAGV operation.
  ## ih: identifier of the element that activated the event.
  ## delta: the amount the wheel was rotated in notches.
  ## x, y: position in the canvas where the event has occurred, in pixels.
  ## status: status of mouse buttons and certain keyboard keys at the moment the event was generated. The same macros used for BUTTON_CB can be used for this status.
  ## 
  ## Notes
  ## In Motif and GTK delta is always 1 or -1. In Windows is some situations delta can reach the value of two. In the future with more precise wheels this increment can be changed.
  SetCallback(cast[PIhandle](control), "WHEEL_CB", cast[Icallback](cb))
proc `wheel_cb`*(control: Wheel_cbTypes): proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, delta: cfloat, x, y: cint, status: cstring): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "WHEEL_CB"))

# Attributes

proc `[]`*(ih: IUPhandle_t, attribute: string): string {.cdecl.} =
  return $GetAttribute(cast[PIhandle](ih), attribute)

proc `[]=`*(ih: IUPhandle_t, attribute, value: string) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), cstring(attribute), cstring(value))

proc `[]=`*(ih: IUPhandle_t, attribute: string, value: typeof(nil)) {.cdecl.} =
  SetAttribute(cast[PIhandle](ih), cstring(attribute), value)

proc SetAttributes*(ih: IUPhandle_t, attrs: string) {.cdecl.} =
  SetAttributes(cast[PIhandle](ih), cstring(attrs))

proc GetInt*(ih: IUPhandle_t, name: string): int {.cdecl.} =
  return GetInt(cast[PIhandle](ih), cstring(name))

# Dialog/Reference
proc Show*(ih: IUPhandle_t) {.cdecl.} =
  Show(cast[PIhandle](ih))

proc ShowXY*(ih: IUPhandle_t, x, y: cint | int) {.cdecl.} =
  ShowXY(cast[PIhandle](ih), x, y)

proc Hide*(ih: IUPhandle_t) {.cdecl.} =
  Hide(cast[PIhandle](ih))

proc Message*(title, message: string) {.cdecl.} =
  ## Shows a modal dialog containing a message. It simply creates and popup a IupMessageDlg.
  ##  title: dialog title
  ##  message: text message contents
  ##  format: same format as the C sprintf function
  ## The IupMessage function shows a dialog centralized on the screen, showing the message and the “OK” button. The ‘\n’ character can be added to the message to indicate line change.
  ## The dialog uses a global attribute called "PARENTDIALOG" as the parent dialog if it is defined. It also uses a global attribute called "ICON" as the dialog icon if it is defined (used only in Motif, in Windows MessageBox does not have an icon in the title bar).
  Message(cstring(title), cstring(message))

proc MessageError*(ih: IUPhandle_t, message: string) {.cdecl.} =
  ## Shows a modal dialog containing an error message. It simply creates and popup a IupMessageDlg with DIALOGTYPE=ERROR.
  ##   parent: parent dialog, can be NULL.
  ##   message: text message contents. It can be a language pre-defined string without the "_@" prefix.
  ## If parent is NULL the title defaults to "Error!" and tries the global attribute "PARENTDIALOG" as the parent dialog.
  ## The dialog title will be the same title of the parent dialog.
  ## The dialog is shown centered relative to its parent.
  MessageError(cast[PIhandle](ih), cstring(message))

proc MessageAlarm*(parent: IUPhandle_t, title, message, buttons: string) {.cdecl.} =
  ## Shows a modal dialog containing a question message, similar to IupAlarm. It simply creates and popup a IupMessageDlg with DIALOGTYPE=QUESTION.
  ## parent: parent dialog, can be NULL.
  ##   title: dialog’s title, can be NULL.  It can be a language pre-defined string without the "_@" prefix.
  ##   message: text message contents.  It can be a language pre-defined string without the "_@" prefix.
  ##   buttons: list of buttons. Can have values: "OK", "OKCANCEL", "RETRYCANCEL", "YESNO", or "YESNOCANCEL".
  ## Returns: the number of the button selected by the user (1, 2 or 3).
  ## If parent is NULL the title defaults to "Attention!" and tries the global attribute "PARENTDIALOG" as the parent dialog.
  ## The dialog is shown centered relative to its parent.
  MessageAlarm(cast[PIhandle](parent), cstring(title), cstring(message), cstring(buttons))

# Controls/Management
proc Map*(ih: IUPhandle_t) {.cdecl.} =
  Map(cast[PIhandle](ih))

proc Unmap*(ih: IUPhandle_t) {.cdecl.} =
  Unmap(cast[PIhandle](ih))

proc Destroy*(ih: IUPhandle_t) {.cdecl.} =
  Destroy(cast[PIhandle](ih))

# Resources/Handle Names
proc SetHandle*(name: string, handle: IUPhandle_t ) {.cdecl.} =
  SetHandle(name, cast[PIhandle](handle))

#
proc SetFocus*(ih: IUPhandle_t) {.cdecl.} =
  SetFocus(cast[PIhandle](ih))

# utility functions
proc SetAttributeId*(ih: IUPhandle_t, name: string, id: int, value: string) {.cdecl.} =
  SetAttributeId(cast[PIhandle](ih), cstring(name), id, cstring(value))

proc GetAttributeId*(ih: IUPhandle_t, name: string, id: int): string {.cdecl.} =
  return $GetAttributeId(cast[PIhandle](ih), cstring(name), id)

proc SetIntId*(ih: IUPhandle_t, name: string, id:int , value: int) {.cdecl.} =
  SetIntId(cast[PIhandle](ih), cstring(name), id, value)

proc GetIntId*(ih: IUPhandle_t, name: string, id: int): int {.cdecl.} =
  return GetIntId(cast[PIhandle](ih), cstring(name), int id)

proc SetFloatId*(ih: IUPhandle_t, name: string, id: int, value: float) {.cdecl.} =
  SetFloatId(cast[PIhandle](ih), cstring(name), id, value)

proc GetFloatId*(ih: IUPhandle_t, name: string, id: int): float {.cdecl.} =
  return GetFloatId(cast[PIhandle](ih), name, id)

# List utility functions
proc image*(ih: List_t , n: int, img: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
   SetAttributeHandle(cast[PIhandle](ih), cstring(&"IMAGE{n}"), cast[PIhandle](img))

proc insertitem*(ih: List_t , n: int, value: string) {.cdecl.} =
   SetAttribute(cast[PIhandle](ih), cstring(&"INSERTITEM{n}"), cstring(value))

# Text, MultiLine aux
proc TextConvertLinColToPos(ih: IUPhandle_t, lin, col: int, pos: var int) {.cdecl.} =
  niupc.TextConvertLinColToPos(cast[PIhandle](ih), cint(lin), cint(col), cast[var cint](pos))

proc TextConvertPosToLinCol(ih: IUPhandle_t, pos: int, lin, col: var int) {.cdecl.} =
  niupc.TextConvertPosToLinCol(cast[PIhandle](ih), cint(pos), cast[var cint](lin), cast[var cint](col))

# K_* callbacks
proc `k_sp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_SP", cast[Icallback](cb))
proc `k_sp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_SP"))
proc `k_exclam=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_exclam", cast[Icallback](cb))
proc `k_exclam`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_exclam"))
proc `k_quotedbl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_quotedbl", cast[Icallback](cb))
proc `k_quotedbl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_quotedbl"))
proc `k_numbersign=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_numbersign", cast[Icallback](cb))
proc `k_numbersign`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_numbersign"))
proc `k_dollar=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_dollar", cast[Icallback](cb))
proc `k_dollar`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_dollar"))
proc `k_percent=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_percent", cast[Icallback](cb))
proc `k_percent`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_percent"))
proc `k_ampersand=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_ampersand", cast[Icallback](cb))
proc `k_ampersand`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ampersand"))
proc `k_apostrophe=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_apostrophe", cast[Icallback](cb))
proc `k_apostrophe`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_apostrophe"))
proc `k_parentleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_parentleft", cast[Icallback](cb))
proc `k_parentleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_parentleft"))
proc `k_parentright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_parentright", cast[Icallback](cb))
proc `k_parentright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_parentright"))
proc `k_asterisk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_asterisk", cast[Icallback](cb))
proc `k_asterisk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_asterisk"))
proc `k_plus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_plus", cast[Icallback](cb))
proc `k_plus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_plus"))
proc `k_comma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_comma", cast[Icallback](cb))
proc `k_comma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_comma"))
proc `k_minus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_minus", cast[Icallback](cb))
proc `k_minus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_minus"))
proc `k_period=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_period", cast[Icallback](cb))
proc `k_period`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_period"))
proc `k_slash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_slash", cast[Icallback](cb))
proc `k_slash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_slash"))
proc `k_0=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_0", cast[Icallback](cb))
proc `k_0`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_0"))
proc `k_1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_1", cast[Icallback](cb))
proc `k_1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_1"))
proc `k_2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_2", cast[Icallback](cb))
proc `k_2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_2"))
proc `k_3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_3", cast[Icallback](cb))
proc `k_3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_3"))
proc `k_4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_4", cast[Icallback](cb))
proc `k_4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_4"))
proc `k_5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_5", cast[Icallback](cb))
proc `k_5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_5"))
proc `k_6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_6", cast[Icallback](cb))
proc `k_6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_6"))
proc `k_7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_7", cast[Icallback](cb))
proc `k_7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_7"))
proc `k_8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_8", cast[Icallback](cb))
proc `k_8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_8"))
proc `k_9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_9", cast[Icallback](cb))
proc `k_9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_9"))
proc `k_colon=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_colon", cast[Icallback](cb))
proc `k_colon`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_colon"))
proc `k_semicolon=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_semicolon", cast[Icallback](cb))
proc `k_semicolon`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_semicolon"))
proc `k_less=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_less", cast[Icallback](cb))
proc `k_less`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_less"))
proc `k_equal=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_equal", cast[Icallback](cb))
proc `k_equal`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_equal"))
proc `k_greater=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_greater", cast[Icallback](cb))
proc `k_greater`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_greater"))
proc `k_question=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_question", cast[Icallback](cb))
proc `k_question`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_question"))
proc `k_at=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_at", cast[Icallback](cb))
proc `k_at`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_at"))
proc `k_uppera=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperA", cast[Icallback](cb))
proc `k_uppera`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperA"))
proc `k_upperb=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperB", cast[Icallback](cb))
proc `k_upperb`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperB"))
proc `k_upperc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperC", cast[Icallback](cb))
proc `k_upperc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperC"))
proc `k_upperd=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperD", cast[Icallback](cb))
proc `k_upperd`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperD"))
proc `k_uppere=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperE", cast[Icallback](cb))
proc `k_uppere`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperE"))
proc `k_upperf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperF", cast[Icallback](cb))
proc `k_upperf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperF"))
proc `k_upperg=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperG", cast[Icallback](cb))
proc `k_upperg`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperG"))
proc `k_upperh=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperH", cast[Icallback](cb))
proc `k_upperh`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperH"))
proc `k_upperi=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperI", cast[Icallback](cb))
proc `k_upperi`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperI"))
proc `k_upperj=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperJ", cast[Icallback](cb))
proc `k_upperj`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperJ"))
proc `k_upperk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperK", cast[Icallback](cb))
proc `k_upperk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperK"))
proc `k_upperl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperL", cast[Icallback](cb))
proc `k_upperl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperL"))
proc `k_upperm=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperM", cast[Icallback](cb))
proc `k_upperm`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperM"))
proc `k_uppern=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperN", cast[Icallback](cb))
proc `k_uppern`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperN"))
proc `k_uppero=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperO", cast[Icallback](cb))
proc `k_uppero`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperO"))
proc `k_upperp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperP", cast[Icallback](cb))
proc `k_upperp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperP"))
proc `k_upperq=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperQ", cast[Icallback](cb))
proc `k_upperq`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperQ"))
proc `k_upperr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperR", cast[Icallback](cb))
proc `k_upperr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperR"))
proc `k_uppers=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperS", cast[Icallback](cb))
proc `k_uppers`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperS"))
proc `k_uppert=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperT", cast[Icallback](cb))
proc `k_uppert`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperT"))
proc `k_upperu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperU", cast[Icallback](cb))
proc `k_upperu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperU"))
proc `k_upperv=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperV", cast[Icallback](cb))
proc `k_upperv`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperV"))
proc `k_upperw=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperW", cast[Icallback](cb))
proc `k_upperw`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperW"))
proc `k_upperx=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperX", cast[Icallback](cb))
proc `k_upperx`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperX"))
proc `k_uppery=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperY", cast[Icallback](cb))
proc `k_uppery`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperY"))
proc `k_upperz=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_upperZ", cast[Icallback](cb))
proc `k_upperz`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_upperZ"))
proc `k_bracketleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_bracketleft", cast[Icallback](cb))
proc `k_bracketleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_bracketleft"))
proc `k_backslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_backslash", cast[Icallback](cb))
proc `k_backslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_backslash"))
proc `k_bracketright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_bracketright", cast[Icallback](cb))
proc `k_bracketright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_bracketright"))
proc `k_circum=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_circum", cast[Icallback](cb))
proc `k_circum`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_circum"))
proc `k_underscore=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_underscore", cast[Icallback](cb))
proc `k_underscore`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_underscore"))
proc `k_grave=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_grave", cast[Icallback](cb))
proc `k_grave`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_grave"))
proc `k_lowera=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowera", cast[Icallback](cb))
proc `k_lowera`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowera"))
proc `k_lowerb=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerb", cast[Icallback](cb))
proc `k_lowerb`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerb"))
proc `k_lowerc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerc", cast[Icallback](cb))
proc `k_lowerc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerc"))
proc `k_lowerd=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerd", cast[Icallback](cb))
proc `k_lowerd`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerd"))
proc `k_lowere=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowere", cast[Icallback](cb))
proc `k_lowere`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowere"))
proc `k_lowerf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerf", cast[Icallback](cb))
proc `k_lowerf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerf"))
proc `k_lowerg=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerg", cast[Icallback](cb))
proc `k_lowerg`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerg"))
proc `k_lowerh=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerh", cast[Icallback](cb))
proc `k_lowerh`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerh"))
proc `k_loweri=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_loweri", cast[Icallback](cb))
proc `k_loweri`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_loweri"))
proc `k_lowerj=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerj", cast[Icallback](cb))
proc `k_lowerj`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerj"))
proc `k_lowerk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerk", cast[Icallback](cb))
proc `k_lowerk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerk"))
proc `k_lowerl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerl", cast[Icallback](cb))
proc `k_lowerl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerl"))
proc `k_lowerm=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerm", cast[Icallback](cb))
proc `k_lowerm`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerm"))
proc `k_lowern=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowern", cast[Icallback](cb))
proc `k_lowern`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowern"))
proc `k_lowero=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowero", cast[Icallback](cb))
proc `k_lowero`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowero"))
proc `k_lowerp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerp", cast[Icallback](cb))
proc `k_lowerp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerp"))
proc `k_lowerq=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerq", cast[Icallback](cb))
proc `k_lowerq`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerq"))
proc `k_lowerr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerr", cast[Icallback](cb))
proc `k_lowerr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerr"))
proc `k_lowers=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowers", cast[Icallback](cb))
proc `k_lowers`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowers"))
proc `k_lowert=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowert", cast[Icallback](cb))
proc `k_lowert`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowert"))
proc `k_loweru=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_loweru", cast[Icallback](cb))
proc `k_loweru`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_loweru"))
proc `k_lowerv=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerv", cast[Icallback](cb))
proc `k_lowerv`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerv"))
proc `k_lowerw=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerw", cast[Icallback](cb))
proc `k_lowerw`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerw"))
proc `k_lowerx=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerx", cast[Icallback](cb))
proc `k_lowerx`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerx"))
proc `k_lowery=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowery", cast[Icallback](cb))
proc `k_lowery`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowery"))
proc `k_lowerz=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerz", cast[Icallback](cb))
proc `k_lowerz`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerz"))
proc `k_braceleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_braceleft", cast[Icallback](cb))
proc `k_braceleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_braceleft"))
proc `k_bar=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_bar", cast[Icallback](cb))
proc `k_bar`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_bar"))
proc `k_braceright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_braceright", cast[Icallback](cb))
proc `k_braceright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_braceright"))
proc `k_tilde=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_tilde", cast[Icallback](cb))
proc `k_tilde`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_tilde"))
proc `k_bs=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_BS", cast[Icallback](cb))
proc `k_bs`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_BS"))
proc `k_tab=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_TAB", cast[Icallback](cb))
proc `k_tab`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_TAB"))
proc `k_lf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_LF", cast[Icallback](cb))
proc `k_lf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_LF"))
proc `k_cr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_CR", cast[Icallback](cb))
proc `k_cr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_CR"))
proc `k_quoteleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_quoteleft", cast[Icallback](cb))
proc `k_quoteleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_quoteleft"))
proc `k_quoteright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_quoteright", cast[Icallback](cb))
proc `k_quoteright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_quoteright"))
proc `k_pause=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_PAUSE", cast[Icallback](cb))
proc `k_pause`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_PAUSE"))
proc `k_esc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_ESC", cast[Icallback](cb))
proc `k_esc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ESC"))
proc `k_home=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_HOME", cast[Icallback](cb))
proc `k_home`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_HOME"))
proc `k_left=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_LEFT", cast[Icallback](cb))
proc `k_left`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_LEFT"))
proc `k_up=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_UP", cast[Icallback](cb))
proc `k_up`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_UP"))
proc `k_right=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_RIGHT", cast[Icallback](cb))
proc `k_right`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_RIGHT"))
proc `k_down=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_DOWN", cast[Icallback](cb))
proc `k_down`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_DOWN"))
proc `k_pgup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_PGUP", cast[Icallback](cb))
proc `k_pgup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_PGUP"))
proc `k_pgdn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_PGDN", cast[Icallback](cb))
proc `k_pgdn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_PGDN"))
proc `k_end=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_END", cast[Icallback](cb))
proc `k_end`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_END"))
proc `k_middle=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_MIDDLE", cast[Icallback](cb))
proc `k_middle`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_MIDDLE"))
proc `k_print=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_Print", cast[Icallback](cb))
proc `k_print`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_Print"))
proc `k_ins=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_INS", cast[Icallback](cb))
proc `k_ins`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_INS"))
proc `k_menu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_Menu", cast[Icallback](cb))
proc `k_menu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_Menu"))
proc `k_del=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_DEL", cast[Icallback](cb))
proc `k_del`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_DEL"))
proc `k_f1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F1", cast[Icallback](cb))
proc `k_f1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F1"))
proc `k_f2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F2", cast[Icallback](cb))
proc `k_f2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F2"))
proc `k_f3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F3", cast[Icallback](cb))
proc `k_f3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F3"))
proc `k_f4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F4", cast[Icallback](cb))
proc `k_f4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F4"))
proc `k_f5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F5", cast[Icallback](cb))
proc `k_f5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F5"))
proc `k_f6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F6", cast[Icallback](cb))
proc `k_f6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F6"))
proc `k_f7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F7", cast[Icallback](cb))
proc `k_f7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F7"))
proc `k_f8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F8", cast[Icallback](cb))
proc `k_f8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F8"))
proc `k_f9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F9", cast[Icallback](cb))
proc `k_f9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F9"))
proc `k_f10=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F10", cast[Icallback](cb))
proc `k_f10`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F10"))
proc `k_f11=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F11", cast[Icallback](cb))
proc `k_f11`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F11"))
proc `k_f12=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F12", cast[Icallback](cb))
proc `k_f12`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F12"))
proc `k_f13=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F13", cast[Icallback](cb))
proc `k_f13`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F13"))
proc `k_f14=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F14", cast[Icallback](cb))
proc `k_f14`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F14"))
proc `k_f15=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F15", cast[Icallback](cb))
proc `k_f15`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F15"))
proc `k_f16=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F16", cast[Icallback](cb))
proc `k_f16`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F16"))
proc `k_f17=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F17", cast[Icallback](cb))
proc `k_f17`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F17"))
proc `k_f18=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F18", cast[Icallback](cb))
proc `k_f18`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F18"))
proc `k_f19=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F19", cast[Icallback](cb))
proc `k_f19`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F19"))
proc `k_f20=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_F20", cast[Icallback](cb))
proc `k_f20`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_F20"))
proc `k_lshift=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_LSHIFT", cast[Icallback](cb))
proc `k_lshift`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_LSHIFT"))
proc `k_rshift=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_RSHIFT", cast[Icallback](cb))
proc `k_rshift`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_RSHIFT"))
proc `k_lctrl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_LCTRL", cast[Icallback](cb))
proc `k_lctrl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_LCTRL"))
proc `k_rctrl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_RCTRL", cast[Icallback](cb))
proc `k_rctrl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_RCTRL"))
proc `k_lalt=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_LALT", cast[Icallback](cb))
proc `k_lalt`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_LALT"))
proc `k_ralt=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_RALT", cast[Icallback](cb))
proc `k_ralt`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_RALT"))
proc `k_num=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_NUM", cast[Icallback](cb))
proc `k_num`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_NUM"))
proc `k_scroll=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_SCROLL", cast[Icallback](cb))
proc `k_scroll`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_SCROLL"))
proc `k_caps=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_CAPS", cast[Icallback](cb))
proc `k_caps`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_CAPS"))
proc `k_clear=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_CLEAR", cast[Icallback](cb))
proc `k_clear`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_CLEAR"))
proc `k_help=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_HELP", cast[Icallback](cb))
proc `k_help`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_HELP"))
proc `k_lowerccedilla=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_lowerccedilla", cast[Icallback](cb))
proc `k_lowerccedilla`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_lowerccedilla"))
proc `k_ccedilla=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_Ccedilla", cast[Icallback](cb))
proc `k_ccedilla`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_Ccedilla"))
proc `k_acute=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_acute", cast[Icallback](cb))
proc `k_acute`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_acute"))
proc `k_diaeresis=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_diaeresis", cast[Icallback](cb))
proc `k_diaeresis`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_diaeresis"))
proc `k_shome=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sHOME", cast[Icallback](cb))
proc `k_shome`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sHOME"))
proc `k_sup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sUP", cast[Icallback](cb))
proc `k_sup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sUP"))
proc `k_spgup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sPGUP", cast[Icallback](cb))
proc `k_spgup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPGUP"))
proc `k_sleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sLEFT", cast[Icallback](cb))
proc `k_sleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sLEFT"))
proc `k_smiddle=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sMIDDLE", cast[Icallback](cb))
proc `k_smiddle`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sMIDDLE"))
proc `k_sright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sRIGHT", cast[Icallback](cb))
proc `k_sright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sRIGHT"))
proc `k_send=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sEND", cast[Icallback](cb))
proc `k_send`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sEND"))
proc `k_sdown=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sDOWN", cast[Icallback](cb))
proc `k_sdown`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sDOWN"))
proc `k_spgdn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sPGDN", cast[Icallback](cb))
proc `k_spgdn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPGDN"))
proc `k_sins=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sINS", cast[Icallback](cb))
proc `k_sins`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sINS"))
proc `k_sdel=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sDEL", cast[Icallback](cb))
proc `k_sdel`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sDEL"))
proc `k_ssp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sSP", cast[Icallback](cb))
proc `k_ssp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sSP"))
proc `k_stab=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sTAB", cast[Icallback](cb))
proc `k_stab`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sTAB"))
proc `k_scr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sCR", cast[Icallback](cb))
proc `k_scr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sCR"))
proc `k_sbs=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sBS", cast[Icallback](cb))
proc `k_sbs`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sBS"))
proc `k_spause=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sPAUSE", cast[Icallback](cb))
proc `k_spause`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPAUSE"))
proc `k_sesc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sESC", cast[Icallback](cb))
proc `k_sesc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sESC"))
proc `k_sclear=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sCLEAR", cast[Icallback](cb))
proc `k_sclear`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sCLEAR"))
proc `k_sf1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF1", cast[Icallback](cb))
proc `k_sf1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF1"))
proc `k_sf2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF2", cast[Icallback](cb))
proc `k_sf2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF2"))
proc `k_sf3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF3", cast[Icallback](cb))
proc `k_sf3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF3"))
proc `k_sf4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF4", cast[Icallback](cb))
proc `k_sf4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF4"))
proc `k_sf5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF5", cast[Icallback](cb))
proc `k_sf5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF5"))
proc `k_sf6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF6", cast[Icallback](cb))
proc `k_sf6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF6"))
proc `k_sf7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF7", cast[Icallback](cb))
proc `k_sf7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF7"))
proc `k_sf8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF8", cast[Icallback](cb))
proc `k_sf8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF8"))
proc `k_sf9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF9", cast[Icallback](cb))
proc `k_sf9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF9"))
proc `k_sf10=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF10", cast[Icallback](cb))
proc `k_sf10`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF10"))
proc `k_sf11=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF11", cast[Icallback](cb))
proc `k_sf11`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF11"))
proc `k_sf12=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF12", cast[Icallback](cb))
proc `k_sf12`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF12"))
proc `k_sf13=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF13", cast[Icallback](cb))
proc `k_sf13`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF13"))
proc `k_sf14=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF14", cast[Icallback](cb))
proc `k_sf14`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF14"))
proc `k_sf15=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF15", cast[Icallback](cb))
proc `k_sf15`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF15"))
proc `k_sf16=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF16", cast[Icallback](cb))
proc `k_sf16`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF16"))
proc `k_sf17=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF17", cast[Icallback](cb))
proc `k_sf17`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF17"))
proc `k_sf18=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF18", cast[Icallback](cb))
proc `k_sf18`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF18"))
proc `k_sf19=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF19", cast[Icallback](cb))
proc `k_sf19`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF19"))
proc `k_sf20=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sF20", cast[Icallback](cb))
proc `k_sf20`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sF20"))
proc `k_sprint=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sPrint", cast[Icallback](cb))
proc `k_sprint`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPrint"))
proc `k_smenu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sMenu", cast[Icallback](cb))
proc `k_smenu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sMenu"))
proc `k_chome=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cHOME", cast[Icallback](cb))
proc `k_chome`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cHOME"))
proc `k_cup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cUP", cast[Icallback](cb))
proc `k_cup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cUP"))
proc `k_cpgup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cPGUP", cast[Icallback](cb))
proc `k_cpgup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPGUP"))
proc `k_cleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cLEFT", cast[Icallback](cb))
proc `k_cleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cLEFT"))
proc `k_cmiddle=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cMIDDLE", cast[Icallback](cb))
proc `k_cmiddle`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cMIDDLE"))
proc `k_cright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cRIGHT", cast[Icallback](cb))
proc `k_cright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cRIGHT"))
proc `k_cend=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cEND", cast[Icallback](cb))
proc `k_cend`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cEND"))
proc `k_cdown=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cDOWN", cast[Icallback](cb))
proc `k_cdown`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cDOWN"))
proc `k_cpgdn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cPGDN", cast[Icallback](cb))
proc `k_cpgdn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPGDN"))
proc `k_cins=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cINS", cast[Icallback](cb))
proc `k_cins`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cINS"))
proc `k_cdel=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cDEL", cast[Icallback](cb))
proc `k_cdel`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cDEL"))
proc `k_csp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cSP", cast[Icallback](cb))
proc `k_csp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cSP"))
proc `k_ctab=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cTAB", cast[Icallback](cb))
proc `k_ctab`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cTAB"))
proc `k_ccr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cCR", cast[Icallback](cb))
proc `k_ccr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cCR"))
proc `k_cbs=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cBS", cast[Icallback](cb))
proc `k_cbs`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cBS"))
proc `k_cpause=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cPAUSE", cast[Icallback](cb))
proc `k_cpause`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPAUSE"))
proc `k_cesc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cESC", cast[Icallback](cb))
proc `k_cesc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cESC"))
proc `k_cclear=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cCLEAR", cast[Icallback](cb))
proc `k_cclear`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cCLEAR"))
proc `k_cccedilla=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cCcedilla", cast[Icallback](cb))
proc `k_cccedilla`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cCcedilla"))
proc `k_cf1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF1", cast[Icallback](cb))
proc `k_cf1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF1"))
proc `k_cf2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF2", cast[Icallback](cb))
proc `k_cf2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF2"))
proc `k_cf3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF3", cast[Icallback](cb))
proc `k_cf3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF3"))
proc `k_cf4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF4", cast[Icallback](cb))
proc `k_cf4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF4"))
proc `k_cf5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF5", cast[Icallback](cb))
proc `k_cf5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF5"))
proc `k_cf6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF6", cast[Icallback](cb))
proc `k_cf6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF6"))
proc `k_cf7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF7", cast[Icallback](cb))
proc `k_cf7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF7"))
proc `k_cf8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF8", cast[Icallback](cb))
proc `k_cf8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF8"))
proc `k_cf9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF9", cast[Icallback](cb))
proc `k_cf9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF9"))
proc `k_cf10=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF10", cast[Icallback](cb))
proc `k_cf10`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF10"))
proc `k_cf11=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF11", cast[Icallback](cb))
proc `k_cf11`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF11"))
proc `k_cf12=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF12", cast[Icallback](cb))
proc `k_cf12`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF12"))
proc `k_cf13=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF13", cast[Icallback](cb))
proc `k_cf13`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF13"))
proc `k_cf14=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF14", cast[Icallback](cb))
proc `k_cf14`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF14"))
proc `k_cf15=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF15", cast[Icallback](cb))
proc `k_cf15`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF15"))
proc `k_cf16=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF16", cast[Icallback](cb))
proc `k_cf16`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF16"))
proc `k_cf17=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF17", cast[Icallback](cb))
proc `k_cf17`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF17"))
proc `k_cf18=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF18", cast[Icallback](cb))
proc `k_cf18`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF18"))
proc `k_cf19=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF19", cast[Icallback](cb))
proc `k_cf19`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF19"))
proc `k_cf20=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cF20", cast[Icallback](cb))
proc `k_cf20`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cF20"))
proc `k_cprint=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cPrint", cast[Icallback](cb))
proc `k_cprint`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPrint"))
proc `k_cmenu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cMenu", cast[Icallback](cb))
proc `k_cmenu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cMenu"))
proc `k_mhome=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mHOME", cast[Icallback](cb))
proc `k_mhome`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mHOME"))
proc `k_mup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mUP", cast[Icallback](cb))
proc `k_mup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mUP"))
proc `k_mpgup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mPGUP", cast[Icallback](cb))
proc `k_mpgup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPGUP"))
proc `k_mleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mLEFT", cast[Icallback](cb))
proc `k_mleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mLEFT"))
proc `k_mmiddle=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mMIDDLE", cast[Icallback](cb))
proc `k_mmiddle`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mMIDDLE"))
proc `k_mright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mRIGHT", cast[Icallback](cb))
proc `k_mright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mRIGHT"))
proc `k_mend=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mEND", cast[Icallback](cb))
proc `k_mend`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mEND"))
proc `k_mdown=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mDOWN", cast[Icallback](cb))
proc `k_mdown`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mDOWN"))
proc `k_mpgdn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mPGDN", cast[Icallback](cb))
proc `k_mpgdn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPGDN"))
proc `k_mins=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mINS", cast[Icallback](cb))
proc `k_mins`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mINS"))
proc `k_mdel=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mDEL", cast[Icallback](cb))
proc `k_mdel`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mDEL"))
proc `k_msp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mSP", cast[Icallback](cb))
proc `k_msp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mSP"))
proc `k_mtab=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mTAB", cast[Icallback](cb))
proc `k_mtab`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mTAB"))
proc `k_mcr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mCR", cast[Icallback](cb))
proc `k_mcr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mCR"))
proc `k_mbs=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mBS", cast[Icallback](cb))
proc `k_mbs`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mBS"))
proc `k_mpause=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mPAUSE", cast[Icallback](cb))
proc `k_mpause`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPAUSE"))
proc `k_mesc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mESC", cast[Icallback](cb))
proc `k_mesc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mESC"))
proc `k_mclear=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mCLEAR", cast[Icallback](cb))
proc `k_mclear`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mCLEAR"))
proc `k_mccedilla=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mCcedilla", cast[Icallback](cb))
proc `k_mccedilla`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mCcedilla"))
proc `k_mf1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF1", cast[Icallback](cb))
proc `k_mf1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF1"))
proc `k_mf2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF2", cast[Icallback](cb))
proc `k_mf2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF2"))
proc `k_mf3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF3", cast[Icallback](cb))
proc `k_mf3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF3"))
proc `k_mf4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF4", cast[Icallback](cb))
proc `k_mf4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF4"))
proc `k_mf5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF5", cast[Icallback](cb))
proc `k_mf5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF5"))
proc `k_mf6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF6", cast[Icallback](cb))
proc `k_mf6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF6"))
proc `k_mf7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF7", cast[Icallback](cb))
proc `k_mf7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF7"))
proc `k_mf8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF8", cast[Icallback](cb))
proc `k_mf8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF8"))
proc `k_mf9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF9", cast[Icallback](cb))
proc `k_mf9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF9"))
proc `k_mf10=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF10", cast[Icallback](cb))
proc `k_mf10`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF10"))
proc `k_mf11=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF11", cast[Icallback](cb))
proc `k_mf11`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF11"))
proc `k_mf12=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF12", cast[Icallback](cb))
proc `k_mf12`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF12"))
proc `k_mf13=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF13", cast[Icallback](cb))
proc `k_mf13`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF13"))
proc `k_mf14=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF14", cast[Icallback](cb))
proc `k_mf14`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF14"))
proc `k_mf15=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF15", cast[Icallback](cb))
proc `k_mf15`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF15"))
proc `k_mf16=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF16", cast[Icallback](cb))
proc `k_mf16`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF16"))
proc `k_mf17=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF17", cast[Icallback](cb))
proc `k_mf17`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF17"))
proc `k_mf18=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF18", cast[Icallback](cb))
proc `k_mf18`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF18"))
proc `k_mf19=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF19", cast[Icallback](cb))
proc `k_mf19`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF19"))
proc `k_mf20=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF20", cast[Icallback](cb))
proc `k_mf20`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF20"))
proc `k_mprint=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mPrint", cast[Icallback](cb))
proc `k_mprint`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPrint"))
proc `k_mmenu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mMenu", cast[Icallback](cb))
proc `k_mmenu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mMenu"))
proc `k_yhome=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yHOME", cast[Icallback](cb))
proc `k_yhome`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yHOME"))
proc `k_yup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yUP", cast[Icallback](cb))
proc `k_yup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yUP"))
proc `k_ypgup=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yPGUP", cast[Icallback](cb))
proc `k_ypgup`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPGUP"))
proc `k_yleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yLEFT", cast[Icallback](cb))
proc `k_yleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yLEFT"))
proc `k_ymiddle=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yMIDDLE", cast[Icallback](cb))
proc `k_ymiddle`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yMIDDLE"))
proc `k_yright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yRIGHT", cast[Icallback](cb))
proc `k_yright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yRIGHT"))
proc `k_yend=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yEND", cast[Icallback](cb))
proc `k_yend`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yEND"))
proc `k_ydown=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yDOWN", cast[Icallback](cb))
proc `k_ydown`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yDOWN"))
proc `k_ypgdn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yPGDN", cast[Icallback](cb))
proc `k_ypgdn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPGDN"))
proc `k_yins=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yINS", cast[Icallback](cb))
proc `k_yins`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yINS"))
proc `k_ydel=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yDEL", cast[Icallback](cb))
proc `k_ydel`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yDEL"))
proc `k_ysp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_ySP", cast[Icallback](cb))
proc `k_ysp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ySP"))
proc `k_ytab=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yTAB", cast[Icallback](cb))
proc `k_ytab`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yTAB"))
proc `k_ycr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yCR", cast[Icallback](cb))
proc `k_ycr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yCR"))
proc `k_ybs=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yBS", cast[Icallback](cb))
proc `k_ybs`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yBS"))
proc `k_ypause=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yPAUSE", cast[Icallback](cb))
proc `k_ypause`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPAUSE"))
proc `k_yesc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yESC", cast[Icallback](cb))
proc `k_yesc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yESC"))
proc `k_yclear=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yCLEAR", cast[Icallback](cb))
proc `k_yclear`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yCLEAR"))
proc `k_yccedilla=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yCcedilla", cast[Icallback](cb))
proc `k_yccedilla`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yCcedilla"))
proc `k_yf1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF1", cast[Icallback](cb))
proc `k_yf1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF1"))
proc `k_yf2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF2", cast[Icallback](cb))
proc `k_yf2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF2"))
proc `k_yf3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF3", cast[Icallback](cb))
proc `k_yf3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF3"))
proc `k_yf4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF4", cast[Icallback](cb))
proc `k_yf4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF4"))
proc `k_yf5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF5", cast[Icallback](cb))
proc `k_yf5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF5"))
proc `k_yf6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF6", cast[Icallback](cb))
proc `k_yf6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF6"))
proc `k_yf7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF7", cast[Icallback](cb))
proc `k_yf7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF7"))
proc `k_yf8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF8", cast[Icallback](cb))
proc `k_yf8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF8"))
proc `k_yf9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF9", cast[Icallback](cb))
proc `k_yf9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF9"))
proc `k_yf10=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF10", cast[Icallback](cb))
proc `k_yf10`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF10"))
proc `k_yf11=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF11", cast[Icallback](cb))
proc `k_yf11`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF11"))
proc `k_yf12=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF12", cast[Icallback](cb))
proc `k_yf12`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF12"))
proc `k_yf13=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF13", cast[Icallback](cb))
proc `k_yf13`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF13"))
proc `k_yf14=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF14", cast[Icallback](cb))
proc `k_yf14`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF14"))
proc `k_yf15=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF15", cast[Icallback](cb))
proc `k_yf15`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF15"))
proc `k_yf16=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF16", cast[Icallback](cb))
proc `k_yf16`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF16"))
proc `k_yf17=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF17", cast[Icallback](cb))
proc `k_yf17`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF17"))
proc `k_yf18=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF18", cast[Icallback](cb))
proc `k_yf18`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF18"))
proc `k_yf19=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF19", cast[Icallback](cb))
proc `k_yf19`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF19"))
proc `k_yf20=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF20", cast[Icallback](cb))
proc `k_yf20`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF20"))
proc `k_yprint=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yPrint", cast[Icallback](cb))
proc `k_yprint`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPrint"))
proc `k_ymenu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yMenu", cast[Icallback](cb))
proc `k_ymenu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yMenu"))
proc `k_splus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sPlus", cast[Icallback](cb))
proc `k_splus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPlus"))
proc `k_scomma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sComma", cast[Icallback](cb))
proc `k_scomma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sComma"))
proc `k_sminus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sMinus", cast[Icallback](cb))
proc `k_sminus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sMinus"))
proc `k_speriod=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sPeriod", cast[Icallback](cb))
proc `k_speriod`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sPeriod"))
proc `k_sslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sSlash", cast[Icallback](cb))
proc `k_sslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sSlash"))
proc `k_sasterisk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_sAsterisk", cast[Icallback](cb))
proc `k_sasterisk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_sAsterisk"))
proc `k_cuppera=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperA", cast[Icallback](cb))
proc `k_cuppera`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperA"))
proc `k_cupperb=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperB", cast[Icallback](cb))
proc `k_cupperb`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperB"))
proc `k_cupperc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperC", cast[Icallback](cb))
proc `k_cupperc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperC"))
proc `k_cupperd=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperD", cast[Icallback](cb))
proc `k_cupperd`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperD"))
proc `k_cuppere=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperE", cast[Icallback](cb))
proc `k_cuppere`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperE"))
proc `k_cupperf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperF", cast[Icallback](cb))
proc `k_cupperf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperF"))
proc `k_cupperg=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperG", cast[Icallback](cb))
proc `k_cupperg`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperG"))
proc `k_cupperh=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperH", cast[Icallback](cb))
proc `k_cupperh`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperH"))
proc `k_cupperi=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperI", cast[Icallback](cb))
proc `k_cupperi`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperI"))
proc `k_cupperj=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperJ", cast[Icallback](cb))
proc `k_cupperj`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperJ"))
proc `k_cupperk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperK", cast[Icallback](cb))
proc `k_cupperk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperK"))
proc `k_cupperl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperL", cast[Icallback](cb))
proc `k_cupperl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperL"))
proc `k_cupperm=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperM", cast[Icallback](cb))
proc `k_cupperm`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperM"))
proc `k_cuppern=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperN", cast[Icallback](cb))
proc `k_cuppern`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperN"))
proc `k_cuppero=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperO", cast[Icallback](cb))
proc `k_cuppero`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperO"))
proc `k_cupperp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperP", cast[Icallback](cb))
proc `k_cupperp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperP"))
proc `k_cupperq=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperQ", cast[Icallback](cb))
proc `k_cupperq`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperQ"))
proc `k_cupperr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperR", cast[Icallback](cb))
proc `k_cupperr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperR"))
proc `k_cuppers=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperS", cast[Icallback](cb))
proc `k_cuppers`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperS"))
proc `k_cuppert=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperT", cast[Icallback](cb))
proc `k_cuppert`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperT"))
proc `k_cupperu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperU", cast[Icallback](cb))
proc `k_cupperu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperU"))
proc `k_cupperv=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperV", cast[Icallback](cb))
proc `k_cupperv`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperV"))
proc `k_cupperw=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperW", cast[Icallback](cb))
proc `k_cupperw`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperW"))
proc `k_cupperx=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperX", cast[Icallback](cb))
proc `k_cupperx`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperX"))
proc `k_cuppery=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperY", cast[Icallback](cb))
proc `k_cuppery`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperY"))
proc `k_cupperz=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cupperZ", cast[Icallback](cb))
proc `k_cupperz`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cupperZ"))
proc `k_c1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_c1", cast[Icallback](cb))
proc `k_c1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c1"))
proc `k_c2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_c2", cast[Icallback](cb))
proc `k_c2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c2"))
proc `k_c3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_c3", cast[Icallback](cb))
proc `k_c3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c3"))
proc `k_c4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_c4", cast[Icallback](cb))
proc `k_c4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c4"))
proc `k_c5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_c5", cast[Icallback](cb))
proc `k_c5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c5"))
proc `k_c6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_c6", cast[Icallback](cb))
proc `k_c6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c6"))
proc `k_c7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_c7", cast[Icallback](cb))
proc `k_c7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c7"))
proc `k_c8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_c8", cast[Icallback](cb))
proc `k_c8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c8"))
proc `k_c9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_c9", cast[Icallback](cb))
proc `k_c9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c9"))
proc `k_c0=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_c0", cast[Icallback](cb))
proc `k_c0`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_c0"))
proc `k_cplus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cPlus", cast[Icallback](cb))
proc `k_cplus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPlus"))
proc `k_ccomma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cComma", cast[Icallback](cb))
proc `k_ccomma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cComma"))
proc `k_cminus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cMinus", cast[Icallback](cb))
proc `k_cminus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cMinus"))
proc `k_cperiod=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cPeriod", cast[Icallback](cb))
proc `k_cperiod`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cPeriod"))
proc `k_cslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cSlash", cast[Icallback](cb))
proc `k_cslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cSlash"))
proc `k_csemicolon=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cSemicolon", cast[Icallback](cb))
proc `k_csemicolon`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cSemicolon"))
proc `k_cequal=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cEqual", cast[Icallback](cb))
proc `k_cequal`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cEqual"))
proc `k_cbracketleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cBracketleft", cast[Icallback](cb))
proc `k_cbracketleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cBracketleft"))
proc `k_cbracketright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cBracketright", cast[Icallback](cb))
proc `k_cbracketright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cBracketright"))
proc `k_cbackslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cBackslash", cast[Icallback](cb))
proc `k_cbackslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cBackslash"))
proc `k_casterisk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_cAsterisk", cast[Icallback](cb))
proc `k_casterisk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_cAsterisk"))
proc `k_ma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mA", cast[Icallback](cb))
proc `k_ma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mA"))
proc `k_mb=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mB", cast[Icallback](cb))
proc `k_mb`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mB"))
proc `k_mc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mC", cast[Icallback](cb))
proc `k_mc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mC"))
proc `k_md=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mD", cast[Icallback](cb))
proc `k_md`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mD"))
proc `k_me=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mE", cast[Icallback](cb))
proc `k_me`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mE"))
proc `k_mf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mF", cast[Icallback](cb))
proc `k_mf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mF"))
proc `k_mg=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mG", cast[Icallback](cb))
proc `k_mg`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mG"))
proc `k_mh=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mH", cast[Icallback](cb))
proc `k_mh`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mH"))
proc `k_mi=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mI", cast[Icallback](cb))
proc `k_mi`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mI"))
proc `k_mj=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mJ", cast[Icallback](cb))
proc `k_mj`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mJ"))
proc `k_mk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mK", cast[Icallback](cb))
proc `k_mk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mK"))
proc `k_ml=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mL", cast[Icallback](cb))
proc `k_ml`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mL"))
proc `k_mm=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mM", cast[Icallback](cb))
proc `k_mm`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mM"))
proc `k_mn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mN", cast[Icallback](cb))
proc `k_mn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mN"))
proc `k_mo=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mO", cast[Icallback](cb))
proc `k_mo`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mO"))
proc `k_mp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mP", cast[Icallback](cb))
proc `k_mp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mP"))
proc `k_mq=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mQ", cast[Icallback](cb))
proc `k_mq`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mQ"))
proc `k_mr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mR", cast[Icallback](cb))
proc `k_mr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mR"))
proc `k_ms=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mS", cast[Icallback](cb))
proc `k_ms`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mS"))
proc `k_mt=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mT", cast[Icallback](cb))
proc `k_mt`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mT"))
proc `k_mu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mU", cast[Icallback](cb))
proc `k_mu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mU"))
proc `k_mv=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mV", cast[Icallback](cb))
proc `k_mv`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mV"))
proc `k_mw=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mW", cast[Icallback](cb))
proc `k_mw`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mW"))
proc `k_mx=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mX", cast[Icallback](cb))
proc `k_mx`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mX"))
proc `k_my=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mY", cast[Icallback](cb))
proc `k_my`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mY"))
proc `k_mz=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mZ", cast[Icallback](cb))
proc `k_mz`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mZ"))
proc `k_m1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_m1", cast[Icallback](cb))
proc `k_m1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m1"))
proc `k_m2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_m2", cast[Icallback](cb))
proc `k_m2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m2"))
proc `k_m3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_m3", cast[Icallback](cb))
proc `k_m3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m3"))
proc `k_m4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_m4", cast[Icallback](cb))
proc `k_m4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m4"))
proc `k_m5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_m5", cast[Icallback](cb))
proc `k_m5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m5"))
proc `k_m6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_m6", cast[Icallback](cb))
proc `k_m6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m6"))
proc `k_m7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_m7", cast[Icallback](cb))
proc `k_m7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m7"))
proc `k_m8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_m8", cast[Icallback](cb))
proc `k_m8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m8"))
proc `k_m9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_m9", cast[Icallback](cb))
proc `k_m9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m9"))
proc `k_m0=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_m0", cast[Icallback](cb))
proc `k_m0`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_m0"))
proc `k_mplus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mPlus", cast[Icallback](cb))
proc `k_mplus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPlus"))
proc `k_mcomma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mComma", cast[Icallback](cb))
proc `k_mcomma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mComma"))
proc `k_mminus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mMinus", cast[Icallback](cb))
proc `k_mminus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mMinus"))
proc `k_mperiod=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mPeriod", cast[Icallback](cb))
proc `k_mperiod`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mPeriod"))
proc `k_mslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mSlash", cast[Icallback](cb))
proc `k_mslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mSlash"))
proc `k_msemicolon=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mSemicolon", cast[Icallback](cb))
proc `k_msemicolon`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mSemicolon"))
proc `k_mequal=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mEqual", cast[Icallback](cb))
proc `k_mequal`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mEqual"))
proc `k_mbracketleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mBracketleft", cast[Icallback](cb))
proc `k_mbracketleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mBracketleft"))
proc `k_mbracketright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mBracketright", cast[Icallback](cb))
proc `k_mbracketright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mBracketright"))
proc `k_mbackslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mBackslash", cast[Icallback](cb))
proc `k_mbackslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mBackslash"))
proc `k_masterisk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_mAsterisk", cast[Icallback](cb))
proc `k_masterisk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_mAsterisk"))
proc `k_ya=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yA", cast[Icallback](cb))
proc `k_ya`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yA"))
proc `k_yb=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yB", cast[Icallback](cb))
proc `k_yb`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yB"))
proc `k_yc=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yC", cast[Icallback](cb))
proc `k_yc`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yC"))
proc `k_yd=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yD", cast[Icallback](cb))
proc `k_yd`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yD"))
proc `k_ye=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yE", cast[Icallback](cb))
proc `k_ye`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yE"))
proc `k_yf=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yF", cast[Icallback](cb))
proc `k_yf`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yF"))
proc `k_yg=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yG", cast[Icallback](cb))
proc `k_yg`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yG"))
proc `k_yh=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yH", cast[Icallback](cb))
proc `k_yh`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yH"))
proc `k_yi=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yI", cast[Icallback](cb))
proc `k_yi`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yI"))
proc `k_yj=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yJ", cast[Icallback](cb))
proc `k_yj`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yJ"))
proc `k_yk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yK", cast[Icallback](cb))
proc `k_yk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yK"))
proc `k_yl=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yL", cast[Icallback](cb))
proc `k_yl`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yL"))
proc `k_ym=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yM", cast[Icallback](cb))
proc `k_ym`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yM"))
proc `k_yn=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yN", cast[Icallback](cb))
proc `k_yn`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yN"))
proc `k_yo=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yO", cast[Icallback](cb))
proc `k_yo`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yO"))
proc `k_yp=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yP", cast[Icallback](cb))
proc `k_yp`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yP"))
proc `k_yq=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yQ", cast[Icallback](cb))
proc `k_yq`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yQ"))
proc `k_yr=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yR", cast[Icallback](cb))
proc `k_yr`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yR"))
proc `k_ys=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yS", cast[Icallback](cb))
proc `k_ys`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yS"))
proc `k_yt=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yT", cast[Icallback](cb))
proc `k_yt`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yT"))
proc `k_yu=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yU", cast[Icallback](cb))
proc `k_yu`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yU"))
proc `k_yv=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yV", cast[Icallback](cb))
proc `k_yv`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yV"))
proc `k_yw=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yW", cast[Icallback](cb))
proc `k_yw`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yW"))
proc `k_yx=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yX", cast[Icallback](cb))
proc `k_yx`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yX"))
proc `k_yy=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yY", cast[Icallback](cb))
proc `k_yy`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yY"))
proc `k_yz=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yZ", cast[Icallback](cb))
proc `k_yz`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yZ"))
proc `k_y1=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_y1", cast[Icallback](cb))
proc `k_y1`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y1"))
proc `k_y2=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_y2", cast[Icallback](cb))
proc `k_y2`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y2"))
proc `k_y3=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_y3", cast[Icallback](cb))
proc `k_y3`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y3"))
proc `k_y4=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_y4", cast[Icallback](cb))
proc `k_y4`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y4"))
proc `k_y5=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_y5", cast[Icallback](cb))
proc `k_y5`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y5"))
proc `k_y6=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_y6", cast[Icallback](cb))
proc `k_y6`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y6"))
proc `k_y7=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_y7", cast[Icallback](cb))
proc `k_y7`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y7"))
proc `k_y8=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_y8", cast[Icallback](cb))
proc `k_y8`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y8"))
proc `k_y9=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_y9", cast[Icallback](cb))
proc `k_y9`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y9"))
proc `k_y0=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_y0", cast[Icallback](cb))
proc `k_y0`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_y0"))
proc `k_yplus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yPlus", cast[Icallback](cb))
proc `k_yplus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPlus"))
proc `k_ycomma=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yComma", cast[Icallback](cb))
proc `k_ycomma`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yComma"))
proc `k_yminus=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yMinus", cast[Icallback](cb))
proc `k_yminus`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yMinus"))
proc `k_yperiod=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yPeriod", cast[Icallback](cb))
proc `k_yperiod`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yPeriod"))
proc `k_yslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_ySlash", cast[Icallback](cb))
proc `k_yslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ySlash"))
proc `k_ysemicolon=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_ySemicolon", cast[Icallback](cb))
proc `k_ysemicolon`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_ySemicolon"))
proc `k_yequal=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yEqual", cast[Icallback](cb))
proc `k_yequal`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yEqual"))
proc `k_ybracketleft=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yBracketleft", cast[Icallback](cb))
proc `k_ybracketleft`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yBracketleft"))
proc `k_ybracketright=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yBracketright", cast[Icallback](cb))
proc `k_ybracketright`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yBracketright"))
proc `k_ybackslash=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yBackslash", cast[Icallback](cb))
proc `k_ybackslash`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yBackslash"))
proc `k_yasterisk=`*(control: IUPhandle_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  SetCallback(cast[PIhandle](control), "K_yAsterisk", cast[Icallback](cb))
proc `k_yasterisk`*(control: IUPhandle_t): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(cast[PIhandle](control), "K_yAsterisk"))
