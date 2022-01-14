when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: FileDlg
##
## NIUP type: FileDlg_t
##
## constructors
##
##    proc FileDlg(): FileDlg_t
##

proc FileDlg*(): FileDlg_t {.cdecl.} =
    ## Creates the File Dialog element. It is a predefined dialog for
    ## selecting files or a directory. The dialog can be shown with
    ## the IupPopup function only.
    return FileDlg_t(niupc.FileDlg())

proc `active=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `activewindow`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVEWINDOW")) == "YES"

proc `allownew=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    ## ALLOWNEW: Indicates if non-existent file names are accepted. If
    ## equals "NO" and the user specifies a non-existing file, an
    ## alert dialog is shown. Default: if the dialog is of type
    ## "OPEN", default is "NO"; if the dialog is of type "SAVE",
    ## default is "YES". Not used when DIALOGTYPE=DIR.
    SetAttribute(cast[PIhandle](ih), cstring("ALLOWNEW"), cstring(value))

proc `allownew`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALLOWNEW"), cstring(value))

proc `allownew=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALLOWNEW"), cstring((if yes: "YES" else: "NO")))

proc `allownew`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALLOWNEW"), cstring((if yes: "YES" else: "NO")))

proc `allownew`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ALLOWNEW")) == "YES"

proc `background=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(value))

proc `background`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(value))

proc `background=`*(ih: FileDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(&"{red} {green} {blue} {alpha}"))

proc `background`*(ih: FileDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(&"{red} {green} {blue} {alpha}"))

proc `background`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"))

proc `bgcolor=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: FileDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: FileDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `border=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDER")) == "YES"

proc `bordersize`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERSIZE"))

proc `bringfront=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring(value))

proc `bringfront`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring(value))

proc `bringfront=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring((if yes: "YES" else: "NO")))

proc `bringfront`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring((if yes: "YES" else: "NO")))

proc `bringfront`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT")) == "YES"

proc `canfocus=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `childoffset=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(value))

proc `childoffset`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(value))

proc `childoffset=`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(&"{width}x{height}"))

proc `childoffset`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(&"{width}x{height}"))

proc `childoffset`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"))

proc `clientoffset`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(value))

proc `clientsize`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(value))

proc `clientsize=`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(&"{width}x{height}"))

proc `clientsize`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(&"{width}x{height}"))

proc `clientsize`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `composited=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring(value))

proc `composited`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring(value))

proc `composited=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring((if yes: "YES" else: "NO")))

proc `composited`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring((if yes: "YES" else: "NO")))

proc `composited`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COMPOSITED")) == "YES"

proc `control=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring(value))

proc `control`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring(value))

proc `control=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring((if yes: "YES" else: "NO")))

proc `control`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring((if yes: "YES" else: "NO")))

proc `control`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CONTROL")) == "YES"

proc `cursor=`*(ih: FileDlg_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: FileDlg_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CURSOR"))

proc `customframe=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring(value))

proc `customframe`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring(value))

proc `customframe=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring((if yes: "YES" else: "NO")))

proc `customframe`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring((if yes: "YES" else: "NO")))

proc `customframe`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME")) == "YES"

proc `customframesimulate=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring(value))

proc `customframesimulate`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring(value))

proc `customframesimulate=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring((if yes: "YES" else: "NO")))

proc `customframesimulate`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring((if yes: "YES" else: "NO")))

proc `customframesimulate`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE")) == "YES"

proc `defaultenter=`*(ih: FileDlg_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTENTER"), cast[PIhandle](handle))

proc `defaultenter`*(ih: FileDlg_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTENTER"), cast[PIhandle](handle))

proc `defaultenter`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DEFAULTENTER"))

proc `defaultesc=`*(ih: FileDlg_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTESC"), cast[PIhandle](handle))

proc `defaultesc`*(ih: FileDlg_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTESC"), cast[PIhandle](handle))

proc `defaultesc`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DEFAULTESC"))

proc `dialogframe=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring(value))

proc `dialogframe`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring(value))

proc `dialogframe=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring((if yes: "YES" else: "NO")))

proc `dialogframe`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring((if yes: "YES" else: "NO")))

proc `dialogframe`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME")) == "YES"

proc `dialoghint=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring(value))

proc `dialoghint`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring(value))

proc `dialoghint=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring((if yes: "YES" else: "NO")))

proc `dialoghint`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring((if yes: "YES" else: "NO")))

