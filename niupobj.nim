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
proc Button*(title:string, action:string):Button_t =
  return Button_t(niup.Button(title, action))

proc Button*(title:string):Button_t =
  return Button_t(niup.Button(title, nil))

proc Label*(title:string):Label_t =
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
proc Dialog*(child: PIhandle):Dialog_t =
  return Dialog_t(niup.Dialog(child))


# ATTRIBUTES
type ActiveTypes = Button_t
proc `active=`*(control: ActiveTypes, value: string) =
  ## Activates or inhibits user interaction.
  SetAttribute(control, "ACTIVE", value)

proc `active`*(control: ActiveTypes): string =
  return $GetAttribute(control, "ACTIVE")

proc `active=`*(control: ActiveTypes, active:bool) =
  SetAttribute(control, "ACTIVE", (if active: "YES" else: "NO"))

type AlignmentTypes = Button_t | Vbox_t
proc `alignment=`*(control: AlignmentTypes, value: string) =
  ## (non inheritable): Horizontally aligns the elements. Possible values: "ALEFT", "ACENTER", "ARIGHT". Default: "ALEFT".
  SetAttribute(control, "ALIGNMENT", value)

proc `alignment`*(control: AlignmentTypes): string =
  return $GetAttribute(control, "ALIGNMENT")


type BgcolorTypes = Button_t
proc `bgcolor=`*(control: BgcolorTypes, value: string) =
  ## Background color. If text and image are not defined, the button is configured to simply show a color, in this case set the button size because the natural size will be very small. In Windows and in GTK 3, the BGCOLOR attribute is ignored if text or image is defined. Default: the global attribute DLGBGCOLOR. BGCOLOR is ignored when FLAT=YES because it will be used the background from the native parent.
  SetAttribute(control, "BGCOLOR", value)

proc `bgcolor`*(control: BgcolorTypes): string =
  return $GetAttribute(control, "BGCOLOR")

proc `bgcolor=`*(control: BgcolorTypes, red:int, green:int, blue:int, alpha:int = 255) =
  SetAttribute(control, "BGCOLOR", &"{red} {green} {blue} {alpha}")

type CanfocusTypes = Button_t
proc `canfocus=`*(control: CanfocusTypes, value: string) =
  ## (creation only) (non inheritable): enables the focus traversal of the control. In Windows the button will respect CANFOCUS differently to some other controls. Default: YES. (since 3.0)
  SetAttribute(control, "CANFOCUS", value)

proc `canfocus`*(control: CanfocusTypes): string =
  return $GetAttribute(control, "CANFOCUS")


type CgapTypes = Vbox_t
proc `cgap=`*(control: CgapTypes, value: string) =
  ## Defines a vertical space in pixels between the children, CGAP is in the same units of the SIZE attribute for the height. Default: "0". (CGAP since 3.0)
  SetAttribute(control, "CGAP", value)

proc `cgap`*(control: CgapTypes): string =
  return $GetAttribute(control, "CGAP")


type CharsizeTypes = Button_t
proc `charsize`*(control: CharsizeTypes): string =
  ## (read-only, non inheritable) Returns the average character size of the current FONT attribute. This is the factor used by the SIZE attribute to convert its units to pixels.
  return $GetAttribute(control, "CHARSIZE")


type CpaddingTypes = Button_t
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


type ExpandTypes = Button_t
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


type FgcolorTypes = Button_t
proc `fgcolor=`*(control: FgcolorTypes, value: string) =
  ## Text color. Default: the global attribute DLGFGCOLOR.
  SetAttribute(control, "FGCOLOR", value)

proc `fgcolor`*(control: FgcolorTypes): string =
  return $GetAttribute(control, "FGCOLOR")

proc `fgcolor=`*(control: FgcolorTypes, red:int, green:int, blue:int, alpha:int = 255) =
  SetAttribute(control, "FGCOLOR", &"{red} {green} {blue} {alpha}")

type FlatTypes = Button_t
proc `flat=`*(control: FlatTypes, value: string) =
  ## (creation only): Hides the button borders until the mouse cursor enters the button area. The border space is always there. Can be YES or NO. Default: NO.
  SetAttribute(control, "FLAT", value)

proc `flat`*(control: FlatTypes): string =
  return $GetAttribute(control, "FLAT")


type FontTypes = Button_t
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


type FontfaceTypes = Button_t
proc `fontface=`*(control: FontfaceTypes, value: string) =
  ## (non inheritable) Replaces or returns the face name of the current FONT attribute.
  SetAttribute(control, "FONTFACE", value)

