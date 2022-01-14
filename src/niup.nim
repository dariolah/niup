import niup/niupc
import std/macros
import strformat

export niupc.PIhandle, # type used in callbacks
  # macros, required
  niupc.Vbox, niupc.Hbox, niupc.Cbox, niupc.FlatTabs, niupc.GridBox, niupc.Menu,
  niupc.MultiBox, niupc.Normalizer, niupc.ParamBox, niupc.Tabs, niupc.Zbox

# re-use types for IUP, IM and CD
include niup/inc/c/im_template
include niup/inc/c/cd_template
include niup/inc/c/iup_template
include niup/inc/c/im_const
include niup/inc/c/cd_const
include niup/inc/c/iup_const

#
include niup/inc/types
include niup/inc/animatedlabel
include niup/inc/backgroundbox
include niup/inc/button
include niup/inc/calendar
include niup/inc/canvas
include niup/inc/cbox
include niup/inc/clipboard
include niup/inc/colorbar
include niup/inc/colorbrowser
include niup/inc/colordlg
include niup/inc/datepick
include niup/inc/detachbox
include niup/inc/dial
include niup/inc/dialog
include niup/inc/dropbutton
include niup/inc/expander
include niup/inc/filedlg
include niup/inc/fill
include niup/inc/flatbutton
include niup/inc/flatframe
include niup/inc/flatlabel
include niup/inc/flatlist
include niup/inc/flatscrollbox
include niup/inc/flatseparator
include niup/inc/flattabs
include niup/inc/flattoggle
include niup/inc/flattree
include niup/inc/flatval
include niup/inc/fontdlg
include niup/inc/frame
include niup/inc/gauge
include niup/inc/gridbox
include niup/inc/hbox
include niup/inc/image
include niup/inc/imagergb
include niup/inc/imagergba
include niup/inc/item
include niup/inc/label
include niup/inc/link
include niup/inc/list
include niup/inc/menu
include niup/inc/messagedlg
include niup/inc/multibox
include niup/inc/multiline
include niup/inc/normalizer
include niup/inc/param
include niup/inc/parambox
include niup/inc/progressbar
include niup/inc/progressdlg
include niup/inc/radio
include niup/inc/sbox
include niup/inc/scrollbox
include niup/inc/separator
include niup/inc/space
include niup/inc/spin
include niup/inc/spinbox
include niup/inc/split
include niup/inc/submenu
include niup/inc/tabs
include niup/inc/text
include niup/inc/thread
include niup/inc/timer
include niup/inc/toggle
include niup/inc/tree
include niup/inc/user
include niup/inc/val
include niup/inc/vbox
include niup/inc/zbox
include niup/inc/utilsfn

#
include niup/inc/misc
include niup/inc/k_callbacks