proc `dialoghint`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT")) == "YES"

proc `dialogtype=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    ## DIALOGTYPE: Type of dialog (Open, Save or Directory). Can have
    ## values "OPEN", "SAVE" or "DIR". Default: "OPEN". In Windows,
    ## when DIALOGTYPE=DIR the dialog shown is not the same dialog for
    ## OPEN and SAVE, this new dialog does not have the Help button
    ## neither filters. Also this new dialog needs CoInitializeEx with
    ## COINIT_APARTMENTTHREADED (done in IupOpen), if the COM library
    ## was initialized with COINIT_MULTITHREADED prior to IupOpen then
    ## the new dialog will have limited functionality. In Motif or GTK
    ## the dialog is the same, but it only allows the user to select a
    ## directory.
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGTYPE"), cstring(value))

proc `dialogtype`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGTYPE"), cstring(value))

proc `dialogtype`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIALOGTYPE"))

proc `directory=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    ## DIRECTORY: Initial directory. When consulted after the dialog
    ## is closed and the user pressed the OK button, it will contain
    ## the directory of the selected file. When set the last separator
    ## does not need to be specified, but when get the returned value
    ## will always contains the last separator. In Motif or GTK, if
    ## not defined, the dialog opens in the current directory. In
    ## Windows, if not defined and the application has used the dialog
    ## in the past, the path most recently used is selected as the
    ## initial directory. However, if an application is not run for a
    ## long time, its saved selected path is discarded. Also if not
    ## defined and the current directory contains any files of the
    ## specified filter types, the initial directory is the current
    ## directory. Otherwise, the initial directory is the "My
    ## Documents" directory of the current user. Otherwise, the
    ## initial directory is the Desktop folder. In Windows, the FILE
    ## and the DIRECTORY attributes also accept strings containing "/"
    ## as path separators, but the VALUE attribute will always return
    ## strings using the "\" character.
    SetAttribute(cast[PIhandle](ih), cstring("DIRECTORY"), cstring(value))

proc `directory`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIRECTORY"), cstring(value))

# TODO ??? String Binary filedlg
proc `directory`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIRECTORY"))

proc `dragdrop=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragsource=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary filedlg
proc `dragtypes`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

proc `dropfilestarget=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary filedlg
proc `droptypes`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `expand=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: FileDlg_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: FileDlg_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `extdefault=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    ## EXTDEFAULT: default extension to be used if selected file does
    ## not have an extension. The inspected extension will consider to
    ## have the same number of characters of the default extension. It
    ## must NOT include the period ".". (since 3.18)
    SetAttribute(cast[PIhandle](ih), cstring("EXTDEFAULT"), cstring(value))

proc `extdefault`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXTDEFAULT"), cstring(value))

# TODO ??? String Binary filedlg
proc `extdefault`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXTDEFAULT"))

proc `extfilter=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    ## EXTFILTER [Windows and GTK Only]: Defines several file filters.
    ## It has priority over FILTERINFO and FILTER. Must be a text with
    ## the format "FilterInfo1|Filter1|FilterInfo2|Filter2|...". The
    ## list ends with character '|'. Example: "Text
    ## files|\*.txt;\*.doc|Image files|\*.gif;\*.jpg;\*.bmp|". In GTK there
    ## is no way how to overwrite the filters, so it is recommended to
    ## always add a less restrictive filter to the filter list, for
    ## example "All Files|\*.\*".
    SetAttribute(cast[PIhandle](ih), cstring("EXTFILTER"), cstring(value))

proc `extfilter`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXTFILTER"), cstring(value))

# TODO ??? String Binary filedlg
proc `extfilter`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXTFILTER"))

# TODO unknown: filedlg FILE Unknown Binary
proc `file`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FILE"))

proc `fileexist`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FILEEXIST"))

proc `filter=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    ## FILTER: String containing a list of file filters separated by
    ## ';' without spaces. Example: "\*.C;\*.LED;test.\*". In Motif only
    ## the first filter is used.
    SetAttribute(cast[PIhandle](ih), cstring("FILTER"), cstring(value))

