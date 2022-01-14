when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: Text
##
## NIUP type: Text_t
##
## constructors
##
##    proc Text(action: string): Text_t
##
##    proc Text(): Text_t
##

proc Text*(action: string): Text_t {.cdecl.} =
    ## Creates an editable text field.
    return Text_t(niupc.Text(cstring(action)))

proc Text*(): Text_t {.cdecl.} =
    ## Creates an editable text field.
    return Text_t(niupc.Text(nil))

proc `active=`*(ih: Text_t, value: string) {.cdecl.} =
    ## ACTIVE, FONT, EXPAND, SCREENPOSITION, POSITION, MINSIZE,
    ## MAXSIZE, WID, TIP, RASTERSIZE, ZORDER, VISIBLE, THEME: also
    ## accepted.
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `addformattag=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG"), cstring(value))

proc `addformattag`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG"), cstring(value))

# TODO ??? String Binary text
proc `addformattag`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG"))

proc `addformattag_handle=`*(ih: Text_t, handle: User_t) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG_HANDLE"), cstring(cast[cstring](handle)))

proc `addformattag_handle`*(ih: Text_t, handle: User_t) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG_HANDLE"), cstring(cast[cstring](handle)))

proc `addformattag_handle`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ADDFORMATTAG_HANDLE"))

proc `alignment=`*(ih: Text_t, value: string) {.cdecl.} =
    ## ALIGNMENT [Windows and GTK Only] (non inheritable): horizontal
    ## text alignment. Possible values: "ALEFT", "ARIGHT", "ACENTER".
    ## Default: "ALEFT". In Motif, text is always left aligned.
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"), cstring(value))

proc `alignment`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ALIGNMENT"))

proc `append=`*(ih: Text_t, value: string) {.cdecl.} =
    ## APPEND (write-only): Inserts a text at the end of the current
    ## text. In the Multiline, if APPENDNEWLINE=YES, a "\n" character
    ## will be automatically inserted before the appended text if the
    ## current text is not empty(APPENDNEWLINE default is YES).
    ## Ignored if set before map.
    SetAttribute(cast[PIhandle](ih), cstring("APPEND"), cstring(value))

proc `append`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPEND"), cstring(value))

# TODO ??? String Binary text
proc `appendnewline=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPENDNEWLINE"), cstring(value))

proc `appendnewline`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPENDNEWLINE"), cstring(value))

proc `appendnewline=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPENDNEWLINE"), cstring((if yes: "YES" else: "NO")))

proc `appendnewline`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPENDNEWLINE"), cstring((if yes: "YES" else: "NO")))

proc `appendnewline`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("APPENDNEWLINE")) == "YES"

proc `autohide=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring(value))

proc `autohide`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring(value))

proc `autohide=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `autohide`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `autohide`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE")) == "YES"

proc `bgcolor=`*(ih: Text_t, value: string) {.cdecl.} =
    ## BGCOLOR: Background color of the text. Default: the global
    ## attribute TXTBGCOLOR. Ignored in GTK when MULTILINE=NO.
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: Text_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Text_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `border=`*(ih: Text_t, value: string) {.cdecl.} =
    ## BORDER (creation only): Shows a border around the text.
    ## Default: "YES".
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring(value))

proc `border=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BORDER"), cstring((if yes: "YES" else: "NO")))

proc `border`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BORDER")) == "YES"

proc `canfocus=`*(ih: Text_t, value: string) {.cdecl.} =
    ## CANFOCUS (creation only) (non inheritable): enables the focus
    ## traversal of the control. In Windows the control will still get
    ## the focus when clicked. Default: YES. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `caret=`*(ih: Text_t, value: string) {.cdecl.} =
    ## CARET (non inheritable): Character position of the insertion
    ## point. Its format depends in MULTILINE=YES. The first position,
    ## lin or col, is "1".
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(value))

proc `caret`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(value))

proc `caret=`*(ih: Text_t, lin, col:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(&"{lin},{col}"))

proc `caret`*(ih: Text_t, lin, col:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(&"{lin},{col}"))

proc `caret`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CARET"))

