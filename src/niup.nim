import niup/niupc
import std/macros
import strformat

export niupc except Dialog

proc Open*() =
  var argc:cint=0
  var argv:cstringArray=nil
  Open(argc, addr argv)
# CONTROLS
type
  Button_t* = PIhandle
  Label_t* = PIhandle

# CTORs
proc Button*(title:string, action:string):Button_t =
  ## Buttons with images and/or texts can not change its behavior after mapped. This is a creation dependency. But after creation the image can be changed for another image, and the text for another text.
  ## Buttons are activated using Enter or Space keys.
  ## Buttons are not activated if the user clicks inside the button but moves the cursor and releases outside the button area. Also in Windows the highlight feedback when that happens is different if the button has CANFOCUS enabled or not.
  ## Buttons always have borders, except when IMAGE and IMPRESS are both defined and IMPRESSBORDER=NO. In this case in Windows TITLE can also be defined.
  ## Usually toolbar buttons have FLAT=Yes and CANFOCUS=NO.
  ## In GTK uses GtkButton/GtkImage, in Windows uses WC_BUTTON, and in Motif uses xmPushButton.
  return Button_t(niupc.Button(title, action))

proc Button*(title:string):Button_t =
  return Button_t(niupc.Button(title, nil))

proc Label*(title:string):Label_t =
  ## Labels with images, texts or line separator can not change its behavior after mapped. But after map the image can be changed for another image, and the text for another text.
  ## In GTK uses GtkSeparator(GtkHSeparator/GtkVSeparator in GTK 2)/GtkImage/GtkLabel, in Windows uses WC_STATIC, and in Motif uses xmSeparator/xmLabel.
  return Label_t(niupc.Label(title))


# CONTAINERS
type
  Vbox_t* = PIhandle
  Hbox_t* = PIhandle

# CTORs
template Vbox*(children: varargs[PIhandle]): Vbox_t =
  ## The box can be created with no elements and be dynamic filled using IupAppend or IupInsert.
  ## The box will NOT expand its children, it will allow its children to expand according to the space left in the box parent. So for the expansion to occur, the children must be expandable with EXPAND!=NO, and there must be room in the box parent.
  ## Also the vbox will not reduce its children beyond their vertical natural size even if SHRINK=Yes at the dialog.
  when varargsLen(callArgs) > 0:
    Vbox_t(unpackVarargs(niupc.Vbox, children))
  else: Vbox_t(niupc.Vbox(nil))
template Hbox*(children: varargs[PIhandle]): Hbox_t =
  ## The box can be created with no elements and be dynamic filled using IupAppend or IupInsert.
  ## The box will NOT expand its children, it will allow its children to expand according to the space left in the box parent. So for the expansion to occur, the children must be expandable with EXPAND!=NO, and there must be room in the box parent.
  ## Also the hbox will not reduce its children beyond their horizontal natural size even if SHRINK=Yes at the dialog.
  when varargsLen(callArgs) > 0:
    Hbox_t(unpackVarargs(niupc.Hbox, children))
  else: Hbox_t(niupc.Hbox(nil))

# DIALOGS
type
  Dialog_t* = PIhandle

# CTORs
proc Dialog*(child: PIhandle):Dialog_t =
  ## Do not associate an IupDialog with the native "dialog"nomenclature in Windows, GTK or Motif. IupDialog use native standard windows in all drivers.
  ## Except for the menu, all other elements must be inside a dialog to interact with the user. Therefore, an interface element will only be visible if its dialog is also visible.
  ## The order of callback calling is system dependent. For instance, the RESIZE_CB and the SHOW_CB are called in a different order in Win32 and in X-Windows when the dialog is shown for the first time.
  ## In Windows, when all decorations are removed the window icon is not displayed on the task bar, when minimized a small rectangular window will be positioned above the task bar on the bottom-left corner of the desktop.
  ## In GTK uses a GtkWindow, in Windows uses a custom windows class called "IupDialog", and in Motif uses topLevelShellWidgetClass.
  return Dialog_t(niupc.Dialog(child))


# ATTRIBUTES
type ActiveTypes = Button_t | Label_t | Dialog_t
proc `active=`*(control: ActiveTypes, value: string) =
  ## Activates or inhibits user interaction.
  SetAttribute(control, "ACTIVE", value)

proc `active`*(control: ActiveTypes): string =
  return $GetAttribute(control, "ACTIVE")

proc `active=`*(control: ActiveTypes, active:bool) =
  SetAttribute(control, "ACTIVE", (if active: "YES" else: "NO"))

type ActivewindowTypes = Dialog_t
proc `activewindow`*(control: ActivewindowTypes): string =
  ## [Windows and GTK Only] (read-only): informs if the dialog is the active window (the window with focus). Can be Yes or No. (since 3.4)
  return $GetAttribute(control, "ACTIVEWINDOW")


type AlignmentTypes = Button_t | Label_t | Vbox_t | Hbox_t
proc `alignment=`*(control: AlignmentTypes, value: string) =
  ## (non inheritable): Horizontally aligns the elements. Possible values: "ALEFT", "ACENTER", "ARIGHT". Default: "ALEFT".
  SetAttribute(control, "ALIGNMENT", value)

proc `alignment`*(control: AlignmentTypes): string =
  return $GetAttribute(control, "ALIGNMENT")


type BackgroundTypes = Dialog_t
proc `background=`*(control: BackgroundTypes, value: string) =
  ## (non inheritable): Dialog background color or image. Can be a non inheritable alternative to BGCOLOR or can be the name of an image to be tiled on the background. See also the screenshots of the sample.c results with normal background, changing the dialog BACKGROUND, the dialog BGCOLOR and the children BGCOLOR. Not working in GTK 3. (since 3.0)
  SetAttribute(control, "BACKGROUND", value)

proc `background`*(control: BackgroundTypes): string =
  return $GetAttribute(control, "BACKGROUND")


type BgcolorTypes = Button_t | Label_t | Dialog_t
proc `bgcolor=`*(control: BgcolorTypes, value: string) =
  ## Background color. If text and image are not defined, the button is configured to simply show a color, in this case set the button size because the natural size will be very small. In Windows and in GTK 3, the BGCOLOR attribute is ignored if text or image is defined. Default: the global attribute DLGBGCOLOR. BGCOLOR is ignored when FLAT=YES because it will be used the background from the native parent.
  SetAttribute(control, "BGCOLOR", value)

proc `bgcolor`*(control: BgcolorTypes): string =
  return $GetAttribute(control, "BGCOLOR")

proc `bgcolor=`*(control: BgcolorTypes, red, green, blue:int, alpha:int = 255) =
  SetAttribute(control, "BGCOLOR", &"{red} {green} {blue} {alpha}")

type BorderTypes = Dialog_t
proc `border=`*(control: BorderTypes, value: string) =
  ## (non inheritable) (creation only): Shows a resize border around the dialog. Default: "YES". BORDER=NO is useful only when RESIZE=NO, MAXBOX=NO, MINBOX=NO, MENUBOX=NO and TITLE=NULL, if any of these are defined there will be always some border.
  SetAttribute(control, "BORDER", value)

proc `border`*(control: BorderTypes): string =
  return $GetAttribute(control, "BORDER")


type BordersizeTypes = Dialog_t
proc `bordersize`*(control: BordersizeTypes): string =
  ## (non inheritable) (read only): returns the border size. (since 3.18)
  return $GetAttribute(control, "BORDERSIZE")


type BringfrontTypes = Dialog_t
proc `bringfront=`*(control: BringfrontTypes, value: string) =
  ## [Windows Only] (write-only): makes the dialog the foreground window. Use "YES"to activate it. Useful for multithreaded applications.
  SetAttribute(control, "BRINGFRONT", value)


type CanfocusTypes = Button_t
proc `canfocus=`*(control: CanfocusTypes, value: string) =
  ## (creation only) (non inheritable): enables the focus traversal of the control. In Windows the button will respect CANFOCUS differently to some other controls. Default: YES. (since 3.0)
  SetAttribute(control, "CANFOCUS", value)

proc `canfocus`*(control: CanfocusTypes): string =
  return $GetAttribute(control, "CANFOCUS")


type CgapTypes = Vbox_t | Hbox_t
proc `cgap=`*(control: CgapTypes, value: string) =
  ## Defines a vertical space in pixels between the children, CGAP is in the same units of the SIZE attribute for the height. Default: "0". (CGAP since 3.0)
  SetAttribute(control, "CGAP", value)

proc `cgap`*(control: CgapTypes): string =
  return $GetAttribute(control, "CGAP")


type CharsizeTypes = Button_t
proc `charsize`*(control: CharsizeTypes): string =
  ## (read-only, non inheritable) Returns the average character size of the current FONT attribute. This is the factor used by the SIZE attribute to convert its units to pixels.
  return $GetAttribute(control, "CHARSIZE")


type ChildoffsetTypes = Dialog_t
proc `childoffset=`*(control: ChildoffsetTypes, value: string) =
  ## Allow to specify a position offset for the child. Available for native containers only. It will not affect the natural size, and allows to position controls outside the client area. Format "dxxdy", where dx and dy are integer values corresponding to the horizontal and vertical offsets, respectively, in pixels. Default: 0x0. (since 3.14)
  SetAttribute(control, "CHILDOFFSET", value)

proc `childoffset`*(control: ChildoffsetTypes): string =
  return $GetAttribute(control, "CHILDOFFSET")

proc `childoffset=`*(control: ChildoffsetTypes, dx, dy:int) =
  SetAttribute(control, "CHILDOFFSET", cstring(&"{dx}x{dy}"))

type ClientoffsetTypes = Dialog_t | Vbox_t | Hbox_t
proc `clientoffset`*(control: ClientoffsetTypes): string =
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
  return $GetAttribute(control, "CLIENTOFFSET")


type ClientsizeTypes = Dialog_t | Vbox_t | Hbox_t
proc `clientsize`*(control: ClientsizeTypes): string =
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
  return $GetAttribute(control, "CLIENTSIZE")


type CmarginTypes = Vbox_t | Hbox_t
proc `cmargin=`*(control: CmarginTypes, value: string) =
  ## Defines a margin in pixels, CMARGIN is in the same units of the SIZE attribute. Its value has the format "widthxheight", where width and height are integer values corresponding to the horizontal and vertical margins, respectively. Default: "0x0"(no margin). (CMARGIN since 3.0)
  SetAttribute(control, "CMARGIN", value)

proc `cmargin`*(control: CmarginTypes): string =
  return $GetAttribute(control, "CMARGIN")

proc `cmargin=`*(control: CmarginTypes, width, height:int) =
  SetAttribute(control, "CMARGIN", &"{width}x{height}")

type CompositedTypes = Dialog_t
proc `composited=`*(control: CompositedTypes, value: string) =
  ## [Windows Only] (creation only): controls if the window will have an automatic double buffer for all children. Default is "NO". In Windows Vista it is NOT working as expected. It is NOT compatible with IupCanvas and all derived IUP controls such as IupFlat*, IupGL*, IupPlot and IupMatrix, because IupCanvas uses CS_OWNDC in the window class.
  SetAttribute(control, "COMPOSITED", value)

proc `composited`*(control: CompositedTypes): string =
  return $GetAttribute(control, "COMPOSITED")