proc `fontface`*(control: FontfaceTypes): string =
  return $GetAttribute(control, "FONTFACE")


type FontsizeTypes = Button_t
proc `fontsize=`*(control: FontsizeTypes, value: string) =
  ## (non inheritable) Replaces or returns the size of the current FONT attribute.
  SetAttribute(control, "FONTSIZE", value)

proc `fontsize`*(control: FontsizeTypes): string =
  return $GetAttribute(control, "FONTSIZE")


type FontstyleTypes = Button_t
proc `fontstyle=`*(control: FontstyleTypes, value: string) =
  ## (non inheritable) Replaces or returns the style of the current FONT attribute. Since font styles are case sensitive, this attribute is also case sensitive.
  SetAttribute(control, "FONTSTYLE", value)

proc `fontstyle`*(control: FontstyleTypes): string =
  return $GetAttribute(control, "FONTSTYLE")


type FoundryTypes = Button_t
proc `foundry=`*(control: FoundryTypes, value: string) =
  ## [Motif Only] (non inheritable) Allows to select a foundry for the FONT being selected. Must be set before setting the FONT attribute.
  SetAttribute(control, "FOUNDRY", value)

proc `foundry`*(control: FoundryTypes): string =
  return $GetAttribute(control, "FOUNDRY")


type GapTypes = Vbox_t
proc `gap=`*(control: GapTypes, value: string) =
  ## Defines a vertical space in pixels between the children, CGAP is in the same units of the SIZE attribute for the height. Default: "0". (CGAP since 3.0)
  SetAttribute(control, "GAP", value)

proc `gap`*(control: GapTypes): string =
  return $GetAttribute(control, "GAP")


type ImageTypes = Button_t
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


type IminactiveTypes = Button_t
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


type MarginTypes = Vbox_t
proc `margin=`*(control: MarginTypes, value: string) =
  ## Defines a margin in pixels, CMARGIN is in the same units of the SIZE attribute. Its value has the format "widthxheight", where width and height are integer values corresponding to the horizontal and vertical margins, respectively. Default: "0x0"(no margin). (CMARGIN since 3.0)
  SetAttribute(control, "MARGIN", value)

proc `margin`*(control: MarginTypes): string =
  return $GetAttribute(control, "MARGIN")

proc `margin=`*(control: MarginTypes, width:int, height:int) =
  SetAttribute(control, "MARGIN", &"{width}x{height}")

type MarkupTypes = Button_t
proc `markup=`*(control: MarkupTypes, value: string) =
  ## [GTK only]: allows the title string to contains pango markup commands. Works only if a mnemonic is NOT defined in the title. Can be "YES"or "NO". Default: "NO".
  SetAttribute(control, "MARKUP", value)

proc `markup`*(control: MarkupTypes): string =
  return $GetAttribute(control, "MARKUP")


type MaxsizeTypes = Button_t
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

proc `maxsize=`*(control: MaxsizeTypes, width:int, height:int) =
  SetAttribute(control, "MAXSIZE", &"{width}x{height}")

type MinsizeTypes = Button_t
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

proc `minsize=`*(control: MinsizeTypes, width:int, height:int) =
  SetAttribute(control, "MINSIZE", &"{width}x{height}")

type NcgapTypes = Vbox_t
proc `ncgap=`*(control: NcgapTypes, value: string) =
  ## Same as GAP but are non inheritable. (since 3.0)
  SetAttribute(control, "NCGAP", value)

proc `ncgap`*(control: NcgapTypes): string =
  return $GetAttribute(control, "NCGAP")


type NgapTypes = Vbox_t
proc `ngap=`*(control: NgapTypes, value: string) =
  ## Same as GAP but are non inheritable. (since 3.0)
  SetAttribute(control, "NGAP", value)

proc `ngap`*(control: NgapTypes): string =
  return $GetAttribute(control, "NGAP")


type PaddingTypes = Button_t
proc `padding=`*(control: PaddingTypes, value: string) =
  ## internal margin. Works just like the MARGIN attribute of the IupHbox and IupVbox containers, but uses a different name to avoid inheritance problems. Default value: "0x0". Value can be DEFAULTBUTTONPADDING, so the global attribute of this name will be used instead (since 3.29). (since 3.0)
  SetAttribute(control, "PADDING", value)

proc `padding`*(control: PaddingTypes): string =
  return $GetAttribute(control, "PADDING")


