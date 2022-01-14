when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

## IUP class: List
##
## NIUP type: List_t
##
## constructors
##
##    proc List(action: string): List_t
##
##    proc List(): List_t
##

proc List*(action: string): List_t {.cdecl.} =
    ## Creates an interface element that displays a list of items. The
    ## list can be visible or can be dropped down. It also can have an
    ## edit box for text input. So it is a 4 in 1 element. In native
    ## systems the dropped down case is called Combo Box.
    return List_t(niupc.List(cstring(action)))

proc List*(): List_t {.cdecl.} =
    ## Creates an interface element that displays a list of items. The
    ## list can be visible or can be dropped down. It also can have an
    ## edit box for text input. So it is a 4 in 1 element. In native
    ## systems the dropped down case is called Combo Box.
    return List_t(niupc.List(nil))

proc `active=`*(ih: List_t, value: string) {.cdecl.} =
    ## ACTIVE, FONT, EXPAND, SCREENPOSITION, POSITION, MINSIZE,
    ## MAXSIZE, WID, TIP, RASTERSIZE, ZORDER, VISIBLE, THEME: also
    ## accepted.
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring(value))

proc `active=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ACTIVE"), cstring((if yes: "YES" else: "NO")))

proc `active`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("ACTIVE")) == "YES"

proc `append=`*(ih: List_t, value: string) {.cdecl.} =
    ## APPEND, CARET, CARETPOS, CLIPBOARD, CUEBANNER, FILTER, INSERT,
    ## PADDING, MASK, NC, READONLY, SELECTEDTEXT, SELECTION,
    ## SELECTIONPOS, SCROLLTO, SCROLLTOPOS : Same as the IupText
    ## attributes, but are valid only when EDITBOX=YES and effective
    ## only for the edit box inside the list.
    SetAttribute(cast[PIhandle](ih), cstring("APPEND"), cstring(value))

proc `append`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPEND"), cstring(value))

# TODO ??? String Binary list
proc `appenditem=`*(ih: List_t, value: string) {.cdecl.} =
    ## APPENDITEM (write-only): inserts an item after the last item.
    ## Ignored if set before map. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("APPENDITEM"), cstring(value))

proc `appenditem`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("APPENDITEM"), cstring(value))

# TODO ??? String Binary list
proc `autohide=`*(ih: List_t, value: string) {.cdecl.} =
    ## AUTOHIDE: scrollbars are shown only if they are necessary.
    ## Default: "YES". When DROPDOWN=YES the scrollbars are system
    ## dependent, and do NOT depend on the SCROLLBAR or AUTOHIDE
    ## attributes. Usually the scrollbars are shown if necessary. In
    ## GTK, scrollbars are never shown and all items are always
    ## visible. In Motif, the horizontal scrollbar is never shown. In
    ## Windows, if DROPEXPAND=YES then the horizontal scrollbar is
    ## never shown.
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring(value))

proc `autohide`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring(value))

proc `autohide=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `autohide`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE"), cstring((if yes: "YES" else: "NO")))

proc `autohide`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUTOHIDE")) == "YES"

proc `autoredraw=`*(ih: List_t, value: string) {.cdecl.} =
    ## AUTOREDRAW [Windows] (non inheritable): automatically redraws
    ## the list when something has change. Set to NO to add many items
    ## to the list without updating the display. Default: "YES".
    ## (since 3.3)
    SetAttribute(cast[PIhandle](ih), cstring("AUTOREDRAW"), cstring(value))

proc `autoredraw`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOREDRAW"), cstring(value))

proc `autoredraw=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOREDRAW"), cstring((if yes: "YES" else: "NO")))

proc `autoredraw`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("AUTOREDRAW"), cstring((if yes: "YES" else: "NO")))

proc `autoredraw`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("AUTOREDRAW")) == "YES"

proc `bgcolor=`*(ih: List_t, value: string) {.cdecl.} =
    ## BGCOLOR: Background color of the text. Default: the global
    ## attribute TXTBGCOLOR. In GTK does nothing when DROPDOWN=Yes. In
    ## GTK older than 2.12, the editbox of a dropdown will not follow
    ## the list attributes: FONT, BGCOLOR, FGCOLOR and SPACING.
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(value))

proc `bgcolor=`*(ih: List_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: List_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `bgcolor`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("BGCOLOR"))

proc `canfocus=`*(ih: List_t, value: string) {.cdecl.} =
    ## CANFOCUS (creation only) (non inheritable): enables the focus
    ## traversal of the control. In Windows the control will still get
    ## the focus when clicked. Default: YES. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring(value))

proc `canfocus=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CANFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `canfocus`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CANFOCUS")) == "YES"

proc `caret=`*(ih: List_t, value: string) {.cdecl.} =
    ## APPEND, CARET, CARETPOS, CLIPBOARD, CUEBANNER, FILTER, INSERT,
    ## PADDING, MASK, NC, READONLY, SELECTEDTEXT, SELECTION,
    ## SELECTIONPOS, SCROLLTO, SCROLLTOPOS : Same as the IupText
    ## attributes, but are valid only when EDITBOX=YES and effective
    ## only for the edit box inside the list.
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(value))

proc `caret`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(value))

proc `caret=`*(ih: List_t, lin, col:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(&"{lin},{col}"))