proc `caretpos=`*(ih: Text_t, value: string) {.cdecl.} =
    ## CARETPOS (non inheritable): Also the character position of the
    ## insertion point, but using a zero based character unique index
    ## "pos". Useful for indexing the VALUE string. See the Notes
    ## below if using UTF-8 strings in GTK. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(value))

proc `caretpos`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(value))

proc `caretpos=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(&"{x}"))

proc `caretpos`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(&"{x}"))

proc `caretpos`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CARETPOS"))

proc `changecase=`*(ih: Text_t, value: string) {.cdecl.} =
    ## CHANGECASE (non inheritable): Change case according to given
    ## conversion. Can be UPPER, LOWER, TOGGLE, or TITLE. TITLE case
    ## change first letter of words separated by spaces to upper case
    ## others to lower case, but first letter is changed only if word
    ## has more than 3 characters, for instance: "Best of the World".
    ## Supports Latin-1 encoding only, even when using UTF-8. Does not
    ## depends on current locale. (since 3.28)
    SetAttribute(cast[PIhandle](ih), cstring("CHANGECASE"), cstring(value))

proc `changecase`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CHANGECASE"), cstring(value))

proc `charsize`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `clipboard=`*(ih: Text_t, value: string) {.cdecl.} =
    ## CLIPBOARD (write-only): clear, cut, copy or paste the selection
    ## to or from the clipboard. Values: "CLEAR", "CUT", "COPY" or
    ## "PASTE". In Windows UNDO is also available, and REDO is
    ## available when FORMATTING=YES. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("CLIPBOARD"), cstring(value))

proc `clipboard`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIPBOARD"), cstring(value))

proc `clipboard`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIPBOARD"))

proc `count`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COUNT"))

proc `cpadding=`*(ih: Text_t, value: string) {.cdecl.} =
    ## CPADDING: same as PADDING but using the units of the SIZE
    ## attribute. It will actually set the PADDING attribute. (since
    ## 3.29)
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding=`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CPADDING"))

proc `cuebanner=`*(ih: Text_t, value: string) {.cdecl.} =
    ## CUEBANNER [Windows and GTK Only] (non inheritable): a text that
    ## is displayed when there is no text at the control. It works as
    ## a textual cue, or tip to prompt the user for input. Valid only
    ## for MULTILINE=NO, and works only when Visual Styles are
    ## enabled. (since 3.0) [GTK 3.2] (GTK support added in IUP 3.20)
    SetAttribute(cast[PIhandle](ih), cstring("CUEBANNER"), cstring(value))

proc `cuebanner`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CUEBANNER"), cstring(value))

# TODO ??? String Binary text
proc `cuebanner`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CUEBANNER"))

proc `dragdrop=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragsource=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary text
proc `dragtypes`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

proc `dropfilestarget=`*(ih: Text_t, value: string) {.cdecl.} =
    ## DROPFILESTARGET [Windows and GTK Only] (non inheritable):
    ## Enable or disable the drop of files. Default: NO, but if
    ## DROPFILES_CB is defined when the element is mapped then it will
    ## be automatically enabled. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary text
proc `droptypes`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `expand=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: Text_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Text_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `fgcolor=`*(ih: Text_t, value: string) {.cdecl.} =
    ## FGCOLOR: Text color. Default: the global attribute TXTFGCOLOR.
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor=`*(ih: Text_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: Text_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"))

proc `filter=`*(ih: Text_t, value: string) {.cdecl.} =
    ## FILTER [Windows Only] (non inheritable): allows a custom filter
    ## to process the characters: Can be LOWERCASE, UPPERCASE or
    ## NUMBER (only numbers allowed). (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("FILTER"), cstring(value))

proc `filter`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FILTER"), cstring(value))

proc `filter`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FILTER"))

proc `floating=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary text
proc `font`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary text
proc `fontface`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary text
proc `fontstyle`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `formatting=`*(ih: Text_t, value: string) {.cdecl.} =
    ## FORMATTING [Windows and GTK Only] (non inheritable): When
    ## enabled allow the use of text formatting attributes. In GTK is
    ## always enabled, but only when MULTILINE=YES. Default: NO.
    ## (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("FORMATTING"), cstring(value))

