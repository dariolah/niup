when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: MessageDlg
##
## NIUP type: MessageDlg_t
##
## constructors
##
##    proc MessageDlg(): MessageDlg_t
##

proc MessageDlg*(): MessageDlg_t {.cdecl.} =
    ## Creates the Message Dialog element. It is a predefined dialog
    ## for displaying a message. The dialog can be shown with the
    ## IupPopup function only.
    return MessageDlg_t(niupc.MessageDlg())

proc `active=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `activewindow`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVEWINDOW")) == "YES"

proc `background=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(value))

proc `background`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(value))

proc `background=`*(ih: MessageDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(&"{red} {green} {blue} {alpha}"))

proc `background`*(ih: MessageDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"), cstring(&"{red} {green} {blue} {alpha}"))

proc `background`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BACKGROUND"))

proc `bgcolor=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: MessageDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: MessageDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `border=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDER")) == "YES"

proc `bordersize`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDERSIZE"))

proc `bringfront=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring(value))

proc `bringfront`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring(value))

proc `bringfront=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring((if yes: "YES" else: "NO")))

proc `bringfront`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT"), cstring((if yes: "YES" else: "NO")))

proc `bringfront`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BRINGFRONT")) == "YES"

proc `buttondefault=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    ## BUTTONDEFAULT: Number of the default button. Can be "1", "2" or
    ## "3". "2" is valid only for "RETRYCANCEL", "OKCANCEL" and
    ## "YESNO" button configurations. "3" is valid only for
    ## "YESNOCANCEL". Default: "1".
    SetAttribute(cast[PIhandle](ih), cstring("BUTTONDEFAULT"), cstring(value))

proc `buttondefault`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BUTTONDEFAULT"), cstring(value))

proc `buttondefault`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTONDEFAULT"))

proc `buttonresponse=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    ## BUTTONRESPONSE: Number of the pressed button. Can be "1", "2"
    ## or "3". Default: "1".
    SetAttribute(cast[PIhandle](ih), cstring("BUTTONRESPONSE"), cstring(value))

proc `buttonresponse`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BUTTONRESPONSE"), cstring(value))

proc `buttonresponse`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTONRESPONSE"))

proc `buttons=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    ## BUTTONS: Buttons configuration. Can have values: "OK",
    ## "OKCANCEL", "RETRYCANCEL", "YESNO", or "YESNOCANCEL". Default:
    ## "OK". Additionally the "Help" button is displayed if the
    ## HELP_CB callback is defined. (RETRYCANCEL and YESNOCANCEL since
    ## 3.16)
    SetAttribute(cast[PIhandle](ih), cstring("BUTTONS"), cstring(value))

proc `buttons`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BUTTONS"), cstring(value))

proc `buttons`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BUTTONS"))

proc `canfocus=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `charsize`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `childoffset=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(value))

proc `childoffset`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(value))

proc `childoffset=`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(&"{width}x{height}"))

proc `childoffset`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"), cstring(&"{width}x{height}"))

proc `childoffset`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHILDOFFSET"))

proc `clientoffset`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTOFFSET"))

proc `clientsize=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(value))

proc `clientsize`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(value))

proc `clientsize=`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(&"{width}x{height}"))

proc `clientsize`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"), cstring(&"{width}x{height}"))

proc `clientsize`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIENTSIZE"))

proc `composited=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring(value))

proc `composited`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring(value))

proc `composited=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring((if yes: "YES" else: "NO")))

proc `composited`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("COMPOSITED"), cstring((if yes: "YES" else: "NO")))

proc `composited`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COMPOSITED")) == "YES"

proc `control=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring(value))

proc `control`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring(value))

proc `control=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring((if yes: "YES" else: "NO")))

proc `control`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CONTROL"), cstring((if yes: "YES" else: "NO")))

proc `control`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CONTROL")) == "YES"

proc `cursor=`*(ih: MessageDlg_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: MessageDlg_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("CURSOR"), cast[PIhandle](handle))

proc `cursor`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CURSOR"))

proc `customframe=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring(value))

proc `customframe`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring(value))

proc `customframe=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring((if yes: "YES" else: "NO")))

proc `customframe`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME"), cstring((if yes: "YES" else: "NO")))

proc `customframe`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAME")) == "YES"

proc `customframesimulate=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring(value))

proc `customframesimulate`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring(value))

proc `customframesimulate=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring((if yes: "YES" else: "NO")))

proc `customframesimulate`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE"), cstring((if yes: "YES" else: "NO")))

proc `customframesimulate`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CUSTOMFRAMESIMULATE")) == "YES"

