when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: MultiLine
##
## NIUP type: MultiLine_t
##
## constructors
##
##    proc MultiLine(action: string): MultiLine_t
##
##    proc MultiLine(): MultiLine_t
##

proc MultiLine*(action: string): MultiLine_t {.cdecl.} =
    ## Creates an editable field with one or more lines. Since IUP
    ## 3.0, IupText has support for multiple lines when the MULTILINE
    ## attribute is set to YES. Now when a IupMultiline element is
    ## created in fact a IupText element with MULTILINE=YES is
    ## created. See IupText
    return MultiLine_t(niupc.MultiLine(cstring(action)))

proc MultiLine*(): MultiLine_t {.cdecl.} =
    ## Creates an editable field with one or more lines. Since IUP
    ## 3.0, IupText has support for multiple lines when the MULTILINE
    ## attribute is set to YES. Now when a IupMultiline element is
    ## created in fact a IupText element with MULTILINE=YES is
    ## created. See IupText
    return MultiLine_t(niupc.MultiLine(nil))

proc `active=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `addformattag=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG"), cstring(value))

proc `addformattag`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG"), cstring(value))

# TODO ??? String Binary multiline
proc `addformattag`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG"))

proc `addformattag_handle=`*(ih: MultiLine_t, handle: User_t) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG_HANDLE"), cstring(cast[cstring](handle)))

proc `addformattag_handle`*(ih: MultiLine_t, handle: User_t) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG_HANDLE"), cstring(cast[cstring](handle)))

proc `addformattag_handle`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG_HANDLE"))

proc `alignment=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"))

proc `append=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPEND"), cstring(value))

proc `append`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPEND"), cstring(value))

# TODO ??? String Binary multiline
proc `appendnewline=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPENDNEWLINE"), cstring(value))

proc `appendnewline`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPENDNEWLINE"), cstring(value))

proc `appendnewline=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPENDNEWLINE"), cstring((if yes: "YES" else: "NO")))

proc `appendnewline`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPENDNEWLINE"), cstring((if yes: "YES" else: "NO")))

proc `appendnewline`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("APPENDNEWLINE")) == "YES"

proc `autohide=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring(value))

proc `autohide`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring(value))

proc `autohide=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `autohide`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `autohide`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE")) == "YES"

proc `bgcolor=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: MultiLine_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: MultiLine_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `border=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDER")) == "YES"

proc `canfocus=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `caret=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(value))

proc `caret`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(value))

proc `caret=`*(ih: MultiLine_t, lin, col:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(&"{lin},{col}"))

proc `caret`*(ih: MultiLine_t, lin, col:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(&"{lin},{col}"))

proc `caret`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CARET"))

proc `caretpos=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(value))

proc `caretpos`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(value))

proc `caretpos=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(&"{x}"))

proc `caretpos`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(&"{x}"))

proc `caretpos`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CARETPOS"))

proc `changecase=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHANGECASE"), cstring(value))

proc `changecase`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHANGECASE"), cstring(value))

proc `charsize`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `clipboard=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIPBOARD"), cstring(value))

proc `clipboard`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIPBOARD"), cstring(value))

proc `clipboard`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIPBOARD"))

proc `count`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COUNT"))

proc `cpadding=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding=`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CPADDING"))

proc `cuebanner=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUEBANNER"), cstring(value))

proc `cuebanner`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUEBANNER"), cstring(value))

# TODO ??? String Binary multiline
proc `cuebanner`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CUEBANNER"))

proc `dragdrop=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragsource=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary multiline
proc `dragtypes`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

