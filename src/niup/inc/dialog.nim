when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Dialog
##
## NIUP type: Dialog_t
##
## constructors
##
##    proc Dialog(child: IUPhandle_t): Dialog_t
##

proc Dialog*(child: IUPhandle_t): Dialog_t {.cdecl.} =
    ## Creates a dialog element. It manages user interaction with the
    ## interface elements. For any interface element to be shown, it
    ## must be encapsulated in a dialog.
    return Dialog_t(niupc.Dialog(cast[PIhandle](child)))

proc `active=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## ACTIVE, BGCOLOR, FONT, EXPAND, SCREENPOSITION, WID, TIP,
    ## CLIENTOFFSET, CLIENTSIZE, RASTERSIZE, ZORDER: also accepted.
    ## Note that ACTIVE, BGCOLOR and FONT will also affect all the
    ## controls inside the dialog.
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `activewindow`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVEWINDOW")) == "YES"

proc `background=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## BACKGROUND (non inheritable): Dialog background color or image.
    ## Can be a non inheritable alternative to BGCOLOR or can be the
    ## name of an image to be tiled on the background. See also the
    ## screenshots of the sample.c results with normal background,
    ## changing the dialog BACKGROUND, the dialog BGCOLOR and the
    ## children BGCOLOR. Not working in GTK 3. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(value))

proc `background`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(value))

proc `background=`*(ih: Dialog_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(&"{red} {green} {blue} {alpha}"))

proc `background`*(ih: Dialog_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(&"{red} {green} {blue} {alpha}"))

proc `background`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"))

proc `bgcolor=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: Dialog_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Dialog_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `border=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## BORDER (non inheritable) (creation only): Shows a resize border
    ## around the dialog. Default: "YES". BORDER=NO is useful only
    ## when RESIZE=NO, MAXBOX=NO, MINBOX=NO, MENUBOX=NO and
    ## TITLE=NULL, if any of these are defined there will be always
    ## some border.
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDER")) == "YES"

proc `bordersize`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERSIZE"))

proc `bringfront=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## BRINGFRONT [Windows Only] (write-only): makes the dialog the
    ## foreground window. Use "YES" to activate it. Useful for
    ## multithreaded applications.
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring(value))

proc `bringfront`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring(value))

proc `bringfront=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring((if yes: "YES" else: "NO")))

proc `bringfront`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring((if yes: "YES" else: "NO")))

proc `bringfront`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT")) == "YES"

proc `canfocus=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `childoffset=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## CHILDOFFSET: Allow to specify a position offset for the child.
    ## Available for native containers only. It will not affect the
    ## natural size, and allows to position controls outside the
    ## client area. Format "dxxdy", where dx and dy are integer values
    ## corresponding to the horizontal and vertical offsets,
    ## respectively, in pixels. Default: 0x0. (since 3.14)
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(value))

proc `childoffset`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(value))

proc `childoffset=`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(&"{width}x{height}"))

proc `childoffset`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(&"{width}x{height}"))

proc `childoffset`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"))

proc `clientoffset`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(value))

proc `clientsize`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(value))

proc `clientsize=`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(&"{width}x{height}"))

proc `clientsize`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(&"{width}x{height}"))

proc `clientsize`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `composited=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## COMPOSITED [Windows Only] (creation only): controls if the
    ## window will have an automatic double buffer for all children.
    ## Default is "NO". In Windows Vista it is NOT working as
    ## expected. It is NOT compatible with IupCanvas and all derived
    ## IUP controls such as IupFlat\*, IupGL\*, IupPlot and IupMatrix,
    ## because IupCanvas uses CS_OWNDC in the window class.
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring(value))

proc `composited`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring(value))

proc `composited=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring((if yes: "YES" else: "NO")))

proc `composited`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring((if yes: "YES" else: "NO")))

proc `composited`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COMPOSITED")) == "YES"

proc `control=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## CONTROL [Windows Only] (creation only): Embeds the dialog
    ## inside another window.
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring(value))

proc `control`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring(value))

proc `control=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring((if yes: "YES" else: "NO")))

proc `control`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring((if yes: "YES" else: "NO")))

proc `control`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CONTROL")) == "YES"

proc `cursor=`*(ih: Dialog_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## CURSOR (non inheritable): Defines a cursor for the dialog.
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: Dialog_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CURSOR"))

proc `customframe=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## CUSTOMFRAME [Windows and GTK Only] (non inheritable): allows
    ## the application to customize the dialog frame elements (the
    ## title and its buttons) by using IUP controls for its elements
    ## like caption, minimize button, maximize button, and close
    ## buttons. The custom frame support uses the native system
    ## support for custom frames. The application is responsible for
    ## leaving space for the borders. One drawback is that menu bars
    ## will not work. For the dialog to be able to be moved an
    ## IupLabel or an IupCanvas must be at the top of the dialog and
    ## must have the NAME attribute set to CUSTOMFRAMECAPTION (since
    ## 3.22). Native custom frames are supported only in Windows and
    ## in GTK version 3.10, so for older GTK versions we have to
    ## simulate the support using CUSTOMFRAMESIMULATE. (since 3.18)
    ## (renamed in 3.22) (GTK support since 3.22) See the Custom Frame
    ## notes bellow.
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring(value))

proc `customframe`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring(value))

proc `customframe=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring((if yes: "YES" else: "NO")))

proc `customframe`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring((if yes: "YES" else: "NO")))

proc `customframe`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME")) == "YES"