proc `formatting`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORMATTING"), cstring(value))

proc `formatting=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORMATTING"), cstring((if yes: "YES" else: "NO")))

proc `formatting`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FORMATTING"), cstring((if yes: "YES" else: "NO")))

proc `formatting`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FORMATTING")) == "YES"

proc `handlename=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary text
proc `handlename`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

# TODO unknown: text INSERT Unknown Binary
proc `linecount`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINECOUNT"))

proc `linevalue`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("LINEVALUE"))

proc `mask=`*(ih: Text_t, value: string) {.cdecl.} =
    ## MASK (non inheritable): Defines a mask that will filter
    ## interactive text input.
    SetAttribute(cast[PIhandle](ih), cstring("MASK"), cstring(value))

proc `mask`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASK"), cstring(value))

# TODO ??? String Binary text
proc `mask`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASK"))

proc `maskcasei=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring(value))

proc `maskcasei`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring(value))

proc `maskcasei=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring((if yes: "YES" else: "NO")))

proc `maskcasei`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring((if yes: "YES" else: "NO")))

proc `maskcasei`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKCASEI")) == "YES"

proc `maskdecimalsymbol=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKDECIMALSYMBOL"), cstring(value))

proc `maskdecimalsymbol`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKDECIMALSYMBOL"), cstring(value))

# TODO ??? String Binary text
proc `maskdecimalsymbol`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKDECIMALSYMBOL"))

proc `maskfloat=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(value))

proc `maskfloat`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(value))

proc `maskfloat=`*(ih: Text_t, min, max:float) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(&"{min},{max}"))

proc `maskfloat`*(ih: Text_t, min, max:float) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(&"{min},{max}"))

proc `maskfloat`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"))

proc `maskint=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(value))

proc `maskint`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(value))

proc `maskint=`*(ih: Text_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(&"{min},{max}"))

proc `maskint`*(ih: Text_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(&"{min},{max}"))

proc `maskint`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKINT"))

proc `masknoempty=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring(value))

proc `masknoempty`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring(value))

proc `masknoempty=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring((if yes: "YES" else: "NO")))

proc `masknoempty`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring((if yes: "YES" else: "NO")))

proc `masknoempty`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY")) == "YES"

proc `maskreal=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKREAL"), cstring(value))

proc `maskreal`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKREAL"), cstring(value))

proc `maskreal`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKREAL"))

proc `maxsize=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `multiline=`*(ih: Text_t, value: string) {.cdecl.} =
    ## MULTILINE (creation only) (non inheritable): allows the edition
    ## of multiple lines. In single line mode some characters are
    ## invalid, like "\t", "\r" and "\n". Default: NO. When set to Yes
    ## will also reset the SCROLLBAR attribute to Yes. The values ALL
    ## and NONE are also accepted independently of MULTILINE (since
    ## 3.0).
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring(value))

proc `multiline`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring(value))

proc `multiline=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring((if yes: "YES" else: "NO")))

proc `multiline`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTILINE"), cstring((if yes: "YES" else: "NO")))

proc `multiline`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MULTILINE")) == "YES"

proc `name=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary text
proc `name`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `nc=`*(ih: Text_t, value: string) {.cdecl.} =
    ## NC: Maximum number of characters allowed for keyboard input,
    ## larger text can still be set using attributes. The maximum
    ## value is the limit of the VALUE attribute. The "0" value is the
    ## same as maximum. Default: maximum.
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(value))

proc `nc`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(value))

proc `nc=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(&"{x}"))

proc `nc`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(&"{x}"))

proc `nc`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NC"))

proc `normalizergroup=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary text
proc `normalizergroup`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary text
proc `ntheme`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `overwrite=`*(ih: Text_t, value: string) {.cdecl.} =
    ## OVERWRITE [Windows and GTK Only] (non inheritable): turns the
    ## overwrite mode ON or OFF. Works only when FORMATTING=YES.
    ## (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("OVERWRITE"), cstring(value))

proc `overwrite`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OVERWRITE"), cstring(value))

proc `overwrite=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OVERWRITE"), cstring((if yes: "YES" else: "NO")))