type ControlTypes = Dialog_t
proc `control=`*(control: ControlTypes, value: string) =
  ## Windows only. Whether the dialog is embedded inside the parent window or has a window of its own.
  ## 
  ## Value
  ## YES or NO. If the value is YES, the dialog will appear embedded inside its parent window (you must set a parent, either with PARENTDIALOG or NATIVEPARENT, or this setting will be ignored). If the value is NO, the dialog will have its own window.
  ## 
  ## Notes
  ## This is useful for implementing ActiveX controls, with the help of the LuaCOM library. ActiveX controls run embedded inside another window. LuaCOM will send a window creation event the the control, passing a handle to the parent window and the size of the control. You can use this to set the dialog's NATIVEPARENT and RASTERSIZE attributes. See the LuaCOM documentation for more information.
  SetAttribute(control, "CONTROL", value)

proc `control`*(control: ControlTypes): string =
  return $GetAttribute(control, "CONTROL")


type CpaddingTypes = Button_t | Label_t
proc `cpadding=`*(control: CpaddingTypes, value: string) =
  ## same as PADDING but using the units of the SIZE attribute. It will actually set the PADDING attribute. (since 3.29)
  SetAttribute(control, "CPADDING", value)

proc `cpadding`*(control: CpaddingTypes): string =
  return $GetAttribute(control, "CPADDING")


type CspacingTypes = Button_t
proc `cspacing=`*(control: CspacingTypes, value: string) =
  ## same as SPACING but using the units of the vertical part of the SIZE attribute. It will actually set the SPACING attribute. (since 3.29)
  SetAttribute(control, "CSPACING", value)

proc `cspacing`*(control: CspacingTypes): string =
  return $GetAttribute(control, "CSPACING")


type CursorTypes = Dialog_t
proc `cursor=`*(control: CursorTypes, value: string) =
  ## Defines the element's cursor.ValueName of a cursor.It will check first for the following predefined names:"NONE"or "NULL"--- "APPSTARTING"(Windows Only)"ARROW""BUSY""CROSS""HAND""HELP""MOVE"--- "NO"(Windows Only)"PEN"(*)"RESIZE_N""RESIZE_S""RESIZE_NS""RESIZE_W""RESIZE_E""RESIZE_WE""RESIZE_NE""RESIZE_SW""RESIZE_NW""RESIZE_SE""SPLITTER_HORIZ""SPLITTER_VERT""TEXT""UPARROW"Default: "ARROW"(*) To use this cursor on Windows, the iup.rc file, provided with IUP, must be linked with the application (except when using the IUP DLL).The Windows SDK recommends that cursors and icons should be implemented as resources rather than created at run time.The GTK cursors have the same appearance of the X-Windows cursors. Althought GTK cursors can have more than 2 colors depending on the X-Server.If it is not a pre-defined name, then will check for other system cursors. In Windows the value will be used to load a cursor form the application resources. In Motif the value will be used as a X-Windows cursor number, see definitions in the X11 header "cursorfont.h". In GTK the value will be used as a cursor name, see the GDK documentation on Cursors.If no system cursors were found then the value will be used to try to find an IUP image with the same name. Use IupSetHandle to define a name for an IupImage. But the image will need an extra attribute and some specific characteristics, see notes below.NotesFor an image to represent a cursor, it should has the attribute "HOTSPOT"to define the cursor hotspot (place where the mouse click is actually effective). The default value is "0:0".Usually only color indices 0, 1 and 2 can be used in a cursor, where 0 will be transparent (must be "BGCOLOR"). The RGB colors corresponding to indices 1 and 2 are defined just as in regular images. In Windows and GTK the cursor can have more than 2 colors. Cursor sizes are usually less than or equal to 32x32.The cursor will only change when the interface system regains control or when IupFlush is called.The Windows SDK recommends that cursors and icons should be implemented as resources rather than created at run time.When the cursor image is no longer necessary, it must be destroyed through function IupDestroy. Attention: the cursor cannot be in use when it is destroyed.
  SetAttribute(control, "CURSOR", value)

proc `cursor`*(control: CursorTypes): string =
  return $GetAttribute(control, "CURSOR")


type CustomframeTypes = Dialog_t
proc `customframe=`*(control: CustomframeTypes, value: string) =
  ## [Windows and GTK Only] (non inheritable): allows the application to customize the dialog frame elements (the title and its buttons) by using IUP controls for its elements like caption, minimize button, maximize button, and close buttons. The custom frame support uses the native system support for custom frames. The application is responsible for leaving space for the borders. One drawback is that menu bars will not work. For the dialog to be able to be moved an IupLabel or an IupCanvas must be at the top of the dialog and must have the NAME attribute set to CUSTOMFRAMECAPTION (since 3.22). Native custom frames are supported only in Windows and in GTK version 3.10, so for older GTK versions we have to simulate the support using CUSTOMFRAMESIMULATE. (since 3.18) (renamed in 3.22) (GTK support since 3.22) See the Custom Frame notes bellow.
  SetAttribute(control, "CUSTOMFRAME", value)

proc `customframe`*(control: CustomframeTypes): string =
  return $GetAttribute(control, "CUSTOMFRAME")


type CustomframecaptionheightTypes = Dialog_t
proc `customframecaptionheight=`*(control: CustomframecaptionheightTypes, value: string) =
  ## [Windows Only] (non inheritable): height of the caption area. If not defined it will use the system size. (since 3.18) (renamed in 3.22)
  SetAttribute(control, "CUSTOMFRAMECAPTIONHEIGHT", value)

proc `customframecaptionheight`*(control: CustomframecaptionheightTypes): string =
  return $GetAttribute(control, "CUSTOMFRAMECAPTIONHEIGHT")


type CustomframecaptionlimitsTypes = Dialog_t
proc `customframecaptionlimits=`*(control: CustomframecaptionlimitsTypes, value: string) =
  ## [Windows Only] (non inheritable): limits of the caption area at left and at right. The caption area is always expanded inside the limits when the dialog is resized. Format is "left:right"or in C "%d:%d". Default: "0:0". This will allow the dialog to be moved by the system when the user click and drag the caption area. If not defined but CUSTOMFRAMECAPTION is defined, then it will use the caption element horizontal position and size for the limits (since 3.22). (since 3.18)
  SetAttribute(control, "CUSTOMFRAMECAPTIONLIMITS", value)

proc `customframecaptionlimits`*(control: CustomframecaptionlimitsTypes): string =
  return $GetAttribute(control, "CUSTOMFRAMECAPTIONLIMITS")


type CustomframedrawTypes = Dialog_t
proc `customframedraw=`*(control: CustomframedrawTypes, value: string) =
  ## [Windows Only] (non inheritable): allows the application to customize the dialog frame elements (the title and its buttons) by drawing them with the CUSTOMFRAMEDRAW_CB callback. Can be Yes or No. The Window client area is expanded to include the whole window. Notice that the dialog attributes like BORDER, RESIZE, MAXBOX, MINBOX and TITLE must still be defined. But maximize, minimize and close buttons must be manually implemented in the BUTTON_CB callback. One drawback is that menu bars will not work. (since 3.18) (renamed in 3.22)
  SetAttribute(control, "CUSTOMFRAMEDRAW", value)

proc `customframedraw`*(control: CustomframedrawTypes): string =
  return $GetAttribute(control, "CUSTOMFRAMEDRAW")


type CustomframesimulateTypes = Dialog_t
proc `customframesimulate=`*(control: CustomframesimulateTypes, value: string) =
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
  SetAttribute(control, "CUSTOMFRAMESIMULATE", value)

proc `customframesimulate`*(control: CustomframesimulateTypes): string =
  return $GetAttribute(control, "CUSTOMFRAMESIMULATE")


type DefaultenterTypes = Dialog_t
proc `defaultenter=`*(control: DefaultenterTypes, value: string) =
  ## Name of the button activated when the user press Enter when focus is in another control of the dialog. Use IupSetHandle or IupSetAttributeHandle to associate a button to a name.
  SetAttribute(control, "DEFAULTENTER", value)

proc `defaultenter`*(control: DefaultenterTypes): string =
  return $GetAttribute(control, "DEFAULTENTER")


type DefaultescTypes = Dialog_t
proc `defaultesc=`*(control: DefaultescTypes, value: string) =
  ## Name of the button activated when the user press Esc when focus is in another control of the dialog. Use IupSetHandle or IupSetAttributeHandle to associate a button to a name.
  SetAttribute(control, "DEFAULTESC", value)

proc `defaultesc`*(control: DefaultescTypes): string =
  return $GetAttribute(control, "DEFAULTESC")


type DialogframeTypes = Dialog_t
proc `dialogframe=`*(control: DialogframeTypes, value: string) =
  ## Set the common decorations for modal dialogs. This means RESIZE=NO, MINBOX=NO and MAXBOX=NO. In Windows, if the PARENTDIALOG is defined then the MENUBOX is also removed, but the Close button remains.
  SetAttribute(control, "DIALOGFRAME", value)

proc `dialogframe`*(control: DialogframeTypes): string =
  return $GetAttribute(control, "DIALOGFRAME")


type DialoghintTypes = Dialog_t
proc `dialoghint=`*(control: DialoghintTypes, value: string) =
  ## [GTK Only] (creation-only): if enabled sets the window type hint to a dialog hint.
  SetAttribute(control, "DIALOGHINT", value)

proc `dialoghint`*(control: DialoghintTypes): string =
  return $GetAttribute(control, "DIALOGHINT")


type DragcursorTypes = Label_t | Dialog_t
proc `dragcursor=`*(control: DragcursorTypes, value: string) =
  ## (non inheritable): name of an image to be used as cursor during drag. Use IupSetHandle or IupSetAttributeHandle to associate an image to a name. See also IupImage. (since 3.11)
  SetAttribute(control, "DRAGCURSOR", value)

proc `dragcursor`*(control: DragcursorTypes): string =
  return $GetAttribute(control, "DRAGCURSOR")


type DragsourceTypes = Label_t | Dialog_t
proc `dragsource=`*(control: DragsourceTypes, value: string) =
  ## (non inheritable): Set up a control as a source for drag operations. Default: NO.
  SetAttribute(control, "DRAGSOURCE", value)

proc `dragsource`*(control: DragsourceTypes): string =
  return $GetAttribute(control, "DRAGSOURCE")


type DragsourcemoveTypes = Label_t | Dialog_t
proc `dragsourcemove=`*(control: DragsourcemoveTypes, value: string) =
  ## (non inheritable): Enables the move action. Default: NO (only copy is enabled).
  SetAttribute(control, "DRAGSOURCEMOVE", value)

proc `dragsourcemove`*(control: DragsourcemoveTypes): string =
  return $GetAttribute(control, "DRAGSOURCEMOVE")


type DragtypesTypes = Label_t | Dialog_t
proc `dragtypes=`*(control: DragtypesTypes, value: string) =
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
  SetAttribute(control, "DRAGTYPES", value)

proc `dragtypes`*(control: DragtypesTypes): string =
  return $GetAttribute(control, "DRAGTYPES")


type DropfilestargetTypes = Label_t | Dialog_t
proc `dropfilestarget=`*(control: DropfilestargetTypes, value: string) =
  ## [Windows and GTK Only] (non inheritable): Enable or disable the drop of files. Default: NO, but if DROPFILES_CB is defined when the element is mapped then it will be automatically enabled. (since 3.0)
  SetAttribute(control, "DROPFILESTARGET", value)