proc `customframesimulate=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## CUSTOMFRAMESIMULATE: allows the application to customize the
    ## dialog frame elements (the title and its buttons) by using IUP
    ## controls for its elements like caption, minimize button,
    ## maximize button, and close buttons. The custom frame support is
    ## entirely simulated by IUP, no native support for custom frame
    ## is used (this seems to have less drawbacks on the application
    ## behavior). The application is responsible for leaving space for
    ## the borders. One drawback is that menu bars will not work. For
    ## the dialog to be able to be moved an IupLabel, or a
    ## IupFlatLabel or an IupCanvas must be at the top of the dialog
    ## and must have the NAME attribute set to CUSTOMFRAMECAPTION. See
    ## the Custom Frame notes bellow. (since 3.28)
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring(value))

proc `customframesimulate`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring(value))

proc `customframesimulate=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring((if yes: "YES" else: "NO")))

proc `customframesimulate`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring((if yes: "YES" else: "NO")))

proc `customframesimulate`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE")) == "YES"

proc `defaultenter=`*(ih: Dialog_t, handle: IUPhandle_t) {.cdecl.} =
    ## DEFAULTENTER: Name of the button activated when the user press
    ## Enter when focus is in another control of the dialog. Use
    ## IupSetHandle or IupSetAttributeHandle to associate a button to
    ## a name.
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTENTER"), cast[PIhandle](handle))

proc `defaultenter`*(ih: Dialog_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTENTER"), cast[PIhandle](handle))

proc `defaultenter`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DEFAULTENTER"))

proc `defaultesc=`*(ih: Dialog_t, handle: IUPhandle_t) {.cdecl.} =
    ## DEFAULTESC: Name of the button activated when the user press
    ## Esc when focus is in another control of the dialog. Use
    ## IupSetHandle or IupSetAttributeHandle to associate a button to
    ## a name.
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTESC"), cast[PIhandle](handle))

proc `defaultesc`*(ih: Dialog_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTESC"), cast[PIhandle](handle))

proc `defaultesc`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DEFAULTESC"))

proc `dialogframe=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## DIALOGFRAME: Set the common decorations for modal dialogs. This
    ## means RESIZE=NO, MINBOX=NO and MAXBOX=NO. In Windows, if the
    ## PARENTDIALOG is defined then the MENUBOX is also removed, but
    ## the Close button remains.
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring(value))

proc `dialogframe`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring(value))

proc `dialogframe=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring((if yes: "YES" else: "NO")))

proc `dialogframe`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring((if yes: "YES" else: "NO")))

proc `dialogframe`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME")) == "YES"

proc `dialoghint=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## DIALOGHINT [GTK Only] (creation-only): if enabled sets the
    ## window type hint to a dialog hint.
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring(value))

proc `dialoghint`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring(value))

proc `dialoghint=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring((if yes: "YES" else: "NO")))

proc `dialoghint`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring((if yes: "YES" else: "NO")))

proc `dialoghint`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT")) == "YES"

proc `dragdrop=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragsource=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary dialog
proc `dragtypes`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

proc `dropfilestarget=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## DROPFILESTARGET [Windows and GTK Only] (non inheritable):
    ## Enable or disable the drop of files. Default: NO, but if
    ## DROPFILES_CB is defined when the element is mapped then it will
    ## be automatically enabled.
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary dialog
proc `droptypes`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `expand=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## EXPAND (non inheritable): The default value is "YES".
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: Dialog_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Dialog_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `floating=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary dialog
proc `font`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary dialog
proc `fontface`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: Dialog_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Dialog_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary dialog
proc `fontstyle`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `fullscreen=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## FULLSCREEN: Makes the dialog occupy the whole screen over any
    ## system bars in the main monitor. All dialog details, such as
    ## title bar, borders, maximize button, etc, are removed. Possible
    ## values: YES, NO. In Motif you may have to click in the dialog
    ## to set its focus. In Motif if set to YES when the dialog is
    ## hidden, then it can not be changed after it is visible.
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring(value))

proc `fullscreen`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring(value))

proc `fullscreen=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring((if yes: "YES" else: "NO")))

proc `fullscreen`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring((if yes: "YES" else: "NO")))

proc `handlename=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary dialog
proc `handlename`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `helpbutton=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## HELPBUTTON [Windows Only] (creation only): Inserts a help
    ## button in the same place of the maximize button. It can only be
    ## used for dialogs without the minimize and maximize buttons, and
    ## with the menu box. For the next interaction of the user with a
    ## control in the dialog, the callback HELP_CB will be called
    ## instead of the control defined ACTION callback. Possible
    ## values: YES, NO. Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring(value))

proc `helpbutton`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring(value))

proc `helpbutton=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring((if yes: "YES" else: "NO")))

proc `helpbutton`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring((if yes: "YES" else: "NO")))

proc `helpbutton`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON")) == "YES"

proc `hidetaskbar=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## HIDETASKBAR [Windows and GTK Only] (write-only): Action
    ## attribute that when set to "YES", hides the dialog, but does
    ## not decrement the visible dialog count, does not call SHOW_CB
    ## and does not mark the dialog as hidden inside IUP. It is
    ## usually used to hide the dialog and keep the tray icon working
    ## without closing the main loop. It has the same effect as
    ## setting LOCKLOOP=Yes and normally hiding the dialog. IMPORTANT:
    ## when you hide using HIDETASKBAR, you must show using
    ## HIDETASKBAR also. Possible values: YES, NO.
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring(value))

proc `hidetaskbar`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring(value))