proc `overwrite`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("OVERWRITE"), cstring((if yes: "YES" else: "NO")))

proc `overwrite`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("OVERWRITE")) == "YES"

proc `padding=`*(ih: Text_t, value: string) {.cdecl.} =
    ## PADDING: internal margin. Works just like the MARGIN attribute
    ## of the IupHbox and IupVbox containers, but uses a different
    ## name to avoid inheritance problems. Default value: "0x0". In
    ## Windows, only the horizontal value is used. (since 3.0) (GTK
    ## 2.10 for single line)
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(value))

proc `padding`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(value))

proc `padding=`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(&"{width}x{height}"))

proc `padding`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(&"{width}x{height}"))

proc `padding`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PADDING"))

# TODO unknown: text PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: text PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `password=`*(ih: Text_t, value: string) {.cdecl.} =
    ## PASSWORD (creation only) [Windows and GTK Only] (non
    ## inheritable): Hide the typed character using an "\*". Default:
    ## "NO".
    SetAttribute(cast[PIhandle](ih), cstring("PASSWORD"), cstring(value))

proc `password`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PASSWORD"), cstring(value))

proc `password=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PASSWORD"), cstring((if yes: "YES" else: "NO")))

proc `password`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PASSWORD"), cstring((if yes: "YES" else: "NO")))

proc `password`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PASSWORD")) == "YES"

proc `position=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: Text_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Text_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: Text_t, value: string) {.cdecl.} =
    ## PROPAGATEFOCUS(non inheritable): enables the focus callback
    ## forwarding to the next native parent with FOCUS_CB defined.
    ## Default: NO. (since 3.23)
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `readonly=`*(ih: Text_t, value: string) {.cdecl.} =
    ## READONLY: Allows the user only to read the contents, without
    ## changing it. Restricts keyboard input only, text value can
    ## still be changed using attributes. Navigation keys are still
    ## available. Possible values: "YES", "NO". Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring(value))

proc `readonly`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring(value))

proc `readonly=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring((if yes: "YES" else: "NO")))

proc `readonly`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring((if yes: "YES" else: "NO")))

proc `readonly`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("READONLY")) == "YES"

proc `removeformatting=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("REMOVEFORMATTING"), cstring(value))

proc `removeformatting`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("REMOVEFORMATTING"), cstring(value))

proc `screenposition`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `scrollbar=`*(ih: Text_t, value: string) {.cdecl.} =
    ## SCROLLBAR (creation only): Valid only when MULTILINE=YES.
    ## Associates an automatic horizontal and/or vertical scrollbar to
    ## the multiline. Can be: "VERTICAL", "HORIZONTAL", "YES" (both)
    ## or "NO" (none). Default: "YES". For all systems, when
    ## SCROLLBAR!=NO the natural size will always include its size
    ## even if the native system hides the scrollbar. If AUTOHIDE=YES
    ## scrollbars are visible only if they are necessary, by default
    ## AUTOHIDE=NO. In Windows when FORMATTING=NO, AUTOHIDE is not
    ## supported. In Motif AUTOHIDE is not supported.
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR")) == "YES"

proc `scrollto=`*(ih: Text_t, value: string) {.cdecl.} =
    ## SCROLLTO (non inheritable, write only): Scroll the text to make
    ## the given character position visible. It uses the same format
    ## and reference of the CARET attribute ("lin:col" or "col"
    ## starting at 1). In Windows, when FORMATTING=Yes "col" is
    ## ignored. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(value))

proc `scrollto`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(value))

proc `scrollto=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(&"{x}"))

proc `scrollto`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(&"{x}"))

proc `scrolltopos=`*(ih: Text_t, value: string) {.cdecl.} =
    ## SCROLLTOPOS (non inheritable, write only): Scroll the text to
    ## make the given character position visible. It uses the same
    ## format and reference of the CARETPOS attribute ("pos" starting
    ## at 0). (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(value))

proc `scrolltopos`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(value))

proc `scrolltopos=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(&"{x}"))

proc `scrolltopos`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(&"{x}"))