type PositionTypes = Button_t
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

proc `position=`*(control: PositionTypes, x:int, y:int) =
  SetAttribute(control, "POSITION", &"{x},{y}")

type PropagatefocusTypes = Button_t
proc `propagatefocus=`*(control: PropagatefocusTypes, value: string) =
  ## (non inheritable): enables the focus callback forwarding to the next native parent with FOCUS_CB defined. Default: NO. (since 3.23)
  SetAttribute(control, "PROPAGATEFOCUS", value)

proc `propagatefocus`*(control: PropagatefocusTypes): string =
  return $GetAttribute(control, "PROPAGATEFOCUS")


type RastersizeTypes = Button_t
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

proc `rastersize=`*(control: RastersizeTypes, width:int, height:int) =
  SetAttribute(control, "RASTERSIZE", &"{width}x{height}")

type ScreenpositionTypes = Button_t
proc `screenposition=`*(control: ScreenpositionTypes, value: string) =
  ## Returns the absolute horizontal and/or vertical position of the top-left corner of the client area relative to the origin of the main screen in pixels. It is similar to POSITION but relative to the origin of the main screen, instead of the origin of the client area. The origin of the main screen is at the top-left corner, in Windows it is affected by the position of the Start Menu when it is at the top or left side of the screen.
  ## IMPORTANT: For the dialog, it is the position of the top-left corner of the window, NOT the client area. It is the same position used in IupShowXY and IupPopup. In GTK, if the dialog is hidden the values can be outdated.
  ## 
  ## Value
  ## "x,y", where x and y are integer values corresponding to the horizontal and vertical position, respectively, in pixels. When X or Y are used a single value is returned.
  SetAttribute(control, "SCREENPOSITION", value)

proc `screenposition`*(control: ScreenpositionTypes): string =
  return $GetAttribute(control, "SCREENPOSITION")

proc `screenposition=`*(control: ScreenpositionTypes, x:int, y:int) =
  SetAttribute(control, "SCREENPOSITION", &"{x},{y}")

type SizeTypes = Button_t
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


type ThemeTypes = Button_t
proc `theme=`*(control: ThemeTypes, value: string) =
  ## Applies a set of attributes to a control. The THEME attribute in inheritable and the NTHEME attribute is NOT inheritable.
  SetAttribute(control, "THEME", value)

proc `theme`*(control: ThemeTypes): string =
  return $GetAttribute(control, "THEME")


type TipTypes = Button_t
proc `tip=`*(control: TipTypes, value: string) =
  ## Text to be shown when the mouse lies over the element.
  SetAttribute(control, "TIP", value)

proc `tip`*(control: TipTypes): string =
  return $GetAttribute(control, "TIP")


type TipballoonTypes = Button_t
proc `tipballoon=`*(control: TipballoonTypes, value: string) =
  ## [Windows Only]: The tip window will have the appearance of a cartoon "balloon"with rounded corners and a stem pointing to the item. Default: NO.
  SetAttribute(control, "TIPBALLOON", value)

proc `tipballoon`*(control: TipballoonTypes): string =
  return $GetAttribute(control, "TIPBALLOON")


type TipballoontitleTypes = Button_t
proc `tipballoontitle=`*(control: TipballoontitleTypes, value: string) =
  ## [Windows Only]: When using the balloon format, the tip can also has a title in a separate area.
  SetAttribute(control, "TIPBALLOONTITLE", value)

proc `tipballoontitle`*(control: TipballoontitleTypes): string =
  return $GetAttribute(control, "TIPBALLOONTITLE")


type TipballoontitleiconTypes = Button_t
proc `tipballoontitleicon=`*(control: TipballoontitleiconTypes, value: string) =
  ## [Windows Only]: When using the balloon format, the tip can also has a pre-defined icon in the title area. Values can be:
  ## "0"- No icon (default)
  ## "1"- Info icon
  ## "2"- Warning icon
  ## "3"- Error Icon
  SetAttribute(control, "TIPBALLOONTITLEICON", value)

proc `tipballoontitleicon`*(control: TipballoontitleiconTypes): string =
  return $GetAttribute(control, "TIPBALLOONTITLEICON")


type TipbgcolorTypes = Button_t
proc `tipbgcolor=`*(control: TipbgcolorTypes, value: string) =
  ## [Windows and Motif Only]: The tip background color. Default: "255 255 225"(Light Yellow)
  SetAttribute(control, "TIPBGCOLOR", value)