proc `defaultenter=`*(ih: MessageDlg_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTENTER"), cast[PIhandle](handle))

proc `defaultenter`*(ih: MessageDlg_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTENTER"), cast[PIhandle](handle))

proc `defaultenter`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DEFAULTENTER"))

proc `defaultesc=`*(ih: MessageDlg_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTESC"), cast[PIhandle](handle))

proc `defaultesc`*(ih: MessageDlg_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("DEFAULTESC"), cast[PIhandle](handle))

proc `defaultesc`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DEFAULTESC"))

proc `dialogframe=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring(value))

proc `dialogframe`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring(value))

proc `dialogframe=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring((if yes: "YES" else: "NO")))

proc `dialogframe`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME"), cstring((if yes: "YES" else: "NO")))

proc `dialogframe`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIALOGFRAME")) == "YES"

proc `dialoghint=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring(value))

proc `dialoghint`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring(value))

proc `dialoghint=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring((if yes: "YES" else: "NO")))

proc `dialoghint`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT"), cstring((if yes: "YES" else: "NO")))

proc `dialoghint`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIALOGHINT")) == "YES"

proc `dialogtype=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    ## DIALOGTYPE: Type of dialog defines which icon will be displayed
    ## besides the message text. Can have values: "MESSAGE" (No Icon),
    ## "ERROR" (Stop-sign), "WARNING" (Exclamation-point), "QUESTION"
    ## (Question-mark) or "INFORMATION" (Letter "i"). Default:
    ## "MESSAGE".
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGTYPE"), cstring(value))

proc `dialogtype`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DIALOGTYPE"), cstring(value))

proc `dialogtype`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DIALOGTYPE"))

proc `dragdrop=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragsource=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary messagedlg
proc `dragtypes`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

proc `dropfilestarget=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary messagedlg
proc `droptypes`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `expand=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: MessageDlg_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: MessageDlg_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `floating=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary messagedlg
proc `font`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary messagedlg
proc `fontface`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: MessageDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: MessageDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary messagedlg
proc `fontstyle`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `fullscreen=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring(value))

proc `fullscreen`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring(value))

proc `fullscreen=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring((if yes: "YES" else: "NO")))

proc `fullscreen`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FULLSCREEN"), cstring((if yes: "YES" else: "NO")))

proc `handlename=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary messagedlg
proc `handlename`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

proc `helpbutton=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring(value))

proc `helpbutton`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring(value))

proc `helpbutton=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring((if yes: "YES" else: "NO")))

proc `helpbutton`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON"), cstring((if yes: "YES" else: "NO")))

proc `helpbutton`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HELPBUTTON")) == "YES"

proc `hidetaskbar=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring(value))

proc `hidetaskbar`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring(value))

proc `hidetaskbar=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring((if yes: "YES" else: "NO")))

proc `hidetaskbar`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR"), cstring((if yes: "YES" else: "NO")))

proc `hidetaskbar`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDETASKBAR")) == "YES"

proc `hidetitlebar=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETITLEBAR"), cstring(value))

proc `hidetitlebar`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HIDETITLEBAR"), cstring(value))

# TODO ??? String Binary messagedlg
proc `hidetitlebar`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HIDETITLEBAR"))

proc `icon=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ICON"), cstring(value))

proc `icon`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ICON"), cstring(value))

# TODO ??? String Binary messagedlg
proc `icon`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ICON"))

proc `maxbox=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring(value))

proc `maxbox`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring(value))

proc `maxbox=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring((if yes: "YES" else: "NO")))

proc `maxbox`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXBOX"), cstring((if yes: "YES" else: "NO")))

proc `maxbox`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXBOX")) == "YES"

proc `maximized`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXIMIZED")) == "YES"

proc `maxsize=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `mdichild=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring(value))

proc `mdichild`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring(value))

proc `mdichild=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring((if yes: "YES" else: "NO")))

proc `mdichild`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICHILD"), cstring((if yes: "YES" else: "NO")))

proc `mdichild`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDICHILD")) == "YES"

proc `mdiclient=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring(value))

proc `mdiclient`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring(value))

proc `mdiclient=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring((if yes: "YES" else: "NO")))

proc `mdiclient`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDICLIENT"), cstring((if yes: "YES" else: "NO")))

proc `mdiclient`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDICLIENT")) == "YES"

proc `mdiframe=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring(value))

proc `mdiframe`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring(value))

proc `mdiframe=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring((if yes: "YES" else: "NO")))

proc `mdiframe`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MDIFRAME"), cstring((if yes: "YES" else: "NO")))

proc `mdiframe`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDIFRAME")) == "YES"

proc `mdimenu=`*(ih: MessageDlg_t, handle: Menu_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("MDIMENU"), cast[PIhandle](handle))

proc `mdimenu`*(ih: MessageDlg_t, handle: Menu_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("MDIMENU"), cast[PIhandle](handle))

proc `mdimenu`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MDIMENU"))

proc `menu=`*(ih: MessageDlg_t, handle: Menu_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("MENU"), cast[PIhandle](handle))

proc `menu`*(ih: MessageDlg_t, handle: Menu_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("MENU"), cast[PIhandle](handle))

proc `menu`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MENU"))

proc `menubox=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring(value))