proc `hidetaskbar=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring((if yes: "YES" else: "NO")))

proc `hidetaskbar`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring((if yes: "YES" else: "NO")))

proc `hidetaskbar`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR")) == "YES"

proc `hidetitlebar=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## HIDETITLEBAR [GTK Only] (non inheritable): hides the title bar
    ## with al its elements. (since 3.20) (GTK 3.10)
    SetAttribute(cast[PIhandle](ih), cstring("HIDETITLEBAR"), cstring(value))

proc `hidetitlebar`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETITLEBAR"), cstring(value))

# TODO ??? String Binary dialog
proc `hidetitlebar`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDETITLEBAR"))

proc `icon=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## ICON: Dialogs icon. The Windows SDK recommends that cursors and
    ## icons should be implemented as resources rather than created at
    ## run time.
    SetAttribute(cast[PIhandle](ih), cstring("ICON"), cstring(value))

proc `icon`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ICON"), cstring(value))

# TODO ??? String Binary dialog
proc `icon`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ICON"))

proc `maxbox=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## MAXBOX (creation only): Requires a maximize button from the
    ## window manager. If RESIZE=NO then MAXBOX will be set to NO.
    ## Default: YES. In Motif the decorations are controlled by the
    ## Window Manager and may not be possible to be changed from IUP.
    ## In Windows MAXBOX is hidden only if MINBOX is hidden as well,
    ## or else it will be just disabled.
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring(value))

proc `maxbox`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring(value))

proc `maxbox=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring((if yes: "YES" else: "NO")))

proc `maxbox`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring((if yes: "YES" else: "NO")))

proc `maxbox`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXBOX")) == "YES"

proc `maximized`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXIMIZED")) == "YES"

proc `maxsize=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## MAXSIZE: Maximum size for the dialog in raster units (pixels).
    ## The windowing system will not be able to change the size beyond
    ## this limit. Default: 65535x65535. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `mdichild=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## MDICHILD (creation only) [Windows Only]: Configure this dialog
    ## to be a MDI child. Can be YES or NO. The PARENTDIALOG attribute
    ## must also be defined. Each MDI child is automatically named if
    ## it does not have one. Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring(value))

proc `mdichild`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring(value))

proc `mdichild=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring((if yes: "YES" else: "NO")))

proc `mdichild`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring((if yes: "YES" else: "NO")))

proc `mdichild`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDICHILD")) == "YES"

proc `mdiclient=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## MDICLIENT (creation only) [Windows Only] (non inheritable):
    ## Configure the canvas as a MDI client. Can be YES or NO. No
    ## callbacks will be called. This canvas will be used internally
    ## only by the MDI Frame and its MDI Children. The MDI frame must
    ## have one and only one MDI client. Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring(value))

proc `mdiclient`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring(value))

proc `mdiclient=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring((if yes: "YES" else: "NO")))

proc `mdiclient`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring((if yes: "YES" else: "NO")))

proc `mdiclient`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDICLIENT")) == "YES"

proc `mdiframe=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## MDIFRAME (creation only) [Windows Only] (non inheritable):
    ## Configure this dialog as a MDI frame. Can be YES or NO.
    ## Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring(value))

proc `mdiframe`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring(value))

proc `mdiframe=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring((if yes: "YES" else: "NO")))

proc `mdiframe`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring((if yes: "YES" else: "NO")))

proc `mdiframe`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDIFRAME")) == "YES"

proc `mdimenu=`*(ih: Dialog_t, handle: Menu_t) {.cdecl.} =
    ## MDIMENU (creation only) [Windows Only]: Name of a IupMenu to be
    ## used as the Window list of a MDI frame. The system will
    ## automatically add the list of MDI child windows there.
    SetAttributeHandle(cast[PIhandle](ih), cstring("MDIMENU"), cast[PIhandle](handle))

proc `mdimenu`*(ih: Dialog_t, handle: Menu_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("MDIMENU"), cast[PIhandle](handle))

proc `mdimenu`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDIMENU"))

proc `menu=`*(ih: Dialog_t, handle: Menu_t) {.cdecl.} =
    ## MENU: Name of a menu. Associates a menu to the dialog as a menu
    ## bar. The previous menu, if any, is unmapped. Use IupSetHandle
    ## or IupSetAttributeHandle to associate a menu to a name. See
    ## also IupMenu.
    SetAttributeHandle(cast[PIhandle](ih), cstring("MENU"), cast[PIhandle](handle))

proc `menu`*(ih: Dialog_t, handle: Menu_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("MENU"), cast[PIhandle](handle))

proc `menu`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MENU"))

proc `menubox=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## MENUBOX (creation only): Requires a system menu box from the
    ## window manager. If hidden will also remove the Close button.
    ## Default: YES. In Motif the decorations are controlled by the
    ## Window Manager and may not be possible to be changed from IUP.
    ## In Windows if hidden will hide also MAXBOX and MINBOX.
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring(value))

proc `menubox`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring(value))

proc `menubox=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring((if yes: "YES" else: "NO")))

proc `menubox`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring((if yes: "YES" else: "NO")))

proc `menubox`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MENUBOX")) == "YES"

proc `minbox=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## MINBOX (creation only): Requires a minimize button from the
    ## window manager. Default: YES. In Motif the decorations are
    ## controlled by the Window Manager and may not be possible to be
    ## changed from IUP. In Windows MINBOX is hidden only if MAXBOX is
    ## hidden as well, or else it will be just disabled.
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring(value))

proc `minbox`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring(value))