proc `selectedtext=`*(ih: Text_t, value: string) {.cdecl.} =
    ## SELECTEDTEXT (non inheritable): Selection text. Returns NULL if
    ## there is no selection. When changed replaces the current
    ## selection. Similar to INSERT, but does nothing if there is no
    ## selection.
    SetAttribute(cast[PIhandle](ih), cstring("SELECTEDTEXT"), cstring(value))

proc `selectedtext`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTEDTEXT"), cstring(value))

# TODO ??? String Binary text
proc `selectedtext`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SELECTEDTEXT"))

proc `selection=`*(ih: Text_t, value: string) {.cdecl.} =
    ## SELECTION (non inheritable): Selection interval in characters.
    ## Returns NULL if there is no selection. Its format depends in
    ## MULTILINE=YES. The first position, lin or col, is "1".
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(value))

proc `selection`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(value))

proc `selection=`*(ih: Text_t, lin1,col1,lin2,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{lin1},{col1}:{lin2},{col2}"))

proc `selection`*(ih: Text_t, lin1,col1,lin2,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{lin1},{col1}:{lin2},{col2}"))

proc `selection=`*(ih: Text_t, col1,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{col1}:{col2}"))

proc `selection`*(ih: Text_t, col1,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{col1}:{col2}"))

proc `selection`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SELECTION"))

proc `selectionpos=`*(ih: Text_t, value: string) {.cdecl.} =
    ## SELECTIONPOS (non inheritable): Same as SELECTION but using a
    ## zero based character index "pos1:pos2". Useful for indexing the
    ## VALUE string. The values ALL and NONE are also accepted. See
    ## the Notes below if using UTF-8 strings in GTK. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(value))

proc `selectionpos`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(value))

proc `selectionpos=`*(ih: Text_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(&"{min},{max}"))

proc `selectionpos`*(ih: Text_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(&"{min},{max}"))

proc `selectionpos`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"))

proc `size=`*(ih: Text_t, value: string) {.cdecl.} =
    ## SIZE (non inheritable): Since the contents can be changed by
    ## the user, the Natural Size is not affected by the text contents
    ## (since 3.0). Use VISIBLECOLUMNS and VISIBLELINES to control the
    ## Natural Size.
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `spin=`*(ih: Text_t, value: string) {.cdecl.} =
    ## SPIN (non inheritable, creation only): enables a spin control
    ## attached to the element. Default: NO. The spin increments and
    ## decrements an integer number. The editing in the element is
    ## still available. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("SPIN"), cstring(value))

proc `spin`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPIN"), cstring(value))

proc `spin=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPIN"), cstring((if yes: "YES" else: "NO")))

proc `spin`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPIN"), cstring((if yes: "YES" else: "NO")))

proc `spin`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPIN")) == "YES"

proc `spinalign=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINALIGN"), cstring(value))

proc `spinalign`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINALIGN"), cstring(value))

proc `spinalign`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINALIGN"))

proc `spinauto=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINAUTO"), cstring(value))

proc `spinauto`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINAUTO"), cstring(value))

proc `spinauto=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINAUTO"), cstring((if yes: "YES" else: "NO")))

proc `spinauto`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINAUTO"), cstring((if yes: "YES" else: "NO")))

proc `spinauto`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINAUTO")) == "YES"

proc `spininc=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPININC"), cstring(value))

proc `spininc`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPININC"), cstring(value))

proc `spininc=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPININC"), cstring(&"{x}"))

proc `spininc`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPININC"), cstring(&"{x}"))

proc `spininc`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPININC"))

proc `spinmax=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMAX"), cstring(value))

proc `spinmax`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMAX"), cstring(value))

proc `spinmax=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMAX"), cstring(&"{x}"))

proc `spinmax`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMAX"), cstring(&"{x}"))

proc `spinmax`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINMAX"))

proc `spinmin=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMIN"), cstring(value))

proc `spinmin`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMIN"), cstring(value))

proc `spinmin=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMIN"), cstring(&"{x}"))

proc `spinmin`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINMIN"), cstring(&"{x}"))

proc `spinmin`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINMIN"))

proc `spinvalue=`*(ih: Text_t, value: string) {.cdecl.} =
    ## SPINVALUE (non inheritable): the current value of the spin. The
    ## value is limited to the minimum and maximum values. SPINMAX
    ## (non inheritable): the maximum value. Default: 100. SPINMIN
    ## (non inheritable): the minimum value. Default: 0. SPININC (non
    ## inheritable): the increment value. Default: 1. SPINALIGN
    ## (creation only): the position of the spin. Can be LEFT or
    ## RIGHT. Default: RIGHT. In GTK is always RIGHT. SPINWRAP
    ## (creation only): if the position reach a limit it continues
    ## from the opposite limit. Default: NO. SPINAUTO (creation only):
    ## enables the automatic update of the text contents. Default:
    ## YES. Use SPINAUTO=NO and the VALUE attribute during SPIN_CB to
    ## control the text contents when the spin is incremented.
    SetAttribute(cast[PIhandle](ih), cstring("SPINVALUE"), cstring(value))

proc `spinvalue`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINVALUE"), cstring(value))

proc `spinvalue=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINVALUE"), cstring(&"{x}"))

proc `spinvalue`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINVALUE"), cstring(&"{x}"))

proc `spinvalue`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINVALUE"))

proc `spinwrap=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINWRAP"), cstring(value))

proc `spinwrap`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINWRAP"), cstring(value))

proc `spinwrap=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINWRAP"), cstring((if yes: "YES" else: "NO")))

proc `spinwrap`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPINWRAP"), cstring((if yes: "YES" else: "NO")))

proc `spinwrap`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPINWRAP")) == "YES"

proc `tabsize=`*(ih: Text_t, value: string) {.cdecl.} =
    ## TABSIZE [Windows and GTK Only]: Valid only when MULTILINE=YES.
    ## Controls the number of characters for a tab stop. Default: 8.
    SetAttribute(cast[PIhandle](ih), cstring("TABSIZE"), cstring(value))

proc `tabsize`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TABSIZE"), cstring(value))

proc `tabsize=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TABSIZE"), cstring(&"{x}"))

proc `tabsize`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TABSIZE"), cstring(&"{x}"))

proc `tabsize`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TABSIZE"))

proc `theme=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary text
proc `theme`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary text
proc `tip`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: Text_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Text_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: Text_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Text_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary text
proc `tipicon`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary text
proc `tipmarkup`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: Text_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Text_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `usersize=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Text_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `value=`*(ih: Text_t, value: string) {.cdecl.} =
    ## VALUE (non inheritable): Text entered by the user. The '\n'
    ## character indicates a new line, valid only when MULTILINE=YES.
    ## After the element is mapped and if there is no text will return
    ## the empty string "".
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

# TODO ??? String Binary text
proc `value`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `valuemasked=`*(ih: Text_t, value: string) {.cdecl.} =
    ## VALUEMASKED (non inheritable) (write-only): sets VALUE but
    ## first checks if it is validated by MASK. If not does nothing.
    ## (since 3.4)
    SetAttribute(cast[PIhandle](ih), cstring("VALUEMASKED"), cstring(value))

proc `valuemasked`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUEMASKED"), cstring(value))

# TODO ??? String Binary text
proc `visible=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `visiblecolumns=`*(ih: Text_t, value: string) {.cdecl.} =
    ## VISIBLECOLUMNS: Defines the number of visible columns for the
    ## Natural Size, this means that will act also as minimum number
    ## of visible columns. It uses a wider character size than the one
    ## used for the SIZE attribute so strings will fit better without
    ## the need of extra columns. As for SIZE you can set to NULL
    ## after map to use it as an initial value. Default: 5 (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(value))

proc `visiblecolumns`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(value))

proc `visiblecolumns=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(&"{x}"))

proc `visiblecolumns`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(&"{x}"))

proc `visiblecolumns`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"))

proc `visiblelines=`*(ih: Text_t, value: string) {.cdecl.} =
    ## VISIBLELINES: When MULTILINE=YES defines the number of visible
    ## lines for the Natural Size, this means that will act also as
    ## minimum number of visible lines. As for SIZE you can set to
    ## NULL after map to use it as an initial value. Default: 1 (since
    ## 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(value))

proc `visiblelines`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(value))