proc `dropfilestarget=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary multiline
proc `droptypes`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `expand=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: MultiLine_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: MultiLine_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `fgcolor=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor=`*(ih: MultiLine_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: MultiLine_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"))

proc `filter=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FILTER"), cstring(value))

proc `filter`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FILTER"), cstring(value))

proc `filter`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FILTER"))

proc `floating=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary multiline
proc `font`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary multiline
proc `fontface`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary multiline
proc `fontstyle`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `formatting=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORMATTING"), cstring(value))

proc `formatting`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORMATTING"), cstring(value))

proc `formatting=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORMATTING"), cstring((if yes: "YES" else: "NO")))

proc `formatting`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORMATTING"), cstring((if yes: "YES" else: "NO")))

proc `formatting`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FORMATTING")) == "YES"

proc `handlename=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary multiline
proc `handlename`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

# TODO unknown: multiline INSERT Unknown Binary
proc `linecount`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINECOUNT"))

proc `linevalue`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINEVALUE"))

proc `mask=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASK"), cstring(value))

proc `mask`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASK"), cstring(value))

# TODO ??? String Binary multiline
proc `mask`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASK"))

proc `maskcasei=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring(value))

proc `maskcasei`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring(value))

proc `maskcasei=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring((if yes: "YES" else: "NO")))

proc `maskcasei`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring((if yes: "YES" else: "NO")))

proc `maskcasei`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKCASEI")) == "YES"

proc `maskdecimalsymbol=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKDECIMALSYMBOL"), cstring(value))

proc `maskdecimalsymbol`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKDECIMALSYMBOL"), cstring(value))

# TODO ??? String Binary multiline
proc `maskdecimalsymbol`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKDECIMALSYMBOL"))

proc `maskfloat=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(value))

proc `maskfloat`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(value))

proc `maskfloat=`*(ih: MultiLine_t, min, max:float) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(&"{min},{max}"))

proc `maskfloat`*(ih: MultiLine_t, min, max:float) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(&"{min},{max}"))

proc `maskfloat`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"))

proc `maskint=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(value))

proc `maskint`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(value))

proc `maskint=`*(ih: MultiLine_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(&"{min},{max}"))

proc `maskint`*(ih: MultiLine_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(&"{min},{max}"))

proc `maskint`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKINT"))

proc `masknoempty=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring(value))

proc `masknoempty`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring(value))

proc `masknoempty=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring((if yes: "YES" else: "NO")))

proc `masknoempty`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring((if yes: "YES" else: "NO")))

proc `masknoempty`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY")) == "YES"

proc `maskreal=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKREAL"), cstring(value))

proc `maskreal`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKREAL"), cstring(value))

proc `maskreal`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKREAL"))

proc `maxsize=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `multiline=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring(value))

proc `multiline`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring(value))

proc `multiline=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring((if yes: "YES" else: "NO")))

proc `multiline`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring((if yes: "YES" else: "NO")))

proc `multiline`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MULTILINE")) == "YES"

proc `name=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary multiline
proc `name`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `nc=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(value))

proc `nc`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(value))

proc `nc=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(&"{x}"))

proc `nc`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(&"{x}"))

proc `nc`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NC"))

proc `normalizergroup=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary multiline
proc `normalizergroup`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary multiline
proc `ntheme`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `overwrite=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OVERWRITE"), cstring(value))

proc `overwrite`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OVERWRITE"), cstring(value))

proc `overwrite=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OVERWRITE"), cstring((if yes: "YES" else: "NO")))

proc `overwrite`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OVERWRITE"), cstring((if yes: "YES" else: "NO")))

proc `overwrite`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OVERWRITE")) == "YES"

proc `padding=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(value))

proc `padding`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(value))

proc `padding=`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(&"{width}x{height}"))

proc `padding`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(&"{width}x{height}"))

proc `padding`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PADDING"))

# TODO unknown: multiline PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: multiline PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `password=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PASSWORD"), cstring(value))

proc `password`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PASSWORD"), cstring(value))