proc `tipbgcolor`*(control: TipbgcolorTypes): string =
  return $GetAttribute(control, "TIPBGCOLOR")


type TipdelayTypes = Button_t
proc `tipdelay=`*(control: TipdelayTypes, value: string) =
  ## [Windows and Motif Only]: Time the tip will remain visible. Default: "5000". In Windows the maximum value is 32767 milliseconds.
  SetAttribute(control, "TIPDELAY", value)

proc `tipdelay`*(control: TipdelayTypes): string =
  return $GetAttribute(control, "TIPDELAY")


type TipfgcolorTypes = Button_t
proc `tipfgcolor=`*(control: TipfgcolorTypes, value: string) =
  ## [Windows and Motif Only]: The tip text color. Default: "0 0 0"(Black)
  SetAttribute(control, "TIPFGCOLOR", value)

proc `tipfgcolor`*(control: TipfgcolorTypes): string =
  return $GetAttribute(control, "TIPFGCOLOR")


type TipfontTypes = Button_t
proc `tipfont=`*(control: TipfontTypes, value: string) =
  ## [Windows and Motif Only]: The font for the tip text. If not defined the font used for the text is the same as the FONT attribute for the element. If the value is SYSTEM then, no font is selected and the default system font for the tip will be used.
  SetAttribute(control, "TIPFONT", value)

proc `tipfont`*(control: TipfontTypes): string =
  return $GetAttribute(control, "TIPFONT")


type TipiconTypes = Button_t
proc `tipicon=`*(control: TipiconTypes, value: string) =
  ## [GTK only]: name of an image to be displayed in the TIP. See IupImage. (GTK 2.12)
  SetAttribute(control, "TIPICON", value)

proc `tipicon`*(control: TipiconTypes): string =
  return $GetAttribute(control, "TIPICON")


type TipmarkupTypes = Button_t
proc `tipmarkup=`*(control: TipmarkupTypes, value: string) =
  ## [GTK only]: allows the tip string to contains Pango markup commands. Can be "YES"or "NO". Default: "NO". Must be set before setting the TIP attribute. (GTK 2.12)
  SetAttribute(control, "TIPMARKUP", value)

proc `tipmarkup`*(control: TipmarkupTypes): string =
  return $GetAttribute(control, "TIPMARKUP")


type TiprectTypes = Button_t
proc `tiprect=`*(control: TiprectTypes, value: string) =
  ## (non inheritable): Specifies a rectangle inside the element where the tip will be activated. Format: "%d %d %d %d"="x1 y1 x2 y2". Default: all the element area. (GTK 2.12)
  SetAttribute(control, "TIPRECT", value)

proc `tiprect`*(control: TiprectTypes): string =
  return $GetAttribute(control, "TIPRECT")


type TipvisibleTypes = Button_t
proc `tipvisible=`*(control: TipvisibleTypes, value: string) =
  ## Shows or hides the tip under the mouse cursor. Use values "YES"or "NO". Returns the current visible state. (GTK 2.12) (since 3.5)
  SetAttribute(control, "TIPVISIBLE", value)

proc `tipvisible`*(control: TipvisibleTypes): string =
  return $GetAttribute(control, "TIPVISIBLE")


type TitleTypes = Dialog_t
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


type VisibleTypes = Button_t
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


type WidTypes = Button_t
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


type ZorderTypes = Button_t
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

type Button_cbTypes = Button_t
proc `button_cb=`*(control: Button_cbTypes, cb: proc (ih: PIhandle; button: cint; pressed: cint; x: cint; y: cint; status: cstring): cint {.cdecl.}) =
  ## Action generated when any mouse button is pressed and when it is released. Both calls occur before the ACTION callback when button 1 is being used.
  SetCallback(control, "BUTTON_CB", cast[Icallback](cb))
proc `button_cb`*(control: Button_cbTypes): proc (ih: PIhandle; button: cint; pressed: cint; x: cint; y: cint; status: cstring): cint {.cdecl.} =
  return cast[proc (ih: PIhandle; button: cint; pressed: cint; x: cint; y: cint; status: cstring): cint {.cdecl.}](GetCallback(control, "BUTTON_CB"))

type Destroy_cbTypes = Button_t
proc `destroy_cb=`*(control: Destroy_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called right before an element is destroyed.
  SetCallback(control, "DESTROY_CB", cast[Icallback](cb))
proc `destroy_cb`*(control: Destroy_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "DESTROY_CB"))