proc `filter`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FILTER"), cstring(value))

# TODO ??? String Binary filedlg
proc `filter`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FILTER"))

# TODO unknown: filedlg FILTERINFO Unknown Binary
proc `filterinfo`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FILTERINFO"))

# TODO unknown: filedlg FILTERUSED Unknown Binary
proc `filterused`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FILTERUSED"))

proc `floating=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary filedlg
proc `font`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary filedlg
proc `fontface`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: FileDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: FileDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary filedlg
proc `fontstyle`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `fullscreen=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring(value))

proc `fullscreen`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring(value))

proc `fullscreen=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring((if yes: "YES" else: "NO")))

proc `fullscreen`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring((if yes: "YES" else: "NO")))

proc `handlename=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary filedlg
proc `handlename`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `helpbutton=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring(value))

proc `helpbutton`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring(value))

proc `helpbutton=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring((if yes: "YES" else: "NO")))

proc `helpbutton`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring((if yes: "YES" else: "NO")))

proc `helpbutton`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON")) == "YES"

proc `hidetaskbar=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring(value))

proc `hidetaskbar`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring(value))

proc `hidetaskbar=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring((if yes: "YES" else: "NO")))

proc `hidetaskbar`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring((if yes: "YES" else: "NO")))

proc `hidetaskbar`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR")) == "YES"

proc `hidetitlebar=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETITLEBAR"), cstring(value))

proc `hidetitlebar`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETITLEBAR"), cstring(value))

# TODO ??? String Binary filedlg
proc `hidetitlebar`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDETITLEBAR"))

proc `icon=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ICON"), cstring(value))

proc `icon`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ICON"), cstring(value))

# TODO ??? String Binary filedlg
proc `icon`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ICON"))

proc `maxbox=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring(value))

proc `maxbox`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring(value))

proc `maxbox=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring((if yes: "YES" else: "NO")))

proc `maxbox`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring((if yes: "YES" else: "NO")))

proc `maxbox`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXBOX")) == "YES"

proc `maximized`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXIMIZED")) == "YES"

proc `maxsize=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `mdichild=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring(value))

proc `mdichild`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring(value))

proc `mdichild=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring((if yes: "YES" else: "NO")))

proc `mdichild`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring((if yes: "YES" else: "NO")))

proc `mdichild`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDICHILD")) == "YES"

proc `mdiclient=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring(value))

proc `mdiclient`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring(value))

proc `mdiclient=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring((if yes: "YES" else: "NO")))

proc `mdiclient`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring((if yes: "YES" else: "NO")))

proc `mdiclient`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDICLIENT")) == "YES"

proc `mdiframe=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring(value))

proc `mdiframe`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring(value))

proc `mdiframe=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring((if yes: "YES" else: "NO")))

proc `mdiframe`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring((if yes: "YES" else: "NO")))

proc `mdiframe`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDIFRAME")) == "YES"

proc `mdimenu=`*(ih: FileDlg_t, handle: Menu_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("MDIMENU"), cast[PIhandle](handle))

proc `mdimenu`*(ih: FileDlg_t, handle: Menu_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("MDIMENU"), cast[PIhandle](handle))

proc `mdimenu`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDIMENU"))

proc `menu=`*(ih: FileDlg_t, handle: Menu_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("MENU"), cast[PIhandle](handle))

proc `menu`*(ih: FileDlg_t, handle: Menu_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("MENU"), cast[PIhandle](handle))

proc `menu`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MENU"))

proc `menubox=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring(value))

proc `menubox`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring(value))

proc `menubox=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring((if yes: "YES" else: "NO")))

proc `menubox`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring((if yes: "YES" else: "NO")))

proc `menubox`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MENUBOX")) == "YES"

proc `minbox=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring(value))

