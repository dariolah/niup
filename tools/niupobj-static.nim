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
include niup/inc/types.nim
include niup/inc/animatedlabel.nim
include niup/inc/backgroundbox.nim
include niup/inc/button.nim
include niup/inc/calendar.nim
include niup/inc/canvas.nim
include niup/inc/cbox.nim
include niup/inc/clipboard.nim
include niup/inc/colorbar.nim
include niup/inc/colorbrowser.nim
include niup/inc/colordlg.nim
include niup/inc/datepick.nim
include niup/inc/detachbox.nim
include niup/inc/dial.nim
include niup/inc/dialog.nim
include niup/inc/dropbutton.nim
include niup/inc/expander.nim
include niup/inc/filedlg.nim
include niup/inc/fill.nim
include niup/inc/flatbutton.nim
include niup/inc/flatframe.nim
include niup/inc/flatlabel.nim
include niup/inc/flatlist.nim
include niup/inc/flatscrollbox.nim
include niup/inc/flatseparator.nim
include niup/inc/flattabs.nim
include niup/inc/flattoggle.nim
include niup/inc/flattree.nim
include niup/inc/flatval.nim
include niup/inc/fontdlg.nim
include niup/inc/frame.nim
include niup/inc/gauge.nim
include niup/inc/gridbox.nim
include niup/inc/hbox.nim
include niup/inc/image.nim
include niup/inc/imagergb.nim
include niup/inc/imagergba.nim
include niup/inc/item.nim
include niup/inc/label.nim
include niup/inc/link.nim
include niup/inc/list.nim
include niup/inc/menu.nim
include niup/inc/messagedlg.nim
include niup/inc/multibox.nim
include niup/inc/multiline.nim
include niup/inc/normalizer.nim
include niup/inc/param.nim
include niup/inc/parambox.nim
include niup/inc/progressbar.nim
include niup/inc/progressdlg.nim
include niup/inc/radio.nim
include niup/inc/sbox.nim
include niup/inc/scrollbox.nim
include niup/inc/separator.nim
include niup/inc/space.nim
include niup/inc/spin.nim
include niup/inc/spinbox.nim
include niup/inc/split.nim
include niup/inc/submenu.nim
include niup/inc/tabs.nim
include niup/inc/text.nim
include niup/inc/thread.nim
include niup/inc/timer.nim
include niup/inc/toggle.nim
include niup/inc/tree.nim
include niup/inc/user.nim
include niup/inc/val.nim
include niup/inc/vbox.nim
include niup/inc/zbox.nim
include niup/inc/utilsfn.nim

#
include niup/inc/misc
include niup/inc/k_callbacks