proc `menubox`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring(value))

proc `menubox=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring((if yes: "YES" else: "NO")))

proc `menubox`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MENUBOX"), cstring((if yes: "YES" else: "NO")))

proc `menubox`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MENUBOX")) == "YES"

proc `minbox=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring(value))

proc `minbox`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring(value))

proc `minbox=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring((if yes: "YES" else: "NO")))

proc `minbox`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINBOX"), cstring((if yes: "YES" else: "NO")))

proc `minbox`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINBOX")) == "YES"

proc `minsize=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `modal`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MODAL")) == "YES"

proc `nactive=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring(value))

proc `nactive`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring(value))

proc `nactive=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `nactive`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `nactive`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NACTIVE")) == "YES"

proc `name=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary messagedlg
proc `name`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `nativeparent=`*(ih: MessageDlg_t, handle: User_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("NATIVEPARENT"), cast[PIhandle](handle))

proc `nativeparent`*(ih: MessageDlg_t, handle: User_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("NATIVEPARENT"), cast[PIhandle](handle))

proc `nativeparent`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATIVEPARENT"))

proc `naturalsize`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `noflush=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring(value))

proc `noflush`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring(value))

proc `noflush=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring((if yes: "YES" else: "NO")))

proc `noflush`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NOFLUSH"), cstring((if yes: "YES" else: "NO")))

proc `noflush`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NOFLUSH")) == "YES"

proc `normalizergroup=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary messagedlg
proc `normalizergroup`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary messagedlg
proc `ntheme`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `opacity=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(value))

proc `opacity`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(value))

proc `opacity=`*(ih: MessageDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(&"{x}"))

proc `opacity`*(ih: MessageDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITY"), cstring(&"{x}"))

proc `opacity`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OPACITY"))

proc `opacityimage=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITYIMAGE"), cstring(value))

proc `opacityimage`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OPACITYIMAGE"), cstring(value))

# TODO ??? String Binary messagedlg
proc `opacityimage`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OPACITYIMAGE"))

# TODO unknown: messagedlg PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: messagedlg PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `parentdialog=`*(ih: MessageDlg_t, handle: IUPhandle_t) {.cdecl.} =
    ## PARENTDIALOG (creation only): Name of a dialog to be used as
    ## parent. This dialog will be always in front of the parent
    ## dialog. If not defined in Motif the dialog could not be modal.
    ## In Windows, if PARENTDIALOG is specified then it will be modal
    ## relative only to its parent.
    SetAttributeHandle(cast[PIhandle](ih), cstring("PARENTDIALOG"), cast[PIhandle](handle))

proc `parentdialog`*(ih: MessageDlg_t, handle: IUPhandle_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("PARENTDIALOG"), cast[PIhandle](handle))

proc `parentdialog`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PARENTDIALOG"))

proc `placement=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PLACEMENT"), cstring(value))

proc `placement`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PLACEMENT"), cstring(value))

proc `placement`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PLACEMENT"))

proc `position=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: MessageDlg_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: MessageDlg_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `resize=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring(value))

proc `resize=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring((if yes: "YES" else: "NO")))

proc `resize`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RESIZE"), cstring((if yes: "YES" else: "NO")))

proc `resize`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RESIZE")) == "YES"

proc `saveunder=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring(value))

proc `saveunder`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring(value))

proc `saveunder=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring((if yes: "YES" else: "NO")))

proc `saveunder`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER"), cstring((if yes: "YES" else: "NO")))

proc `saveunder`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SAVEUNDER")) == "YES"

proc `screenposition`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `shapeimage=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHAPEIMAGE"), cstring(value))

proc `shapeimage`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHAPEIMAGE"), cstring(value))

# TODO ??? String Binary messagedlg
proc `shapeimage`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHAPEIMAGE"))

proc `shownofocus=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring(value))

proc `shownofocus`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring(value))

proc `shownofocus=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `shownofocus`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `shownofocus`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWNOFOCUS")) == "YES"

proc `shrink=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring(value))

proc `shrink`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring(value))

proc `shrink=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring((if yes: "YES" else: "NO")))

proc `shrink`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHRINK"), cstring((if yes: "YES" else: "NO")))

proc `shrink`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHRINK")) == "YES"

proc `simulatemodal=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring(value))

proc `simulatemodal`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring(value))