proc `minbox`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring(value))

proc `minbox=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring((if yes: "YES" else: "NO")))

proc `minbox`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring((if yes: "YES" else: "NO")))

proc `minbox`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINBOX")) == "YES"

proc `minsize=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `modal`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MODAL")) == "YES"

# TODO unknown: filedlg MULTIPLEFILES Unknown Binary
proc `multiplefiles`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MULTIPLEFILES"))

# TODO unknown: filedlg MULTIVALUEPATH Unknown Binary
proc `multivaluepath`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MULTIVALUEPATH"))

proc `nactive=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring(value))

proc `nactive`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring(value))

proc `nactive=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `nactive`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `nactive`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NACTIVE")) == "YES"

proc `name=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary filedlg
proc `name`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `nativeparent=`*(ih: FileDlg_t, handle: User_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("NATIVEPARENT"), cast[PIhandle](handle))

proc `nativeparent`*(ih: FileDlg_t, handle: User_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("NATIVEPARENT"), cast[PIhandle](handle))

proc `nativeparent`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATIVEPARENT"))

proc `naturalsize`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `nochangedir=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    ## NOCHANGEDIR: Indicates if the current working directory must be
    ## restored after the user navigation. Default: "YES".
    SetAttribute(cast[PIhandle](ih), cstring("NOCHANGEDIR"), cstring(value))

proc `nochangedir`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOCHANGEDIR"), cstring(value))

proc `nochangedir=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOCHANGEDIR"), cstring((if yes: "YES" else: "NO")))

proc `nochangedir`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOCHANGEDIR"), cstring((if yes: "YES" else: "NO")))

proc `nochangedir`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NOCHANGEDIR")) == "YES"

proc `noflush=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring(value))

proc `noflush`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring(value))

proc `noflush=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring((if yes: "YES" else: "NO")))

proc `noflush`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring((if yes: "YES" else: "NO")))

proc `noflush`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NOFLUSH")) == "YES"

proc `nooverwriteprompt=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    ## NOOVERWRITEPROMPT: do not prompt to overwrite an existent file
    ## when in "SAVE" dialog. Default is "NO", i.e. prompt before
    ## overwrite. (GTK 2.8)
    SetAttribute(cast[PIhandle](ih), cstring("NOOVERWRITEPROMPT"), cstring(value))

proc `nooverwriteprompt`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOOVERWRITEPROMPT"), cstring(value))

proc `nooverwriteprompt=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOOVERWRITEPROMPT"), cstring((if yes: "YES" else: "NO")))

proc `nooverwriteprompt`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOOVERWRITEPROMPT"), cstring((if yes: "YES" else: "NO")))

proc `nooverwriteprompt`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NOOVERWRITEPROMPT")) == "YES"

proc `normalizergroup=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary filedlg
proc `normalizergroup`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary filedlg
proc `ntheme`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `opacity=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(value))

proc `opacity`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(value))

proc `opacity=`*(ih: FileDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(&"{x}"))

proc `opacity`*(ih: FileDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(&"{x}"))

proc `opacity`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OPACITY"))

proc `opacityimage=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITYIMAGE"), cstring(value))

proc `opacityimage`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITYIMAGE"), cstring(value))

# TODO ??? String Binary filedlg
proc `opacityimage`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OPACITYIMAGE"))

# TODO unknown: filedlg PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: filedlg PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `parentdialog=`*(ih: FileDlg_t, handle: IUPhandle_t) {.cdecl.} =
    ## PARENTDIALOG: Makes the dialog be treated as a child of the
    ## specified dialog.
    SetAttributeHandle(cast[PIhandle](ih), cstring("PARENTDIALOG"), cast[PIhandle](handle))

proc `parentdialog`*(ih: FileDlg_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("PARENTDIALOG"), cast[PIhandle](handle))

proc `parentdialog`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PARENTDIALOG"))

proc `placement=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PLACEMENT"), cstring(value))

proc `placement`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PLACEMENT"), cstring(value))

proc `placement`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PLACEMENT"))

proc `position=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: FileDlg_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: FileDlg_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `previewdc`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PREVIEWDC"))

