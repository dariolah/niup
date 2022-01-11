template cdAlpha*(_: untyped): untyped =
  cast[uint8]((not (((_) shr 24) and 0xFF)))

template cdReserved*(_: untyped): untyped =
  cast[uint8]((((_) shr 24) and 0xFF))

template cdRed*(_: untyped): untyped =
  cast[uint8]((((_) shr 16) and 0xFF))

template cdGreen*(_: untyped): untyped =
  cast[uint8]((((_) shr 8) and 0xFF))

template cdBlue*(_: untyped): untyped =
  cast[uint8]((((_) shr 0) and 0xFF))