proc `simulatemodal=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring((if yes: "YES" else: "NO")))

proc `simulatemodal`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIMULATEMODAL"), cstring((if yes: "YES" else: "NO")))

proc `size=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size=`*(ih: MessageDlg_t, width: string, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: MessageDlg_t, width: string, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size=`*(ih: MessageDlg_t, width: int, height:string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: MessageDlg_t, width: int, height:string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `startfocus=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STARTFOCUS"), cstring(value))

proc `startfocus`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("STARTFOCUS"), cstring(value))

# TODO ??? String Binary messagedlg
proc `startfocus`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("STARTFOCUS"))

proc `theme=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary messagedlg
proc `theme`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary messagedlg
proc `tip`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: MessageDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: MessageDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: MessageDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: MessageDlg_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: MessageDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: MessageDlg_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary messagedlg
proc `tipicon`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary messagedlg
proc `tipmarkup`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: MessageDlg_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: MessageDlg_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `title=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    ## TITLE: Dialog title.
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

proc `title`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TITLE"), cstring(value))

# TODO ??? String Binary messagedlg
proc `title`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TITLE"))

proc `toolbox=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring(value))

proc `toolbox`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring(value))

proc `toolbox=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring((if yes: "YES" else: "NO")))

proc `toolbox`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOOLBOX"), cstring((if yes: "YES" else: "NO")))

proc `toolbox`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOOLBOX")) == "YES"

proc `topmost=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring(value))

proc `topmost`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring(value))

proc `topmost=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring((if yes: "YES" else: "NO")))

proc `topmost`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPMOST"), cstring((if yes: "YES" else: "NO")))

proc `tray=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring(value))

proc `tray`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring(value))

proc `tray=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring((if yes: "YES" else: "NO")))

proc `tray`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAY"), cstring((if yes: "YES" else: "NO")))

proc `tray`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAY")) == "YES"

proc `trayimage=`*(ih: MessageDlg_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TRAYIMAGE"), cast[PIhandle](handle))

proc `trayimage`*(ih: MessageDlg_t, handle: Image_t | ImageRGB_t | ImageRGBA_t) {.cdecl.} =
    SetAttributeHandle(cast[PIhandle](ih), cstring("TRAYIMAGE"), cast[PIhandle](handle))

proc `trayimage`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAYIMAGE"))

proc `traytip=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIP"), cstring(value))

proc `traytip`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIP"), cstring(value))

# TODO ??? String Binary messagedlg
proc `traytip`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAYTIP"))

proc `traytipmarkup=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIPMARKUP"), cstring(value))

proc `traytipmarkup`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TRAYTIPMARKUP"), cstring(value))

# TODO ??? String Binary messagedlg
proc `traytipmarkup`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TRAYTIPMARKUP"))

proc `usersize=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: MessageDlg_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `value=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    ## VALUE: Message text.
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

# TODO ??? String Binary messagedlg
proc `value`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `visible=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: MessageDlg_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: MessageDlg_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `wid`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

# TODO unknown: messagedlg XFONTID Unknown Binary
proc `xfontid`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

# TODO unknown: messagedlg XWINDOW Unknown Binary
proc `xwindow`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XWINDOW"))

proc `y`*(ih: MessageDlg_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `zorder=`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: MessageDlg_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `close_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## CLOSE_CB CLOSE_CB Called just before a dialog is closed when
    ## the user clicks the close button of the title bar or an
    ## equivalent action. Callback int function(Ihandle \*ih); [in C]
    ## ih:close_cb() -> (ret: number) [in Lua] ih: identifies the
    ## element that activated the event. Returns: if IUP_IGNORE, it
    ## prevents the dialog from being closed. If you destroy the
    ## dialog in this callback, you must return IUP_IGNORE. IUP_CLOSE
    ## will be processed. Affects IupDialog
    SetCallback(cast[PIhandle](ih), cstring("CLOSE_CB"), cast[Icallback](cb))

proc `close_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("CLOSE_CB"), cast[Icallback](cb))

proc `close_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("CLOSE_CB")))

proc `destroy_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragend_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropfiles_cb=`*(ih: MessageDlg_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `dropfiles_cb`*(ih: MessageDlg_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `enterwindow_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `enterwindow_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `focus_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, focus: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("FOCUS_CB"), cast[Icallback](cb))

proc `focus_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("FOCUS_CB")))

proc `getfocus_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `getfocus_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `killfocus_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `killfocus_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `k_any`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `leavewindow_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `postmessage_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `resize_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `resize_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, width, height: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("RESIZE_CB"), cast[Icallback](cb))

proc `resize_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("RESIZE_CB")))

proc `show_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `show_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SHOW_CB"), cast[Icallback](cb))

proc `show_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SHOW_CB")))

proc `trayclick_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("TRAYCLICK_CB"), cast[Icallback](cb))

proc `trayclick_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle, but, pressed, dclick: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("TRAYCLICK_CB"), cast[Icallback](cb))

proc `trayclick_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("TRAYCLICK_CB")))

proc `unmap_cb=`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: MessageDlg_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: MessageDlg_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