proc `dropfilestarget`*(control: DropfilestargetTypes): string =
  return $GetAttribute(control, "DROPFILESTARGET")


type DroptargetTypes = Label_t | Dialog_t
proc `droptarget=`*(control: DroptargetTypes, value: string) =
  ## (non inheritable): Set up a control as a destination for drop operations. Default: NO.
  SetAttribute(control, "DROPTARGET", value)

proc `droptarget`*(control: DroptargetTypes): string =
  return $GetAttribute(control, "DROPTARGET")


type DroptypesTypes = Label_t | Dialog_t
proc `droptypes=`*(control: DroptypesTypes, value: string) =
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
  SetAttribute(control, "DROPTYPES", value)

proc `droptypes`*(control: DroptypesTypes): string =
  return $GetAttribute(control, "DROPTYPES")


type EllipsisTypes = Label_t
proc `ellipsis=`*(control: EllipsisTypes, value: string) =
  ## [Windows and GTK only]: add an ellipsis: "..."to the text if there is not enough space to render the entire string. Can be "YES"or "NO". Default: "NO". (since 3.0) (GTK 2.6)
  SetAttribute(control, "ELLIPSIS", value)

proc `ellipsis`*(control: EllipsisTypes): string =
  return $GetAttribute(control, "ELLIPSIS")


type ExpandTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `expand=`*(control: ExpandTypes, value: string) =
  ## Allows the element to expand, fulfilling empty spaces inside its container.
  ## It is a non inheritable attribute, but a container inherit its parents EXPAND attribute. In other words, although EXPAND is non inheritable, it is inheritable for containers. So if you set it at a container it will not affect its children, except for those who are containers.
  ## The expansion is done equally for all expandable elements in the same container.
  ## For a container, the actual EXPAND value will be always a combination of its own value and the value of its children. In the sense that a container can only expand if its children can expand too in the same direction.
  ## The HORIZONTALFREE and VERTICALFREE values will not behave as normal expansion. These values will NOT affect the expansion of the container when set at its children, the children will simply expand to the available free space at the container. (Since 3.11)
  ## See the Layout Guide for more details on sizes.
  SetAttribute(control, "EXPAND", value)

proc `expand`*(control: ExpandTypes): string =
  return $GetAttribute(control, "EXPAND")


type ExpandchildrenTypes = Vbox_t | Hbox_t
proc `expandchildren=`*(control: ExpandchildrenTypes, value: string) =
  ## (non inheritable): forces all children to expand horizontally and to fully occupy its space available inside the box. Default: "NO". This has the same effect as setting EXPAND=HORIZONTAL on each child. (since 3.0)
  SetAttribute(control, "EXPANDCHILDREN", value)

proc `expandchildren`*(control: ExpandchildrenTypes): string =
  return $GetAttribute(control, "EXPANDCHILDREN")


type FgcolorTypes = Button_t | Label_t
proc `fgcolor=`*(control: FgcolorTypes, value: string) =
  ## Text color. Default: the global attribute DLGFGCOLOR.
  SetAttribute(control, "FGCOLOR", value)

proc `fgcolor`*(control: FgcolorTypes): string =
  return $GetAttribute(control, "FGCOLOR")

proc `fgcolor=`*(control: FgcolorTypes, red, green, blue:int, alpha:int = 255) =
  SetAttribute(control, "FGCOLOR", &"{red} {green} {blue} {alpha}")

type FlatTypes = Button_t
proc `flat=`*(control: FlatTypes, value: string) =
  ## (creation only): Hides the button borders until the mouse cursor enters the button area. The border space is always there. Can be YES or NO. Default: NO.
  SetAttribute(control, "FLAT", value)

proc `flat`*(control: FlatTypes): string =
  return $GetAttribute(control, "FLAT")


type FontTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `font=`*(control: FontTypes, value: string) =
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
  SetAttribute(control, "FONT", value)

proc `font`*(control: FontTypes): string =
  return $GetAttribute(control, "FONT")


type FontfaceTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `fontface=`*(control: FontfaceTypes, value: string) =
  ## (non inheritable) Replaces or returns the face name of the current FONT attribute.
  SetAttribute(control, "FONTFACE", value)

proc `fontface`*(control: FontfaceTypes): string =
  return $GetAttribute(control, "FONTFACE")


type FontsizeTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `fontsize=`*(control: FontsizeTypes, value: string) =
  ## (non inheritable) Replaces or returns the size of the current FONT attribute.
  SetAttribute(control, "FONTSIZE", value)

proc `fontsize`*(control: FontsizeTypes): string =
  return $GetAttribute(control, "FONTSIZE")


type FontstyleTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `fontstyle=`*(control: FontstyleTypes, value: string) =
  ## (non inheritable) Replaces or returns the style of the current FONT attribute. Since font styles are case sensitive, this attribute is also case sensitive.
  SetAttribute(control, "FONTSTYLE", value)

proc `fontstyle`*(control: FontstyleTypes): string =
  return $GetAttribute(control, "FONTSTYLE")


type FoundryTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `foundry=`*(control: FoundryTypes, value: string) =
  ## [Motif Only] (non inheritable) Allows to select a foundry for the FONT being selected. Must be set before setting the FONT attribute.
  SetAttribute(control, "FOUNDRY", value)

proc `foundry`*(control: FoundryTypes): string =
  return $GetAttribute(control, "FOUNDRY")


type FullscreenTypes = Dialog_t
proc `fullscreen=`*(control: FullscreenTypes, value: string) =
  ## Makes the dialog occupy the whole screen over any system bars in the main monitor. All dialog details, such as title bar, borders, maximize button, etc, are removed. Possible values: YES, NO. In Motif you may have to click in the dialog to set its focus. In Motif if set to YES when the dialog is hidden, then it can not be changed after it is visible.
  SetAttribute(control, "FULLSCREEN", value)

proc `fullscreen`*(control: FullscreenTypes): string =
  return $GetAttribute(control, "FULLSCREEN")


type GapTypes = Vbox_t | Hbox_t
proc `gap=`*(control: GapTypes, value: string) =
  ## Defines a vertical space in pixels between the children, CGAP is in the same units of the SIZE attribute for the height. Default: "0". (CGAP since 3.0)
  SetAttribute(control, "GAP", value)

proc `gap`*(control: GapTypes): string =
  return $GetAttribute(control, "GAP")


type HelpbuttonTypes = Dialog_t
proc `helpbutton=`*(control: HelpbuttonTypes, value: string) =
  ## [Windows Only] (creation only): Inserts a help button in the same place of the maximize button. It can only be used for dialogs without the minimize and maximize buttons, and with the menu box. For the next interaction of the user with a control in the dialog, the callback HELP_CB will be called instead of the control defined ACTION callback. Possible values: YES, NO. Default: NO.
  SetAttribute(control, "HELPBUTTON", value)

proc `helpbutton`*(control: HelpbuttonTypes): string =
  return $GetAttribute(control, "HELPBUTTON")


type HidetaskbarTypes = Dialog_t
proc `hidetaskbar=`*(control: HidetaskbarTypes, value: string) =
  ## [Windows and GTK Only] (write-only): Action attribute that when set to "YES", hides the dialog, but does not decrement the visible dialog count, does not call SHOW_CB and does not mark the dialog as hidden inside IUP. It is usually used to hide the dialog and keep the tray icon working without closing the main loop. It has the same effect as setting LOCKLOOP=Yes and normally hiding the dialog. IMPORTANT: when you hide using HIDETASKBAR, you must show using HIDETASKBAR also. Possible values: YES, NO.
  SetAttribute(control, "HIDETASKBAR", value)


type HidetitlebarTypes = Dialog_t
proc `hidetitlebar=`*(control: HidetitlebarTypes, value: string) =
  ## [GTK Only] (non inheritable): hides the title bar with al its elements. (since 3.20) (GTK 3.10)
  SetAttribute(control, "HIDETITLEBAR", value)

proc `hidetitlebar`*(control: HidetitlebarTypes): string =
  return $GetAttribute(control, "HIDETITLEBAR")


type HomogeneousTypes = Vbox_t | Hbox_t
proc `homogeneous=`*(control: HomogeneousTypes, value: string) =
  ## (non inheritable): forces all children to get equal vertical space. The space height will be based on the highest child. Default: "NO". Notice that this does not changes the children size, only the available space for each one of them to expand. (since 3.0)
  SetAttribute(control, "HOMOGENEOUS", value)

proc `homogeneous`*(control: HomogeneousTypes): string =
  return $GetAttribute(control, "HOMOGENEOUS")


type HwndTypes = Dialog_t
proc `hwnd`*(control: HwndTypes): string =
  ## [Windows Only] (non inheritable, read-only): Returns the Windows Window handle. Available in the Windows driver or in the GTK driver in Windows.
  return $GetAttribute(control, "HWND")


type IconTypes = Dialog_t
proc `icon=`*(control: IconTypes, value: string) =
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
  SetAttribute(control, "ICON", value)

proc `icon`*(control: IconTypes): string =
  return $GetAttribute(control, "ICON")


type ImageTypes = Button_t | Label_t
proc `image=`*(control: ImageTypes, value: string) =
  ## (non inheritable): Image name. If set before map defines the behavior of the button to contain an image. The natural size will be size of the image in pixels, plus the button borders. Use IupSetHandle or IupSetAttributeHandle to associate an image to a name. See also IupImage. If TITLE is also defined and not empty both will be shown (except in Motif). (GTK 2.6)
  SetAttribute(control, "IMAGE", value)

proc `image`*(control: ImageTypes): string =
  return $GetAttribute(control, "IMAGE")


type ImagepositionTypes = Button_t
proc `imageposition=`*(control: ImagepositionTypes, value: string) =
  ## (non inheritable): Position of the image relative to the text when both are displayed. Can be: LEFT, RIGHT, TOP, BOTTOM. Default: LEFT. (since 3.0) (GTK 2.10)
  SetAttribute(control, "IMAGEPOSITION", value)

proc `imageposition`*(control: ImagepositionTypes): string =
  return $GetAttribute(control, "IMAGEPOSITION")


type IminactiveTypes = Button_t | Label_t
proc `iminactive=`*(control: IminactiveTypes, value: string) =
  ## non inheritable): Image name of the element when inactive. If it is not defined then the IMAGE is used and the colors will be replaced by a modified version of the background color creating the disabled effect. GTK will also change the inactive image to look like other inactive objects. (GTK 2.6)
  SetAttribute(control, "IMINACTIVE", value)

proc `iminactive`*(control: IminactiveTypes): string =
  return $GetAttribute(control, "IMINACTIVE")


type ImpressTypes = Button_t
proc `impress=`*(control: ImpressTypes, value: string) =
  ## (non inheritable): Image name of the pressed button. If IMPRESS and IMAGE are defined, the button borders are not shown and not computed in natural size. When the button is clicked the pressed image does not offset. In Motif the button will lose its focus feedback also. (GTK 2.6)
  SetAttribute(control, "IMPRESS", value)

proc `impress`*(control: ImpressTypes): string =
  return $GetAttribute(control, "IMPRESS")


type ImpressborderTypes = Button_t
proc `impressborder=`*(control: ImpressborderTypes, value: string) =
  ## (non inheritable): if enabled the button borders will be shown and computed even if IMPRESS is defined. Can be "YES"or "NO". Default: "NO".
  SetAttribute(control, "IMPRESSBORDER", value)