proc `password=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PASSWORD"), cstring((if yes: "YES" else: "NO")))

proc `password`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PASSWORD"), cstring((if yes: "YES" else: "NO")))

proc `password`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PASSWORD")) == "YES"

proc `position=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: MultiLine_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: MultiLine_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `readonly=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring(value))

proc `readonly`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring(value))

proc `readonly=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring((if yes: "YES" else: "NO")))

proc `readonly`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring((if yes: "YES" else: "NO")))

proc `readonly`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("READONLY")) == "YES"

proc `removeformatting=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("REMOVEFORMATTING"), cstring(value))

proc `removeformatting`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("REMOVEFORMATTING"), cstring(value))

proc `screenposition`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `scrollbar=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR")) == "YES"

proc `scrollto=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(value))

proc `scrollto`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(value))

proc `scrollto=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(&"{x}"))

proc `scrollto`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(&"{x}"))

proc `scrolltopos=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(value))

proc `scrolltopos`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(value))

proc `scrolltopos=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(&"{x}"))

proc `scrolltopos`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(&"{x}"))

proc `selectedtext=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTEDTEXT"), cstring(value))

proc `selectedtext`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTEDTEXT"), cstring(value))

# TODO ??? String Binary multiline
proc `selectedtext`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SELECTEDTEXT"))

proc `selection=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(value))

proc `selection`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(value))