proc `caret`*(ih: List_t, lin, col:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARET"), cstring(&"{lin},{col}"))

proc `caret`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CARET"))

proc `caretpos=`*(ih: List_t, value: string) {.cdecl.} =
    ## APPEND, CARET, CARETPOS, CLIPBOARD, CUEBANNER, FILTER, INSERT,
    ## PADDING, MASK, NC, READONLY, SELECTEDTEXT, SELECTION,
    ## SELECTIONPOS, SCROLLTO, SCROLLTOPOS : Same as the IupText
    ## attributes, but are valid only when EDITBOX=YES and effective
    ## only for the edit box inside the list.
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(value))

proc `caretpos`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(value))

proc `caretpos=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(&"{x}"))

proc `caretpos`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CARETPOS"), cstring(&"{x}"))

proc `caretpos`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CARETPOS"))

proc `charsize`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CHARSIZE"))

proc `clipboard=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIPBOARD"), cstring(value))

proc `clipboard`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CLIPBOARD"), cstring(value))

proc `clipboard`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CLIPBOARD"))

proc `count`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("COUNT"))

proc `cpadding=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(value))

proc `cpadding=`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CPADDING"), cstring(&"{width}x{height}"))

proc `cpadding`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CPADDING"))

proc `cspacing=`*(ih: List_t, value: string) {.cdecl.} =
    ## CSPACING: same as SPACING but using the units of the vertical
    ## part of the SIZE attribute. It will actually set the SPACING
    ## attribute. (since 3.29)
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(value))

proc `cspacing`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(value))

proc `cspacing=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(&"{x}"))

proc `cspacing`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("CSPACING"), cstring(&"{x}"))

proc `cspacing`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("CSPACING"))

proc `dragdrop=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring(value))

proc `dragdrop=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `dragdrop`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROP")) == "YES"

proc `dragdroplist=`*(ih: List_t, value: string) {.cdecl.} =
    ## DRAGDROPLIST (non inheritable): prepare the Drag & Drop
    ## callbacks to support drag and drop of items between lists
    ## (IupList or IupFlatList), in the same IUP application. Drag &
    ## Drop attributes still need to be set in order to activate the
    ## drag & drop support, so the application can control if this
    ## list will be source and/or target. Default: NO. (since 3.10)
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPLIST"), cstring(value))

proc `dragdroplist`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPLIST"), cstring(value))

proc `dragdroplist=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPLIST"), cstring((if yes: "YES" else: "NO")))

proc `dragdroplist`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGDROPLIST"), cstring((if yes: "YES" else: "NO")))

proc `dragdroplist`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGDROPLIST")) == "YES"

proc `dragsource=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring(value))

proc `dragsource=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE"), cstring((if yes: "YES" else: "NO")))

proc `dragsource`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCE")) == "YES"

proc `dragsourcemove=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring(value))

proc `dragsourcemove=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE"), cstring((if yes: "YES" else: "NO")))

proc `dragsourcemove`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGSOURCEMOVE")) == "YES"

proc `dragtypes=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

proc `dragtypes`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"), cstring(value))

# TODO ??? String Binary list
proc `dragtypes`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DRAGTYPES"))

proc `dropdown=`*(ih: List_t, value: string) {.cdecl.} =
    ## DROPDOWN (creation only): Changes the appearance of the list
    ## for the user: only the selected item is shown beside a button
    ## with the image of an arrow pointing down. To select another
    ## option, the user must press this button, which displays all
    ## items in the list. Can be "YES" or "NO". Default "NO".
    SetAttribute(cast[PIhandle](ih), cstring("DROPDOWN"), cstring(value))

proc `dropdown`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPDOWN"), cstring(value))

proc `dropdown=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPDOWN"), cstring((if yes: "YES" else: "NO")))

proc `dropdown`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPDOWN"), cstring((if yes: "YES" else: "NO")))

proc `dropdown`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPDOWN")) == "YES"

proc `dropexpand=`*(ih: List_t, value: string) {.cdecl.} =
    ## DROPEXPAND [Windows Only]: When DROPDOWN=Yes the size of the
    ## dropped list will expand to include the largest text. Can be
    ## "YES" or "NO". Default: "YES".
    SetAttribute(cast[PIhandle](ih), cstring("DROPEXPAND"), cstring(value))

proc `dropexpand`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPEXPAND"), cstring(value))

proc `dropexpand=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPEXPAND"), cstring((if yes: "YES" else: "NO")))

proc `dropexpand`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPEXPAND"), cstring((if yes: "YES" else: "NO")))

proc `dropexpand`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPEXPAND")) == "YES"

proc `dropfilestarget=`*(ih: List_t, value: string) {.cdecl.} =
    ## DROPFILESTARGET [Windows and GTK Only] (non inheritable):
    ## Enable or disable the drop of files. Default: NO, but if
    ## DROPFILES_CB is defined when the element is mapped then it will
    ## be automatically enabled. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring(value))

proc `dropfilestarget=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET"), cstring((if yes: "YES" else: "NO")))

proc `dropfilestarget`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPFILESTARGET")) == "YES"

proc `droptarget=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring(value))

proc `droptarget=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTARGET"), cstring((if yes: "YES" else: "NO")))

proc `droptarget`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTARGET")) == "YES"

proc `droptypes=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