proc `visiblelines=`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(&"{x}"))

proc `visiblelines`*(ih: Text_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(&"{x}"))

proc `visiblelines`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"))

proc `wid`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `wordwrap=`*(ih: Text_t, value: string) {.cdecl.} =
    ## WORDWRAP (creation only): Valid only when MULTILINE=YES. If
    ## enabled will force a word wrap of lines that are greater than
    ## the with of the control, and the horizontal scrollbar will be
    ## removed. Default: NO.
    SetAttribute(cast[PIhandle](ih), cstring("WORDWRAP"), cstring(value))

proc `wordwrap`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WORDWRAP"), cstring(value))

proc `wordwrap=`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WORDWRAP"), cstring((if yes: "YES" else: "NO")))

proc `wordwrap`*(ih: Text_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("WORDWRAP"), cstring((if yes: "YES" else: "NO")))

proc `wordwrap`*(ih: Text_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WORDWRAP")) == "YES"

proc `x`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

# TODO unknown: text XFONTID Unknown Binary
proc `xfontid`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `y`*(ih: Text_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `zorder=`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: Text_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `action=`*(ih: Text_t, cb: proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.}) {.cdecl.} =
    ## ACTION ACTION Action generated when the element is activated.
    ## Affects each element differently. Callback int function(Ihandle
    ## \*ih); [in C] ih:action() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. In some
    ## elements, this callback may receive more parameters, apart from
    ## ih. Please refer to each element's documentation. Affects
    ## IupButton, IupItem, IupList, IupText, IupCanvas, IupMultiline,
    ## IupToggle
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: Text_t, cb: proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION")))

proc `button_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `button_cb`*(ih: Text_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BUTTON_CB")))

proc `caret_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, lin, col,  pos: cint): cint {.cdecl.}) {.cdecl.} =
    ## CARET_CB: Action generated when the caret/cursor position is
    ## changed. int function(Ihandle \*ih, int lin, int col, int pos);
    ## [in C]ih:caret_cb(lin, col, pos: number) -> (ret: number) [in
    ## Lua]
    SetCallback(cast[PIhandle](ih), cstring("CARET_CB"), cast[Icallback](cb))