proc `impressborder`*(control: ImpressborderTypes): string =
  return $GetAttribute(control, "IMPRESSBORDER")


type MarginTypes = Vbox_t | Hbox_t
proc `margin=`*(control: MarginTypes, value: string) =
  ## Defines a margin in pixels, CMARGIN is in the same units of the SIZE attribute. Its value has the format "widthxheight", where width and height are integer values corresponding to the horizontal and vertical margins, respectively. Default: "0x0"(no margin). (CMARGIN since 3.0)
  SetAttribute(control, "MARGIN", value)

proc `margin`*(control: MarginTypes): string =
  return $GetAttribute(control, "MARGIN")

proc `margin=`*(control: MarginTypes, width, height:int) =
  SetAttribute(control, "MARGIN", &"{width}x{height}")

type MarkupTypes = Button_t | Label_t
proc `markup=`*(control: MarkupTypes, value: string) =
  ## [GTK only]: allows the title string to contains pango markup commands. Works only if a mnemonic is NOT defined in the title. Can be "YES"or "NO". Default: "NO".
  SetAttribute(control, "MARKUP", value)

proc `markup`*(control: MarkupTypes): string =
  return $GetAttribute(control, "MARKUP")


type MaxboxTypes = Dialog_t
proc `maxbox=`*(control: MaxboxTypes, value: string) =
  ## (creation only): Requires a maximize button from the window manager. If RESIZE=NO then MAXBOX will be set to NO. Default: YES. In Motif the decorations are controlled by the Window Manager and may not be possible to be changed from IUP. In Windows MAXBOX is hidden only if MINBOX is hidden as well, or else it will be just disabled.
  SetAttribute(control, "MAXBOX", value)

proc `maxbox`*(control: MaxboxTypes): string =
  return $GetAttribute(control, "MAXBOX")


type MaximizeatparentTypes = Dialog_t
proc `maximizeatparent=`*(control: MaximizeatparentTypes, value: string) =
  ## [Windows Only]: when using multiple monitors, maximize the dialog in the same monitor that the parent dialog is. (since 3.28)
  SetAttribute(control, "MAXIMIZEATPARENT", value)

proc `maximizeatparent`*(control: MaximizeatparentTypes): string =
  return $GetAttribute(control, "MAXIMIZEATPARENT")


type MaximizedTypes = Dialog_t
proc `maximized=`*(control: MaximizedTypes, value: string) =
  ## [Windows and GTK Only] (read-only): indicates if the dialog is maximized. Can be YES or NO. (since 3.12)
  SetAttribute(control, "MAXIMIZED", value)

proc `maximized`*(control: MaximizedTypes): string =
  return $GetAttribute(control, "MAXIMIZED")


type MaxsizeTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `maxsize=`*(control: MaxsizeTypes, value: string) =
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
  SetAttribute(control, "MAXSIZE", value)

proc `maxsize`*(control: MaxsizeTypes): string =
  return $GetAttribute(control, "MAXSIZE")

proc `maxsize=`*(control: MaxsizeTypes, width, height:int) =
  SetAttribute(control, "MAXSIZE", &"{width}x{height}")

type MdiactivateTypes = Dialog_t
proc `mdiactivate=`*(control: MdiactivateTypes, value: string) =
  ## [Windows Only] (write-only): Name of a MDI child window to be activated. If value is "NEXT"will activate the next window after the current active window. If value is "PREVIOUS"will activate the previous one.
  SetAttribute(control, "MDIACTIVATE", value)


type MdiactiveTypes = Dialog_t
proc `mdiactive`*(control: MdiactiveTypes): string =
  ## Windows Only] (read-only): Returns the name of the current active MDI child. Use IupGetAttributeHandle to directly retrieve the child handle.
  return $GetAttribute(control, "MDIACTIVE")


type MdiarrangeTypes = Dialog_t
proc `mdiarrange=`*(control: MdiarrangeTypes, value: string) =
  ## [Windows Only] (write-only): Action to arrange MDI child windows. Possible values: TILEHORIZONTAL, TILEVERTICAL, CASCADE and ICON (arrange the minimized icons).
  SetAttribute(control, "MDIARRANGE", value)


type MdichildTypes = Dialog_t
proc `mdichild=`*(control: MdichildTypes, value: string) =
  ## (creation only) [Windows Only]: Configure this dialog to be a MDI child. Can be YES or NO. The PARENTDIALOG attribute must also be defined. Each MDI child is automatically named if it does not have one. Default: NO.
  SetAttribute(control, "MDICHILD", value)

proc `mdichild`*(control: MdichildTypes): string =
  return $GetAttribute(control, "MDICHILD")


type MdiclientTypes = Dialog_t
proc `mdiclient=`*(control: MdiclientTypes, value: string) =
  ## (creation only) [Windows Only] (non inheritable): Configure the canvas as a MDI client. Can be YES or NO. No callbacks will be called. This canvas will be used internally only by the MDI Frame and its MDI Children. The MDI frame must have one and only one MDI client. Default: NO.
  SetAttribute(control, "MDICLIENT", value)

proc `mdiclient`*(control: MdiclientTypes): string =
  return $GetAttribute(control, "MDICLIENT")


type MdicloseallTypes = Dialog_t
proc `mdicloseall=`*(control: MdicloseallTypes, value: string) =
  ## [Windows Only] (write-only): Action to close and destroy all MDI child windows. The CLOSE_CB callback will be called for each child.
  ## IMPORTANT: When a MDI child window is closed it is automatically destroyed. The application can override this returning IUP_IGNORE in CLOSE_CB.
  SetAttribute(control, "MDICLOSEALL", value)


type MdiframeTypes = Dialog_t
proc `mdiframe=`*(control: MdiframeTypes, value: string) =
  ## (creation only) [Windows Only] (non inheritable): Configure this dialog as a MDI frame. Can be YES or NO. Default: NO.
  SetAttribute(control, "MDIFRAME", value)

proc `mdiframe`*(control: MdiframeTypes): string =
  return $GetAttribute(control, "MDIFRAME")


type MdimenuTypes = Dialog_t
proc `mdimenu=`*(control: MdimenuTypes, value: string) =
  ## (creation only) [Windows Only]: Name of a IupMenu to be used as the Window list of a MDI frame. The system will automatically add the list of MDI child windows there.
  SetAttribute(control, "MDIMENU", value)

proc `mdimenu`*(control: MdimenuTypes): string =
  return $GetAttribute(control, "MDIMENU")


type MdinextTypes = Dialog_t
proc `mdinext`*(control: MdinextTypes): string =
  ## [Windows Only] (read-only): Returns the name of the next available MDI child. Use IupGetAttributeHandle to directly retrieve the child handle. Must use MDIACTIVE to retrieve the first child. If the application is going to destroy the child retrieve the next child before destroying the current.
  return $GetAttribute(control, "MDINEXT")


type MenuTypes = Dialog_t
proc `menu=`*(control: MenuTypes, value: string) =
  ## Name of a menu. Associates a menu to the dialog as a menu bar. The previous menu, if any, is unmapped. Use IupSetHandle or IupSetAttributeHandle to associate a menu to a name. See also IupMenu.
  SetAttribute(control, "MENU", value)

proc `menu`*(control: MenuTypes): string =
  return $GetAttribute(control, "MENU")


type MenuboxTypes = Dialog_t
proc `menubox=`*(control: MenuboxTypes, value: string) =
  ## (creation only): Requires a system menu box from the window manager. If hidden will also remove the Close button. Default: YES. In Motif the decorations are controlled by the Window Manager and may not be possible to be changed from IUP. In Windows if hidden will hide also MAXBOX and MINBOX.
  SetAttribute(control, "MENUBOX", value)

proc `menubox`*(control: MenuboxTypes): string =
  return $GetAttribute(control, "MENUBOX")


type MinboxTypes = Dialog_t
proc `minbox=`*(control: MinboxTypes, value: string) =
  ## (creation only): Requires a minimize button from the window manager. Default: YES. In Motif the decorations are controlled by the Window Manager and may not be possible to be changed from IUP. In Windows MINBOX is hidden only if MAXBOX is hidden as well, or else it will be just disabled.
  SetAttribute(control, "MINBOX", value)

proc `minbox`*(control: MinboxTypes): string =
  return $GetAttribute(control, "MINBOX")


type MinimizedTypes = Dialog_t
proc `minimized=`*(control: MinimizedTypes, value: string) =
  ## [Windows and GTK Only] (read-only): indicates if the dialog is minimized. Can be YES or NO. (since 3.15)
  SetAttribute(control, "MINIMIZED", value)

proc `minimized`*(control: MinimizedTypes): string =
  return $GetAttribute(control, "MINIMIZED")


type MinsizeTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `minsize=`*(control: MinsizeTypes, value: string) =
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
  SetAttribute(control, "MINSIZE", value)

proc `minsize`*(control: MinsizeTypes): string =
  return $GetAttribute(control, "MINSIZE")

proc `minsize=`*(control: MinsizeTypes, width, height:int) =
  SetAttribute(control, "MINSIZE", &"{width}x{height}")

type ModalTypes = Dialog_t
proc `modal`*(control: ModalTypes): string =
  ## (read-only): Returns the popup state. It is "YES"if the dialog was shown using IupPopup. It is "NO"if IupShow was used or it is not visible. At the first time the dialog is shown, MODAL is not set yet when SHOW_CB is called. (since 3.0)
  return $GetAttribute(control, "MODAL")


type NactiveTypes = Dialog_t
proc `nactive=`*(control: NactiveTypes, value: string) =
  ## (non inheritable): same as ACTIVE but does not affects the controls inside the dialog. (since 3.13)
  SetAttribute(control, "NACTIVE", value)

proc `nactive`*(control: NactiveTypes): string =
  return $GetAttribute(control, "NACTIVE")


type NativeparentTypes = Dialog_t
proc `nativeparent=`*(control: NativeparentTypes, value: string) =
  ## (creation only): Native handle of a dialog to be used as parent. Used only if PARENTDIALOG is not defined.
  SetAttribute(control, "NATIVEPARENT", value)

proc `nativeparent`*(control: NativeparentTypes): string =
  return $GetAttribute(control, "NATIVEPARENT")


type NcgapTypes = Vbox_t | Hbox_t
proc `ncgap=`*(control: NcgapTypes, value: string) =
  ## Same as GAP but are non inheritable. (since 3.0)
  SetAttribute(control, "NCGAP", value)

proc `ncgap`*(control: NcgapTypes): string =
  return $GetAttribute(control, "NCGAP")


type NcmarginTypes = Vbox_t | Hbox_t
proc `ncmargin=`*(control: NcmarginTypes, value: string) =
  ## (non inheritable): Same as MARGIN but are non inheritable. (since 3.0)
  SetAttribute(control, "NCMARGIN", value)

proc `ncmargin`*(control: NcmarginTypes): string =
  return $GetAttribute(control, "NCMARGIN")


type NgapTypes = Vbox_t | Hbox_t
proc `ngap=`*(control: NgapTypes, value: string) =
  ## Same as GAP but are non inheritable. (since 3.0)
  SetAttribute(control, "NGAP", value)

proc `ngap`*(control: NgapTypes): string =
  return $GetAttribute(control, "NGAP")


