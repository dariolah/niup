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