proc `minbox=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring((if yes: "YES" else: "NO")))

proc `minbox`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring((if yes: "YES" else: "NO")))

proc `minbox`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINBOX")) == "YES"

proc `minsize=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## MINSIZE: Minimum size for the dialog in raster units (pixels).
    ## The windowing system will not be able to change the size beyond
    ## this limit. Default: 1x1. Some systems define a very minimum
    ## size greater than this, for instance in Windows the horizontal
    ## minimum size includes the window decoration buttons. (since
    ## 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `modal`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MODAL")) == "YES"

proc `nactive=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## NACTIVE (non inheritable): same as ACTIVE but does not affects
    ## the controls inside the dialog. (since 3.13)
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring(value))

proc `nactive`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring(value))

proc `nactive=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `nactive`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `nactive`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NACTIVE")) == "YES"

proc `name=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary dialog
proc `name`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `nativeparent=`*(ih: Dialog_t, handle: User_t) {.cdecl.} =
    ## NATIVEPARENT (creation only): Native handle of a dialog to be
    ## used as parent. Used only if PARENTDIALOG is not defined.
    SetAttributeHandle(cast[PIhandle](ih), cstring("NATIVEPARENT"), cast[PIhandle](handle))

proc `nativeparent`*(ih: Dialog_t, handle: User_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("NATIVEPARENT"), cast[PIhandle](handle))

proc `nativeparent`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATIVEPARENT"))

proc `naturalsize`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `noflush=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring(value))

proc `noflush`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring(value))

proc `noflush=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring((if yes: "YES" else: "NO")))

proc `noflush`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring((if yes: "YES" else: "NO")))

proc `noflush`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NOFLUSH")) == "YES"

proc `normalizergroup=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary dialog
proc `normalizergroup`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary dialog
proc `ntheme`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `opacity=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## OPACITY [Windows and GTK Only]: sets the dialog transparency
    ## alpha value. Valid values range from 0 (completely transparent)
    ## to 255 (opaque). In Windows must be set before map so the
    ## native window would be properly initialized when mapped (since
    ## 3.16). (GTK 2.12)
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(value))

proc `opacity`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(value))

proc `opacity=`*(ih: Dialog_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(&"{x}"))

proc `opacity`*(ih: Dialog_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(&"{x}"))

proc `opacity`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OPACITY"))

proc `opacityimage=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## OPACITYIMAGE [Windows Only]: sets an RGBA image as the dialog
    ## background so it is possible to create a non rectangle window
    ## with transparency, but it can not have children. Used usually
    ## for splash screens. It must be set before map so the native
    ## window would be properly initialized when mapped. Works also
    ## for GTK but as the SHAPEIMAGE attribute. (since 3.16)
    SetAttribute(cast[PIhandle](ih), cstring("OPACITYIMAGE"), cstring(value))

proc `opacityimage`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITYIMAGE"), cstring(value))

# TODO ??? String Binary dialog
proc `opacityimage`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OPACITYIMAGE"))

# TODO unknown: dialog PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: dialog PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `parentdialog=`*(ih: Dialog_t, handle: IUPhandle_t) {.cdecl.} =
    ## PARENTDIALOG (creation only): Name of a dialog to be used as
    ## parent.
    SetAttributeHandle(cast[PIhandle](ih), cstring("PARENTDIALOG"), cast[PIhandle](handle))

proc `parentdialog`*(ih: Dialog_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("PARENTDIALOG"), cast[PIhandle](handle))

proc `parentdialog`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PARENTDIALOG"))

proc `placement=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## PLACEMENT: Changes how the dialog will be shown. Values:
    ## "FULL", "MAXIMIZED", "MINIMIZED" and "NORMAL". Default: NORMAL.
    ## After IupShow/IupPopup the attribute is set back to "NORMAL".
    ## FULL is similar to FULLSCREEN but only the dialog client area
    ## covers the screen area, menu and decorations will be there but
    ## out of the screen. In UNIX there is a chance that the placement
    ## won't work correctly, that depends on the Window Manager. In
    ## Windows, the SHOWNOACTIVATE attribute can be set to Yes to
    ## prevent the window from being activated (since 3.15). In
    ## Windows, the SHOWMINIMIZENEXT attribute can be set to Yes to
    ## activate the next top-level window in the Z order when
    ## minimizing (since 3.15).
    SetAttribute(cast[PIhandle](ih), cstring("PLACEMENT"), cstring(value))

proc `placement`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PLACEMENT"), cstring(value))

proc `placement`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PLACEMENT"))

proc `position=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: Dialog_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Dialog_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## Values set at SIZE or RASTERSIZE attributes of a dialog are
    ## always accepted, regardless of the minimum size required by its
    ## children. For a dialog to have the minimum necessary size to
    ## fit all elements contained in it, simply define SIZE or
    ## RASTERSIZE to NULL. Also if you set SIZE or RASTERSIZE to be
    ## used as the initial size of the dialog, its contents will be
    ## limited to this size as the minimum size, if you do not want
    ## that, then after showing the dialog reset this size to NULL so
    ## the dialog can be resized to smaller values. But notice that
    ## its contents will still be limited by the Natural size, to also
    ## remove that limitation set SHRINK=YES. To only change the User
    ## size in pixels, without resetting the Current size, set the
    ## USERSIZE attribute (since 3.12). Values set at SIZE or
    ## RASTERSIZE attributes of a dialog are always accepted,
    ## regardless of the minimum size required by its children. For a
    ## dialog to have the minimum necessary size to fit all elements
    ## contained in it, simply define SIZE or RASTERSIZE to NULL. Also
    ## if you set SIZE or RASTERSIZE to be used as the initial size of
    ## the dialog, its contents will be limited to this size as the
    ## minimum size, if you do not want that, then after showing the
    ## dialog reset this size to NULL so the dialog can be resized to
    ## smaller values. But notice that its contents will still be
    ## limited by the Natural size, to also remove that limitation set
    ## SHRINK=YES. To only change the User size in pixels, without
    ## resetting the Current size, set the USERSIZE attribute (since
    ## 3.12). Values set at SIZE or RASTERSIZE attributes of a dialog
    ## are always accepted, regardless of the minimum size required by
    ## its children. For a dialog to have the minimum necessary size
    ## to fit all elements contained in it, simply define SIZE or
    ## RASTERSIZE to NULL. Also if you set SIZE or RASTERSIZE to be
    ## used as the initial size of the dialog, its contents will be
    ## limited to this size as the minimum size, if you do not want
    ## that, then after showing the dialog reset this size to NULL so
    ## the dialog can be resized to smaller values. But notice that
    ## its contents will still be limited by the Natural size, to also
    ## remove that limitation set SHRINK=YES. To only change the User
    ## size in pixels, without resetting the Current size, set the
    ## USERSIZE attribute (since 3.12).
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `resize=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## RESIZE (creation only): Allows interactively changing the
    ## dialogs size. Default: YES. If RESIZE=NO then MAXBOX will be
    ## set to NO. In Motif the decorations are controlled by the
    ## Window Manager and may not be possible to be changed from IUP.
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring((if yes: "YES" else: "NO")))

proc `resize`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring((if yes: "YES" else: "NO")))

proc `resize`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RESIZE")) == "YES"

proc `saveunder=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## SAVEUNDER [Windows and Motif Only] (creation only): When this
    ## attribute is true (YES), the dialog stores the original image
    ## of the desktop region it occupies (if the system has enough
    ## memory to store the image). In this case, when the dialog is
    ## closed or moved, a redrawing event is not generated for the
    ## windows that were shadowed by it. Its default value is YES if
    ## the dialog has a parent dialog (since 3.24). To save memory
    ## disable it for your main dialog. Not available in GTK.
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring(value))