type NmarginTypes = Vbox_t | Hbox_t
proc `nmargin=`*(control: NmarginTypes, value: string) =
  ## (non inheritable): Same as MARGIN but are non inheritable. (since 3.0)
  SetAttribute(control, "NMARGIN", value)

proc `nmargin`*(control: NmarginTypes): string =
  return $GetAttribute(control, "NMARGIN")


type NormalizesizeTypes = Vbox_t | Hbox_t
proc `normalizesize=`*(control: NormalizesizeTypes, value: string) =
  ## non inheritable): normalizes all children natural size to be the biggest natural size among them. All natural width will be set to the biggest width, and all natural height will be set to the biggest height according to is value. Can be NO, HORIZONTAL, VERTICAL or BOTH. Default: "NO". Same as using IupNormalizer. (since 3.0)
  SetAttribute(control, "NORMALIZESIZE", value)

proc `normalizesize`*(control: NormalizesizeTypes): string =
  return $GetAttribute(control, "NORMALIZESIZE")


type OpacityTypes = Dialog_t
proc `opacity=`*(control: OpacityTypes, value: string) =
  ## [Windows and GTK Only]: sets the dialog transparency alpha value. Valid values range from 0 (completely transparent) to 255 (opaque). In Windows must be set before map so the native window would be properly initialized when mapped (since 3.16). (GTK 2.12)
  SetAttribute(control, "OPACITY", value)

proc `opacity`*(control: OpacityTypes): string =
  return $GetAttribute(control, "OPACITY")


type OpacityimageTypes = Dialog_t
proc `opacityimage=`*(control: OpacityimageTypes, value: string) =
  ## [Windows Only]: sets an RGBA image as the dialog background so it is possible to create a non rectangle window with transparency, but it can not have children. Used usually for splash screens. It must be set before map so the native window would be properly initialized when mapped. Works also for GTK but as the SHAPEIMAGE attribute. (since 3.16)
  SetAttribute(control, "OPACITYIMAGE", value)

proc `opacityimage`*(control: OpacityimageTypes): string =
  return $GetAttribute(control, "OPACITYIMAGE")


type OrientationTypes = Vbox_t | Hbox_t
proc `orientation`*(control: OrientationTypes): string =
  ## (read-only) (non inheritable)
  return $GetAttribute(control, "ORIENTATION")


type PaddingTypes = Button_t | Label_t
proc `padding=`*(control: PaddingTypes, value: string) =
  ## internal margin. Works just like the MARGIN attribute of the IupHbox and IupVbox containers, but uses a different name to avoid inheritance problems. Default value: "0x0". Value can be DEFAULTBUTTONPADDING, so the global attribute of this name will be used instead (since 3.29). (since 3.0)
  SetAttribute(control, "PADDING", value)

proc `padding`*(control: PaddingTypes): string =
  return $GetAttribute(control, "PADDING")


type ParentdialogTypes = Dialog_t
proc `parentdialog=`*(control: ParentdialogTypes, value: string) =
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
  SetAttribute(control, "PARENTDIALOG", value)

proc `parentdialog`*(control: ParentdialogTypes): string =
  return $GetAttribute(control, "PARENTDIALOG")


type PlacementTypes = Dialog_t
proc `placement=`*(control: PlacementTypes, value: string) =
  ## (creation only): Name of a dialog to be used as parent.
  SetAttribute(control, "PLACEMENT", value)

proc `placement`*(control: PlacementTypes): string =
  return $GetAttribute(control, "PLACEMENT")


type PositionTypes = Button_t | Label_t | Vbox_t | Hbox_t
proc `position=`*(control: PositionTypes, value: string) =
  ## The position of the element relative to the origin of the Client area of the native parent. If you add the CLIENTOFFSET attribute of the native parent, you can obtain the coordinates relative to the Window area of the native parent. See the Layout Guide.
  ## It will be changed during the layout computation, except when FLOATING=YES or when used inside a concrete layout container.
  ## 
  ## Value
  ## "x,y", where x and y are integer values corresponding to the horizontal and vertical position, respectively, in pixels.
  ## 
  ## Affects
  ## All, except menus.
  SetAttribute(control, "POSITION", value)

proc `position`*(control: PositionTypes): string =
  return $GetAttribute(control, "POSITION")

proc `position=`*(control: PositionTypes, x, y:int) =
  SetAttribute(control, "POSITION", &"{x},{y}")

type PropagatefocusTypes = Button_t
proc `propagatefocus=`*(control: PropagatefocusTypes, value: string) =
  ## (non inheritable): enables the focus callback forwarding to the next native parent with FOCUS_CB defined. Default: NO. (since 3.23)
  SetAttribute(control, "PROPAGATEFOCUS", value)

proc `propagatefocus`*(control: PropagatefocusTypes): string =
  return $GetAttribute(control, "PROPAGATEFOCUS")


type RastersizeTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `rastersize=`*(control: RastersizeTypes, value: string) =
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
  SetAttribute(control, "RASTERSIZE", value)

proc `rastersize`*(control: RastersizeTypes): string =
  return $GetAttribute(control, "RASTERSIZE")

proc `rastersize=`*(control: RastersizeTypes, width, height:int) =
  SetAttribute(control, "RASTERSIZE", &"{width}x{height}")

type ResizeTypes = Dialog_t
proc `resize=`*(control: ResizeTypes, value: string) =
  ## (creation only): Allows interactively changing the dialog’s size. Default: YES. If RESIZE=NO then MAXBOX will be set to NO. In Motif the decorations are controlled by the Window Manager and may not be possible to be changed from IUP.
  SetAttribute(control, "RESIZE", value)

proc `resize`*(control: ResizeTypes): string =
  return $GetAttribute(control, "RESIZE")


type SaveunderTypes = Dialog_t
proc `saveunder=`*(control: SaveunderTypes, value: string) =
  ## [Windows and Motif Only] (creation only): When this attribute is true (YES), the dialog stores the original image of the desktop region it occupies (if the system has enough memory to store the image). In this case, when the dialog is closed or moved, a redrawing event is not generated for the windows that were shadowed by it. Its default value is YES if the dialog has a parent dialog (since 3.24). To save memory disable it for your main dialog. Not available in GTK.
  SetAttribute(control, "SAVEUNDER", value)

proc `saveunder`*(control: SaveunderTypes): string =
  return $GetAttribute(control, "SAVEUNDER")


type ScreenpositionTypes = Button_t | Label_t | Dialog_t
proc `screenposition=`*(control: ScreenpositionTypes, value: string) =
  ## Returns the absolute horizontal and/or vertical position of the top-left corner of the client area relative to the origin of the main screen in pixels. It is similar to POSITION but relative to the origin of the main screen, instead of the origin of the client area. The origin of the main screen is at the top-left corner, in Windows it is affected by the position of the Start Menu when it is at the top or left side of the screen.
  ## IMPORTANT: For the dialog, it is the position of the top-left corner of the window, NOT the client area. It is the same position used in IupShowXY and IupPopup. In GTK, if the dialog is hidden the values can be outdated.
  ## 
  ## Value
  ## "x,y", where x and y are integer values corresponding to the horizontal and vertical position, respectively, in pixels. When X or Y are used a single value is returned.
  SetAttribute(control, "SCREENPOSITION", value)

proc `screenposition`*(control: ScreenpositionTypes): string =
  return $GetAttribute(control, "SCREENPOSITION")

proc `screenposition=`*(control: ScreenpositionTypes, x, y:int) =
  SetAttribute(control, "SCREENPOSITION", &"{x},{y}")

type SeparatorTypes = Label_t
proc `separator=`*(control: SeparatorTypes, value: string) =
  ## (creation only) (non inheritable): Turns the label into a line separator. Possible values: "HORIZONTAL"or "VERTICAL". When changed before mapping the EXPAND attribute is set to "HORIZONTALFREE"or "VERTICALFREE"accordingly. (Since 3.11 changed to FREE based expand)
  SetAttribute(control, "SEPARATOR", value)

proc `separator`*(control: SeparatorTypes): string =
  return $GetAttribute(control, "SEPARATOR")


type ShapeimageTypes = Dialog_t
proc `shapeimage=`*(control: ShapeimageTypes, value: string) =
  ## [Windows and GTK Only]: sets a RGBA image as the dialog shape so it is possible to create a non rectangle window with children. (GTK 2.12) Only the fully transparent pixels will be transparent. The pixels colors will be ignored, only the alpha channel is used. (since 3.26)
  SetAttribute(control, "SHAPEIMAGE", value)

proc `shapeimage`*(control: ShapeimageTypes): string =
  return $GetAttribute(control, "SHAPEIMAGE")


type ShownofocusTypes = Dialog_t
proc `shownofocus=`*(control: ShownofocusTypes, value: string) =
  ## do not set focus after show. (since 3.30)
  SetAttribute(control, "SHOWNOFOCUS", value)

proc `shownofocus`*(control: ShownofocusTypes): string =
  return $GetAttribute(control, "SHOWNOFOCUS")


type ShrinkTypes = Dialog_t
proc `shrink=`*(control: ShrinkTypes, value: string) =
  ## Allows changing the elements’ distribution when the dialog is smaller than the minimum size. Default: NO.
  SetAttribute(control, "SHRINK", value)

proc `shrink`*(control: ShrinkTypes): string =
  return $GetAttribute(control, "SHRINK")


type SimulatemodalTypes = Dialog_t
proc `simulatemodal=`*(control: SimulatemodalTypes, value: string) =
  ## (write-only): disable all other visible dialogs, just like when the dialog is made modal. (since 3.21)
  SetAttribute(control, "SIMULATEMODAL", value)


type SizeTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `size=`*(control: SizeTypes, value: string) =
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
  SetAttribute(control, "SIZE", value)

proc `size`*(control: SizeTypes): string =
  return $GetAttribute(control, "SIZE")

proc `size=`*(control: SizeTypes, width:int, height:int) =
  SetAttribute(control, "SIZE", &"{width}x{height}")

type SpacingTypes = Button_t
proc `spacing=`*(control: SpacingTypes, value: string) =
  ## (creation only): defines the spacing between the image associated and the button's text. Default: "2".
  SetAttribute(control, "SPACING", value)

proc `spacing`*(control: SpacingTypes): string =
  return $GetAttribute(control, "SPACING")


type StartfocusTypes = Dialog_t
proc `startfocus=`*(control: StartfocusTypes, value: string) =
  ## Name of the element that must receive the focus right after the dialog is shown using IupShow or IupPopup. If not defined then the first control than can receive the focus is selected (same effect of calling IupNextField for the dialog). Updated after SHOW_CB is called and only if the focus was not changed during the callback.
  SetAttribute(control, "STARTFOCUS", value)

proc `startfocus`*(control: StartfocusTypes): string =
  return $GetAttribute(control, "STARTFOCUS")


type TaskbarbuttonTypes = Dialog_t
proc `taskbarbutton=`*(control: TaskbarbuttonTypes, value: string) =
  ## [Windows Only]: If set to SHOW force the application button to be shown on the taskbar even if the dialog does not have decorations. If set to HIDE force the application button to be hidden from the taskbar, but also in this case the system menu, the maximize and minimize buttons will be hidden. (since 3.28)
  SetAttribute(control, "TASKBARBUTTON", value)

proc `taskbarbutton`*(control: TaskbarbuttonTypes): string =
  return $GetAttribute(control, "TASKBARBUTTON")