proc `previewheight`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PREVIEWHEIGHT"))

proc `previewwidth`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PREVIEWWIDTH"))

proc `propagatefocus=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `resize=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring((if yes: "YES" else: "NO")))

proc `resize`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring((if yes: "YES" else: "NO")))

proc `resize`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RESIZE")) == "YES"

proc `saveunder=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring(value))

proc `saveunder`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring(value))

proc `saveunder=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring((if yes: "YES" else: "NO")))

proc `saveunder`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring((if yes: "YES" else: "NO")))

proc `saveunder`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER")) == "YES"

proc `screenposition`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `shapeimage=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHAPEIMAGE"), cstring(value))

proc `shapeimage`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHAPEIMAGE"), cstring(value))

# TODO ??? String Binary filedlg
proc `shapeimage`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHAPEIMAGE"))

# TODO unknown: filedlg SHOWHIDDEN Unknown Binary
proc `showhidden`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWHIDDEN"))

proc `shownofocus=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring(value))

proc `shownofocus`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring(value))

proc `shownofocus=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `shownofocus`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `shownofocus`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS")) == "YES"

proc `showpreview=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    ## SHOWPREVIEW: A preview area is shown inside the file dialog.
    ## Can have values "YES" or "NO". Default: "NO". In Windows, you
    ## must link with the "iup.rc" resource file so the preview area
    ## can be enabled (not necessary if using "iup.dll"). Valid only
    ## if the FILE_CB callback is defined, use it to retrieve the file
    ## name and the necessary attributes to paint the preview area.
    ## (in Motif since 3.0) Read only attributes that are valid inside
    ## the FILE_CB callback when status="PAINT": PREVIEWDC: Returns
    ## the Device Context (HDC in Windows and GC in UNIX) PREVIEWWIDTH
    ## and PREVIEWHEIGHT: Returns the width and the height of the
    ## client rectangle for the preview area. Also the attributes WID,
    ## HWND, XWINDOW and XDISPLAY are valid and are relative to the
    ## preview area. If the attribute PREVIEWGLCANVAS is defined then
    ## it is used as the name of an existent IupGLCanvas control to be
    ## mapped internally to the preview canvas. Notice that this is
    ## not a fully implemented IupGLCanvas that inherits from
    ## IupCanvas. This does the minimum necessary so you can use
    ## IupGLCanvas auxiliary functions for the preview canvas and call
    ## OpenGL functions. No IupCanvas attributes or callbacks are
    ## available. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("SHOWPREVIEW"), cstring(value))

proc `showpreview`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWPREVIEW"), cstring(value))

# TODO ??? String Binary filedlg
proc `showpreview`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWPREVIEW"))

proc `shrink=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring(value))

proc `shrink`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring(value))

proc `shrink=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring((if yes: "YES" else: "NO")))

proc `shrink`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring((if yes: "YES" else: "NO")))

proc `shrink`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHRINK")) == "YES"

proc `simulatemodal=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring(value))

proc `simulatemodal`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring(value))

proc `simulatemodal=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring((if yes: "YES" else: "NO")))

proc `simulatemodal`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring((if yes: "YES" else: "NO")))

proc `size=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size=`*(ih: FileDlg_t, width: string, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: FileDlg_t, width: string, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size=`*(ih: FileDlg_t, width: int, height:string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: FileDlg_t, width: int, height:string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `startfocus=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STARTFOCUS"), cstring(value))

proc `startfocus`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STARTFOCUS"), cstring(value))

# TODO ??? String Binary filedlg
proc `startfocus`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("STARTFOCUS"))

proc `status`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("STATUS"))

proc `theme=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary filedlg
proc `theme`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary filedlg
proc `tip`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: FileDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: FileDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: FileDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: FileDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: FileDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: FileDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary filedlg
proc `tipicon`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary filedlg
proc `tipmarkup`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: FileDlg_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: FileDlg_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `title=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    ## TITLE: Dialog's title.
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

proc `title`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

# TODO ??? String Binary filedlg
proc `title`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLE"))

