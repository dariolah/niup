when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  import strformat
  #

type
  AnimatedLabel_t* = distinct PIhandle
  BackgroundBox_t* = distinct PIhandle
  Button_t* = distinct PIhandle
  Calendar_t* = distinct PIhandle
  Canvas_t* = distinct PIhandle
  Cbox_t* = distinct PIhandle
  Clipboard_t* = distinct PIhandle
  Colorbar_t* = distinct PIhandle
  ColorBrowser_t* = distinct PIhandle
  ColorDlg_t* = distinct PIhandle
  DatePick_t* = distinct PIhandle
  DetachBox_t* = distinct PIhandle
  Dial_t* = distinct PIhandle
  Dialog_t* = distinct PIhandle
  DropButton_t* = distinct PIhandle
  Expander_t* = distinct PIhandle
  FileDlg_t* = distinct PIhandle
  Fill_t* = distinct PIhandle
  FlatButton_t* = distinct PIhandle
  FlatFrame_t* = distinct PIhandle
  FlatLabel_t* = distinct PIhandle
  FlatList_t* = distinct PIhandle
  FlatScrollBox_t* = distinct PIhandle
  FlatSeparator_t* = distinct PIhandle
  FlatTabs_t* = distinct PIhandle
  FlatToggle_t* = distinct PIhandle
  FlatTree_t* = distinct PIhandle
  FlatVal_t* = distinct PIhandle
  FontDlg_t* = distinct PIhandle
  Frame_t* = distinct PIhandle
  Gauge_t* = distinct PIhandle
  GridBox_t* = distinct PIhandle
  Hbox_t* = distinct PIhandle
  Image_t* = distinct PIhandle
  ImageRGB_t* = distinct PIhandle
  ImageRGBA_t* = distinct PIhandle
  Item_t* = distinct PIhandle
  Label_t* = distinct PIhandle
  Link_t* = distinct PIhandle
  List_t* = distinct PIhandle
  Menu_t* = distinct PIhandle
  MessageDlg_t* = distinct PIhandle
  MultiBox_t* = distinct PIhandle
  MultiLine_t* = distinct PIhandle
  Normalizer_t* = distinct PIhandle
  Param_t* = distinct PIhandle
  ParamBox_t* = distinct PIhandle
  ProgressBar_t* = distinct PIhandle
  ProgressDlg_t* = distinct PIhandle
  Radio_t* = distinct PIhandle
  Sbox_t* = distinct PIhandle
  ScrollBox_t* = distinct PIhandle
  Separator_t* = distinct PIhandle
  Space_t* = distinct PIhandle
  Spin_t* = distinct PIhandle
  Spinbox_t* = distinct PIhandle
  Split_t* = distinct PIhandle
  Submenu_t* = distinct PIhandle
  Tabs_t* = distinct PIhandle
  Text_t* = distinct PIhandle
  Thread_t* = distinct PIhandle
  Timer_t* = distinct PIhandle
  Toggle_t* = distinct PIhandle
  Tree_t* = distinct PIhandle
  User_t* = distinct PIhandle
  Val_t* = distinct PIhandle
  Vbox_t* = distinct PIhandle
  Zbox_t* = distinct PIhandle

type IUPhandle_t* = AnimatedLabel_t | BackgroundBox_t | Button_t | Calendar_t | Canvas_t | Cbox_t | Clipboard_t | Colorbar_t | ColorBrowser_t | ColorDlg_t | DatePick_t | DetachBox_t | Dial_t | Dialog_t | DropButton_t | Expander_t | FileDlg_t | Fill_t | FlatButton_t | FlatFrame_t | FlatLabel_t | FlatList_t | FlatScrollBox_t | FlatSeparator_t | FlatTabs_t | FlatToggle_t | FlatTree_t | FlatVal_t | FontDlg_t | Frame_t | Gauge_t | GridBox_t | Hbox_t | Image_t | ImageRGB_t | ImageRGBA_t | Item_t | Label_t | Link_t | List_t | Menu_t | MessageDlg_t | MultiBox_t | MultiLine_t | Normalizer_t | Param_t | ParamBox_t | ProgressBar_t | ProgressDlg_t | Radio_t | Sbox_t | ScrollBox_t | Separator_t | Space_t | Spin_t | Spinbox_t | Split_t | Submenu_t | Tabs_t | Text_t | Thread_t | Timer_t | Toggle_t | Tree_t | User_t | Val_t | Vbox_t | Zbox_t