proc `selection=`*(ih: MultiLine_t, lin1,col1,lin2,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{lin1},{col1}:{lin2},{col2}"))

proc `selection`*(ih: MultiLine_t, lin1,col1,lin2,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{lin1},{col1}:{lin2},{col2}"))

proc `selection=`*(ih: MultiLine_t, col1,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{col1}:{col2}"))

proc `selection`*(ih: MultiLine_t, col1,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{col1}:{col2}"))

proc `selection`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SELECTION"))

proc `selectionpos=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(value))

proc `selectionpos`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(value))

proc `selectionpos=`*(ih: MultiLine_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(&"{min},{max}"))

proc `selectionpos`*(ih: MultiLine_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(&"{min},{max}"))

proc `selectionpos`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"))

proc `size=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `spin=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPIN"), cstring(value))

proc `spin`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPIN"), cstring(value))

proc `spin=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPIN"), cstring((if yes: "YES" else: "NO")))

proc `spin`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPIN"), cstring((if yes: "YES" else: "NO")))

proc `spin`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPIN")) == "YES"

proc `spinalign=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINALIGN"), cstring(value))

proc `spinalign`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINALIGN"), cstring(value))

proc `spinalign`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINALIGN"))

proc `spinauto=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINAUTO"), cstring(value))

proc `spinauto`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINAUTO"), cstring(value))

proc `spinauto=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINAUTO"), cstring((if yes: "YES" else: "NO")))

proc `spinauto`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINAUTO"), cstring((if yes: "YES" else: "NO")))

proc `spinauto`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINAUTO")) == "YES"

proc `spininc=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPININC"), cstring(value))

proc `spininc`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPININC"), cstring(value))

proc `spininc=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPININC"), cstring(&"{x}"))

proc `spininc`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPININC"), cstring(&"{x}"))

proc `spininc`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPININC"))

proc `spinmax=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMAX"), cstring(value))

proc `spinmax`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMAX"), cstring(value))

proc `spinmax=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMAX"), cstring(&"{x}"))

proc `spinmax`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMAX"), cstring(&"{x}"))

proc `spinmax`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINMAX"))

proc `spinmin=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMIN"), cstring(value))

proc `spinmin`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMIN"), cstring(value))

proc `spinmin=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMIN"), cstring(&"{x}"))

proc `spinmin`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMIN"), cstring(&"{x}"))

proc `spinmin`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINMIN"))

proc `spinvalue=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINVALUE"), cstring(value))

proc `spinvalue`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINVALUE"), cstring(value))

proc `spinvalue=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINVALUE"), cstring(&"{x}"))

proc `spinvalue`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINVALUE"), cstring(&"{x}"))

proc `spinvalue`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINVALUE"))

proc `spinwrap=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINWRAP"), cstring(value))

proc `spinwrap`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINWRAP"), cstring(value))

proc `spinwrap=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINWRAP"), cstring((if yes: "YES" else: "NO")))

proc `spinwrap`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINWRAP"), cstring((if yes: "YES" else: "NO")))

proc `spinwrap`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINWRAP")) == "YES"

proc `tabsize=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TABSIZE"), cstring(value))

proc `tabsize`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TABSIZE"), cstring(value))

proc `tabsize=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TABSIZE"), cstring(&"{x}"))

proc `tabsize`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TABSIZE"), cstring(&"{x}"))

proc `tabsize`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TABSIZE"))

proc `theme=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary multiline
proc `theme`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary multiline
proc `tip`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: MultiLine_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: MultiLine_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: MultiLine_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: MultiLine_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary multiline
proc `tipicon`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary multiline
proc `tipmarkup`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: MultiLine_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: MultiLine_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `usersize=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: MultiLine_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `value=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

# TODO ??? String Binary multiline
proc `value`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `valuemasked=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUEMASKED"), cstring(value))

proc `valuemasked`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUEMASKED"), cstring(value))

# TODO ??? String Binary multiline
proc `visible=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `visiblecolumns=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(value))

proc `visiblecolumns`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(value))

proc `visiblecolumns=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(&"{x}"))

proc `visiblecolumns`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(&"{x}"))

proc `visiblecolumns`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"))

proc `visiblelines=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(value))

proc `visiblelines`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(value))

proc `visiblelines=`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(&"{x}"))

proc `visiblelines`*(ih: MultiLine_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(&"{x}"))

proc `visiblelines`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"))

proc `wid`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `wordwrap=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WORDWRAP"), cstring(value))

proc `wordwrap`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WORDWRAP"), cstring(value))

proc `wordwrap=`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WORDWRAP"), cstring((if yes: "YES" else: "NO")))

proc `wordwrap`*(ih: MultiLine_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WORDWRAP"), cstring((if yes: "YES" else: "NO")))

proc `wordwrap`*(ih: MultiLine_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WORDWRAP")) == "YES"

proc `x`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

# TODO unknown: multiline XFONTID Unknown Binary
proc `xfontid`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `y`*(ih: MultiLine_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `zorder=`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: MultiLine_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `action=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.}) {.cdecl.} =
    ## ACTION ACTION Action generated when the element is activated.
    ## Affects each element differently. Callback int function(Ihandle
    ## \*ih); [in C] ih:action() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. In some
    ## elements, this callback may receive more parameters, apart from
    ## ih. Please refer to each element's documentation. Affects
    ## IupButton, IupItem, IupList, IupText, IupCanvas, IupMultiline,
    ## IupToggle
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: MultiLine_t, cb: proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION")))

proc `button_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    ## BUTTON_CB BUTTON_CB Action generated when a mouse button is
    ## pressed or released. Callback int function(Ihandle\* ih, int
    ## button, int pressed, int x, int y, char\* status); [in C]
    ## ih:button_cb(button, pressed, x, y: number, status: string) ->
    ## (ret: number) [in Lua] ih: identifies the element that
    ## activated the event. button: identifies the activated mouse
    ## button: IUP_BUTTON1 - left mouse button (button 1); IUP_BUTTON2
    ## - middle mouse button (button 2); IUP_BUTTON3 - right mouse
    ## button (button 3). pressed: indicates the state of the button:
    ## 0 - mouse button was released; 1 - mouse button was pressed. x,
    ## y: position in the canvas where the event has occurred, in
    ## pixels. status: status of the mouse buttons and some keyboard
    ## keys at the moment the event is generated. The following macros
    ## must be used for verification: iup_isshift(status)
    ## iup_iscontrol(status) iup_isbutton1(status)
    ## iup_isbutton2(status) iup_isbutton3(status)
    ## iup_isbutton4(status) iup_isbutton5(status)
    ## iup_isdouble(status) iup_isalt(status) iup_issys(status) They
    ## return 1 if the respective key or button is pressed, and 0
    ## otherwise. These macros are also available in Lua, returning a
    ## boolean. Returns: IUP_CLOSE will be processed. On some controls
    ## if IUP_IGNORE is returned the action is ignored (this is system
    ## dependent). Notes This callback can be used to customize a
    ## button behavior. For a standard button behavior use the ACTION
    ## callback of the IupButton. For a single click the callback is
    ## called twice, one for pressed=1 and one for pressed=0. Only
    ## after both calls the ACTION callback is called. In Windows, if
    ## a dialog is shown or popup in any situation there could be
    ## unpredictable results because the native system still has
    ## processing to be done even after the callback is called. A
    ## double click is preceded by two single clicks, one for
    ## pressed=1 and one for pressed=0, and followed by a press=0, all
    ## three without the double click flag set. In GTK, it is preceded
    ## by an additional two single clicks sequence. For example, for
    ## one double click all the following calls are made:
    ## BUTTON_CB(but=1 (1), x=154, y=83 [ 1 ]) BUTTON_CB(but=1 (0),
    ## x=154, y=83 [ 1 ]) BUTTON_CB(but=1 (1), x=154, y=83 [ 1 ]) (in
    ## GTK only) BUTTON_CB(but=1 (0), x=154, y=83 [ 1 ]) (in GTK only)
    ## BUTTON_CB(but=1 (1), x=154, y=83 [ 1 D ]) BUTTON_CB(but=1 (0),
    ## x=154, y=83 [ 1 ]) Between press and release all mouse events
    ## are redirected only to this control, even if the cursor moves
    ## outside the element. So the BUTTON_CB callback when released
    ## and the MOTION_CB callback can be called with coordinates
    ## outside the element rectangle. Affects IupCanvas, IupButton,
    ## IupText, IupList, IupGLCanvas
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BUTTON_CB")))

proc `caret_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, lin, col,  pos: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("CARET_CB"), cast[Icallback](cb))

proc `caret_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, lin, col,  pos: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("CARET_CB"), cast[Icallback](cb))

proc `caret_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("CARET_CB")))

proc `destroy_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragend_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropfiles_cb=`*(ih: MultiLine_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `dropfiles_cb`*(ih: MultiLine_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `enterwindow_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `enterwindow_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `getfocus_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `getfocus_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `killfocus_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `killfocus_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `k_any`*(ih: MultiLine_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `leavewindow_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `motion_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    ## MOTION_CB MOTION_CB Action generated when the mouse moves.
    ## Callback int function(Ihandle \*ih, int x, int y, char \*status);
    ## [in C] ih:motion_cb(x, y: number, status: string) -> (ret:
    ## number) [in Lua] ih: identifier of the element that activated
    ## the event. x, y: position in the canvas where the event has
    ## occurred, in pixels. status: status of mouse buttons and
    ## certain keyboard keys at the moment the event was generated.
    ## The same macros used for BUTTON_CB can be used for this status.
    ## Notes Between press and release all mouse events are redirected
    ## only to this control, even if the cursor moves outside the
    ## element. So the BUTTON_CB callback when released and the
    ## MOTION_CB callback can be called with coordinates outside the
    ## element rectangle. Affects IupCanvas, IupGLCanvas
    SetCallback(cast[PIhandle](ih), cstring("MOTION_CB"), cast[Icallback](cb))

proc `motion_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MOTION_CB"), cast[Icallback](cb))

proc `motion_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MOTION_CB")))

proc `postmessage_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `spin_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle, pos: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SPIN_CB"), cast[Icallback](cb))

proc `spin_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle, pos: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SPIN_CB"), cast[Icallback](cb))

proc `spin_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SPIN_CB")))

proc `unmap_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `valuechanged_cb=`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: MultiLine_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: MultiLine_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB")))