proc `saveunder`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring(value))

proc `saveunder=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring((if yes: "YES" else: "NO")))

proc `saveunder`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring((if yes: "YES" else: "NO")))

proc `saveunder`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER")) == "YES"

proc `screenposition`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `shapeimage=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## SHAPEIMAGE [Windows and GTK Only]: sets a RGBA image as the
    ## dialog shape so it is possible to create a non rectangle window
    ## with children. (GTK 2.12) Only the fully transparent pixels
    ## will be transparent. The pixels colors will be ignored, only
    ## the alpha channel is used. (since 3.26)
    SetAttribute(cast[PIhandle](ih), cstring("SHAPEIMAGE"), cstring(value))

proc `shapeimage`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHAPEIMAGE"), cstring(value))

# TODO ??? String Binary dialog
proc `shapeimage`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHAPEIMAGE"))

proc `shownofocus=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## SHOWNOFOCUS: do not set focus after show. (since 3.30)
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring(value))

proc `shownofocus`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring(value))

proc `shownofocus=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `shownofocus`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `shownofocus`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS")) == "YES"

proc `shrink=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## SHRINK: Allows changing the elements distribution when the
    ## dialog is smaller than the minimum size. Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring(value))

proc `shrink`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring(value))

proc `shrink=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring((if yes: "YES" else: "NO")))

proc `shrink`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring((if yes: "YES" else: "NO")))

proc `shrink`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHRINK")) == "YES"

proc `simulatemodal=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## SIMULATEMODAL (write-only): disable all other visible dialogs,
    ## just like when the dialog is made modal. (since 3.21)
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring(value))

proc `simulatemodal`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring(value))

proc `simulatemodal=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring((if yes: "YES" else: "NO")))

proc `simulatemodal`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring((if yes: "YES" else: "NO")))

