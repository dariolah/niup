template isshift*(Xs: untyped): untyped =
  (Xs[0] == 'S')

template iscontrol*(Xs: untyped): untyped =
  (Xs[1] == 'C')

template isbutton1*(Xs: untyped): untyped =
  (Xs[2] == '1')

template isbutton2*(Xs: untyped): untyped =
  (Xs[3] == '2')

template isbutton3*(Xs: untyped): untyped =
  (Xs[4] == '3')

template isdouble*(Xs: untyped): untyped =
  (Xs[5] == 'D')

template isalt*(Xs: untyped): untyped =
  (Xs[6] == 'A')

template issys*(Xs: untyped): untyped =
  (Xs[7] == 'Y')

template isbutton4*(Xs: untyped): untyped =
  (Xs[8] == '4')

template isbutton5*(Xs: untyped): untyped =
  (Xs[9] == '5')

template iup_isprint*(Xc: untyped): untyped =
  ((Xc) > 31 and (Xc) < 127)

template iup_isXkey*(Xc: untyped): untyped =
  ((Xc) >= 128)

template iup_isShiftXkey*(Xc: untyped): untyped =
  (((Xc) and 0x10000000) != 0)

template iup_isCtrlXkey*(Xc: untyped): untyped =
  (((Xc) and 0x20000000) != 0)

template iup_isAltXkey*(Xc: untyped): untyped =
  (((Xc) and 0x40000000) != 0)

template iup_isSysXkey*(Xc: untyped): untyped =
  (((Xc) and 0x80000000) != 0)

template iup_XkeyBase*(Xc: untyped): untyped =
  ((Xc) and 0x0FFFFFFF)

template iup_XkeyShift*(Xc: untyped): untyped =
  ((Xc) or 0x10000000)

template iup_XkeyCtrl*(Xc: untyped): untyped =
  ((Xc) or 0x20000000)

template iup_XkeyAlt*(Xc: untyped): untyped =
  ((Xc) or 0x40000000)

template iup_XkeySys*(Xc: untyped): untyped =
  ((Xc) or 0x80000000)