proc `toolbox=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring(value))

proc `toolbox`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring(value))

proc `toolbox=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring((if yes: "YES" else: "NO")))

proc `toolbox`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring((if yes: "YES" else: "NO")))

proc `toolbox`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOOLBOX")) == "YES"

proc `topmost=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring(value))

proc `topmost`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring(value))

proc `topmost=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring((if yes: "YES" else: "NO")))

proc `topmost`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring((if yes: "YES" else: "NO")))

proc `tray=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring(value))

proc `tray`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring(value))

proc `tray=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring((if yes: "YES" else: "NO")))

proc `tray`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring((if yes: "YES" else: "NO")))

proc `tray`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAY")) == "YES"

proc `trayimage=`*(ih: FileDlg_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TRAYIMAGE"), cast[PIhandle](handle))

proc `trayimage`*(ih: FileDlg_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TRAYIMAGE"), cast[PIhandle](handle))

proc `trayimage`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAYIMAGE"))

proc `traytip=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIP"), cstring(value))

proc `traytip`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIP"), cstring(value))

# TODO ??? String Binary filedlg
proc `traytip`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAYTIP"))

proc `traytipmarkup=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIPMARKUP"), cstring(value))

proc `traytipmarkup`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIPMARKUP"), cstring(value))

# TODO ??? String Binary filedlg
proc `traytipmarkup`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAYTIPMARKUP"))

proc `usersize=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: FileDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `value`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `visible=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: FileDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: FileDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

# TODO unknown: filedlg XFONTID Unknown Binary
proc `xfontid`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

# TODO unknown: filedlg XWINDOW Unknown Binary
proc `xwindow`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XWINDOW"))

proc `y`*(ih: FileDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `zorder=`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: FileDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `close_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## CLOSE_CB CLOSE_CB Called just before a dialog is closed when
    ## the user clicks the close button of the title bar or an
    ## equivalent action. Callback int function(Ihandle \*ih); [in C]
    ## ih:close_cb() -> (ret: number) [in Lua] ih: identifies the
    ## element that activated the event. Returns: if IUP_IGNORE, it
    ## prevents the dialog from being closed. If you destroy the
    ## dialog in this callback, you must return IUP_IGNORE. IUP_CLOSE
    ## will be processed. Affects IupDialog
    SetCallback(cast[PIhandle](ih), cstring("CLOSE_CB"), cast[Icallback](cb))

proc `close_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("CLOSE_CB"), cast[Icallback](cb))

proc `close_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("CLOSE_CB")))

proc `destroy_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragend_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropfiles_cb=`*(ih: FileDlg_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `dropfiles_cb`*(ih: FileDlg_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `enterwindow_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `enterwindow_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `file_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cstring): cint {.cdecl.}) {.cdecl.} =
    ## When saving a file, the overwrite check is done before the
    ## FILE_CB callback is called with status=OK. If the application
    ## wants to add an extension to the file name inside the FILE_CB
    ## callback when status=OK, then it must manually check if the
    ## file with the extension exits and asks the user if the file
    ## should be replaced, if not then the callback can set the FILE
    ## attribute and returns IUP_CONTINUE, so the file dialog will
    ## remain open and the user will have an opportunity to change the
    ## file name now that it contains the extension.
    SetCallback(cast[PIhandle](ih), cstring("FILE_CB"), cast[Icallback](cb))

proc `file_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FILE_CB"), cast[Icallback](cb))

proc `file_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FILE_CB")))

proc `focus_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FOCUS_CB")))

proc `getfocus_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `getfocus_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `killfocus_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `killfocus_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `k_any`*(ih: FileDlg_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `leavewindow_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `resize_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `resize_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RESIZE_CB"), cast[Icallback](cb))

proc `resize_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RESIZE_CB")))

proc `show_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `show_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SHOW_CB"), cast[Icallback](cb))

proc `show_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SHOW_CB")))

proc `trayclick_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("TRAYCLICK_CB"), cast[Icallback](cb))

proc `trayclick_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("TRAYCLICK_CB"), cast[Icallback](cb))

proc `trayclick_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("TRAYCLICK_CB")))

proc `unmap_cb=`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: FileDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: FileDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