proc `size=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## SIZE (non inheritable): Dialogs size. Additionally the
    ## following values can also be defined for width and/or height:
    ## "FULL": Defines the dialogs width (or height) equal to the
    ## screen's width (or height) "HALF": Defines the dialogs width
    ## (or height) equal to half the screen's width (or height)
    ## "THIRD": Defines the dialogs width (or height) equal to 1/3 the
    ## screen's width (or height) "QUARTER": Defines the dialogs width
    ## (or height) equal to 1/4 of the screen's width (or height)
    ## "EIGHTH": Defines the dialogs width (or height) equal to 1/8 of
    ## the screen's width (or height). Values set at SIZE or
    ## RASTERSIZE attributes of a dialog are always accepted,
    ## regardless of the minimum size required by its children. For a
    ## dialog to have the minimum necessary size to fit all elements
    ## contained in it, simply define SIZE or RASTERSIZE to NULL. Also
    ## if you set SIZE or RASTERSIZE to be used as the initial size of
    ## the dialog, its contents will be limited to this size as the
    ## minimum size, if you do not want that, then after showing the
    ## dialog reset this size to NULL so the dialog can be resized to
    ## smaller values. But notice that its contents will still be
    ## limited by the Natural size, to also remove that limitation set
    ## SHRINK=YES. To only change the User size in pixels, without
    ## resetting the Current size, set the USERSIZE attribute (since
    ## 3.12). Values set at SIZE or RASTERSIZE attributes of a dialog
    ## are always accepted, regardless of the minimum size required by
    ## its children. For a dialog to have the minimum necessary size
    ## to fit all elements contained in it, simply define SIZE or
    ## RASTERSIZE to NULL. Also if you set SIZE or RASTERSIZE to be
    ## used as the initial size of the dialog, its contents will be
    ## limited to this size as the minimum size, if you do not want
    ## that, then after showing the dialog reset this size to NULL so
    ## the dialog can be resized to smaller values. But notice that
    ## its contents will still be limited by the Natural size, to also
    ## remove that limitation set SHRINK=YES. To only change the User
    ## size in pixels, without resetting the Current size, set the
    ## USERSIZE attribute (since 3.12). Values set at SIZE or
    ## RASTERSIZE attributes of a dialog are always accepted,
    ## regardless of the minimum size required by its children. For a
    ## dialog to have the minimum necessary size to fit all elements
    ## contained in it, simply define SIZE or RASTERSIZE to NULL. Also
    ## if you set SIZE or RASTERSIZE to be used as the initial size of
    ## the dialog, its contents will be limited to this size as the
    ## minimum size, if you do not want that, then after showing the
    ## dialog reset this size to NULL so the dialog can be resized to
    ## smaller values. But notice that its contents will still be
    ## limited by the Natural size, to also remove that limitation set
    ## SHRINK=YES. To only change the User size in pixels, without
    ## resetting the Current size, set the USERSIZE attribute (since
    ## 3.12).
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size=`*(ih: Dialog_t, width: string, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Dialog_t, width: string, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size=`*(ih: Dialog_t, width: int, height:string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Dialog_t, width: int, height:string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `startfocus=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## STARTFOCUS: Name of the element that must receive the focus
    ## right after the dialog is shown using IupShow or IupPopup. If
    ## not defined then the first control than can receive the focus
    ## is selected (same effect of calling IupNextField for the
    ## dialog). Updated after SHOW_CB is called and only if the focus
    ## was not changed during the callback.
    SetAttribute(cast[PIhandle](ih), cstring("STARTFOCUS"), cstring(value))

proc `startfocus`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STARTFOCUS"), cstring(value))

# TODO ??? String Binary dialog
proc `startfocus`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("STARTFOCUS"))

proc `theme=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary dialog
proc `theme`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary dialog
proc `tip`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: Dialog_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Dialog_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: Dialog_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Dialog_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: Dialog_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Dialog_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary dialog
proc `tipicon`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary dialog
proc `tipmarkup`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: Dialog_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Dialog_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `title=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## TITLE (non inheritable): Dialogs title. Default: NULL. If you
    ## want to remove the title bar you must also set MENUBOX=NO,
    ## MAXBOX=NO and MINBOX=NO, before map. But in Motif and GTK it
    ## will hide it only if RESIZE=NO also.
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

proc `title`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

# TODO ??? String Binary dialog
proc `title`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLE"))

proc `toolbox=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## TOOLBOX [Windows Only] (creation only): makes the dialog look
    ## like a toolbox with a smaller title bar. It is only valid if
    ## the PARENTDIALOG or NATIVEPARENT attribute is also defined.
    ## Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring(value))

proc `toolbox`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring(value))

proc `toolbox=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring((if yes: "YES" else: "NO")))

proc `toolbox`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring((if yes: "YES" else: "NO")))

proc `toolbox`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOOLBOX")) == "YES"

proc `topmost=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## TOPMOST [Windows and GTK Only]: puts the dialog always in front
    ## of all other dialogs in all applications. Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring(value))

proc `topmost`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring(value))

proc `topmost=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring((if yes: "YES" else: "NO")))

proc `topmost`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring((if yes: "YES" else: "NO")))

proc `tray=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## TRAY [Windows and GTK Only]: When set to "YES", displays an
    ## icon on the system tray. (GTK 2.10 and GTK < 3.14)
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring(value))

proc `tray`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring(value))

proc `tray=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring((if yes: "YES" else: "NO")))

proc `tray`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring((if yes: "YES" else: "NO")))

proc `tray`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAY")) == "YES"

proc `trayimage=`*(ih: Dialog_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    ## TRAYIMAGE [Windows and GTK Only]: Name of a IUP image to be
    ## used as the tray icon. The Windows SDK recommends that cursors
    ## and icons should be implemented as resources rather than
    ## created at run time. (GTK 2.10 and GTK < 3.14)
    SetAttributeHandle(cast[PIhandle](ih), cstring("TRAYIMAGE"), cast[PIhandle](handle))

proc `trayimage`*(ih: Dialog_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TRAYIMAGE"), cast[PIhandle](handle))

proc `trayimage`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAYIMAGE"))

proc `traytip=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## TRAYTIP [Windows and GTK Only]: Tray icon's tooltip text. (GTK
    ## 2.10 and GTK < 3.14)
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIP"), cstring(value))

proc `traytip`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIP"), cstring(value))

# TODO ??? String Binary dialog
proc `traytip`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAYTIP"))

proc `traytipmarkup=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## TRAYTIPMARKUP [GTK Only]: allows the tip string to contains
    ## Pango markup commands. Can be "YES" or "NO". Default: "NO".
    ## Must be set before setting the TRAYTIP attribute. (GTK 2.16)
    ## (since 3.6)
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIPMARKUP"), cstring(value))

proc `traytipmarkup`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIPMARKUP"), cstring(value))

# TODO ??? String Binary dialog
proc `traytipmarkup`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAYTIPMARKUP"))

proc `usersize=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Dialog_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `visible=`*(ih: Dialog_t, value: string) {.cdecl.} =
    ## VISIBLE: Simply call IupShow or IupHide for the dialog.
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Dialog_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Dialog_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

# TODO unknown: dialog XFONTID Unknown Binary
proc `xfontid`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

# TODO unknown: dialog XWINDOW Unknown Binary
proc `xwindow`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XWINDOW"))

proc `y`*(ih: Dialog_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `zorder=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `gap=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(cstring(value)))

proc `gap`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(cstring(value)))

proc `gap=`*(ih: Dialog_t, value: int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(cstring(&"value")))

proc `gap`*(ih: Dialog_t, value: int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("GAP"), cstring(cstring(&"value")))

proc `margin=`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(cstring(value)))

proc `margin`*(ih: Dialog_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(cstring(value)))

proc `margin=`*(ih: Dialog_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(&"{horiz}x{vert}"))

proc `margin`*(ih: Dialog_t, horiz, vert:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MARGIN"), cstring(&"{horiz}x{vert}"))

proc `shapeimage=`*(ih: Dialog_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SHAPEIMAGE"), cast[PIhandle](handle))

proc `shapeimage`*(ih: Dialog_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("SHAPEIMAGE"), cast[PIhandle](handle))

proc `close_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## CLOSE_CB CLOSE_CB Called just before a dialog is closed when
    ## the user clicks the close button of the title bar or an
    ## equivalent action. Callback int function(Ihandle \*ih); [in C]
    ## ih:close_cb() -> (ret: number) [in Lua] ih: identifies the
    ## element that activated the event. Returns: if IUP_IGNORE, it
    ## prevents the dialog from being closed. If you destroy the
    ## dialog in this callback, you must return IUP_IGNORE. IUP_CLOSE
    ## will be processed. Affects IupDialog
    SetCallback(cast[PIhandle](ih), cstring("CLOSE_CB"), cast[Icallback](cb))

proc `close_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("CLOSE_CB"), cast[Icallback](cb))

proc `close_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("CLOSE_CB")))