proc `droptypes`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"), cstring(value))

# TODO ??? String Binary list
proc `droptypes`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("DROPTYPES"))

proc `editbox=`*(ih: List_t, value: string) {.cdecl.} =
    ## EDITBOX (creation only): Adds an edit box to the list. Can be
    ## "YES" or "NO". Default "NO".
    SetAttribute(cast[PIhandle](ih), cstring("EDITBOX"), cstring(value))

proc `editbox`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EDITBOX"), cstring(value))

proc `editbox=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EDITBOX"), cstring((if yes: "YES" else: "NO")))

proc `editbox`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EDITBOX"), cstring((if yes: "YES" else: "NO")))

proc `editbox`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EDITBOX")) == "YES"

proc `expand=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPAND"), cstring(value))

proc `expand`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPAND"))

proc `expandweight=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(value))

proc `expandweight=`*(ih: List_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: List_t, x:int64) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"), cstring(&"{x}"))

proc `expandweight`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("EXPANDWEIGHT"))

proc `fgcolor=`*(ih: List_t, value: string) {.cdecl.} =
    ## FGCOLOR: Text color. Default: the global attribute TXTFGCOLOR.
    ## In GTK older than 2.12, the editbox of a dropdown will not
    ## follow the list attributes: FONT, BGCOLOR, FGCOLOR and SPACING.
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(value))

proc `fgcolor=`*(ih: List_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: List_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `fgcolor`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FGCOLOR"))

proc `floating=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FLOATING"), cstring(value))

proc `floating`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FLOATING"))

proc `font=`*(ih: List_t, value: string) {.cdecl.} =
    ## In GTK older than 2.12, the editbox of a dropdown will not
    ## follow the list attributes: FONT, BGCOLOR, FGCOLOR and SPACING.
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

proc `font`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONT"), cstring(value))

# TODO ??? String Binary list
proc `font`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONT"))

proc `fontface=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

proc `fontface`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTFACE"), cstring(value))

# TODO ??? String Binary list
proc `fontface`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTFACE"))

proc `fontsize=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(value))

proc `fontsize=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"), cstring(&"{x}"))

proc `fontsize`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSIZE"))

proc `fontstyle=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

proc `fontstyle`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"), cstring(value))

# TODO ??? String Binary list
proc `fontstyle`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("FONTSTYLE"))

proc `handlename=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

proc `handlename`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"), cstring(value))

# TODO ??? String Binary list
proc `handlename`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("HANDLENAME"))

# TODO getter list IDVALUE
# TODO getter list IMAGE
# TODO getter list IMAGENATIVEHANDLE
# TODO unknown: list INSERT Unknown Binary
# TODO getter list INSERTITEM
proc `mask=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASK"), cstring(value))

proc `mask`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASK"), cstring(value))

# TODO ??? String Binary list
proc `mask`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASK"))

proc `maskcasei=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring(value))

proc `maskcasei`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring(value))

proc `maskcasei=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring((if yes: "YES" else: "NO")))

proc `maskcasei`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKCASEI"), cstring((if yes: "YES" else: "NO")))

proc `maskcasei`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKCASEI")) == "YES"

proc `maskdecimalsymbol=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKDECIMALSYMBOL"), cstring(value))

proc `maskdecimalsymbol`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKDECIMALSYMBOL"), cstring(value))

# TODO ??? String Binary list
proc `maskdecimalsymbol`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKDECIMALSYMBOL"))

proc `maskfloat=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(value))

proc `maskfloat`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(value))

proc `maskfloat=`*(ih: List_t, min, max:float) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(&"{min},{max}"))

proc `maskfloat`*(ih: List_t, min, max:float) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"), cstring(&"{min},{max}"))

proc `maskfloat`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKFLOAT"))

proc `maskint=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(value))

proc `maskint`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(value))

proc `maskint=`*(ih: List_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(&"{min},{max}"))

proc `maskint`*(ih: List_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKINT"), cstring(&"{min},{max}"))

proc `maskint`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKINT"))

proc `masknoempty=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring(value))

proc `masknoempty`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring(value))

proc `masknoempty=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring((if yes: "YES" else: "NO")))

proc `masknoempty`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY"), cstring((if yes: "YES" else: "NO")))

proc `masknoempty`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKNOEMPTY")) == "YES"

proc `maskreal=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKREAL"), cstring(value))

proc `maskreal`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MASKREAL"), cstring(value))

proc `maskreal`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MASKREAL"))

proc `maxsize=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(value))

proc `maxsize=`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"), cstring(&"{width}x{height}"))

proc `maxsize`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MAXSIZE"))

proc `minsize=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(value))

proc `minsize=`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MINSIZE"), cstring(&"{width}x{height}"))

proc `minsize`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MINSIZE"))

proc `multiple=`*(ih: List_t, value: string) {.cdecl.} =
    ## MULTIPLE (creation only): Allows selecting several items
    ## simultaneously (multiple list). Default: "NO". Only valid when
    ## EDITBOX=NO and DROPDOWN=NO.
    SetAttribute(cast[PIhandle](ih), cstring("MULTIPLE"), cstring(value))

proc `multiple`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTIPLE"), cstring(value))