type Enterwindow_cbTypes = Button_t
proc `enterwindow_cb=`*(control: Enterwindow_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when the mouse enters the native element.
  ## 
  ## Notes
  ## When the cursor is moved from one element to another, the call order in all platforms will be first the LEAVEWINDOW_CB callback of the old control followed by the ENTERWINDOW_CB callback of the new control. (since 3.14)
  ## If the mouse button is hold pressed and the cursor moves outside the element the behavior is system dependent. In Windows the LEAVEWINDOW_CB/ENTERWINDOW_CB callbacks are NOT called, in GTK the callbacks are called.
  SetCallback(control, "ENTERWINDOW_CB", cast[Icallback](cb))
proc `enterwindow_cb`*(control: Enterwindow_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "ENTERWINDOW_CB"))

type Getfocus_cbTypes = Button_t
proc `getfocus_cb=`*(control: Getfocus_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus.
  SetCallback(control, "GETFOCUS_CB", cast[Icallback](cb))
proc `getfocus_cb`*(control: Getfocus_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "GETFOCUS_CB"))

type Help_cbTypes = Button_t
proc `help_cb=`*(control: Help_cbTypes, cb: proc (ih: PIhandle): void {.cdecl.}) =
  ## Action generated when the user press F1 at a control. In Motif is also activated by the Help button in some workstations keyboard.
  SetCallback(control, "HELP_CB", cast[Icallback](cb))
proc `help_cb`*(control: Help_cbTypes): proc (ih: PIhandle): void {.cdecl.} =
  return cast[proc (ih: PIhandle): void {.cdecl.}](GetCallback(control, "HELP_CB"))

type K_anyTypes = Button_t
proc `k_any=`*(control: K_anyTypes, cb: proc (ih: PIhandle, c: int): cint {.cdecl.}) =
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
proc `k_any`*(control: K_anyTypes): proc (ih: PIhandle, c: int): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, c: int): cint {.cdecl.}](GetCallback(control, "K_ANY"))

type Killfocus_cbTypes = Button_t
proc `killfocus_cb=`*(control: Killfocus_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus.
  SetCallback(control, "KILLFOCUS_CB", cast[Icallback](cb))
proc `killfocus_cb`*(control: Killfocus_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "KILLFOCUS_CB"))

type Leavewindow_cbTypes = Button_t
proc `leavewindow_cb=`*(control: Leavewindow_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Action generated when the mouse leaves the native element.
  ## 
  ## Notes
  ## When the cursor is moved from one element to another, the call order in all platforms will be first the LEAVEWINDOW_CB callback of the old control followed by the ENTERWINDOW_CB callback of the new control. (since 3.14)
  ## If the mouse button is hold pressed and the cursor moves outside the element the behavior is system dependent. In Windows the LEAVEWINDOW_CB/ENTERWINDOW_CB callbacks are NOT called, in GTK the callbacks are called.
  SetCallback(control, "LEAVEWINDOW_CB", cast[Icallback](cb))
proc `leavewindow_cb`*(control: Leavewindow_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "LEAVEWINDOW_CB"))

type Map_cbTypes = Button_t
proc `map_cb=`*(control: Map_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called right after an element is mapped and its attributes updated in IupMap.
  ## When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB (since 3.14).
  SetCallback(control, "MAP_CB", cast[Icallback](cb))
proc `map_cb`*(control: Map_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "MAP_CB"))

type Tips_cbTypes = Button_t
proc `tips_cb=`*(control: Tips_cbTypes, cb: proc (ih: PIhandle, x: int, y: int): cint {.cdecl.}) =
  ## Action before a tip is displayed.
  SetCallback(control, "TIPS_CB", cast[Icallback](cb))
proc `tips_cb`*(control: Tips_cbTypes): proc (ih: PIhandle, x: int, y: int): cint {.cdecl.} =
  return cast[proc (ih: PIhandle, x: int, y: int): cint {.cdecl.}](GetCallback(control, "TIPS_CB"))

type Unmap_cbTypes = Button_t
proc `unmap_cb=`*(control: Unmap_cbTypes, cb: proc (ih: PIhandle): cint {.cdecl.}) =
  ## Called right before an element is unmapped.
  SetCallback(control, "UNMAP_CB", cast[Icallback](cb))
proc `unmap_cb`*(control: Unmap_cbTypes): proc (ih: PIhandle): cint {.cdecl.} =
  return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(control, "UNMAP_CB"))