proc `destroy_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## DESTROY_CB DESTROY_CB Called right before an element is
    ## destroyed. Callback int function(Ihandle \*ih); [in C]
    ## ih:destroy_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Notes If the dialog is
    ## visible then it is hidden before it is destroyed. The callback
    ## will be called right after it is hidden. The callback will be
    ## called before all other destroy procedures. For instance, if
    ## the element has children then it is called before the children
    ## are destroyed. For language binding implementations use the
    ## callback name "LDESTROY_CB" to release memory allocated by the
    ## binding for the element. Also the callback will be called
    ## before the language callback. Affects All.
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragend_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropfiles_cb=`*(ih: Dialog_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    ## DROPFILES_CB DROPFILES_CB Action called when a file is
    ## "dropped" into the control. When several files are dropped at
    ## once, the callback is called several times, once for each file.
    ## If defined after the element is mapped then the attribute
    ## DROPFILESTARGET must be set to YES. [Windows and GTK Only] (GTK
    ## 2.6) Callback int function(Ihandle \*ih, const char\* filename,
    ## int num, int x, int y); [in C] ih:dropfiles_cb(filename:
    ## string; num, x, y: number) -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. filename:
    ## Name of the dropped file. num: Number index of the dropped
    ## file. If several files are dropped, num is the index of the
    ## dropped file starting from "total-1" to "0". x: X coordinate of
    ## the point where the user released the mouse button. y: Y
    ## coordinate of the point where the user released the mouse
    ## button. Returns: If IUP_IGNORE is returned the callback will
    ## NOT be called for the next dropped files, and the processing of
    ## dropped files will be interrupted. Affects IupDialog,
    ## IupCanvas, IupGLCanvas, IupText, IupList
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: Dialog_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `enterwindow_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## ENTERWINDOW_CB ENTERWINDOW_CB Action generated when the mouse
    ## enters the native element. Callback int function(Ihandle \*ih);
    ## [in C] ih:enterwindow_cb() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. Notes When
    ## the cursor is moved from one element to another, the call order
    ## in all platforms will be first the LEAVEWINDOW_CB callback of
    ## the old control followed by the ENTERWINDOW_CB callback of the
    ## new control. (since 3.14) If the mouse button is hold pressed
    ## and the cursor moves outside the element the behavior is system
    ## dependent. In Windows the LEAVEWINDOW_CB/ENTERWINDOW_CB
    ## callbacks are NOT called, in GTK the callbacks are called.
    ## Affects All controls with user interaction. See Also
    ## LEAVEWINDOW_CB
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `focus_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    ## FOCUS_CB: Called when the dialog or any of its children gets
    ## the focus, or when another dialog or any control in another
    ## dialog gets the focus. It is called after the common callbacks
    ## GETFOCUS_CB and KILL_FOCUS_CB. (since 3.21) int
    ## function(Ihandle \*ih, int focus); [in C]ih:focus_cb(focus:
    ## number) -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FOCUS_CB")))

proc `getfocus_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## GETFOCUS_CB GETFOCUS_CB Action generated when an element is
    ## given keyboard focus. This callback is called after the
    ## KILLFOCUS_CB of the element that loosed the focus. The
    ## IupGetFocus function during the callback returns the element
    ## that loosed the focus. Callback int function(Ihandle \*ih); [in
    ## C] ih:getfocus_cb() -> (ret: number) [in Lua] ih: identifier of
    ## the element that received keyboard focus. Affects All elements
    ## with user interaction, except menus. See Also KILLFOCUS_CB,
    ## IupGetFocus, IupSetFocus
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `killfocus_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## KILLFOCUS_CB KILLFOCUS_CB Action generated when an element
    ## loses keyboard focus. This callback is called before the
    ## GETFOCUS_CB of the element that gets the focus. Callback int
    ## function(Ihandle \*ih); [in C] ih:killfocus_cb() -> (ret:
    ## number) [in Lua] ih: identifier of the element that activated
    ## the event. Affects All elements with user interaction, except
    ## menus. In Windows, there are restrictions when using this
    ## callback. From MSDN on WM_KILLFOCUS: "While processing this
    ## message, do not make any function calls that display or
    ## activate a window. This causes the thread to yield control and
    ## can cause the application to stop responding to messages. See
    ## Also GETFOCUS_CB, IupGetFocus, IupSetFocus
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: Dialog_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    ## K_ANY K_ANY Action generated when a keyboard event occurs.
    ## Callback int function(Ihandle \*ih, int c); [in C] ih:k_any(c:
    ## number) -> (ret: number) [in Lua] ih: identifier of the element
    ## that activated the event. c: identifier of typed key. Please
    ## refer to the Keyboard Codes table for a list of possible
    ## values. Returns: If IUP_IGNORE is returned the key is ignored
    ## and not processed by the control and not propagated. If returns
    ## IUP_CONTINUE, the key will be processed and the event will be
    ## propagated to the parent of the element receiving it, this is
    ## the default behavior. If returns IUP_DEFAULT the key is
    ## processed but it is not propagated. IUP_CLOSE will be
    ## processed. Notes Keyboard callbacks depend on the keyboard
    ## usage of the control with the focus. So if you return
    ## IUP_IGNORE the control will usually not process the key. But be
    ## aware that sometimes the control process the key in another
    ## event so even returning IUP_IGNORE the key can get processed.
    ## Although it will not be propagated. IMPORTANT: The callbacks
    ## "K_\*" of the dialog or native containers depend on the
    ## IUP_CONTINUE return value to work while the control is in
    ## focus. If the callback does not exists it is automatically
    ## propagated to the parent of the element. K_\* callbacks All
    ## defined keys are also callbacks of any element, called when the
    ## respective key is activated. For example: "K_cC" is also a
    ## callback activated when the user press Ctrl+C, when the focus
    ## is at the element or at a children with focus. This is the way
    ## an application can create shortcut keys, also called hot keys.
    ## These callbacks are not available in IupLua. Affects All
    ## elements with keyboard interaction.
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: Dialog_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## LEAVEWINDOW_CB LEAVEWINDOW_CB Action generated when the mouse
    ## leaves the native element. Callback int function(Ihandle \*ih);
    ## [in C] ih:leavewindow_cb() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. Notes When
    ## the cursor is moved from one element to another, the call order
    ## in all platforms will be first the LEAVEWINDOW_CB callback of
    ## the old control followed by the ENTERWINDOW_CB callback of the
    ## new control. (since 3.14) If the mouse button is hold pressed
    ## and the cursor moves outside the element the behavior is system
    ## dependent. In Windows the LEAVEWINDOW_CB/ENTERWINDOW_CB
    ## callbacks are NOT called, in GTK the callbacks are called.
    ## Affects All controls with user interaction. See Also
    ## ENTERWINDOW_CB
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `resize_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
    ## RESIZE_CB RESIZE_CB Action generated when the canvas or dialog
    ## size is changed. Callback int function(Ihandle \*ih, int width,
    ## int height); [in C] ih:resize_cb(width, height: number) ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. width: the width of the internal element
    ## size in pixels not considering the decorations (client size)
    ## height: the height of the internal element size in pixels not
    ## considering the decorations (client size) Notes For the dialog,
    ## this action is also generated when the dialog is mapped, after
    ## the map and before the show. When XAUTOHIDE=Yes or
    ## YAUTOHIDE=Yes, if the canvas scrollbar is hidden/shown after
    ## changing the DX or DY attributes from inside the callback, the
    ## size of the drawing area will immediately change, so the
    ## parameters with and height will be invalid. To update the
    ## parameters consult the DRAWSIZE attribute. Also activate the
    ## drawing toolkit only after updating the DX or DY attributes.
    ## Affects IupCanvas, IupGLCanvas, IupDialog
    SetCallback(cast[PIhandle](ih), cstring("RESIZE_CB"), cast[Icallback](cb))

proc `resize_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RESIZE_CB"), cast[Icallback](cb))

proc `resize_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RESIZE_CB")))

proc `show_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) {.cdecl.} =
    ## SHOW_CB SHOW_CB Called right after the dialog is showed,
    ## hidden, maximized, minimized or restored from
    ## minimized/maximized. This callback is called when those actions
    ## were performed by the user or programmatically by the
    ## application. Callback int function(Ihandle \*ih, int state); [in
    ## C] ih:show_cb(state: number) -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. state:
    ## indicates which of the following situations generated the
    ## event: IUP_HIDE (since 3.0) IUP_SHOW IUP_RESTORE (was minimized
    ## or maximized) IUP_MINIMIZE IUP_MAXIMIZE (since 3.0) (not
    ## received in Motif when activated from the maximize button)
    ## Returns: IUP_CLOSE will be processed. Affects IupDialog
    SetCallback(cast[PIhandle](ih), cstring("SHOW_CB"), cast[Icallback](cb))

proc `show_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SHOW_CB"), cast[Icallback](cb))

proc `show_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SHOW_CB")))

proc `trayclick_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.}) {.cdecl.} =
    ## TRAYCLICK_CB [Windows and GTK Only]: Called right after the
    ## mouse button is pressed or released over the tray icon. (GTK
    ## 2.10) int function(Ihandle \*ih, int but, int pressed, int
    ## dclick); [in C]elem:trayclick_cb(but, pressed, dclick: number)
    ## -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("TRAYCLICK_CB"), cast[Icallback](cb))

proc `trayclick_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("TRAYCLICK_CB"), cast[Icallback](cb))

proc `trayclick_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("TRAYCLICK_CB")))

proc `unmap_cb=`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Dialog_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Dialog_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