proc `caret_cb`*(ih: Text_t, cb: proc (ih: PIhandle, lin, col,  pos: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("CARET_CB"), cast[Icallback](cb))

proc `caret_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("CARET_CB")))

proc `destroy_cb=`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: Text_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: Text_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: Text_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragend_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: Text_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: Text_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropfiles_cb=`*(ih: Text_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `dropfiles_cb`*(ih: Text_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: Text_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `enterwindow_cb=`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `enterwindow_cb`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `getfocus_cb=`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `getfocus_cb`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `killfocus_cb=`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `killfocus_cb`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: Text_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `k_any`*(ih: Text_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `leavewindow_cb`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `motion_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `motion_cb`*(ih: Text_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MOTION_CB"), cast[Icallback](cb))

proc `motion_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MOTION_CB")))

proc `postmessage_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Text_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `spin_cb=`*(ih: Text_t, cb: proc (ih: PIhandle, pos: cint): cint {.cdecl.}) {.cdecl.} =
    ## SPIN_CB: Action generated when a spin button is pressed. Valid
    ## only when SPIN=YES. When this callback is called the ACTION
    ## callback is not called. The VALUE attribute can be changed
    ## during this callback only if SPINAUTO=NO. (since 3.0) int
    ## function(Ihandle \*ih, int pos); [in C]ih:spin_cb(pos: number)
    ## -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("SPIN_CB"), cast[Icallback](cb))

proc `spin_cb`*(ih: Text_t, cb: proc (ih: PIhandle, pos: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("SPIN_CB"), cast[Icallback](cb))

proc `spin_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("SPIN_CB")))

proc `unmap_cb=`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `valuechanged_cb=`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## VALUECHANGED_CB: Called after the value was interactively
    ## changed by the user. (since 3.0) int function(Ihandle \*ih); [in
    ## C]ih:valuechanged_cb() -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: Text_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: Text_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB")))