proc `multiple=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTIPLE"), cstring((if yes: "YES" else: "NO")))

proc `multiple`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("MULTIPLE"), cstring((if yes: "YES" else: "NO")))

proc `multiple`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("MULTIPLE")) == "YES"

proc `name=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

proc `name`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NAME"), cstring(value))

# TODO ??? String Binary list
proc `name`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NAME"))

proc `naturalsize`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NATURALSIZE"))

proc `nc=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(value))

proc `nc`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(value))

proc `nc=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(&"{x}"))

proc `nc`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NC"), cstring(&"{x}"))

proc `nc`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NC"))

proc `normalizergroup=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

proc `normalizergroup`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"), cstring(value))

# TODO ??? String Binary list
proc `normalizergroup`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NORMALIZERGROUP"))

proc `ntheme=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

proc `ntheme`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("NTHEME"), cstring(value))

# TODO ??? String Binary list
proc `ntheme`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("NTHEME"))

proc `padding=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(value))

proc `padding`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(value))

proc `padding=`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(&"{width}x{height}"))

proc `padding`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PADDING"), cstring(&"{width}x{height}"))

proc `padding`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PADDING"))

# TODO unknown: list PANGOFONTDESC Unknown Binary
proc `pangofontdesc`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOFONTDESC"))

# TODO unknown: list PANGOLAYOUT Unknown Binary
proc `pangolayout`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PANGOLAYOUT"))

proc `position=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(value))

proc `position=`*(ih: List_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: List_t, x, y:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("POSITION"), cstring(&"{x},{y}"))

proc `position`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("POSITION"))

proc `propagatefocus=`*(ih: List_t, value: string) {.cdecl.} =
    ## PROPAGATEFOCUS(non inheritable): enables the focus callback
    ## forwarding to the next native parent with FOCUS_CB defined.
    ## Default: NO. (since 3.23)
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring(value))

proc `propagatefocus=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS"), cstring((if yes: "YES" else: "NO")))

proc `propagatefocus`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("PROPAGATEFOCUS")) == "YES"

proc `rastersize=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(value))

proc `rastersize=`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"), cstring(&"{width}x{height}"))

proc `rastersize`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("RASTERSIZE"))

proc `readonly=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring(value))

proc `readonly`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring(value))

proc `readonly=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring((if yes: "YES" else: "NO")))

proc `readonly`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("READONLY"), cstring((if yes: "YES" else: "NO")))

proc `readonly`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("READONLY")) == "YES"

proc `removeitem=`*(ih: List_t, value: string) {.cdecl.} =
    ## REMOVEITEM (write-only): removes the given value. value starts
    ## at 1. If value is NULL or "ALL" removes all the items. Ignored
    ## if set before map. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("REMOVEITEM"), cstring(value))

proc `removeitem`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("REMOVEITEM"), cstring(value))

proc `removeitem=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("REMOVEITEM"), cstring(&"{x}"))

proc `removeitem`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("REMOVEITEM"), cstring(&"{x}"))

proc `screenposition`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCREENPOSITION"))

proc `scrollbar=`*(ih: List_t, value: string) {.cdecl.} =
    ## SCROLLBAR (creation only): Associates automatic scrollbars to
    ## the list when DROPDOWN=NO. Can be: "YES" or "NO" (none).
    ## Default: "YES". For all systems, when SCROLLBAR=YES the natural
    ## size will always include its size even if the native system
    ## hides the scrollbars. If AUTOHIDE=YES scrollbars are shown only
    ## if they are necessary, by default AUTOHIDE=YES. In Motif,
    ## SCROLLBAR=NO is not supported and if EDITBOX=YES the horizontal
    ## scrollbar is never shown. When DROPDOWN=YES the scrollbars are
    ## system dependent, and do NOT depend on the SCROLLBAR or
    ## AUTOHIDE attributes. Usually the scrollbars are shown if
    ## necessary. In GTK, scrollbars are never shown and all items are
    ## always visible. In Motif, the horizontal scrollbar is never
    ## shown. In Windows, if DROPEXPAND=YES then the horizontal
    ## scrollbar is never shown.
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring(value))

proc `scrollbar=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR"), cstring((if yes: "YES" else: "NO")))

proc `scrollbar`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SCROLLBAR")) == "YES"

proc `scrollto=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(value))

proc `scrollto`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(value))

proc `scrollto=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(&"{x}"))

proc `scrollto`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTO"), cstring(&"{x}"))

proc `scrolltopos=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(value))

proc `scrolltopos`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(value))

proc `scrolltopos=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(&"{x}"))

proc `scrolltopos`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SCROLLTOPOS"), cstring(&"{x}"))

proc `selectedtext=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTEDTEXT"), cstring(value))

proc `selectedtext`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTEDTEXT"), cstring(value))

# TODO ??? String Binary list
proc `selectedtext`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SELECTEDTEXT"))

proc `selection=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(value))

proc `selection`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(value))