type TaskbarprogressTypes = Dialog_t
proc `taskbarprogress=`*(control: TaskbarprogressTypes, value: string) =
  ## [Windows Only] (write-only): this functionality enables the use of progress bar on a taskbar button (Windows 7 or earlier version) (Available only for Visual C++ 10 and above). Default: NO (since 3.10).
  SetAttribute(control, "TASKBARPROGRESS", value)


type TaskbarprogressstateTypes = Dialog_t
proc `taskbarprogressstate=`*(control: TaskbarprogressstateTypes, value: string) =
  ## [Windows Only] (write-only): sets the type and state of the progress indicator displayed on a taskbar button. Possible values: NORMAL (a green bar), PAUSED (a yellow bar), ERROR (a red bar), INDETERMINATE (a green marquee) and NOPROGRESS (no bar). Default: NORMAL (since 3.10).
  SetAttribute(control, "TASKBARPROGRESSSTATE", value)


type TaskbarprogressvalueTypes = Dialog_t
proc `taskbarprogressvalue=`*(control: TaskbarprogressvalueTypes, value: string) =
  ## [Windows Only] (write-only): updates a progress bar hosted in a taskbar button to show the specific percentage completed of the full operation. The value must be between 0 and 100 (since 3.10).
  SetAttribute(control, "TASKBARPROGRESSVALUE", value)


type ThemeTypes = Button_t | Label_t | Vbox_t | Hbox_t
proc `theme=`*(control: ThemeTypes, value: string) =
  ## Applies a set of attributes to a control. The THEME attribute in inheritable and the NTHEME attribute is NOT inheritable.
  SetAttribute(control, "THEME", value)

proc `theme`*(control: ThemeTypes): string =
  return $GetAttribute(control, "THEME")


type TipTypes = Button_t | Label_t | Dialog_t
proc `tip=`*(control: TipTypes, value: string) =
  ## Text to be shown when the mouse lies over the element.
  SetAttribute(control, "TIP", value)

proc `tip`*(control: TipTypes): string =
  return $GetAttribute(control, "TIP")


type TipballoonTypes = Button_t | Label_t | Dialog_t
proc `tipballoon=`*(control: TipballoonTypes, value: string) =
  ## [Windows Only]: The tip window will have the appearance of a cartoon "balloon"with rounded corners and a stem pointing to the item. Default: NO.
  SetAttribute(control, "TIPBALLOON", value)

proc `tipballoon`*(control: TipballoonTypes): string =
  return $GetAttribute(control, "TIPBALLOON")


type TipballoontitleTypes = Button_t | Label_t | Dialog_t
proc `tipballoontitle=`*(control: TipballoontitleTypes, value: string) =
  ## [Windows Only]: When using the balloon format, the tip can also has a title in a separate area.
  SetAttribute(control, "TIPBALLOONTITLE", value)

proc `tipballoontitle`*(control: TipballoontitleTypes): string =
  return $GetAttribute(control, "TIPBALLOONTITLE")


type TipballoontitleiconTypes = Button_t | Label_t | Dialog_t
proc `tipballoontitleicon=`*(control: TipballoontitleiconTypes, value: string) =
  ## [Windows Only]: When using the balloon format, the tip can also has a pre-defined icon in the title area. Values can be:
  ## "0"- No icon (default)
  ## "1"- Info icon
  ## "2"- Warning icon
  ## "3"- Error Icon
  SetAttribute(control, "TIPBALLOONTITLEICON", value)

proc `tipballoontitleicon`*(control: TipballoontitleiconTypes): string =
  return $GetAttribute(control, "TIPBALLOONTITLEICON")


type TipbgcolorTypes = Button_t | Label_t | Dialog_t
proc `tipbgcolor=`*(control: TipbgcolorTypes, value: string) =
  ## [Windows and Motif Only]: The tip background color. Default: "255 255 225"(Light Yellow)
  SetAttribute(control, "TIPBGCOLOR", value)

proc `tipbgcolor`*(control: TipbgcolorTypes): string =
  return $GetAttribute(control, "TIPBGCOLOR")


type TipdelayTypes = Button_t | Label_t | Dialog_t
proc `tipdelay=`*(control: TipdelayTypes, value: string) =
  ## [Windows and Motif Only]: Time the tip will remain visible. Default: "5000". In Windows the maximum value is 32767 milliseconds.
  SetAttribute(control, "TIPDELAY", value)

proc `tipdelay`*(control: TipdelayTypes): string =
  return $GetAttribute(control, "TIPDELAY")


type TipfgcolorTypes = Button_t | Label_t | Dialog_t
proc `tipfgcolor=`*(control: TipfgcolorTypes, value: string) =
  ## [Windows and Motif Only]: The tip text color. Default: "0 0 0"(Black)
  SetAttribute(control, "TIPFGCOLOR", value)

proc `tipfgcolor`*(control: TipfgcolorTypes): string =
  return $GetAttribute(control, "TIPFGCOLOR")


type TipfontTypes = Button_t | Label_t | Dialog_t
proc `tipfont=`*(control: TipfontTypes, value: string) =
  ## [Windows and Motif Only]: The font for the tip text. If not defined the font used for the text is the same as the FONT attribute for the element. If the value is SYSTEM then, no font is selected and the default system font for the tip will be used.
  SetAttribute(control, "TIPFONT", value)

proc `tipfont`*(control: TipfontTypes): string =
  return $GetAttribute(control, "TIPFONT")


type TipiconTypes = Button_t | Label_t | Dialog_t
proc `tipicon=`*(control: TipiconTypes, value: string) =
  ## [GTK only]: name of an image to be displayed in the TIP. See IupImage. (GTK 2.12)
  SetAttribute(control, "TIPICON", value)

proc `tipicon`*(control: TipiconTypes): string =
  return $GetAttribute(control, "TIPICON")


type TipmarkupTypes = Button_t | Label_t | Dialog_t
proc `tipmarkup=`*(control: TipmarkupTypes, value: string) =
  ## [GTK only]: allows the tip string to contains Pango markup commands. Can be "YES"or "NO". Default: "NO". Must be set before setting the TIP attribute. (GTK 2.12)
  SetAttribute(control, "TIPMARKUP", value)

proc `tipmarkup`*(control: TipmarkupTypes): string =
  return $GetAttribute(control, "TIPMARKUP")


type TiprectTypes = Button_t | Label_t | Dialog_t
proc `tiprect=`*(control: TiprectTypes, value: string) =
  ## (non inheritable): Specifies a rectangle inside the element where the tip will be activated. Format: "%d %d %d %d"="x1 y1 x2 y2". Default: all the element area. (GTK 2.12)
  SetAttribute(control, "TIPRECT", value)

proc `tiprect`*(control: TiprectTypes): string =
  return $GetAttribute(control, "TIPRECT")


type TipvisibleTypes = Button_t | Label_t | Dialog_t
proc `tipvisible=`*(control: TipvisibleTypes, value: string) =
  ## Shows or hides the tip under the mouse cursor. Use values "YES"or "NO". Returns the current visible state. (GTK 2.12) (since 3.5)
  SetAttribute(control, "TIPVISIBLE", value)

proc `tipvisible`*(control: TipvisibleTypes): string =
  return $GetAttribute(control, "TIPVISIBLE")


type TitleTypes = Label_t | Dialog_t
proc `title=`*(control: TitleTypes, value: string) =
  ## Element’s title. It is often used to modify some static text of the element (which cannot be changed by the user).
  ## Notes
  ## 
  ## The '\n'character usually is accepted for line change (except for menus).
  ## The "&"character can be used to define a MNEMONIC, use "&&"to show the "&"character instead on defining a mnemonic.
  ## If a mnemonic is defined then the character relative to it is underlined and a key is associated so that when pressed together with the Alt key activates the control.
  ## In GTk, if you define a mnemonic using "&"and the string has an underscore, then make sure that the mnemonic comes before the underscore.
  ## In GTK, if the MARKUP attribute is defined then the title string can contains pango markup commands. Works only if a mnemonic is NOT defined in the title. Not valid for menus.
  SetAttribute(control, "TITLE", value)

proc `title`*(control: TitleTypes): string =
  return $GetAttribute(control, "TITLE")


type ToolboxTypes = Dialog_t
proc `toolbox=`*(control: ToolboxTypes, value: string) =
  ## [Windows Only] (creation only): makes the dialog look like a toolbox with a smaller title bar. It is only valid if the PARENTDIALOG or NATIVEPARENT attribute is also defined. Default: NO.
  SetAttribute(control, "TOOLBOX", value)

proc `toolbox`*(control: ToolboxTypes): string =
  return $GetAttribute(control, "TOOLBOX")


type TopmostTypes = Dialog_t
proc `topmost=`*(control: TopmostTypes, value: string) =
  ## [Windows and GTK Only]: puts the dialog always in front of all other dialogs in all applications. Default: NO.
  SetAttribute(control, "TOPMOST", value)

proc `topmost`*(control: TopmostTypes): string =
  return $GetAttribute(control, "TOPMOST")


type TrayTypes = Dialog_t
proc `tray=`*(control: TrayTypes, value: string) =
  ## [Windows and GTK Only]: When set to "YES", displays an icon on the system tray. (GTK 2.10 and GTK <3.14)
  SetAttribute(control, "TRAY", value)

proc `tray`*(control: TrayTypes): string =
  return $GetAttribute(control, "TRAY")


type TrayimageTypes = Dialog_t
proc `trayimage=`*(control: TrayimageTypes, value: string) =
  ## [Windows and GTK Only]: Name of a IUP image to be used as the tray icon. The Windows SDK recommends that cursors and icons should be implemented as resources rather than created at run time. (GTK 2.10 and GTK <3.14)
  SetAttribute(control, "TRAYIMAGE", value)

proc `trayimage`*(control: TrayimageTypes): string =
  return $GetAttribute(control, "TRAYIMAGE")


type TraytipTypes = Dialog_t
proc `traytip=`*(control: TraytipTypes, value: string) =
  ## [Windows and GTK Only]: Tray icon's tooltip text. (GTK 2.10 and GTK <3.14)
  SetAttribute(control, "TRAYTIP", value)

proc `traytip`*(control: TraytipTypes): string =
  return $GetAttribute(control, "TRAYTIP")


type TraytipballoonTypes = Dialog_t
proc `traytipballoon=`*(control: TraytipballoonTypes, value: string) =
  ## [Windows Only]: The tip window will have the appearance of a cartoon "balloon"with rounded corners and a stem pointing to the item. Default: NO. Must be set before setting the TRAYTIP attribute. (since 3.6)
  SetAttribute(control, "TRAYTIPBALLOON", value)

proc `traytipballoon`*(control: TraytipballoonTypes): string =
  return $GetAttribute(control, "TRAYTIPBALLOON")


type TraytipballoondelayTypes = Dialog_t
proc `traytipballoondelay=`*(control: TraytipballoondelayTypes, value: string) =
  ## [Windows Only]: Time the tip will remain visible. Default is system dependent. The minimum and maximum values are 10000 and 30000 milliseconds. Must be set before setting the TRAYTIP attribute. (since 3.6)
  SetAttribute(control, "TRAYTIPBALLOONDELAY", value)

proc `traytipballoondelay`*(control: TraytipballoondelayTypes): string =
  return $GetAttribute(control, "TRAYTIPBALLOONDELAY")