proc `selection=`*(ih: List_t, lin1,col1,lin2,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{lin1},{col1}:{lin2},{col2}"))

proc `selection`*(ih: List_t, lin1,col1,lin2,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{lin1},{col1}:{lin2},{col2}"))

proc `selection=`*(ih: List_t, col1,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{col1}:{col2}"))

proc `selection`*(ih: List_t, col1,col2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTION"), cstring(&"{col1}:{col2}"))

proc `selection`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SELECTION"))

proc `selectionpos=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(value))

proc `selectionpos`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(value))

proc `selectionpos=`*(ih: List_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(&"{min},{max}"))

proc `selectionpos`*(ih: List_t, min, max:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"), cstring(&"{min},{max}"))

proc `selectionpos`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SELECTIONPOS"))

proc `showdragdrop=`*(ih: List_t, value: string) {.cdecl.} =
    ## SHOWDRAGDROP (creation only) (non inheritable): enables the
    ## internal drag and drop of items in the same list, and enables
    ## the DRAGDROP_CB callback. Default: "NO". Works only if
    ## DROPDOWN=NO and MULTIPLE=NO. Drag & Drop attributes are NOT
    ## used. (since 3.7)
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring(value))

proc `showdragdrop`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring(value))

proc `showdragdrop=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `showdragdrop`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP"), cstring((if yes: "YES" else: "NO")))

proc `showdragdrop`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWDRAGDROP")) == "YES"

proc `showdropdown=`*(ih: List_t, value: string) {.cdecl.} =
    ## SHOWDROPDOWN (write-only): opens or closes the dropdown list.
    ## Can be "YES" or "NO". Valid only when DROPDOWN=YES. Ignored if
    ## set before map.
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDROPDOWN"), cstring(value))

proc `showdropdown`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDROPDOWN"), cstring(value))

proc `showdropdown=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDROPDOWN"), cstring((if yes: "YES" else: "NO")))

proc `showdropdown`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWDROPDOWN"), cstring((if yes: "YES" else: "NO")))

proc `showimage=`*(ih: List_t, value: string) {.cdecl.} =
    ## SHOWIMAGE (creation only) [Windows and GTK Only]: enables the
    ## use of an image for each item. Can be "YES" or "NO". Ignored if
    ## set after map. (since 3.6)
    SetAttribute(cast[PIhandle](ih), cstring("SHOWIMAGE"), cstring(value))

proc `showimage`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWIMAGE"), cstring(value))

proc `showimage=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWIMAGE"), cstring((if yes: "YES" else: "NO")))

proc `showimage`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SHOWIMAGE"), cstring((if yes: "YES" else: "NO")))

proc `showimage`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SHOWIMAGE")) == "YES"

proc `size=`*(ih: List_t, value: string) {.cdecl.} =
    ## SIZE: Size of the list. The Natural Size is defined by the
    ## number of elements in the list and the with of the largest
    ## item, the default has room for 5 characters in 1 item. In IUP
    ## 3, the Natural Size ignores the list contents if VISIBLECOLUMNS
    ## or VISIBLELINES attributes are defined. The text in the edit
    ## box is ignored when considering the list contents.
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(value))

proc `size=`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SIZE"), cstring(&"{width}x{height}"))

proc `size`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SIZE"))

proc `spacing=`*(ih: List_t, value: string) {.cdecl.} =
    ## SPACING: internal padding for each item. Notice that vertically
    ## the distance between each item will be actually 2x the spacing.
    ## It also affects the horizontal margin of the item. In Windows,
    ## the text is aligned at the top left of the item always. Valid
    ## only when DROPDOWN=NO. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(value))

proc `spacing`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(value))

proc `spacing=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(&"{x}"))

proc `spacing`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("SPACING"), cstring(&"{x}"))

proc `spacing`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("SPACING"))

proc `theme=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

proc `theme`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("THEME"), cstring(value))

# TODO ??? String Binary list
proc `theme`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("THEME"))

proc `tip=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

proc `tip`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIP"), cstring(value))

# TODO ??? String Binary list
proc `tip`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIP"))

proc `tipbgcolor=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(value))

proc `tipbgcolor=`*(ih: List_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: List_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipbgcolor`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPBGCOLOR"))

proc `tipdelay=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(value))

proc `tipdelay=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"), cstring(&"{x}"))

proc `tipdelay`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPDELAY"))

proc `tipfgcolor=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(value))

proc `tipfgcolor=`*(ih: List_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: List_t, red, green, blue:int, alpha:int = 255) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"), cstring(&"{red} {green} {blue} {alpha}"))

proc `tipfgcolor`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPFGCOLOR"))

proc `tipicon=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

proc `tipicon`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPICON"), cstring(value))

# TODO ??? String Binary list
proc `tipicon`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPICON"))

proc `tipmarkup=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

proc `tipmarkup`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"), cstring(value))

# TODO ??? String Binary list
proc `tipmarkup`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPMARKUP"))

proc `tiprect=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(value))

proc `tiprect=`*(ih: List_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: List_t, x1, y1, x2, y2:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPRECT"), cstring(&"{x1} {y1} {x2} {y2}"))

proc `tiprect`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPRECT"))

proc `tipvisible=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring(value))

proc `tipvisible=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `tipvisible`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TIPVISIBLE")) == "YES"

proc `topitem=`*(ih: List_t, value: string) {.cdecl.} =
    ## TOPITEM (write-only): position the given item at the top of the
    ## list or near to make it visible. Valid only when DROPDOWN=NO.
    ## (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(value))

proc `topitem`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(value))

proc `topitem=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(&"{x}"))

proc `topitem`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("TOPITEM"), cstring(&"{x}"))

proc `topitem`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("TOPITEM"))

proc `usersize=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(value))

proc `usersize=`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: List_t, width, height:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("USERSIZE"), cstring(&"{width}x{height}"))

proc `usersize`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("USERSIZE"))

proc `value=`*(ih: List_t, value: string) {.cdecl.} =
    ## VALUE (non inheritable): Depends on the DROPDOWN+EDITBOX
    ## combination: EDITBOX=YES: Text entered by the user.
    ## MULTIPLE=YES: Sequence of '+' and '-' symbols indicating the
    ## state of each item. When setting this value, the user must
    ## provide the same amount of '+' and '-' symbols as the amount of
    ## items in the list, otherwise the specified items will be
    ## deselected. Others: Integer number representing the selected
    ## item in the list (begins at 1). It can be zero if there is no
    ## selected item. (In Motif when DROPDOWN=YES there is always an
    ## item selected, except when the list is empty). Should return a
    ## non NULL value, even when the list is empty or the text box is
    ## empty. It can be NULL when no item selected (since 3.0). The
    ## state=0 is simulated internally by IUP in all systems. If you
    ## add or remove items to/from the list and you count on the
    ## state=0 value, then after adding/removing items set the VALUE
    ## attribute to ensure proper state=0 value. The non changed items
    ## marked with 'x' are simulated internally by IUP in all systems.
    ## If you add or remove items to/from the list and you count on
    ## the 'x' values, then after adding/removing items set the VALUE
    ## attribute to ensure proper 'x' values.
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

proc `value`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUE"), cstring(value))

# TODO ??? String Binary list
proc `value`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUE"))

proc `valuemasked=`*(ih: List_t, value: string) {.cdecl.} =
    ## VALUEMASKED (non inheritable) (write-only): sets VALUE but
    ## first checks if it is validated by MASK. If not does nothing.
    ## Works only when EDITBOX=YES. (since 3.13)
    SetAttribute(cast[PIhandle](ih), cstring("VALUEMASKED"), cstring(value))

proc `valuemasked`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUEMASKED"), cstring(value))

# TODO ??? String Binary list
proc `valuestring=`*(ih: List_t, value: string) {.cdecl.} =
    ## VALUESTRING (non inheritable): changes or retrieves the value
    ## attribute using a string of an item. Works only when EDITBOX=NO
    ## and DROPDOWN=YES, or DROPDOWN=NO and MULTIPLE=NO. When set it
    ## will search for the first item with the same string. (since
    ## 3.12)
    SetAttribute(cast[PIhandle](ih), cstring("VALUESTRING"), cstring(value))

proc `valuestring`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VALUESTRING"), cstring(value))

# TODO ??? String Binary list
proc `valuestring`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VALUESTRING"))

proc `visible=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring(value))

proc `visible=`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: List_t, yes:bool) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLE"), cstring((if yes: "YES" else: "NO")))

proc `visible`*(ih: List_t): bool {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLE")) == "YES"

proc `visiblecolumns=`*(ih: List_t, value: string) {.cdecl.} =
    ## VISIBLECOLUMNS: Defines the number of visible columns for the
    ## Natural Size, this means that will act also as minimum number
    ## of visible columns. It uses a wider character size then the one
    ## used for the SIZE attribute so strings will fit better without
    ## the need of extra columns. Set this attribute to speed Natural
    ## Size computation for very large lists. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(value))

proc `visiblecolumns`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(value))

proc `visiblecolumns=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(&"{x}"))

proc `visiblecolumns`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"), cstring(&"{x}"))

proc `visiblecolumns`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLECOLUMNS"))

proc `visibleitems=`*(ih: List_t, value: string) {.cdecl.} =
    ## VISIBLEITEMS [Windows and Motif Only]: Number of items that are
    ## visible when DROPDOWN=YES is used for the dropdown list.
    ## Default: 5.
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLEITEMS"), cstring(value))

proc `visibleitems`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLEITEMS"), cstring(value))

proc `visibleitems=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLEITEMS"), cstring(&"{x}"))

proc `visibleitems`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLEITEMS"), cstring(&"{x}"))

proc `visibleitems`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLEITEMS"))

proc `visiblelines=`*(ih: List_t, value: string) {.cdecl.} =
    ## VISIBLELINES: When DROPDOWN=NO defines the number of visible
    ## lines for the Natural Size, this means that will act also as
    ## minimum number of visible lines. (since 3.0)
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(value))

proc `visiblelines`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(value))

proc `visiblelines=`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(&"{x}"))

proc `visiblelines`*(ih: List_t, x:int) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"), cstring(&"{x}"))

proc `visiblelines`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("VISIBLELINES"))

proc `wid`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("WID"))

proc `x`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("X"))

# TODO unknown: list XFONTID Unknown Binary
proc `xfontid`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("XFONTID"))

proc `y`*(ih: List_t): string {.cdecl.} =
    return $GetAttribute(cast[PIhandle](ih), cstring("Y"))

proc `zorder=`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `zorder`*(ih: List_t, value: string) {.cdecl.} =
    SetAttribute(cast[PIhandle](ih), cstring("ZORDER"), cstring(value))