type TraytipballoontitleTypes = Dialog_t
proc `traytipballoontitle=`*(control: TraytipballoontitleTypes, value: string) =
  ## [Windows Only]: When using the balloon format, the tip can also has a title in a separate area. Must be set before setting the TRAYTIP attribute. (since 3.6)
  SetAttribute(control, "TRAYTIPBALLOONTITLE", value)

proc `traytipballoontitle`*(control: TraytipballoontitleTypes): string =
  return $GetAttribute(control, "TRAYTIPBALLOONTITLE")


type TraytipballoontitleiconTypes = Dialog_t
proc `traytipballoontitleicon=`*(control: TraytipballoontitleiconTypes, value: string) =
  ## [Windows Only]: When using the balloon format, the tip can also has a pre-defined icon in the title area. Must be set before setting the TRAYTIP attribute. (since 3.6)
  ## Values can be:
  ## "0"- No icon (default)
  ## "1"- Info icon
  ## "2"- Warning icon
  ## "3"- Error Icon
  SetAttribute(control, "TRAYTIPBALLOONTITLEICON", value)

proc `traytipballoontitleicon`*(control: TraytipballoontitleiconTypes): string =
  return $GetAttribute(control, "TRAYTIPBALLOONTITLEICON")


type TraytipmarkupTypes = Dialog_t
proc `traytipmarkup=`*(control: TraytipmarkupTypes, value: string) =
  ## GTK Only]: allows the tip string to contains Pango markup commands. Can be "YES"or "NO". Default: "NO". Must be set before setting the TRAYTIP attribute. (GTK 2.16) (since 3.6)
  SetAttribute(control, "TRAYTIPMARKUP", value)

proc `traytipmarkup`*(control: TraytipmarkupTypes): string =
  return $GetAttribute(control, "TRAYTIPMARKUP")


type VisibleTypes = Button_t | Label_t | Dialog_t
proc `visible=`*(control: VisibleTypes, value: string) =
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
  SetAttribute(control, "VISIBLE", value)

proc `visible`*(control: VisibleTypes): string =
  return $GetAttribute(control, "VISIBLE")


type WidTypes = Button_t | Label_t | Dialog_t | Vbox_t | Hbox_t
proc `wid=`*(control: WidTypes, value: string) =
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
  SetAttribute(control, "WID", value)

proc `wid`*(control: WidTypes): string =
  return $GetAttribute(control, "WID")


type WordwrapTypes = Label_t
proc `wordwrap=`*(control: WordwrapTypes, value: string) =
  ## [Windows and GTK only]: enables or disable the wrapping of lines that does not fits in the label. Can be "YES"or "NO". Default: "NO". Can only set WORDWRAP=YES if ALIGNMENT=ALEFT. (since 3.0)
  SetAttribute(control, "WORDWRAP", value)

proc `wordwrap`*(control: WordwrapTypes): string =
  return $GetAttribute(control, "WORDWRAP")


type XwindowTypes = Dialog_t
proc `xwindow`*(control: XwindowTypes): string =
  ## [UNIX Only] (non inheritable, read-only): Returns the X-Windows Window (Drawable). Available in the Motif driver or in the GTK driver in UNIX.
  return $GetAttribute(control, "XWINDOW")


type ZorderTypes = Button_t | Label_t | Dialog_t
proc `zorder=`*(control: ZorderTypes, value: string) =
  ## Change the ZORDER of a dialog or control. It is commonly used for dialogs, but it can be used to control the z-order of controls in a dialog.
  ## 
  ## Value
  ## Can be "TOP"or "BOTTOM".
  ## 
  ## Affects
  ## All controls that have visual representation.
  SetAttribute(control, "ZORDER", value)


# CALLBACKS
type ActionTypes = Button_t
proc `action=`*(control: ActionTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area.
  SetCallback(control, "ACTION", cast[Icallback](cb))
proc `action`*(control: ActionTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "ACTION"))

type Button_cbTypes = Button_t | Label_t
proc `button_cb=`*(control: Button_cbTypes, cb: proc (ih: PIhandle; button: cint; pressed: cint; x: cint; y: cint; status: cstring): cint {.cdecl.}) =
  ## Action generated when any mouse button is pressed and when it is released. Both calls occur before the ACTION callback when button 1 is being used.
  SetCallback(control, "BUTTON_CB", cast[Icallback](cb))
proc `button_cb`*(control: Button_cbTypes): proc (ih: PIhandle; button: cint; pressed: cint; x: cint; y: cint; status: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle; button: cint; pressed: cint; x: cint; y: cint; status: cstring): cint {.cdecl.}](GetCallback(control, "BUTTON_CB"))

type Close_cbTypes = Dialog_t
proc `close_cb=`*(control: Close_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called just before a dialog is closed when the user clicks the close button of the title bar or an equivalent action.
  ## Returns: if IUP_IGNORE, it prevents the dialog from being closed. If you destroy the dialog in this callback, you must return IUP_IGNORE. IUP_CLOSE will be processed.
  SetCallback(control, "CLOSE_CB", cast[Icallback](cb))
proc `close_cb`*(control: Close_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "CLOSE_CB"))

type Copydata_cbTypes = Dialog_t
proc `copydata_cb=`*(control: Copydata_cbTypes, cb: proc (ph: PIhandle, cmdLine: cstring, size: cint): cint {.cdecl.}) =
  ## [Windows Only]: Called at the first instance, when a second instance is running. Must set the global attribute SINGLEINSTANCE to be called. (since 3.2)
  ## Ih: identifier of the element that activated the event.
  ## cmdLine: command line of the second instance.
  ## size: size of the command line string including the null character.
  SetCallback(control, "COPYDATA_CB", cast[Icallback](cb))
proc `copydata_cb`*(control: Copydata_cbTypes): proc (ph: PIhandle, cmdLine: cstring, size: cint): cint {.cdecl.} =
  return cast[proc (ph: PIhandle, cmdLine: cstring, size: cint): cint {.cdecl.}](GetCallback(control, "COPYDATA_CB"))

type Customframe_cbTypes = Dialog_t
proc `customframe_cb=`*(control: Customframe_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## [Windows Only]: Called when the dialog must be redraw. Although it is designed for drawing the frame elements, all the dialog must be painted. Works only when CUSTOMFRAME or CUSTOMFRAMEEX is defined. The dialog can be used just like an IupCanvas to draw its elements, the HDC_WMPAINT and CLIPRECT attributes are defined during the callback. For mouse callbacks use the same callbacks as IupCanvas, such as BUTTON_CB and MOTION_CB. (since 3.18)
  SetCallback(control, "CUSTOMFRAME_CB", cast[Icallback](cb))
proc `customframe_cb`*(control: Customframe_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "CUSTOMFRAME_CB"))

type Customframeactivate_cbTypes = Dialog_t
proc `customframeactivate_cb=`*(control: Customframeactivate_cbTypes, cb: proc (ih: PIhandle, active: cint): cint {.cdecl.}) =
  ## [Windows Only]: Called when the dialog active state is changed (for instance the user Alt+Tab to another application, or clicked in another window). Works only when CUSTOMFRAME or CUSTOMFRAMEEX is defined. (since 3.23)
  ## Ih: identifier of the element that activated the event.
  ## active: is non zero if the dialog is active or zero if it is inactive.
  SetCallback(control, "CUSTOMFRAMEACTIVATE_CB", cast[Icallback](cb))
proc `customframeactivate_cb`*(control: Customframeactivate_cbTypes): proc (ih: PIhandle, active: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, active: cint): cint {.cdecl.}](GetCallback(control, "CUSTOMFRAMEACTIVATE_CB"))

type Destroy_cbTypes = Button_t | Label_t | Dialog_t
proc `destroy_cb=`*(control: Destroy_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called right before an element is destroyed.
  SetCallback(control, "DESTROY_CB", cast[Icallback](cb))
proc `destroy_cb`*(control: Destroy_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "DESTROY_CB"))

type Dragbegin_cbTypes = Label_t | Dialog_t
proc `dragbegin_cb=`*(control: Dragbegin_cbTypes, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) =
  ## notifies source that drag started. It is called when the mouse starts a drag operation.
  ## ih: identifier of the element that activated the event.
  ## x, y: cursor position relative to the top-left corner of the element.
  ## 
  ## Returns: If IUP_IGNORE is returned the drag is aborted.
  SetCallback(control, "DRAGBEGIN_CB", cast[Icallback](cb))
proc `dragbegin_cb`*(control: Dragbegin_cbTypes): proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}](GetCallback(control, "DRAGBEGIN_CB"))

type Dragdata_cbTypes = Label_t | Dialog_t
proc `dragdata_cb=`*(control: Dragdata_cbTypes, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) =
  ## request for drag data from source. It is called when the data is dropped.
  ## Ih: identifier of the element that activated the event.
  ## type: type of the data. It is one of the registered types in DRAGTYPES.
  ## data: buffer to be filled by the application. In Lua is a light userdata. If your data is a string you can use iup.CopyString2UserData(str, data, size) to copy the string into the user data (since 3.27).
  ## size: buffer size in bytes. The same value returned by DRAGDATASIZE_CB.
  SetCallback(control, "DRAGDATA_CB", cast[Icallback](cb))
proc `dragdata_cb`*(control: Dragdata_cbTypes): proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}](GetCallback(control, "DRAGDATA_CB"))

type Dragdatasize_cbTypes = Label_t | Dialog_t
proc `dragdatasize_cb=`*(control: Dragdatasize_cbTypes, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) =
  ## request for size of drag data from source. It is called when the data is dropped, before the DRAGDATA_CB callback.
  ## ih: identifier of the element that activated the event.
  ## type: type of the data. It is one of the registered types in DRAGTYPES.
  ## 
  ## Returns: the size in bytes for the data. It will be used to allocate the buffer size for the data in transfer.
  SetCallback(control, "DRAGDATASIZE_CB", cast[Icallback](cb))
proc `dragdatasize_cb`*(control: Dragdatasize_cbTypes): proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}](GetCallback(control, "DRAGDATASIZE_CB"))

type Dragend_cbTypes = Label_t | Dialog_t
proc `dragend_cb=`*(control: Dragend_cbTypes, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) =
  ## notifies source that drag is done. The only drag callback that is optional. It is called after the data has been dropped.
  ## ih: identifier of the element that activated the event.
  ## action: action performed by the operation (1 = move, 0 = copy, -1 = drag failed or aborted)
  ## 
  ## If action is 1 it is responsibility of the application to remove the data from source.
  SetCallback(control, "DRAGEND_CB", cast[Icallback](cb))
proc `dragend_cb`*(control: Dragend_cbTypes): proc (ih: PIhandle, action: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, action: cint): cint {.cdecl.}](GetCallback(control, "DRAGEND_CB"))

type Dropdata_cbTypes = Label_t | Dialog_t
proc `dropdata_cb=`*(control: Dropdata_cbTypes, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) =
  ## source has sent target the requested data. It is called when the data is dropped. If both drag and drop would be in the same application it would be called after the DRAGDATA_CB callback.
  ## ih: identifier of the element that activated the event.
  ## type: type of the data. It is one of the registered types in DROPTYPES.
  ## data: content data received in the drop operation.  In Lua is a light userdata. If your data is a string you can use "str = iup.CopyUserData2String(data, size)"to copy the user data into a string (since 3.27).
  ## size: data size in bytes.
  ## x, y: cursor position relative to the top-left corner of the element.
  SetCallback(control, "DROPDATA_CB", cast[Icallback](cb))