proc `action=`*(ih: List_t, cb: proc (ih: PIhandle, text: cstring, item, state: cint): cint {.cdecl.}) {.cdecl.} =
    ## ACTION ACTION Action generated when the element is activated.
    ## Affects each element differently. Callback int function(Ihandle
    ## \*ih); [in C] ih:action() -> (ret: number) [in Lua] ih:
    ## identifier of the element that activated the event. In some
    ## elements, this callback may receive more parameters, apart from
    ## ih. Please refer to each element's documentation. Affects
    ## IupButton, IupItem, IupList, IupText, IupCanvas, IupMultiline,
    ## IupToggle
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: List_t, cb: proc (ih: PIhandle, text: cstring, item, state: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ACTION"), cast[Icallback](cb))

proc `action`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ACTION")))

proc `button_cb=`*(ih: List_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `button_cb`*(ih: List_t, cb: proc (ih: PIhandle, arg2: cint, arg3: cint, arg4: cint, arg5: cint, arg6: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("BUTTON_CB"), cast[Icallback](cb))

proc `button_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("BUTTON_CB")))

proc `caret_cb=`*(ih: List_t, cb: proc (ih: PIhandle, lin, col,  pos: cint): cint {.cdecl.}) {.cdecl.} =
    ## This is the same CARET_CB callback definition as for the
    ## IupText.
    SetCallback(cast[PIhandle](ih), cstring("CARET_CB"), cast[Icallback](cb))

proc `caret_cb`*(ih: List_t, cb: proc (ih: PIhandle, lin, col,  pos: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("CARET_CB"), cast[Icallback](cb))

proc `caret_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("CARET_CB")))

proc `dblclick_cb=`*(ih: List_t, cb: proc (ih: PIhandle, item: cint, text: cstring): cint {.cdecl.}) {.cdecl.} =
    ## DBLCLICK_CB: Action generated when the user double click an
    ## item. Called only when DROPDOWN=NO. (since 3.0) int function
    ## (Ihandle \*ih, int item, char \*text); [in C]ih:dblclick_cb(item:
    ## number, text: string) -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("DBLCLICK_CB"), cast[Icallback](cb))

proc `dblclick_cb`*(ih: List_t, cb: proc (ih: PIhandle, item: cint, text: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DBLCLICK_CB"), cast[Icallback](cb))

proc `dblclick_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DBLCLICK_CB")))

proc `destroy_cb=`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `destroy_cb`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DESTROY_CB"), cast[Icallback](cb))

proc `destroy_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DESTROY_CB")))

proc `dragbegin_cb=`*(ih: List_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: List_t, cb: proc (ih: PIhandle, x: cint, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB"), cast[Icallback](cb))

proc `dragbegin_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGBEGIN_CB")))

proc `dragdatasize_cb=`*(ih: List_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: List_t, cb: proc (ih: PIhandle, dragtype: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB"), cast[Icallback](cb))

proc `dragdatasize_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATASIZE_CB")))

proc `dragdata_cb=`*(ih: List_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: List_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB"), cast[Icallback](cb))

proc `dragdata_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDATA_CB")))

proc `dragdrop_cb=`*(ih: List_t, cb: proc (ih: PIhandle, drag_id, drop_id, isshift, iscontrol: cint): cint {.cdecl.}) {.cdecl.} =
    ## DRAGDROP_CB: Action generated when an internal drag and drop is
    ## executed. Only active if SHOWDRAGDROP=YES. (since 3.7) int
    ## function(Ihandle \*ih, int drag_id, int drop_id, int isshift,
    ## int iscontrol); [in C] ih:dragdrop_cb(drag_id, drop_id,
    ## isshift, iscontrol: number) -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("DRAGDROP_CB"), cast[Icallback](cb))

proc `dragdrop_cb`*(ih: List_t, cb: proc (ih: PIhandle, drag_id, drop_id, isshift, iscontrol: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGDROP_CB"), cast[Icallback](cb))

proc `dragdrop_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGDROP_CB")))

proc `dragend_cb=`*(ih: List_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: List_t, cb: proc (ih: PIhandle, action: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB"), cast[Icallback](cb))

proc `dragend_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DRAGEND_CB")))

proc `dropdata_cb=`*(ih: List_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: List_t, cb: proc (ih: PIhandle, dragtype: cstring, data: pointer, size, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB"), cast[Icallback](cb))

proc `dropdata_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDATA_CB")))

proc `dropdown_cb=`*(ih: List_t, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) {.cdecl.} =
    ## DROPDOWN_CB: Action generated when the list of a dropdown is
    ## shown or hidden. Called only when DROPDOWN=YES. (since 3.0) int
    ## function (Ihandle \*ih, int state); [in C]ih:dropdown_cb(state:
    ## boolean) -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("DROPDOWN_CB"), cast[Icallback](cb))

proc `dropdown_cb`*(ih: List_t, cb: proc (ih: PIhandle, state: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPDOWN_CB"), cast[Icallback](cb))

proc `dropdown_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPDOWN_CB")))

proc `dropfiles_cb=`*(ih: List_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `dropfiles_cb`*(ih: List_t, cb: proc (Ih: PIhandle, filename: cstring, num, x, y: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB"), cast[Icallback](cb))

proc `dropfiles_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPFILES_CB")))

proc `dropmotion_cb=`*(ih: List_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: List_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB"), cast[Icallback](cb))

proc `dropmotion_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("DROPMOTION_CB")))

proc `edit_cb=`*(ih: List_t, cb: proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.}) {.cdecl.} =
    ## EDIT_CB: Action generated when the text in the text box is
    ## manually changed by the user, but before its value is actually
    ## updated. Valid only when EDITBOX=YES. int function(Ihandle \*ih,
    ## int c, char \*new_value); [in C]ih:edit_cb(c: number, new_value:
    ## string) -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("EDIT_CB"), cast[Icallback](cb))

proc `edit_cb`*(ih: List_t, cb: proc (ih: PIhandle, c: cint, new_value: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("EDIT_CB"), cast[Icallback](cb))

proc `edit_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("EDIT_CB")))

proc `enterwindow_cb=`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `enterwindow_cb`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB"), cast[Icallback](cb))

proc `enterwindow_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("ENTERWINDOW_CB")))

proc `getfocus_cb=`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `getfocus_cb`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB"), cast[Icallback](cb))

proc `getfocus_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("GETFOCUS_CB")))

proc `help_cb=`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## HELP_CB HELP_CB Action generated when the user press F1 at a
    ## control. In Motif is also activated by the Help button in some
    ## workstations keyboard. Callback void function(Ihandle \*ih); [in
    ## C] ih:help_cb() -> (ret: number) [in Lua] ih: identifier of the
    ## element that activated the event. Returns: IUP_CLOSE will be
    ## processed. Affects All elements with user interaction.
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("HELP_CB"), cast[Icallback](cb))

proc `help_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("HELP_CB")))

proc `killfocus_cb=`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `killfocus_cb`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB"), cast[Icallback](cb))

proc `killfocus_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("KILLFOCUS_CB")))

proc `k_any=`*(ih: List_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
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

proc `k_any`*(ih: List_t, cb: proc (ih: PIhandle, c: cint): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("K_ANY"), cast[Icallback](cb))

proc `k_any`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("K_ANY")))

proc `ldestroy_cb=`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB"), cast[Icallback](cb))

proc `ldestroy_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LDESTROY_CB")))

proc `leavewindow_cb=`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
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

proc `leavewindow_cb`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB"), cast[Icallback](cb))

proc `leavewindow_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("LEAVEWINDOW_CB")))

proc `map_cb=`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## MAP_CB MAP_CB Called right after an element is mapped and its
    ## attributes updated in IupMap. When the element is a dialog, it
    ## is called after the layout is updated. For all other elements
    ## is called before the layout is updated, so the element current
    ## size will still be 0x0 during MAP_CB (since 3.14). Callback int
    ## function(Ihandle \*ih); [in C] ih:map_cb() -> (ret: number) [in
    ## Lua] ih: identifier of the element that activated the event.
    ## Affects All that have a native representation.
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MAP_CB"), cast[Icallback](cb))

proc `map_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MAP_CB")))

proc `motion_cb=`*(ih: List_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
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

proc `motion_cb`*(ih: List_t, cb: proc (ih: PIhandle, x, y: cint, status: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MOTION_CB"), cast[Icallback](cb))

proc `motion_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MOTION_CB")))

proc `multiselect_cb=`*(ih: List_t, cb: proc (ih: PIhandle, value: cstring): cint {.cdecl.}) {.cdecl.} =
    ## MULTISELECT_CB: Action generated when the state of an item in
    ## the multiple selection list is changed. But it is called only
    ## when the interaction is over. int function (Ihandle \*ih, char
    ## \*value); [in C]ih:multiselect_cb(value: string) -> (ret:
    ## number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("MULTISELECT_CB"), cast[Icallback](cb))

proc `multiselect_cb`*(ih: List_t, cb: proc (ih: PIhandle, value: cstring): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("MULTISELECT_CB"), cast[Icallback](cb))

proc `multiselect_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("MULTISELECT_CB")))

proc `postmessage_cb=`*(ih: List_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: List_t, cb: proc (ih: PIhandle, arg2: cstring, arg3: cint, arg4: cdouble, arg5: pointer): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB"), cast[Icallback](cb))

proc `postmessage_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("POSTMESSAGE_CB")))

proc `unmap_cb=`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## UNMAP_CB UNMAP_CB Called right before an element is unmapped.
    ## Callback int function(Ihandle \*ih); [in C] ih:unmap_cb() ->
    ## (ret: number) [in Lua] ih: identifier of the element that
    ## activated the event. Affects All that have a native
    ## representation.
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("UNMAP_CB"), cast[Icallback](cb))

proc `unmap_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("UNMAP_CB")))

proc `valuechanged_cb=`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    ## VALUECHANGED_CB: Called after the value was interactively
    ## changed by the user. Called when the selection is changed or
    ## when the text is edited. (since 3.0) int function(Ihandle \*ih);
    ## [in C]ih:valuechanged_cb() -> (ret: number) [in Lua]
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: List_t, cb: proc (ih: PIhandle): cint {.cdecl.}) {.cdecl.} =
    SetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB"), cast[Icallback](cb))

proc `valuechanged_cb`*(ih: List_t): proc (ih: PIhandle): cint {.cdecl.} =
    return cast[proc (ih: PIhandle): cint {.cdecl.}](GetCallback(cast[PIhandle](ih), cstring("VALUECHANGED_CB")))