proc `dropdata_cb`*(control: Dropdata_cbTypes): proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}](GetCallback(control, "DROPDATA_CB"))

type Dropfiles_cbTypes = Label_t | Dialog_t
proc `dropfiles_cb=`*(control: Dropfiles_cbTypes, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: int): cint {.cdecl.}) =
  ## [Windows and GTK Only]: Action generated when one or more files are dropped in the element. (since 3.3)
  ## filename: Name of the dropped file.
  ## num: Number index of the dropped file. If several files are dropped, num is the index of the dropped file starting from "total-1"to "0".
  ## x: X coordinate of the point where the user released the mouse button.
  ## y: Y coordinate of the point where the user released the mouse button.
  ## 
  ## Returns: If IUP_IGNORE is returned the callback will NOT be called for the next dropped files, and the processing of dropped files will be interrupted.
  SetCallback(control, "DROPFILES_CB", cast[Icallback](cb))
proc `dropfiles_cb`*(control: Dropfiles_cbTypes): proc (Ih: PIhandle, filename: cstring, num, x, y: int): cint {.cdecl.} =
  return cast[proc (Ih: PIhandle, filename: cstring, num, x, y: int): cint {.cdecl.}](GetCallback(control, "DROPFILES_CB"))

type Dropmotion_cbTypes = Label_t | Dialog_t
proc `dropmotion_cb=`*(control: Dropmotion_cbTypes, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) =
  ## notifies destination about drag pointer motion. The only drop callback that is optional. It is called when the mouse moves over any valid drop site.
  ## Ih: identifier of the element that activated the event.
  ## x, y: position in the canvas where the event has occurred, in pixels.
  ## status: status of mouse buttons and certain keyboard keys at the moment the event was generated. The same macros used for BUTTON_CB can be used for this status.
  SetCallback(control, "DROPMOTION_CB", cast[Icallback](cb))
proc `dropmotion_cb`*(control: Dropmotion_cbTypes): proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}](GetCallback(control, "DROPMOTION_CB"))

type Enterwindow_cbTypes = Button_t | Label_t | Dialog_t
proc `enterwindow_cb=`*(control: Enterwindow_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when the mouse enters the native element.
  ## 
  ## Notes
  ## When the cursor is moved from one element to another, the call order in all platforms will be first the LEAVEWINDOW_CB callback of the old control followed by the ENTERWINDOW_CB callback of the new control. (since 3.14)
  ## If the mouse button is hold pressed and the cursor moves outside the element the behavior is system dependent. In Windows the LEAVEWINDOW_CB/ENTERWINDOW_CB callbacks are NOT called, in GTK the callbacks are called.
  SetCallback(control, "ENTERWINDOW_CB", cast[Icallback](cb))
proc `enterwindow_cb`*(control: Enterwindow_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "ENTERWINDOW_CB"))

type Getfocus_cbTypes = Button_t | Dialog_t
proc `getfocus_cb=`*(control: Getfocus_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus.
  SetCallback(control, "GETFOCUS_CB", cast[Icallback](cb))
proc `getfocus_cb`*(control: Getfocus_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "GETFOCUS_CB"))

type Help_cbTypes = Button_t | Dialog_t
proc `help_cb=`*(control: Help_cbTypes, cb: proc (ih: PIhandle): void {.cdecl.}) =
  ## Action generated when the user press F1 at a control. In Motif is also activated by the Help button in some workstations keyboard.
  SetCallback(control, "HELP_CB", cast[Icallback](cb))
proc `help_cb`*(control: Help_cbTypes): proc (ih: PIhandle): void {.cdecl.} =
  return cast[proc (ih: PIhandle): void {.cdecl.}](GetCallback(control, "HELP_CB"))

type K_anyTypes = Button_t | Dialog_t
proc `k_any=`*(control: K_anyTypes, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) =
  ## Action generated when a keyboard event occurs.
  ## ih: identifier of the element that activated the event.
  ## c: identifier of typed key. Please refer to the Keyboard Codes table for a list of possible values.
  ## Returns: If IUP_IGNORE is returned the key is ignored and not processed by the control and not propagated. If returns IUP_CONTINUE, the key will be processed and the event will be propagated to the parent of the element receiving it, this is the default behavior. If returns IUP_DEFAULT the key is processed but it is not propagated. IUP_CLOSE will be processed.
  ## 
  ## Notes
  ## Keyboard callbacks depend on the keyboard usage of the control with the focus. So if you return IUP_IGNORE the control will usually not process the key. But be aware that sometimes the control process the key in another event so even returning IUP_IGNORE the key can get processed. Although it will not be propagated.
  ## 
  ## IMPORTANT: The callbacks "K_*"of the dialog or native containers depend on the IUP_CONTINUE return value to work while the control is in focus.
  ## If the callback does not exists it is automatically propagated to the parent of the element.
  ## 
  ## K_* callbacks
  ## All defined keys are also callbacks of any element, called when the respective key is activated. For example: "K_cC"is also a callback activated when the user press Ctrl+C, when the focus is at the element or at a children with focus. This is the way an application can create shortcut keys, also called hot keys. These callbacks are not available in IupLua.
  SetCallback(control, "K_ANY", cast[Icallback](cb))
proc `k_any`*(control: K_anyTypes): proc (ih: PIhandle, c: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: cint): cint {.cdecl.}](GetCallback(control, "K_ANY"))

type Killfocus_cbTypes = Button_t | Dialog_t
proc `killfocus_cb=`*(control: Killfocus_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus.
  SetCallback(control, "KILLFOCUS_CB", cast[Icallback](cb))
proc `killfocus_cb`*(control: Killfocus_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "KILLFOCUS_CB"))

type Leavewindow_cbTypes = Button_t | Label_t | Dialog_t
proc `leavewindow_cb=`*(control: Leavewindow_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when the mouse leaves the native element.
  ## 
  ## Notes
  ## When the cursor is moved from one element to another, the call order in all platforms will be first the LEAVEWINDOW_CB callback of the old control followed by the ENTERWINDOW_CB callback of the new control. (since 3.14)
  ## If the mouse button is hold pressed and the cursor moves outside the element the behavior is system dependent. In Windows the LEAVEWINDOW_CB/ENTERWINDOW_CB callbacks are NOT called, in GTK the callbacks are called.
  SetCallback(control, "LEAVEWINDOW_CB", cast[Icallback](cb))
proc `leavewindow_cb`*(control: Leavewindow_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "LEAVEWINDOW_CB"))

type Map_cbTypes = Button_t | Label_t | Dialog_t
proc `map_cb=`*(control: Map_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called right after an element is mapped and its attributes updated in IupMap.
  ## When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB (since 3.14).
  SetCallback(control, "MAP_CB", cast[Icallback](cb))
proc `map_cb`*(control: Map_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "MAP_CB"))

type Mdiactivate_cbTypes = Dialog_t
proc `mdiactivate_cb=`*(control: Mdiactivate_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## [Windows Only]: Called when a MDI child window is activated. Only the MDI child receive this message. It is not called when the child is shown for the first time.
  SetCallback(control, "MDIACTIVATE_CB", cast[Icallback](cb))
proc `mdiactivate_cb`*(control: Mdiactivate_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "MDIACTIVATE_CB"))

type Motion_cbTypes = Label_t
proc `motion_cb=`*(control: Motion_cbTypes, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) =
  ## Action generated when the mouse is moved. (since 3.20)
  ## X, y: position in the canvas where the event has occurred, in pixels.
  ## status: status of mouse buttons and certain keyboard keys at the moment the event was generated. The same macros used for BUTTON_CB can be used for this status.
  SetCallback(control, "MOTION_CB", cast[Icallback](cb))
proc `motion_cb`*(control: Motion_cbTypes): proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}](GetCallback(control, "MOTION_CB"))

type Move_cbTypes = Dialog_t
proc `move_cb=`*(control: Move_cbTypes, cb: proc (ih: PIhandle, x, y: cint): cint {.cdecl.}) =
  ## [Windows and GTK Only]: Called after the dialog was moved on screen. The coordinates are the same as the SCREENPOSITION attribute. (since 3.0)
  ## x, y: coordinates of the new position.
  SetCallback(control, "MOVE_CB", cast[Icallback](cb))
proc `move_cb`*(control: Move_cbTypes): proc (ih: PIhandle, x, y: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x, y: cint): cint {.cdecl.}](GetCallback(control, "MOVE_CB"))

type Resize_cbTypes = Dialog_t
proc `resize_cb=`*(control: Resize_cbTypes, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) =
  ## Action generated when the canvas or dialog size is changed.
  ## ih: identifier of the element that activated the event.
  ## width: the width of the internal element size in pixels not considering the decorations (client size)
  ## height: the height of the internal element size in pixels not considering the decorations (client size)
  ## 
  ## Notes
  ## For the dialog, this action is also generated when the dialog is mapped, after the map and before the show.
  ## When XAUTOHIDE=Yes or YAUTOHIDE=Yes, if the canvas scrollbar is hidden/shown after changing the DX or DY attributes from inside the callback, the size of the drawing area will immediately change, so the parameters with and height will be invalid. To update the parameters consult the DRAWSIZE attribute. Also activate the drawing toolkit only after updating the DX or DY attributes.
  SetCallback(control, "RESIZE_CB", cast[Icallback](cb))
proc `resize_cb`*(control: Resize_cbTypes): proc (ih: PIhandle, width, height: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, width, height: cint): cint {.cdecl.}](GetCallback(control, "RESIZE_CB"))

type Show_cbTypes = Dialog_t
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
  SetCallback(control, "SHOW_CB", cast[Icallback](cb))
proc `show_cb`*(control: Show_cbTypes): proc (ih: PIhandle, state: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, state: cint): cint {.cdecl.}](GetCallback(control, "SHOW_CB"))

type Tips_cbTypes = Button_t
proc `tips_cb=`*(control: Tips_cbTypes, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) =
  ## Action before a tip is displayed.
  SetCallback(control, "TIPS_CB", cast[Icallback](cb))
proc `tips_cb`*(control: Tips_cbTypes): proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}](GetCallback(control, "TIPS_CB"))

type Trayclick_cbTypes = Dialog_t
proc `trayclick_cb=`*(control: Trayclick_cbTypes, cb: proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.}) =
  ## [Windows and GTK Only]: Called right after the mouse button is pressed or released over the tray icon. (GTK 2.10)
  ## ih: identifier of the element that activated the event.
  ## but: identifies the activated mouse button. Can be: 1, 2 or 3. Note that this is different from the BUTTON_CB canvas callback definition. GTK does not get button=2 messages.
  ## pressed: indicates the state of the button. Always 1 in GTK.
  ## dclick: indicates a double click. In GTK double click is simulated.
  ## Returns: IUP_CLOSE will be processed.
  SetCallback(control, "TRAYCLICK_CB", cast[Icallback](cb))
proc `trayclick_cb`*(control: Trayclick_cbTypes): proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.}](GetCallback(control, "TRAYCLICK_CB"))

type Unmap_cbTypes = Button_t | Label_t | Dialog_t
proc `unmap_cb=`*(control: Unmap_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called right before an element is unmapped.
  SetCallback(control, "UNMAP_CB", cast[Icallback](cb))
proc `unmap_cb`*(control: Unmap_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "UNMAP_CB"))

