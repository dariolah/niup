when defined(gendocniup):
  # required for generation of documentation
  import std/macros
  import niup/niupc
  include niup/inc/doctypes
  import strformat
  #

proc cdVersion*(): string {.cdecl.} =
    return $niupc.cdVersion()

proc cdVersionDate*(): string {.cdecl.} =
    return $niupc.cdVersionDate()

proc cdVersionNumber*(): cint {.cdecl.} =
    return niupc.cdVersionNumber()

proc cdCreateCanvas*(context: ptr cdContext; data: pointer): ptr cdCanvas {.cdecl.} =
    return niupc.cdCreateCanvas(context, data)

proc cdKillCanvas*(canvas: ptr cdCanvas) {.cdecl.} =
    niupc.cdKillCanvas(canvas)

proc cdCanvasGetContext*(canvas: ptr cdCanvas): ptr cdContext {.cdecl.} =
    return niupc.cdCanvasGetContext(canvas)

proc cdCanvasActivate*(canvas: ptr cdCanvas): cint {.cdecl.} =
    return niupc.cdCanvasActivate(canvas)

proc cdCanvasDeactivate*(canvas: ptr cdCanvas) {.cdecl.} =
    niupc.cdCanvasDeactivate(canvas)

proc cdUseContextPlus*(use: cint): cint {.cdecl.} =
    return niupc.cdUseContextPlus(use)

proc cdInitContextPlus*() {.cdecl.} =
    niupc.cdInitContextPlus()

proc cdFinishContextPlus*() {.cdecl.} =
    niupc.cdFinishContextPlus()

proc cdContextRegisterCallback*(context: ptr cdContext; cb: cint; `func`: cdCallback): cint {.cdecl.} =
    return niupc.cdContextRegisterCallback(context, cb, `func`)

proc cdContextCaps*(context: ptr cdContext): culong {.cdecl.} =
    return niupc.cdContextCaps(context)

proc cdContextIsPlus*(context: ptr cdContext): cint {.cdecl.} =
    return niupc.cdContextIsPlus(context)

proc cdContextType*(context: ptr cdContext): cint {.cdecl.} =
    return niupc.cdContextType(context)

proc cdCanvasSimulate*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl.} =
    return niupc.cdCanvasSimulate(canvas, mode)

proc cdCanvasFlush*(canvas: ptr cdCanvas) {.cdecl.} =
    niupc.cdCanvasFlush(canvas)

proc cdCanvasClear*(canvas: ptr cdCanvas) {.cdecl.} =
    niupc.cdCanvasClear(canvas)

proc cdCanvasSaveState*(canvas: ptr cdCanvas): ptr cdState {.cdecl.} =
    return niupc.cdCanvasSaveState(canvas)

proc cdCanvasRestoreState*(canvas: ptr cdCanvas; state: ptr cdState) {.cdecl.} =
    niupc.cdCanvasRestoreState(canvas, state)

proc cdReleaseState*(state: ptr cdState) {.cdecl.} =
    niupc.cdReleaseState(state)

proc cdCanvasSetAttribute*(canvas: ptr cdCanvas; name: string; data: string) {.cdecl.} =
    niupc.cdCanvasSetAttribute(canvas, cstring(name), cstring(data))

proc cdCanvasGetAttribute*(canvas: ptr cdCanvas; name: string): string {.cdecl.} =
    return $niupc.cdCanvasGetAttribute(canvas, cstring(name))

proc cdCanvasPlay*(canvas: ptr cdCanvas; context: ptr cdContext; xmin: cint; xmax: cint; ymin: cint; ymax: cint; data: pointer): cint {.cdecl.} =
    return niupc.cdCanvasPlay(canvas, context, xmin, xmax, ymin, ymax, data)

proc cdCanvasGetSize*(canvas: ptr cdCanvas; width: ptr cint; height: ptr cint; width_mm: ptr cdouble; height_mm: ptr cdouble) {.cdecl.} =
    niupc.cdCanvasGetSize(canvas, width, height, width_mm, height_mm)

proc cdCanvasUpdateYAxis*(canvas: ptr cdCanvas; y: ptr cint): cint {.cdecl.} =
    return niupc.cdCanvasUpdateYAxis(canvas, y)

proc cdfCanvasUpdateYAxis*(canvas: ptr cdCanvas; y: ptr cdouble): cdouble {.cdecl.} =
    return niupc.cdfCanvasUpdateYAxis(canvas, y)

proc cdCanvasInvertYAxis*(canvas: ptr cdCanvas; y: cint): cint {.cdecl.} =
    return niupc.cdCanvasInvertYAxis(canvas, y)

proc cdfCanvasInvertYAxis*(canvas: ptr cdCanvas; y: cdouble): cdouble {.cdecl.} =
    return niupc.cdfCanvasInvertYAxis(canvas, y)

proc cdCanvasMM2Pixel*(canvas: ptr cdCanvas; mm_dx: cdouble; mm_dy: cdouble; dx: ptr cint; dy: ptr cint) {.cdecl.} =
    niupc.cdCanvasMM2Pixel(canvas, mm_dx, mm_dy, dx, dy)

proc cdCanvasPixel2MM*(canvas: ptr cdCanvas; dx: cint; dy: cint; mm_dx: ptr cdouble; mm_dy: ptr cdouble) {.cdecl.} =
    niupc.cdCanvasPixel2MM(canvas, dx, dy, mm_dx, mm_dy)

proc cdfCanvasMM2Pixel*(canvas: ptr cdCanvas; mm_dx: cdouble; mm_dy: cdouble; dx: ptr cdouble; dy: ptr cdouble) {.cdecl.} =
    niupc.cdfCanvasMM2Pixel(canvas, mm_dx, mm_dy, dx, dy)

proc cdfCanvasPixel2MM*(canvas: ptr cdCanvas; dx: cdouble; dy: cdouble; mm_dx: ptr cdouble; mm_dy: ptr cdouble) {.cdecl.} =
    niupc.cdfCanvasPixel2MM(canvas, dx, dy, mm_dx, mm_dy)

proc cdCanvasOrigin*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl.} =
    niupc.cdCanvasOrigin(canvas, x, y)

proc cdfCanvasOrigin*(canvas: ptr cdCanvas; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.cdfCanvasOrigin(canvas, x, y)

proc cdCanvasGetOrigin*(canvas: ptr cdCanvas; x: ptr cint; y: ptr cint) {.cdecl.} =
    niupc.cdCanvasGetOrigin(canvas, x, y)

proc cdfCanvasGetOrigin*(canvas: ptr cdCanvas; x: ptr cdouble; y: ptr cdouble) {.cdecl.} =
    niupc.cdfCanvasGetOrigin(canvas, x, y)

proc cdCanvasTransform*(canvas: ptr cdCanvas; matrix: ptr cdouble) {.cdecl.} =
    niupc.cdCanvasTransform(canvas, matrix)

proc cdCanvasGetTransform*(canvas: ptr cdCanvas): ptr cdouble {.cdecl.} =
    return niupc.cdCanvasGetTransform(canvas)

proc cdCanvasTransformMultiply*(canvas: ptr cdCanvas; matrix: ptr cdouble) {.cdecl.} =
    niupc.cdCanvasTransformMultiply(canvas, matrix)

proc cdCanvasTransformRotate*(canvas: ptr cdCanvas; angle: cdouble) {.cdecl.} =
    niupc.cdCanvasTransformRotate(canvas, angle)

proc cdCanvasTransformScale*(canvas: ptr cdCanvas; sx: cdouble; sy: cdouble) {.cdecl.} =
    niupc.cdCanvasTransformScale(canvas, sx, sy)

proc cdCanvasTransformTranslate*(canvas: ptr cdCanvas; dx: cdouble; dy: cdouble) {.cdecl.} =
    niupc.cdCanvasTransformTranslate(canvas, dx, dy)

proc cdCanvasTransformPoint*(canvas: ptr cdCanvas; x: cint; y: cint; tx: ptr cint; ty: ptr cint) {.cdecl.} =
    niupc.cdCanvasTransformPoint(canvas, x, y, tx, ty)

proc cdfCanvasTransformPoint*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; tx: ptr cdouble; ty: ptr cdouble) {.cdecl.} =
    niupc.cdfCanvasTransformPoint(canvas, x, y, tx, ty)

proc cdCanvasClip*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl.} =
    return niupc.cdCanvasClip(canvas, mode)

proc cdCanvasClipArea*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdCanvasClipArea(canvas, xmin, xmax, ymin, ymax)

proc cdCanvasGetClipArea*(canvas: ptr cdCanvas; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint): cint {.cdecl.} =
    return niupc.cdCanvasGetClipArea(canvas, xmin, xmax, ymin, ymax)

proc cdfCanvasClipArea*(canvas: ptr cdCanvas; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble) {.cdecl.} =
    niupc.cdfCanvasClipArea(canvas, xmin, xmax, ymin, ymax)

proc cdfCanvasGetClipArea*(canvas: ptr cdCanvas; xmin: ptr cdouble; xmax: ptr cdouble; ymin: ptr cdouble; ymax: ptr cdouble): cint {.cdecl.} =
    return niupc.cdfCanvasGetClipArea(canvas, xmin, xmax, ymin, ymax)

proc cdCanvasIsPointInRegion*(canvas: ptr cdCanvas; x: cint; y: cint): cint {.cdecl.} =
    return niupc.cdCanvasIsPointInRegion(canvas, x, y)

proc cdCanvasOffsetRegion*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl.} =
    niupc.cdCanvasOffsetRegion(canvas, x, y)

proc cdCanvasGetRegionBox*(canvas: ptr cdCanvas; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint) {.cdecl.} =
    niupc.cdCanvasGetRegionBox(canvas, xmin, xmax, ymin, ymax)

proc cdCanvasRegionCombineMode*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl.} =
    return niupc.cdCanvasRegionCombineMode(canvas, mode)

proc cdCanvasPixel*(canvas: ptr cdCanvas; x: cint; y: cint; color: clong) {.cdecl.} =
    niupc.cdCanvasPixel(canvas, x, y, color)

proc cdCanvasMark*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl.} =
    niupc.cdCanvasMark(canvas, x, y)

proc cdfCanvasPixel*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; color: clong) {.cdecl.} =
    niupc.cdfCanvasPixel(canvas, x, y, color)

proc cdfCanvasMark*(canvas: ptr cdCanvas; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.cdfCanvasMark(canvas, x, y)

proc cdCanvasBegin*(canvas: ptr cdCanvas; mode: cint) {.cdecl.} =
    niupc.cdCanvasBegin(canvas, mode)

proc cdCanvasPathSet*(canvas: ptr cdCanvas; action: cint) {.cdecl.} =
    niupc.cdCanvasPathSet(canvas, action)

proc cdCanvasEnd*(canvas: ptr cdCanvas) {.cdecl.} =
    niupc.cdCanvasEnd(canvas)

proc cdCanvasLine*(canvas: ptr cdCanvas; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.cdCanvasLine(canvas, x1, y1, x2, y2)

proc cdCanvasVertex*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl.} =
    niupc.cdCanvasVertex(canvas, x, y)

proc cdCanvasRect*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdCanvasRect(canvas, xmin, xmax, ymin, ymax)

proc cdCanvasBox*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdCanvasBox(canvas, xmin, xmax, ymin, ymax)

proc cdCanvasArc*(canvas: ptr cdCanvas; xc: cint; yc: cint; w: cint; h: cint; angle1: cdouble; angle2: cdouble) {.cdecl.} =
    niupc.cdCanvasArc(canvas, xc, yc, w, h, angle1, angle2)

proc cdCanvasSector*(canvas: ptr cdCanvas; xc: cint; yc: cint; w: cint; h: cint; angle1: cdouble; angle2: cdouble) {.cdecl.} =
    niupc.cdCanvasSector(canvas, xc, yc, w, h, angle1, angle2)

proc cdCanvasChord*(canvas: ptr cdCanvas; xc: cint; yc: cint; w: cint; h: cint; angle1: cdouble; angle2: cdouble) {.cdecl.} =
    niupc.cdCanvasChord(canvas, xc, yc, w, h, angle1, angle2)

proc cdCanvasText*(canvas: ptr cdCanvas; x: cint; y: cint; s: string) {.cdecl.} =
    niupc.cdCanvasText(canvas, x, y, cstring(s))

proc cdfCanvasLine*(canvas: ptr cdCanvas; x1: cdouble; y1: cdouble; x2: cdouble; y2: cdouble) {.cdecl.} =
    niupc.cdfCanvasLine(canvas, x1, y1, x2, y2)

proc cdfCanvasVertex*(canvas: ptr cdCanvas; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.cdfCanvasVertex(canvas, x, y)

proc cdfCanvasRect*(canvas: ptr cdCanvas; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble) {.cdecl.} =
    niupc.cdfCanvasRect(canvas, xmin, xmax, ymin, ymax)

proc cdfCanvasBox*(canvas: ptr cdCanvas; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble) {.cdecl.} =
    niupc.cdfCanvasBox(canvas, xmin, xmax, ymin, ymax)

proc cdfCanvasArc*(canvas: ptr cdCanvas; xc: cdouble; yc: cdouble; w: cdouble; h: cdouble; angle1: cdouble; angle2: cdouble) {.cdecl.} =
    niupc.cdfCanvasArc(canvas, xc, yc, w, h, angle1, angle2)

proc cdfCanvasSector*(canvas: ptr cdCanvas; xc: cdouble; yc: cdouble; w: cdouble; h: cdouble; angle1: cdouble; angle2: cdouble) {.cdecl.} =
    niupc.cdfCanvasSector(canvas, xc, yc, w, h, angle1, angle2)

proc cdfCanvasChord*(canvas: ptr cdCanvas; xc: cdouble; yc: cdouble; w: cdouble; h: cdouble; angle1: cdouble; angle2: cdouble) {.cdecl.} =
    niupc.cdfCanvasChord(canvas, xc, yc, w, h, angle1, angle2)

proc cdfCanvasText*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: string) {.cdecl.} =
    niupc.cdfCanvasText(canvas, x, y, cstring(s))

proc cdCanvasSetBackground*(canvas: ptr cdCanvas; color: clong) {.cdecl.} =
    niupc.cdCanvasSetBackground(canvas, color)

proc cdCanvasSetForeground*(canvas: ptr cdCanvas; color: clong) {.cdecl.} =
    niupc.cdCanvasSetForeground(canvas, color)

proc cdCanvasBackground*(canvas: ptr cdCanvas; color: clong): clong {.cdecl.} =
    return niupc.cdCanvasBackground(canvas, color)

proc cdCanvasForeground*(canvas: ptr cdCanvas; color: clong): clong {.cdecl.} =
    return niupc.cdCanvasForeground(canvas, color)

proc cdCanvasBackOpacity*(canvas: ptr cdCanvas; opacity: cint): cint {.cdecl.} =
    return niupc.cdCanvasBackOpacity(canvas, opacity)

proc cdCanvasWriteMode*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl.} =
    return niupc.cdCanvasWriteMode(canvas, mode)

proc cdCanvasLineStyle*(canvas: ptr cdCanvas; style: cint): cint {.cdecl.} =
    return niupc.cdCanvasLineStyle(canvas, style)

proc cdCanvasLineStyleDashes*(canvas: ptr cdCanvas; dashes: ptr cint; count: cint) {.cdecl.} =
    niupc.cdCanvasLineStyleDashes(canvas, dashes, count)

proc cdCanvasLineWidth*(canvas: ptr cdCanvas; width: cint): cint {.cdecl.} =
    return niupc.cdCanvasLineWidth(canvas, width)

proc cdCanvasLineJoin*(canvas: ptr cdCanvas; join: cint): cint {.cdecl.} =
    return niupc.cdCanvasLineJoin(canvas, join)

proc cdCanvasLineCap*(canvas: ptr cdCanvas; cap: cint): cint {.cdecl.} =
    return niupc.cdCanvasLineCap(canvas, cap)

proc cdCanvasInteriorStyle*(canvas: ptr cdCanvas; style: cint): cint {.cdecl.} =
    return niupc.cdCanvasInteriorStyle(canvas, style)

proc cdCanvasHatch*(canvas: ptr cdCanvas; style: cint): cint {.cdecl.} =
    return niupc.cdCanvasHatch(canvas, style)

proc cdCanvasStipple*(canvas: ptr cdCanvas; w: cint; h: cint; stipple: openArray[uint8]) {.cdecl.} =
    niupc.cdCanvasStipple(canvas, w, h, cast[ptr uint8](stipple))

proc cdCanvasGetStipple*(canvas: ptr cdCanvas; n: ptr cint; m: ptr cint): ptr uint8 {.cdecl.} =
    return niupc.cdCanvasGetStipple(canvas, n, m)

proc cdCanvasPattern*(canvas: ptr cdCanvas; w: cint; h: cint; pattern: ptr clong) {.cdecl.} =
    niupc.cdCanvasPattern(canvas, w, h, pattern)

proc cdCanvasGetPattern*(canvas: ptr cdCanvas; n: ptr cint; m: ptr cint): ptr clong {.cdecl.} =
    return niupc.cdCanvasGetPattern(canvas, n, m)

proc cdCanvasFillMode*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl.} =
    return niupc.cdCanvasFillMode(canvas, mode)

proc cdCanvasFont*(canvas: ptr cdCanvas; type_face: string; style: cint; size: cint): cint {.cdecl.} =
    return niupc.cdCanvasFont(canvas, cstring(type_face), style, size)

proc cdCanvasGetFont*(canvas: ptr cdCanvas; type_face: string; style: ptr cint; size: ptr cint) {.cdecl.} =
    niupc.cdCanvasGetFont(canvas, cstring(type_face), style, size)

proc cdCanvasNativeFont*(canvas: ptr cdCanvas; font: string): string {.cdecl.} =
    return $niupc.cdCanvasNativeFont(canvas, cstring(font))

proc cdCanvasTextAlignment*(canvas: ptr cdCanvas; alignment: cint): cint {.cdecl.} =
    return niupc.cdCanvasTextAlignment(canvas, alignment)

proc cdCanvasTextOrientation*(canvas: ptr cdCanvas; angle: cdouble): cdouble {.cdecl.} =
    return niupc.cdCanvasTextOrientation(canvas, angle)

proc cdCanvasMarkType*(canvas: ptr cdCanvas; `type`: cint): cint {.cdecl.} =
    return niupc.cdCanvasMarkType(canvas, `type`)

proc cdCanvasMarkSize*(canvas: ptr cdCanvas; size: cint): cint {.cdecl.} =
    return niupc.cdCanvasMarkSize(canvas, size)

proc cdCanvasVectorText*(canvas: ptr cdCanvas; x: cint; y: cint; s: string) {.cdecl.} =
    niupc.cdCanvasVectorText(canvas, x, y, cstring(s))

proc cdCanvasMultiLineVectorText*(canvas: ptr cdCanvas; x: cint; y: cint; s: string) {.cdecl.} =
    niupc.cdCanvasMultiLineVectorText(canvas, x, y, cstring(s))

proc cdCanvasVectorFont*(canvas: ptr cdCanvas; filename: string): string {.cdecl.} =
    return $niupc.cdCanvasVectorFont(canvas, cstring(filename))

proc cdCanvasVectorTextDirection*(canvas: ptr cdCanvas; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.cdCanvasVectorTextDirection(canvas, x1, y1, x2, y2)

proc cdCanvasVectorTextTransform*(canvas: ptr cdCanvas; matrix: ptr cdouble): ptr cdouble {.cdecl.} =
    return niupc.cdCanvasVectorTextTransform(canvas, matrix)

proc cdCanvasVectorTextSize*(canvas: ptr cdCanvas; size_x: cint; size_y: cint; s: string) {.cdecl.} =
    niupc.cdCanvasVectorTextSize(canvas, size_x, size_y, cstring(s))

proc cdCanvasVectorCharSize*(canvas: ptr cdCanvas; size: cint): cint {.cdecl.} =
    return niupc.cdCanvasVectorCharSize(canvas, size)

proc cdCanvasVectorFontSize*(canvas: ptr cdCanvas; size_x: cdouble; size_y: cdouble) {.cdecl.} =
    niupc.cdCanvasVectorFontSize(canvas, size_x, size_y)

proc cdCanvasGetVectorFontSize*(canvas: ptr cdCanvas; size_x: ptr cdouble; size_y: ptr cdouble) {.cdecl.} =
    niupc.cdCanvasGetVectorFontSize(canvas, size_x, size_y)

proc cdCanvasGetVectorTextSize*(canvas: ptr cdCanvas; s: string; x: ptr cint; y: ptr cint) {.cdecl.} =
    niupc.cdCanvasGetVectorTextSize(canvas, cstring(s), x, y)

proc cdCanvasGetVectorTextBounds*(canvas: ptr cdCanvas; s: string; x: cint; y: cint; rect: ptr cint) {.cdecl.} =
    niupc.cdCanvasGetVectorTextBounds(canvas, cstring(s), x, y, rect)

proc cdCanvasGetVectorTextBox*(canvas: ptr cdCanvas; x: cint; y: cint; s: string; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint) {.cdecl.} =
    niupc.cdCanvasGetVectorTextBox(canvas, x, y, cstring(s), xmin, xmax, ymin, ymax)

proc cdfCanvasVectorTextDirection*(canvas: ptr cdCanvas; x1: cdouble; y1: cdouble; x2: cdouble; y2: cdouble) {.cdecl.} =
    niupc.cdfCanvasVectorTextDirection(canvas, x1, y1, x2, y2)

proc cdfCanvasVectorTextSize*(canvas: ptr cdCanvas; size_x: cdouble; size_y: cdouble; s: string) {.cdecl.} =
    niupc.cdfCanvasVectorTextSize(canvas, size_x, size_y, cstring(s))

proc cdfCanvasGetVectorTextSize*(canvas: ptr cdCanvas; s: string; x: ptr cdouble; y: ptr cdouble) {.cdecl.} =
    niupc.cdfCanvasGetVectorTextSize(canvas, cstring(s), x, y)

proc cdfCanvasVectorCharSize*(canvas: ptr cdCanvas; size: cdouble): cdouble {.cdecl.} =
    return niupc.cdfCanvasVectorCharSize(canvas, size)

proc cdfCanvasVectorText*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: string) {.cdecl.} =
    niupc.cdfCanvasVectorText(canvas, x, y, cstring(s))

proc cdfCanvasMultiLineVectorText*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: string) {.cdecl.} =
    niupc.cdfCanvasMultiLineVectorText(canvas, x, y, cstring(s))

proc cdfCanvasGetVectorTextBounds*(canvas: ptr cdCanvas; s: string; x: cdouble; y: cdouble; rect: ptr cdouble) {.cdecl.} =
    niupc.cdfCanvasGetVectorTextBounds(canvas, cstring(s), x, y, rect)

proc cdfCanvasGetVectorTextBox*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: string; xmin: ptr cdouble; xmax: ptr cdouble; ymin: ptr cdouble; ymax: ptr cdouble) {.cdecl.} =
    niupc.cdfCanvasGetVectorTextBox(canvas, x, y, cstring(s), xmin, xmax, ymin, ymax)

proc cdCanvasGetFontDim*(canvas: ptr cdCanvas; max_width: ptr cint; height: ptr cint; ascent: ptr cint; descent: ptr cint) {.cdecl.} =
    niupc.cdCanvasGetFontDim(canvas, max_width, height, ascent, descent)

proc cdCanvasGetTextSize*(canvas: ptr cdCanvas; s: string; width: ptr cint; height: ptr cint) {.cdecl.} =
    niupc.cdCanvasGetTextSize(canvas, cstring(s), width, height)

proc cdCanvasGetTextBox*(canvas: ptr cdCanvas; x: cint; y: cint; s: string; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint) {.cdecl.} =
    niupc.cdCanvasGetTextBox(canvas, x, y, cstring(s), xmin, xmax, ymin, ymax)

proc cdfCanvasGetTextBox*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: string; xmin: ptr cdouble; xmax: ptr cdouble; ymin: ptr cdouble; ymax: ptr cdouble) {.cdecl.} =
    niupc.cdfCanvasGetTextBox(canvas, x, y, cstring(s), xmin, xmax, ymin, ymax)

proc cdCanvasGetTextBounds*(canvas: ptr cdCanvas; x: cint; y: cint; s: string; rect: ptr cint) {.cdecl.} =
    niupc.cdCanvasGetTextBounds(canvas, x, y, cstring(s), rect)

proc cdfCanvasGetTextBounds*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: string; rect: ptr cdouble) {.cdecl.} =
    niupc.cdfCanvasGetTextBounds(canvas, x, y, cstring(s), rect)

proc cdCanvasGetColorPlanes*(canvas: ptr cdCanvas): cint {.cdecl.} =
    return niupc.cdCanvasGetColorPlanes(canvas)

proc cdCanvasPalette*(canvas: ptr cdCanvas; n: cint; palette: ptr clong; mode: cint) {.cdecl.} =
    niupc.cdCanvasPalette(canvas, n, palette, mode)

proc cdCanvasGetImageRGB*(canvas: ptr cdCanvas; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]; x: cint; y: cint; iw: cint; ih: cint) {.cdecl.} =
    niupc.cdCanvasGetImageRGB(canvas, cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b), x, y, iw, ih)

proc cdCanvasPutImageRectRGB*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]; x: cint; y: cint; w: cint; h: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdCanvasPutImageRectRGB(canvas, iw, ih, cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b), x, y, w, h, xmin, xmax, ymin, ymax)

proc cdCanvasPutImageRectRGBA*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]; a: openArray[uint8]; x: cint; y: cint; w: cint; h: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdCanvasPutImageRectRGBA(canvas, iw, ih, cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b), cast[ptr uint8](a), x, y, w, h, xmin, xmax, ymin, ymax)

proc cdCanvasPutImageRectMap*(canvas: ptr cdCanvas; iw: cint; ih: cint; index: openArray[uint8]; colors: ptr clong; x: cint; y: cint; w: cint; h: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdCanvasPutImageRectMap(canvas, iw, ih, cast[ptr uint8](index), colors, x, y, w, h, xmin, xmax, ymin, ymax)

proc cdfCanvasPutImageRectRGB*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]; x: cdouble; y: cdouble; w: cdouble; h: cdouble; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdfCanvasPutImageRectRGB(canvas, iw, ih, cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b), x, y, w, h, xmin, xmax, ymin, ymax)

proc cdfCanvasPutImageRectRGBA*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]; a: openArray[uint8]; x: cdouble; y: cdouble; w: cdouble; h: cdouble; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdfCanvasPutImageRectRGBA(canvas, iw, ih, cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b), cast[ptr uint8](a), x, y, w, h, xmin, xmax, ymin, ymax)

proc cdfCanvasPutImageRectMap*(canvas: ptr cdCanvas; iw: cint; ih: cint; index: openArray[uint8]; colors: ptr clong; x: cdouble; y: cdouble; w: cdouble; h: cdouble; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdfCanvasPutImageRectMap(canvas, iw, ih, cast[ptr uint8](index), colors, x, y, w, h, xmin, xmax, ymin, ymax)

proc cdCanvasCreateImage*(canvas: ptr cdCanvas; w: cint; h: cint): ptr cdImage {.cdecl.} =
    return niupc.cdCanvasCreateImage(canvas, w, h)

proc cdKillImage*(image: ptr cdImage) {.cdecl.} =
    niupc.cdKillImage(image)

proc cdCanvasGetImage*(canvas: ptr cdCanvas; image: ptr cdImage; x: cint; y: cint) {.cdecl.} =
    niupc.cdCanvasGetImage(canvas, image, x, y)

proc cdCanvasPutImageRect*(canvas: ptr cdCanvas; image: ptr cdImage; x: cint; y: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdCanvasPutImageRect(canvas, image, x, y, xmin, xmax, ymin, ymax)

proc cdCanvasScrollArea*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint; dx: cint; dy: cint) {.cdecl.} =
    niupc.cdCanvasScrollArea(canvas, xmin, xmax, ymin, ymax, dx, dy)

proc cdCreateBitmap*(w: cint; h: cint; `type`: cint): ptr cdBitmap {.cdecl.} =
    return niupc.cdCreateBitmap(w, h, `type`)

proc cdKillBitmap*(bitmap: ptr cdBitmap) {.cdecl.} =
    niupc.cdKillBitmap(bitmap)

proc cdBitmapGetData*(bitmap: ptr cdBitmap; dataptr: cint): ptr uint8 {.cdecl.} =
    return niupc.cdBitmapGetData(bitmap, dataptr)

proc cdBitmapSetRect*(bitmap: ptr cdBitmap; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl.} =
    niupc.cdBitmapSetRect(bitmap, xmin, xmax, ymin, ymax)

proc cdCanvasPutBitmap*(canvas: ptr cdCanvas; bitmap: ptr cdBitmap; x: cint; y: cint; w: cint; h: cint) {.cdecl.} =
    niupc.cdCanvasPutBitmap(canvas, bitmap, x, y, w, h)

proc cdCanvasGetBitmap*(canvas: ptr cdCanvas; bitmap: ptr cdBitmap; x: cint; y: cint) {.cdecl.} =
    niupc.cdCanvasGetBitmap(canvas, bitmap, x, y)

proc cdBitmapRGB2Map*(bitmap_rgb: ptr cdBitmap; bitmap_map: ptr cdBitmap) {.cdecl.} =
    niupc.cdBitmapRGB2Map(bitmap_rgb, bitmap_map)

proc cdEncodeColor*(red: uint8; green: uint8; blue: uint8): clong {.cdecl.} =
    return niupc.cdEncodeColor(red, green, blue)

proc cdEncodeColorAlpha*(red: uint8; green: uint8; blue: uint8; alpha: uint8): clong {.cdecl.} =
    return niupc.cdEncodeColorAlpha(red, green, blue, alpha)

proc cdEncodeAlpha*(color: clong; alpha: uint8): clong {.cdecl.} =
    return niupc.cdEncodeAlpha(color, alpha)

proc cdDecodeColor*(color: clong; red: openArray[uint8]; green: openArray[uint8]; blue: openArray[uint8]) {.cdecl.} =
    niupc.cdDecodeColor(color, cast[ptr uint8](red), cast[ptr uint8](green), cast[ptr uint8](blue))

proc cdDecodeColorAlpha*(color: clong; red: openArray[uint8]; green: openArray[uint8]; blue: openArray[uint8]; alpha: openArray[uint8]) {.cdecl.} =
    niupc.cdDecodeColorAlpha(color, cast[ptr uint8](red), cast[ptr uint8](green), cast[ptr uint8](blue), cast[ptr uint8](alpha))

proc cdDecodeAlpha*(color: clong): uint8 {.cdecl.} =
    return niupc.cdDecodeAlpha(color)

proc cdRGB2Map*(width: cint; height: cint; red: openArray[uint8]; green: openArray[uint8]; blue: openArray[uint8]; index: openArray[uint8]; pal_size: cint; color: ptr clong) {.cdecl.} =
    niupc.cdRGB2Map(width, height, cast[ptr uint8](red), cast[ptr uint8](green), cast[ptr uint8](blue), cast[ptr uint8](index), pal_size, color)

proc cdContextIup*(): ptr cdContext {.cdecl.} =
    return niupc.cdContextIup()

proc cdContextIupDBuffer*(): ptr cdContext {.cdecl.} =
    return niupc.cdContextIupDBuffer()

proc cdContextIupDBufferRGB*(): ptr cdContext {.cdecl.} =
    return niupc.cdContextIupDBufferRGB()

proc cdContextPrinter*(): ptr cdContext {.cdecl.} =
    return niupc.cdContextPrinter()

proc cdContextImageRGB*(): ptr cdContext {.cdecl.} =
    return niupc.cdContextImageRGB()

proc cdContextDBufferRGB*(): ptr cdContext {.cdecl.} =
    return niupc.cdContextDBufferRGB()

proc cdRedImage*(cnv: ptr cdCanvas): ptr uint8 {.cdecl.} =
    return niupc.cdRedImage(cnv)

proc cdGreenImage*(cnv: ptr cdCanvas): ptr uint8 {.cdecl.} =
    return niupc.cdGreenImage(cnv)

proc cdBlueImage*(cnv: ptr cdCanvas): ptr uint8 {.cdecl.} =
    return niupc.cdBlueImage(cnv)

proc cdAlphaImage*(cnv: ptr cdCanvas): ptr uint8 {.cdecl.} =
    return niupc.cdAlphaImage(cnv)

proc imFileOpen*(file_name: string; error: ptr imErrorCodes): ptr imFile {.cdecl.} =
    return niupc.imFileOpen(cstring(file_name), error)

proc imFileOpenAs*(file_name: string; format: string; error: ptr imErrorCodes): ptr imFile {.cdecl.} =
    return niupc.imFileOpenAs(cstring(file_name), cstring(format), error)

proc imFileNew*(file_name: string; format: string; error: ptr imErrorCodes): ptr imFile {.cdecl.} =
    return niupc.imFileNew(cstring(file_name), cstring(format), error)

proc imFileClose*(ifile: ptr imFile) {.cdecl.} =
    niupc.imFileClose(ifile)

proc imFileHandle*(ifile: ptr imFile; index: cint): pointer {.cdecl.} =
    return niupc.imFileHandle(ifile, index)

proc imFileGetInfo*(ifile: ptr imFile; format: string; compression: string; image_count: ptr cint) {.cdecl.} =
    niupc.imFileGetInfo(ifile, cstring(format), cstring(compression), image_count)

proc imFileSetInfo*(ifile: ptr imFile; compression: string) {.cdecl.} =
    niupc.imFileSetInfo(ifile, cstring(compression))

proc imFileSetAttribute*(ifile: ptr imFile; attrib: string; data_type: imDataType; count: cint; data: pointer) {.cdecl.} =
    niupc.imFileSetAttribute(ifile, cstring(attrib), data_type, count, data)

proc imFileSetAttribInteger*(ifile: ptr imFile; attrib: string; data_type: imDataType; value: cint) {.cdecl.} =
    niupc.imFileSetAttribInteger(ifile, cstring(attrib), data_type, value)

proc imFileSetAttribReal*(ifile: ptr imFile; attrib: string; data_type: imDataType; value: cdouble) {.cdecl.} =
    niupc.imFileSetAttribReal(ifile, cstring(attrib), data_type, value)

proc imFileSetAttribString*(ifile: ptr imFile; attrib: string; value: string) {.cdecl.} =
    niupc.imFileSetAttribString(ifile, cstring(attrib), cstring(value))

proc imFileGetAttribute*(ifile: ptr imFile; attrib: string; data_type: ptr cint; count: ptr cint): pointer {.cdecl.} =
    return niupc.imFileGetAttribute(ifile, cstring(attrib), data_type, count)

proc imFileGetAttribInteger*(ifile: ptr imFile; attrib: string; index: cint): cint {.cdecl.} =
    return niupc.imFileGetAttribInteger(ifile, cstring(attrib), index)

proc imFileGetAttribReal*(ifile: ptr imFile; attrib: string; index: cint): cdouble {.cdecl.} =
    return niupc.imFileGetAttribReal(ifile, cstring(attrib), index)

proc imFileGetAttribString*(ifile: ptr imFile; attrib: string): string {.cdecl.} =
    return $niupc.imFileGetAttribString(ifile, cstring(attrib))

proc imFileGetAttributeList*(ifile: ptr imFile; attrib: cstringArray; attrib_count: ptr cint) {.cdecl.} =
    niupc.imFileGetAttributeList(ifile, attrib, attrib_count)

proc imFileGetPalette*(ifile: ptr imFile; palette: ptr clong; palette_count: ptr cint) {.cdecl.} =
    niupc.imFileGetPalette(ifile, palette, palette_count)

proc imFileSetPalette*(ifile: ptr imFile; palette: ptr clong; palette_count: cint) {.cdecl.} =
    niupc.imFileSetPalette(ifile, palette, palette_count)

proc imFileReadImageInfo*(ifile: ptr imFile; index: cint; width: ptr cint; height: ptr cint; file_color_mode: ptr cint; file_data_type: ptr cint): cint {.cdecl.} =
    return niupc.imFileReadImageInfo(ifile, index, width, height, file_color_mode, file_data_type)

proc imFileWriteImageInfo*(ifile: ptr imFile; width: cint; height: cint; user_color_mode: cint; user_data_type: cint): cint {.cdecl.} =
    return niupc.imFileWriteImageInfo(ifile, width, height, user_color_mode, user_data_type)

proc imFileReadImageData*(ifile: ptr imFile; data: pointer; convert2bitmap: cint; color_mode_flags: cint): cint {.cdecl.} =
    return niupc.imFileReadImageData(ifile, data, convert2bitmap, color_mode_flags)

proc imFileWriteImageData*(ifile: ptr imFile; data: pointer): cint {.cdecl.} =
    return niupc.imFileWriteImageData(ifile, data)

proc imFormatRegisterInternal*() {.cdecl.} =
    niupc.imFormatRegisterInternal()

proc imFormatRemoveAll*() {.cdecl.} =
    niupc.imFormatRemoveAll()

proc imFormatList*(format_list: cstringArray; format_count: ptr cint) {.cdecl.} =
    niupc.imFormatList(format_list, format_count)

proc imFormatInfo*(format: string; desc: string; ext: string; can_sequence: ptr cint): cint {.cdecl.} =
    return niupc.imFormatInfo(cstring(format), cstring(desc), cstring(ext), can_sequence)

proc imFormatInfoExtra*(format: string; extra: string): cint {.cdecl.} =
    return niupc.imFormatInfoExtra(cstring(format), cstring(extra))

proc imFormatCompressions*(format: string; comp: cstringArray; comp_count: ptr cint; color_mode: cint; data_type: imDataType): cint {.cdecl.} =
    return niupc.imFormatCompressions(cstring(format), comp, comp_count, color_mode, data_type)

proc imFormatCanWriteImage*(format: string; compression: string; color_mode: cint; data_type: imDataType): cint {.cdecl.} =
    return niupc.imFormatCanWriteImage(cstring(format), cstring(compression), color_mode, data_type)

proc imImageCreate*(width: cint; height: cint; color_space: imColorSpace; data_type: imDataType): ptr imImage {.cdecl.} =
    return niupc.imImageCreate(width, height, color_space, data_type)

proc imImageInit*(width: cint; height: cint; color_mode: cint; data_type: imDataType; data_buffer: pointer; palette: ptr clong; palette_count: cint): ptr imImage {.cdecl.} =
    return niupc.imImageInit(width, height, color_mode, data_type, data_buffer, palette, palette_count)

proc imImageCreateBased*(image: ptr imImage; width: cint; height: cint; color_space: imColorSpace; data_type: imDataType): ptr imImage {.cdecl.} =
    return niupc.imImageCreateBased(image, width, height, color_space, data_type)

proc imImageDestroy*(image: ptr imImage) {.cdecl.} =
    niupc.imImageDestroy(image)

proc imImageAddAlpha*(image: ptr imImage) {.cdecl.} =
    niupc.imImageAddAlpha(image)

proc imImageSetAlpha*(image: ptr imImage; alpha: cdouble) {.cdecl.} =
    niupc.imImageSetAlpha(image, alpha)

proc imImageRemoveAlpha*(image: ptr imImage) {.cdecl.} =
    niupc.imImageRemoveAlpha(image)

proc imImageReshape*(image: ptr imImage; width: cint; height: cint) {.cdecl.} =
    niupc.imImageReshape(image, width, height)

proc imImageCopy*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl.} =
    niupc.imImageCopy(src_image, dst_image)

proc imImageCopyData*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl.} =
    niupc.imImageCopyData(src_image, dst_image)

proc imImageCopyAttributes*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl.} =
    niupc.imImageCopyAttributes(src_image, dst_image)

proc imImageMergeAttributes*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl.} =
    niupc.imImageMergeAttributes(src_image, dst_image)

proc imImageCopyPlane*(src_image: ptr imImage; src_plane: cint; dst_image: ptr imImage; dst_plane: cint) {.cdecl.} =
    niupc.imImageCopyPlane(src_image, src_plane, dst_image, dst_plane)

proc imImageDuplicate*(image: ptr imImage): ptr imImage {.cdecl.} =
    return niupc.imImageDuplicate(image)

proc imImageClone*(image: ptr imImage): ptr imImage {.cdecl.} =
    return niupc.imImageClone(image)

proc imImageSetAttribute*(image: ptr imImage; attrib: string; data_type: imDataType; count: cint; data: pointer) {.cdecl.} =
    niupc.imImageSetAttribute(image, cstring(attrib), data_type, count, data)

proc imImageSetAttribInteger*(image: ptr imImage; attrib: string; data_type: imDataType; value: cint) {.cdecl.} =
    niupc.imImageSetAttribInteger(image, cstring(attrib), data_type, value)

proc imImageSetAttribReal*(image: ptr imImage; attrib: string; data_type: imDataType; value: cdouble) {.cdecl.} =
    niupc.imImageSetAttribReal(image, cstring(attrib), data_type, value)

proc imImageSetAttribString*(image: ptr imImage; attrib: string; value: string) {.cdecl.} =
    niupc.imImageSetAttribString(image, cstring(attrib), cstring(value))

proc imImageGetAttribute*(image: ptr imImage; attrib: string; data_type: ptr cint; count: ptr cint): pointer {.cdecl.} =
    return niupc.imImageGetAttribute(image, cstring(attrib), data_type, count)

proc imImageGetAttribInteger*(image: ptr imImage; attrib: string; index: cint): cint {.cdecl.} =
    return niupc.imImageGetAttribInteger(image, cstring(attrib), index)

proc imImageGetAttribReal*(image: ptr imImage; attrib: string; index: cint): cdouble {.cdecl.} =
    return niupc.imImageGetAttribReal(image, cstring(attrib), index)

proc imImageGetAttribString*(image: ptr imImage; attrib: string): string {.cdecl.} =
    return $niupc.imImageGetAttribString(image, cstring(attrib))

proc imImageGetAttributeList*(image: ptr imImage; attrib: cstringArray; attrib_count: ptr cint) {.cdecl.} =
    niupc.imImageGetAttributeList(image, attrib, attrib_count)

proc imImageClear*(image: ptr imImage) {.cdecl.} =
    niupc.imImageClear(image)

proc imImageIsBitmap*(image: ptr imImage): cint {.cdecl.} =
    return niupc.imImageIsBitmap(image)

proc imImageSetPalette*(image: ptr imImage; palette: ptr clong; palette_count: cint) {.cdecl.} =
    niupc.imImageSetPalette(image, palette, palette_count)

proc imImageMatchSize*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl.} =
    return niupc.imImageMatchSize(image1, image2)

proc imImageMatchColor*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl.} =
    return niupc.imImageMatchColor(image1, image2)

proc imImageMatchDataType*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl.} =
    return niupc.imImageMatchDataType(image1, image2)

proc imImageMatchColorSpace*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl.} =
    return niupc.imImageMatchColorSpace(image1, image2)

proc imImageMatch*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl.} =
    return niupc.imImageMatch(image1, image2)

proc imImageSetMap*(image: ptr imImage) {.cdecl.} =
    niupc.imImageSetMap(image)

proc imImageSetBinary*(image: ptr imImage) {.cdecl.} =
    niupc.imImageSetBinary(image)

proc imImageSetGray*(image: ptr imImage) {.cdecl.} =
    niupc.imImageSetGray(image)

proc imImageMakeBinary*(image: ptr imImage) {.cdecl.} =
    niupc.imImageMakeBinary(image)

proc imImageMakeGray*(image: ptr imImage) {.cdecl.} =
    niupc.imImageMakeGray(image)

proc imFileLoadImage*(ifile: ptr imFile; index: cint; error: ptr imErrorCodes): ptr imImage {.cdecl.} =
    return niupc.imFileLoadImage(ifile, index, error)

proc imFileLoadImageFrame*(ifile: ptr imFile; index: cint; image: ptr imImage; error: ptr imErrorCodes) {.cdecl.} =
    niupc.imFileLoadImageFrame(ifile, index, image, error)

proc imFileLoadBitmap*(ifile: ptr imFile; index: cint; error: ptr imErrorCodes): ptr imImage {.cdecl.} =
    return niupc.imFileLoadBitmap(ifile, index, error)

proc imFileLoadImageRegion*(ifile: ptr imFile; index: cint; bitmap: cint; error: ptr imErrorCodes; xmin: cint; xmax: cint; ymin: cint; ymax: cint; width: cint; height: cint): ptr imImage {.cdecl.} =
    return niupc.imFileLoadImageRegion(ifile, index, bitmap, error, xmin, xmax, ymin, ymax, width, height)

proc imFileLoadBitmapFrame*(ifile: ptr imFile; index: cint; image: ptr imImage; error: ptr imErrorCodes) {.cdecl.} =
    niupc.imFileLoadBitmapFrame(ifile, index, image, error)

proc imFileSaveImage*(ifile: ptr imFile; image: ptr imImage): cint {.cdecl.} =
    return niupc.imFileSaveImage(ifile, image)

proc imFileImageLoad*(file_name: string; index: cint; error: ptr imErrorCodes): ptr imImage {.cdecl.} =
    return niupc.imFileImageLoad(cstring(file_name), index, error)

proc imFileImageLoadBitmap*(file_name: string; index: cint; error: ptr imErrorCodes): ptr imImage {.cdecl.} =
    return niupc.imFileImageLoadBitmap(cstring(file_name), index, error)

proc imFileImageLoadRegion*(file_name: string; index: cint; bitmap: cint; error: ptr imErrorCodes; xmin: cint; xmax: cint; ymin: cint; ymax: cint; width: cint; height: cint): ptr imImage {.cdecl.} =
    return niupc.imFileImageLoadRegion(cstring(file_name), index, bitmap, error, xmin, xmax, ymin, ymax, width, height)

proc imFileImageSave*(file_name: string; format: string; image: ptr imImage): imErrorCodes {.cdecl.} =
    return niupc.imFileImageSave(cstring(file_name), cstring(format), image)

proc imConvertDataType*(src_image: ptr imImage; dst_image: ptr imImage; cpx2real: cint; gamma: cdouble; absolute: cint; cast_mode: cint): cint {.cdecl.} =
    return niupc.imConvertDataType(src_image, dst_image, cpx2real, gamma, absolute, cast_mode)

proc imConvertColorSpace*(src_image: ptr imImage; dst_image: ptr imImage): cint {.cdecl.} =
    return niupc.imConvertColorSpace(src_image, dst_image)

proc imConvertToBitmap*(src_image: ptr imImage; dst_image: ptr imImage; cpx2real: cint; gamma: cdouble; absolute: cint; cast_mode: cint): cint {.cdecl.} =
    return niupc.imConvertToBitmap(src_image, dst_image, cpx2real, gamma, absolute, cast_mode)

proc imImageGetOpenGLData*(image: ptr imImage; glformat: ptr cint): pointer {.cdecl.} =
    return niupc.imImageGetOpenGLData(image, glformat)

proc imImageCreateFromOpenGLData*(width: cint; height: cint; glformat: cint; gldata: pointer): ptr imImage {.cdecl.} =
    return niupc.imImageCreateFromOpenGLData(width, height, glformat, gldata)

proc imConvertPacking*(src_data: pointer; dst_data: pointer; width: cint; height: cint; src_depth: cint; dst_depth: cint; data_type: imDataType; src_is_packed: cint) {.cdecl.} =
    niupc.imConvertPacking(src_data, dst_data, width, height, src_depth, dst_depth, data_type, src_is_packed)

proc imConvertMapToRGB*(data: openArray[uint8]; count: cint; depth: cint; packed: cint; palette: ptr clong; palette_count: cint) {.cdecl.} =
    niupc.imConvertMapToRGB(cast[ptr uint8](data), count, depth, packed, palette, palette_count)

proc imConvertRGB2Map*(width: cint; height: cint; red: openArray[uint8]; green: openArray[uint8]; blue: openArray[uint8]; map: openArray[uint8]; palette: ptr clong; palette_count: ptr cint): cint {.cdecl.} =
    return niupc.imConvertRGB2Map(width, height, cast[ptr uint8](red), cast[ptr uint8](green), cast[ptr uint8](blue), cast[ptr uint8](map), palette, palette_count)

proc imConvertRGB2MapCounter*(width: cint; height: cint; red: openArray[uint8]; green: openArray[uint8]; blue: openArray[uint8]; map: openArray[uint8]; palette: ptr clong; palette_count: ptr cint; counter: cint): cint {.cdecl.} =
    return niupc.imConvertRGB2MapCounter(width, height, cast[ptr uint8](red), cast[ptr uint8](green), cast[ptr uint8](blue), cast[ptr uint8](map), palette, palette_count, counter)

proc Open*(argc: var cint; argv: ptr cstringArray): cint {.cdecl, discardable.} =
    return niupc.Open(argc, argv)

proc Close*() {.cdecl.} =
    niupc.Close()

proc IsOpened*(): cint {.cdecl.} =
    return niupc.IsOpened()

proc ImageLibOpen*() {.cdecl.} =
    niupc.ImageLibOpen()

proc MainLoop*(): cint {.cdecl, discardable.} =
    return niupc.MainLoop()

proc LoopStep*(): cint {.cdecl.} =
    return niupc.LoopStep()

proc LoopStepWait*(): cint {.cdecl.} =
    return niupc.LoopStepWait()

proc MainLoopLevel*(): cint {.cdecl.} =
    return niupc.MainLoopLevel()

proc Flush*() {.cdecl.} =
    niupc.Flush()

proc ExitLoop*() {.cdecl.} =
    niupc.ExitLoop()

proc PostMessage*(ih: IUPhandle_t; s: string; i: cint; d: cdouble; p: pointer) {.cdecl.} =
    niupc.PostMessage(cast[PIhandle](ih), cstring(s), i, d, p)

proc RecordInput*(filename: string; mode: cint): cint {.cdecl.} =
    return niupc.RecordInput(cstring(filename), mode)

proc PlayInput*(filename: string): cint {.cdecl.} =
    return niupc.PlayInput(cstring(filename))

proc Update*(ih: IUPhandle_t) {.cdecl.} =
    niupc.Update(cast[PIhandle](ih))

proc UpdateChildren*(ih: IUPhandle_t) {.cdecl.} =
    niupc.UpdateChildren(cast[PIhandle](ih))

proc Redraw*(ih: IUPhandle_t; children: cint) {.cdecl.} =
    niupc.Redraw(cast[PIhandle](ih), children)

proc Refresh*(ih: IUPhandle_t) {.cdecl.} =
    niupc.Refresh(cast[PIhandle](ih))

proc RefreshChildren*(ih: IUPhandle_t) {.cdecl.} =
    niupc.RefreshChildren(cast[PIhandle](ih))

proc Execute*(filename: string; parameters: string): cint {.cdecl.} =
    return niupc.Execute(cstring(filename), cstring(parameters))

proc ExecuteWait*(filename: string; parameters: string): cint {.cdecl.} =
    return niupc.ExecuteWait(cstring(filename), cstring(parameters))

proc Help*(url: string): cint {.cdecl.} =
    return niupc.Help(cstring(url))

proc Load*(filename: string): string {.cdecl.} =
    return $niupc.Load(cstring(filename))

proc LoadBuffer*(buffer: string): string {.cdecl.} =
    return $niupc.LoadBuffer(cstring(buffer))

proc Version*(): string {.cdecl.} =
    return $niupc.Version()

proc VersionDate*(): string {.cdecl.} =
    return $niupc.VersionDate()

proc VersionNumber*(): cint {.cdecl.} =
    return niupc.VersionNumber()

proc VersionShow*() {.cdecl.} =
    niupc.VersionShow()

proc SetLanguage*(lng: string) {.cdecl.} =
    niupc.SetLanguage(cstring(lng))

proc GetLanguage*(): string {.cdecl.} =
    return $niupc.GetLanguage()

proc SetLanguageString*(name: string; str: string) {.cdecl.} =
    niupc.SetLanguageString(cstring(name), cstring(str))

proc StoreLanguageString*(name: string; str: string) {.cdecl.} =
    niupc.StoreLanguageString(cstring(name), cstring(str))

proc GetLanguageString*(name: string): string {.cdecl.} =
    return $niupc.GetLanguageString(cstring(name))

proc SetLanguagePack*(ih: IUPhandle_t) {.cdecl.} =
    niupc.SetLanguagePack(cast[PIhandle](ih))

proc Destroy*(ih: IUPhandle_t) {.cdecl.} =
    niupc.Destroy(cast[PIhandle](ih))

proc Detach*(child: IUPhandle_t) {.cdecl.} =
    niupc.Detach(cast[PIhandle](child))

proc Append*(ih: IUPhandle_t; child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Append(cast[PIhandle](ih), cast[PIhandle](child))

proc Insert*(ih: IUPhandle_t; ref_child: IUPhandle_t; child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Insert(cast[PIhandle](ih), cast[PIhandle](ref_child), cast[PIhandle](child))

proc GetChild*(ih: IUPhandle_t; pos: cint): PIhandle {.cdecl.} =
    return niupc.GetChild(cast[PIhandle](ih), pos)

proc GetChildPos*(ih: IUPhandle_t; child: IUPhandle_t): cint {.cdecl.} =
    return niupc.GetChildPos(cast[PIhandle](ih), cast[PIhandle](child))

proc GetChildCount*(ih: IUPhandle_t): cint {.cdecl.} =
    return niupc.GetChildCount(cast[PIhandle](ih))

proc GetNextChild*(ih: IUPhandle_t; child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GetNextChild(cast[PIhandle](ih), cast[PIhandle](child))

proc GetBrother*(ih: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GetBrother(cast[PIhandle](ih))

proc GetParent*(ih: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GetParent(cast[PIhandle](ih))

proc GetDialog*(ih: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GetDialog(cast[PIhandle](ih))

proc GetDialogChild*(ih: IUPhandle_t; name: string): PIhandle {.cdecl.} =
    return niupc.GetDialogChild(cast[PIhandle](ih), cstring(name))

proc Reparent*(ih: IUPhandle_t; new_parent: IUPhandle_t; ref_child: IUPhandle_t): cint {.cdecl.} =
    return niupc.Reparent(cast[PIhandle](ih), cast[PIhandle](new_parent), cast[PIhandle](ref_child))

proc Popup*(ih: IUPhandle_t; x: cint; y: cint): cint {.cdecl.} =
    return niupc.Popup(cast[PIhandle](ih), x, y)

proc Show*(ih: IUPhandle_t): cint {.cdecl, discardable.} =
    return niupc.Show(cast[PIhandle](ih))

proc ShowXY*(ih: IUPhandle_t; x: cint; y: cint): cint {.cdecl, discardable.} =
    return niupc.ShowXY(cast[PIhandle](ih), x, y)

proc Hide*(ih: IUPhandle_t): cint {.cdecl.} =
    return niupc.Hide(cast[PIhandle](ih))

proc Map*(ih: IUPhandle_t): cint {.cdecl, discardable.} =
    return niupc.Map(cast[PIhandle](ih))

proc Unmap*(ih: IUPhandle_t) {.cdecl.} =
    niupc.Unmap(cast[PIhandle](ih))

proc ResetAttribute*(ih: IUPhandle_t; name: string) {.cdecl.} =
    niupc.ResetAttribute(cast[PIhandle](ih), cstring(name))

proc GetAllAttributes*(ih: IUPhandle_t; names: cstringArray; n: cint): cint {.cdecl.} =
    return niupc.GetAllAttributes(cast[PIhandle](ih), names, n)

proc CopyAttributes*(src_ih: IUPhandle_t; dst_ih: IUPhandle_t) {.cdecl.} =
    niupc.CopyAttributes(cast[PIhandle](src_ih), cast[PIhandle](dst_ih))

proc SetAttributes*(ih: IUPhandle_t; str: string): PIhandle {.cdecl, discardable.} =
    return niupc.SetAttributes(cast[PIhandle](ih), cstring(str))

proc GetAttributes*(ih: IUPhandle_t): string {.cdecl.} =
    return $niupc.GetAttributes(cast[PIhandle](ih))

proc SetAttribute*(ih: IUPhandle_t; name: string; value: string) {.cdecl.} =
    niupc.SetAttribute(cast[PIhandle](ih), cstring(name), cstring(value))

proc SetStrAttribute*(ih: IUPhandle_t; name: string; value: string) {.cdecl.} =
    niupc.SetStrAttribute(cast[PIhandle](ih), cstring(name), cstring(value))

proc SetInt*(ih: IUPhandle_t; name: string; value: cint) {.cdecl.} =
    niupc.SetInt(cast[PIhandle](ih), cstring(name), value)

proc SetFloat*(ih: IUPhandle_t; name: string; value: cfloat) {.cdecl.} =
    niupc.SetFloat(cast[PIhandle](ih), cstring(name), value)

proc SetDouble*(ih: IUPhandle_t; name: string; value: cdouble) {.cdecl.} =
    niupc.SetDouble(cast[PIhandle](ih), cstring(name), value)

proc SetRGB*(ih: IUPhandle_t; name: string; r: uint8; g: uint8; b: uint8) {.cdecl.} =
    niupc.SetRGB(cast[PIhandle](ih), cstring(name), r, g, b)

proc SetRGBA*(ih: IUPhandle_t; name: string; r: uint8; g: uint8; b: uint8; a: uint8) {.cdecl.} =
    niupc.SetRGBA(cast[PIhandle](ih), cstring(name), r, g, b, a)

proc GetAttribute*(ih: IUPhandle_t; name: string): string {.cdecl.} =
    return $niupc.GetAttribute(cast[PIhandle](ih), cstring(name))

proc GetInt*(ih: IUPhandle_t; name: string): cint {.cdecl.} =
    return niupc.GetInt(cast[PIhandle](ih), cstring(name))

proc GetInt2*(ih: IUPhandle_t; name: string): cint {.cdecl.} =
    return niupc.GetInt2(cast[PIhandle](ih), cstring(name))

proc GetIntInt*(ih: IUPhandle_t; name: string; i1: var cint; i2: var cint): cint {.cdecl.} =
    return niupc.GetIntInt(cast[PIhandle](ih), cstring(name), i1, i2)

proc GetFloat*(ih: IUPhandle_t; name: string): cfloat {.cdecl.} =
    return niupc.GetFloat(cast[PIhandle](ih), cstring(name))

proc GetDouble*(ih: IUPhandle_t; name: string): cdouble {.cdecl.} =
    return niupc.GetDouble(cast[PIhandle](ih), cstring(name))

proc GetRGB*(ih: IUPhandle_t; name: string; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]) {.cdecl.} =
    niupc.GetRGB(cast[PIhandle](ih), cstring(name), cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b))

proc GetRGBA*(ih: IUPhandle_t; name: string; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]; a: openArray[uint8]) {.cdecl.} =
    niupc.GetRGBA(cast[PIhandle](ih), cstring(name), cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b), cast[ptr uint8](a))

proc SetAttributeId*(ih: IUPhandle_t; name: string; id: cint; value: string) {.cdecl.} =
    niupc.SetAttributeId(cast[PIhandle](ih), cstring(name), id, cstring(value))

proc SetStrAttributeId*(ih: IUPhandle_t; name: string; id: cint; value: string) {.cdecl.} =
    niupc.SetStrAttributeId(cast[PIhandle](ih), cstring(name), id, cstring(value))

proc SetIntId*(ih: IUPhandle_t; name: string; id: cint; value: cint) {.cdecl.} =
    niupc.SetIntId(cast[PIhandle](ih), cstring(name), id, value)

proc SetFloatId*(ih: IUPhandle_t; name: string; id: cint; value: cfloat) {.cdecl.} =
    niupc.SetFloatId(cast[PIhandle](ih), cstring(name), id, value)

proc SetDoubleId*(ih: IUPhandle_t; name: string; id: cint; value: cdouble) {.cdecl.} =
    niupc.SetDoubleId(cast[PIhandle](ih), cstring(name), id, value)

proc SetRGBId*(ih: IUPhandle_t; name: string; id: cint; r: uint8; g: uint8; b: uint8) {.cdecl.} =
    niupc.SetRGBId(cast[PIhandle](ih), cstring(name), id, r, g, b)

proc GetAttributeId*(ih: IUPhandle_t; name: string; id: cint): string {.cdecl.} =
    return $niupc.GetAttributeId(cast[PIhandle](ih), cstring(name), id)

proc GetIntId*(ih: IUPhandle_t; name: string; id: cint): cint {.cdecl.} =
    return niupc.GetIntId(cast[PIhandle](ih), cstring(name), id)

proc GetFloatId*(ih: IUPhandle_t; name: string; id: cint): cfloat {.cdecl.} =
    return niupc.GetFloatId(cast[PIhandle](ih), cstring(name), id)

proc GetDoubleId*(ih: IUPhandle_t; name: string; id: cint): cdouble {.cdecl.} =
    return niupc.GetDoubleId(cast[PIhandle](ih), cstring(name), id)

proc GetRGBId*(ih: IUPhandle_t; name: string; id: cint; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]) {.cdecl.} =
    niupc.GetRGBId(cast[PIhandle](ih), cstring(name), id, cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b))

proc SetAttributeId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint; value: string) {.cdecl.} =
    niupc.SetAttributeId2(cast[PIhandle](ih), cstring(name), lin, col, cstring(value))

proc SetStrAttributeId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint; value: string) {.cdecl.} =
    niupc.SetStrAttributeId2(cast[PIhandle](ih), cstring(name), lin, col, cstring(value))

proc SetIntId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint; value: cint) {.cdecl.} =
    niupc.SetIntId2(cast[PIhandle](ih), cstring(name), lin, col, value)

proc SetFloatId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint; value: cfloat) {.cdecl.} =
    niupc.SetFloatId2(cast[PIhandle](ih), cstring(name), lin, col, value)

proc SetDoubleId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint; value: cdouble) {.cdecl.} =
    niupc.SetDoubleId2(cast[PIhandle](ih), cstring(name), lin, col, value)

proc SetRGBId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint; r: uint8; g: uint8; b: uint8) {.cdecl.} =
    niupc.SetRGBId2(cast[PIhandle](ih), cstring(name), lin, col, r, g, b)

proc GetAttributeId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint): string {.cdecl.} =
    return $niupc.GetAttributeId2(cast[PIhandle](ih), cstring(name), lin, col)

proc GetIntId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint): cint {.cdecl.} =
    return niupc.GetIntId2(cast[PIhandle](ih), cstring(name), lin, col)

proc GetFloatId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint): cfloat {.cdecl.} =
    return niupc.GetFloatId2(cast[PIhandle](ih), cstring(name), lin, col)

proc GetDoubleId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint): cdouble {.cdecl.} =
    return niupc.GetDoubleId2(cast[PIhandle](ih), cstring(name), lin, col)

proc GetRGBId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]) {.cdecl.} =
    niupc.GetRGBId2(cast[PIhandle](ih), cstring(name), lin, col, cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b))

proc SetGlobal*(name: string; value: string) {.cdecl.} =
    niupc.SetGlobal(cstring(name), cstring(value))

proc SetStrGlobal*(name: string; value: string) {.cdecl.} =
    niupc.SetStrGlobal(cstring(name), cstring(value))

proc GetGlobal*(name: string): string {.cdecl.} =
    return $niupc.GetGlobal(cstring(name))

proc SetFocus*(ih: IUPhandle_t): PIhandle {.cdecl, discardable.} =
    return niupc.SetFocus(cast[PIhandle](ih))

proc GetFocus*(): PIhandle {.cdecl.} =
    return niupc.GetFocus()

proc PreviousField*(ih: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.PreviousField(cast[PIhandle](ih))

proc NextField*(ih: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.NextField(cast[PIhandle](ih))

proc GetCallback*(ih: IUPhandle_t; name: string): Icallback {.cdecl.} =
    return niupc.GetCallback(cast[PIhandle](ih), cstring(name))

proc SetCallback*(ih: IUPhandle_t; name: string; `func`: Icallback): Icallback {.cdecl.} =
    return niupc.SetCallback(cast[PIhandle](ih), cstring(name), cast[Icallback](`func`))

proc GetFunction*(name: string): Icallback {.cdecl.} =
    return niupc.GetFunction(cstring(name))

proc SetFunction*(name: string; `func`: Icallback): Icallback {.cdecl.} =
    return niupc.SetFunction(cstring(name), cast[Icallback](`func`))

proc GetHandle*(name: string): PIhandle {.cdecl.} =
    return niupc.GetHandle(cstring(name))

proc SetHandle*(name: string; ih: IUPhandle_t): PIhandle {.cdecl, discardable.} =
    return niupc.SetHandle(cstring(name), cast[PIhandle](ih))

proc GetAllNames*(names: cstringArray; n: cint): cint {.cdecl.} =
    return niupc.GetAllNames(names, n)

proc GetAllDialogs*(names: cstringArray; n: cint): cint {.cdecl.} =
    return niupc.GetAllDialogs(names, n)

proc GetName*(ih: IUPhandle_t): string {.cdecl.} =
    return $niupc.GetName(cast[PIhandle](ih))

proc SetAttributeHandle*(ih: IUPhandle_t; name: string; ih_named: IUPhandle_t) {.cdecl.} =
    niupc.SetAttributeHandle(cast[PIhandle](ih), cstring(name), cast[PIhandle](ih_named))

proc GetAttributeHandle*(ih: IUPhandle_t; name: string): PIhandle {.cdecl.} =
    return niupc.GetAttributeHandle(cast[PIhandle](ih), cstring(name))

proc SetAttributeHandleId*(ih: IUPhandle_t; name: string; id: cint; ih_named: IUPhandle_t) {.cdecl.} =
    niupc.SetAttributeHandleId(cast[PIhandle](ih), cstring(name), id, cast[PIhandle](ih_named))

proc GetAttributeHandleId*(ih: IUPhandle_t; name: string; id: cint): PIhandle {.cdecl.} =
    return niupc.GetAttributeHandleId(cast[PIhandle](ih), cstring(name), id)

proc SetAttributeHandleId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint; ih_named: IUPhandle_t) {.cdecl.} =
    niupc.SetAttributeHandleId2(cast[PIhandle](ih), cstring(name), lin, col, cast[PIhandle](ih_named))

proc GetAttributeHandleId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint): PIhandle {.cdecl.} =
    return niupc.GetAttributeHandleId2(cast[PIhandle](ih), cstring(name), lin, col)

proc GetClassName*(ih: IUPhandle_t): string {.cdecl.} =
    return $niupc.GetClassName(cast[PIhandle](ih))

proc GetClassType*(ih: IUPhandle_t): string {.cdecl.} =
    return $niupc.GetClassType(cast[PIhandle](ih))

proc GetAllClasses*(names: cstringArray; n: cint): cint {.cdecl.} =
    return niupc.GetAllClasses(names, n)

proc GetClassAttributes*(classname: string; names: cstringArray; n: cint): cint {.cdecl.} =
    return niupc.GetClassAttributes(cstring(classname), names, n)

proc GetClassCallbacks*(classname: string; names: cstringArray; n: cint): cint {.cdecl.} =
    return niupc.GetClassCallbacks(cstring(classname), names, n)

proc SaveClassAttributes*(ih: IUPhandle_t) {.cdecl.} =
    niupc.SaveClassAttributes(cast[PIhandle](ih))

proc CopyClassAttributes*(src_ih: IUPhandle_t; dst_ih: IUPhandle_t) {.cdecl.} =
    niupc.CopyClassAttributes(cast[PIhandle](src_ih), cast[PIhandle](dst_ih))

proc SetClassDefaultAttribute*(classname: string; name: string; value: string) {.cdecl.} =
    niupc.SetClassDefaultAttribute(cstring(classname), cstring(name), cstring(value))

proc ClassMatch*(ih: IUPhandle_t; classname: string): cint {.cdecl.} =
    return niupc.ClassMatch(cast[PIhandle](ih), cstring(classname))

proc Create*(classname: string): PIhandle {.cdecl.} =
    return niupc.Create(cstring(classname))

proc Createv*(classname: string; params: ptr pointer): PIhandle {.cdecl.} =
    return niupc.Createv(cstring(classname), params)

proc Vboxv*(children: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Vboxv(cast[ptr PIhandle](children))

proc Zboxv*(children: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Zboxv(cast[ptr PIhandle](children))

proc Hboxv*(children: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Hboxv(cast[ptr PIhandle](children))

proc Normalizerv*(ih_list: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Normalizerv(cast[ptr PIhandle](ih_list))

proc Cboxv*(children: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Cboxv(cast[ptr PIhandle](children))

proc GridBoxv*(children: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GridBoxv(cast[ptr PIhandle](children))

proc MultiBoxv*(children: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.MultiBoxv(cast[ptr PIhandle](children))

proc Menuv*(children: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Menuv(cast[ptr PIhandle](children))

proc Tabsv*(children: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.Tabsv(cast[ptr PIhandle](children))

proc FlatTabsv*(children: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.FlatTabsv(cast[ptr PIhandle](children))

proc StringCompare*(str1: string; str2: string; casesensitive: cint; lexicographic: cint): cint {.cdecl.} =
    return niupc.StringCompare(cstring(str1), cstring(str2), casesensitive, lexicographic)

proc SaveImageAsText*(ih: IUPhandle_t; filename: string; format: string; name: string): cint {.cdecl.} =
    return niupc.SaveImageAsText(cast[PIhandle](ih), cstring(filename), cstring(format), cstring(name))

proc ImageGetHandle*(name: string): PIhandle {.cdecl.} =
    return niupc.ImageGetHandle(cstring(name))

proc TextConvertLinColToPos*(ih: IUPhandle_t; lin: cint; col: cint; pos: var cint) {.cdecl.} =
    niupc.TextConvertLinColToPos(cast[PIhandle](ih), lin, col, pos)

proc TextConvertPosToLinCol*(ih: IUPhandle_t; pos: cint; lin: var cint; col: var cint) {.cdecl.} =
    niupc.TextConvertPosToLinCol(cast[PIhandle](ih), pos, lin, col)

proc ConvertXYToPos*(ih: IUPhandle_t; x: cint; y: cint): cint {.cdecl.} =
    return niupc.ConvertXYToPos(cast[PIhandle](ih), x, y)

proc StoreGlobal*(name: string; value: string) {.cdecl.} =
    niupc.StoreGlobal(cstring(name), cstring(value))

proc StoreAttribute*(ih: IUPhandle_t; name: string; value: string) {.cdecl.} =
    niupc.StoreAttribute(cast[PIhandle](ih), cstring(name), cstring(value))

proc StoreAttributeId*(ih: IUPhandle_t; name: string; id: cint; value: string) {.cdecl.} =
    niupc.StoreAttributeId(cast[PIhandle](ih), cstring(name), id, cstring(value))

proc StoreAttributeId2*(ih: IUPhandle_t; name: string; lin: cint; col: cint; value: string) {.cdecl.} =
    niupc.StoreAttributeId2(cast[PIhandle](ih), cstring(name), lin, col, cstring(value))

proc TreeSetUserId*(ih: IUPhandle_t; id: cint; userid: pointer): cint {.cdecl.} =
    return niupc.TreeSetUserId(cast[PIhandle](ih), id, userid)

proc TreeGetUserId*(ih: IUPhandle_t; id: cint): pointer {.cdecl.} =
    return niupc.TreeGetUserId(cast[PIhandle](ih), id)

proc TreeGetId*(ih: IUPhandle_t; userid: pointer): cint {.cdecl.} =
    return niupc.TreeGetId(cast[PIhandle](ih), userid)

proc TreeSetAttributeHandle*(ih: IUPhandle_t; name: string; id: cint; ih_named: IUPhandle_t) {.cdecl.} =
    niupc.TreeSetAttributeHandle(cast[PIhandle](ih), cstring(name), id, cast[PIhandle](ih_named))

proc GetFile*(arq: string): cint {.cdecl, discardable.} =
    return niupc.GetFile(cstring(arq))

proc Message*(title: string; msg: string) {.cdecl.} =
    niupc.Message(cstring(title), cstring(msg))

proc MessageError*(parent: IUPhandle_t; message: string) {.cdecl.} =
    niupc.MessageError(cast[PIhandle](parent), cstring(message))

proc MessageAlarm*(parent: IUPhandle_t; title: string; message: string; buttons: string): cint {.cdecl.} =
    return niupc.MessageAlarm(cast[PIhandle](parent), cstring(title), cstring(message), cstring(buttons))

proc Alarm*(title: string; msg: string; b1: string; b2: string; b3: string): cint {.cdecl.} =
    return niupc.Alarm(cstring(title), cstring(msg), cstring(b1), cstring(b2), cstring(b3))

proc ListDialog*(`type`: cint; title: string; size: cint; list: cstringArray; op: cint; max_col: cint; max_lin: cint; marks: var cint): cint {.cdecl.} =
    return niupc.ListDialog(`type`, cstring(title), size, list, op, max_col, max_lin, marks)

proc GetText*(title: string; text: string; maxsize: cint): cint {.cdecl.} =
    return niupc.GetText(cstring(title), cstring(text), maxsize)

proc GetColor*(x: cint; y: cint; r: openArray[uint8]; g: openArray[uint8]; b: openArray[uint8]): cint {.cdecl.} =
    return niupc.GetColor(x, y, cast[ptr uint8](r), cast[ptr uint8](g), cast[ptr uint8](b))

proc GetParamv*(title: string; action: Iparamcb; user_data: pointer; format: string; param_count: cint; param_extra: cint; param_data: ptr pointer): cint {.cdecl.} =
    return niupc.GetParamv(cstring(title), action, user_data, cstring(format), param_count, param_extra, param_data)

proc ParamBoxv*(param_array: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.ParamBoxv(cast[ptr PIhandle](param_array))

proc LayoutDialog*(dialog: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.LayoutDialog(cast[PIhandle](dialog))

proc ElementPropertiesDialog*(parent: IUPhandle_t; elem: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.ElementPropertiesDialog(cast[PIhandle](parent), cast[PIhandle](elem))

proc GlobalsDialog*(): PIhandle {.cdecl.} =
    return niupc.GlobalsDialog()

proc ClassInfoDialog*(parent: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.ClassInfoDialog(cast[PIhandle](parent))

proc Config*(): PIhandle {.cdecl.} =
    return niupc.Config()

proc ConfigLoad*(ih: IUPhandle_t): cint {.cdecl.} =
    return niupc.ConfigLoad(cast[PIhandle](ih))

proc ConfigSave*(ih: IUPhandle_t): cint {.cdecl.} =
    return niupc.ConfigSave(cast[PIhandle](ih))

proc ConfigSetVariableStr*(ih: IUPhandle_t; group: string; key: string; value: string) {.cdecl.} =
    niupc.ConfigSetVariableStr(cast[PIhandle](ih), cstring(group), cstring(key), cstring(value))

proc ConfigSetVariableStrId*(ih: IUPhandle_t; group: string; key: string; id: cint; value: string) {.cdecl.} =
    niupc.ConfigSetVariableStrId(cast[PIhandle](ih), cstring(group), cstring(key), id, cstring(value))

proc ConfigSetVariableInt*(ih: IUPhandle_t; group: string; key: string; value: cint) {.cdecl.} =
    niupc.ConfigSetVariableInt(cast[PIhandle](ih), cstring(group), cstring(key), value)

proc ConfigSetVariableIntId*(ih: IUPhandle_t; group: string; key: string; id: cint; value: cint) {.cdecl.} =
    niupc.ConfigSetVariableIntId(cast[PIhandle](ih), cstring(group), cstring(key), id, value)

proc ConfigSetVariableDouble*(ih: IUPhandle_t; group: string; key: string; value: cdouble) {.cdecl.} =
    niupc.ConfigSetVariableDouble(cast[PIhandle](ih), cstring(group), cstring(key), value)

proc ConfigSetVariableDoubleId*(ih: IUPhandle_t; group: string; key: string; id: cint; value: cdouble) {.cdecl.} =
    niupc.ConfigSetVariableDoubleId(cast[PIhandle](ih), cstring(group), cstring(key), id, value)

proc ConfigGetVariableStr*(ih: IUPhandle_t; group: string; key: string): string {.cdecl.} =
    return $niupc.ConfigGetVariableStr(cast[PIhandle](ih), cstring(group), cstring(key))

proc ConfigGetVariableStrId*(ih: IUPhandle_t; group: string; key: string; id: cint): string {.cdecl.} =
    return $niupc.ConfigGetVariableStrId(cast[PIhandle](ih), cstring(group), cstring(key), id)

proc ConfigGetVariableInt*(ih: IUPhandle_t; group: string; key: string): cint {.cdecl.} =
    return niupc.ConfigGetVariableInt(cast[PIhandle](ih), cstring(group), cstring(key))

proc ConfigGetVariableIntId*(ih: IUPhandle_t; group: string; key: string; id: cint): cint {.cdecl.} =
    return niupc.ConfigGetVariableIntId(cast[PIhandle](ih), cstring(group), cstring(key), id)

proc ConfigGetVariableDouble*(ih: IUPhandle_t; group: string; key: string): cdouble {.cdecl.} =
    return niupc.ConfigGetVariableDouble(cast[PIhandle](ih), cstring(group), cstring(key))

proc ConfigGetVariableDoubleId*(ih: IUPhandle_t; group: string; key: string; id: cint): cdouble {.cdecl.} =
    return niupc.ConfigGetVariableDoubleId(cast[PIhandle](ih), cstring(group), cstring(key), id)

proc ConfigGetVariableStrDef*(ih: IUPhandle_t; group: string; key: string; def: string): string {.cdecl.} =
    return $niupc.ConfigGetVariableStrDef(cast[PIhandle](ih), cstring(group), cstring(key), cstring(def))

proc ConfigGetVariableStrIdDef*(ih: IUPhandle_t; group: string; key: string; id: cint; def: string): string {.cdecl.} =
    return $niupc.ConfigGetVariableStrIdDef(cast[PIhandle](ih), cstring(group), cstring(key), id, cstring(def))

proc ConfigGetVariableIntDef*(ih: IUPhandle_t; group: string; key: string; def: cint): cint {.cdecl.} =
    return niupc.ConfigGetVariableIntDef(cast[PIhandle](ih), cstring(group), cstring(key), def)

proc ConfigGetVariableIntIdDef*(ih: IUPhandle_t; group: string; key: string; id: cint; def: cint): cint {.cdecl.} =
    return niupc.ConfigGetVariableIntIdDef(cast[PIhandle](ih), cstring(group), cstring(key), id, def)

proc ConfigGetVariableDoubleDef*(ih: IUPhandle_t; group: string; key: string; def: cdouble): cdouble {.cdecl.} =
    return niupc.ConfigGetVariableDoubleDef(cast[PIhandle](ih), cstring(group), cstring(key), def)

proc ConfigGetVariableDoubleIdDef*(ih: IUPhandle_t; group: string; key: string; id: cint; def: cdouble): cdouble {.cdecl.} =
    return niupc.ConfigGetVariableDoubleIdDef(cast[PIhandle](ih), cstring(group), cstring(key), id, def)

proc ConfigCopy*(ih1: IUPhandle_t; ih2: IUPhandle_t; exclude_prefix: string) {.cdecl.} =
    niupc.ConfigCopy(cast[PIhandle](ih1), cast[PIhandle](ih2), cstring(exclude_prefix))

proc ConfigSetListVariable*(ih: IUPhandle_t; group: string; key: string; value: string; add: cint) {.cdecl.} =
    niupc.ConfigSetListVariable(cast[PIhandle](ih), cstring(group), cstring(key), cstring(value), add)

proc ConfigRecentInit*(ih: IUPhandle_t; menu: IUPhandle_t; recent_cb: Icallback; max_recent: cint) {.cdecl.} =
    niupc.ConfigRecentInit(cast[PIhandle](ih), cast[PIhandle](menu), cast[Icallback](recent_cb), max_recent)

proc ConfigRecentUpdate*(ih: IUPhandle_t; filename: string) {.cdecl.} =
    niupc.ConfigRecentUpdate(cast[PIhandle](ih), cstring(filename))

proc ConfigDialogShow*(ih: IUPhandle_t; dialog: IUPhandle_t; name: string) {.cdecl.} =
    niupc.ConfigDialogShow(cast[PIhandle](ih), cast[PIhandle](dialog), cstring(name))

proc ConfigDialogClosed*(ih: IUPhandle_t; dialog: IUPhandle_t; name: string) {.cdecl.} =
    niupc.ConfigDialogClosed(cast[PIhandle](ih), cast[PIhandle](dialog), cstring(name))

proc ControlsOpen*(): cint {.cdecl.} =
    return niupc.ControlsOpen()

proc Cells*(): PIhandle {.cdecl.} =
    return niupc.Cells()

proc Matrix*(action: string): PIhandle {.cdecl.} =
    return niupc.Matrix(cstring(action))

proc MatrixList*(): PIhandle {.cdecl.} =
    return niupc.MatrixList()

proc MatrixEx*(): PIhandle {.cdecl.} =
    return niupc.MatrixEx()

proc MatrixSetFormula*(ih: IUPhandle_t; col: cint; formula: string; init: string) {.cdecl.} =
    niupc.MatrixSetFormula(cast[PIhandle](ih), col, cstring(formula), cstring(init))

proc MatrixSetDynamic*(ih: IUPhandle_t; init: string) {.cdecl.} =
    niupc.MatrixSetDynamic(cast[PIhandle](ih), cstring(init))

proc cdContextIupDraw*(): ptr cdContext {.cdecl.} =
    return niupc.cdContextIupDraw()

proc DrawBegin*(ih: IUPhandle_t) {.cdecl.} =
    niupc.DrawBegin(cast[PIhandle](ih))

proc DrawEnd*(ih: IUPhandle_t) {.cdecl.} =
    niupc.DrawEnd(cast[PIhandle](ih))

proc DrawSetClipRect*(ih: IUPhandle_t; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.DrawSetClipRect(cast[PIhandle](ih), x1, y1, x2, y2)

proc DrawGetClipRect*(ih: IUPhandle_t; x1: var cint; y1: var cint; x2: var cint; y2: var cint) {.cdecl.} =
    niupc.DrawGetClipRect(cast[PIhandle](ih), x1, y1, x2, y2)

proc DrawResetClip*(ih: IUPhandle_t) {.cdecl.} =
    niupc.DrawResetClip(cast[PIhandle](ih))

proc DrawParentBackground*(ih: IUPhandle_t) {.cdecl.} =
    niupc.DrawParentBackground(cast[PIhandle](ih))

proc DrawLine*(ih: IUPhandle_t; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.DrawLine(cast[PIhandle](ih), x1, y1, x2, y2)

proc DrawRectangle*(ih: IUPhandle_t; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.DrawRectangle(cast[PIhandle](ih), x1, y1, x2, y2)

proc DrawArc*(ih: IUPhandle_t; x1: cint; y1: cint; x2: cint; y2: cint; a1: cdouble; a2: cdouble) {.cdecl.} =
    niupc.DrawArc(cast[PIhandle](ih), x1, y1, x2, y2, a1, a2)

proc DrawPolygon*(ih: IUPhandle_t; points: var cint; count: cint) {.cdecl.} =
    niupc.DrawPolygon(cast[PIhandle](ih), points, count)

proc DrawText*(ih: IUPhandle_t; text: string; len: cint; x: cint; y: cint; w: cint; h: cint) {.cdecl.} =
    niupc.DrawText(cast[PIhandle](ih), cstring(text), len, x, y, w, h)

proc DrawImage*(ih: IUPhandle_t; name: string; x: cint; y: cint; w: cint; h: cint) {.cdecl.} =
    niupc.DrawImage(cast[PIhandle](ih), cstring(name), x, y, w, h)

proc DrawSelectRect*(ih: IUPhandle_t; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.DrawSelectRect(cast[PIhandle](ih), x1, y1, x2, y2)

proc DrawFocusRect*(ih: IUPhandle_t; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl.} =
    niupc.DrawFocusRect(cast[PIhandle](ih), x1, y1, x2, y2)

proc DrawGetSize*(ih: IUPhandle_t; w: var cint; h: var cint) {.cdecl.} =
    niupc.DrawGetSize(cast[PIhandle](ih), w, h)

proc DrawGetTextSize*(ih: IUPhandle_t; text: string; len: cint; w: var cint; h: var cint) {.cdecl.} =
    niupc.DrawGetTextSize(cast[PIhandle](ih), cstring(text), len, w, h)

proc DrawGetImageInfo*(name: string; w: var cint; h: var cint; bpp: var cint) {.cdecl.} =
    niupc.DrawGetImageInfo(cstring(name), w, h, bpp)

proc NewFileDlgOpen*(): cint {.cdecl.} =
    return niupc.NewFileDlgOpen()

proc GLControlsOpen*(): cint {.cdecl.} =
    return niupc.GLControlsOpen()

proc GLCanvasBoxv*(children: ptr IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GLCanvasBoxv(cast[ptr PIhandle](children))

proc GLSubCanvas*(): PIhandle {.cdecl.} =
    return niupc.GLSubCanvas()

proc GLLabel*(title: string): PIhandle {.cdecl.} =
    return niupc.GLLabel(cstring(title))

proc GLSeparator*(): PIhandle {.cdecl.} =
    return niupc.GLSeparator()

proc GLButton*(title: string): PIhandle {.cdecl.} =
    return niupc.GLButton(cstring(title))

proc GLToggle*(title: string): PIhandle {.cdecl.} =
    return niupc.GLToggle(cstring(title))

proc GLLink*(url: string; title: string): PIhandle {.cdecl.} =
    return niupc.GLLink(cstring(url), cstring(title))

proc GLProgressBar*(): PIhandle {.cdecl.} =
    return niupc.GLProgressBar()

proc GLVal*(): PIhandle {.cdecl.} =
    return niupc.GLVal()

proc GLFrame*(child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GLFrame(cast[PIhandle](child))

proc GLExpander*(child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GLExpander(cast[PIhandle](child))

proc GLScrollBox*(child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GLScrollBox(cast[PIhandle](child))

proc GLSizeBox*(child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GLSizeBox(cast[PIhandle](child))

proc GLText*(): PIhandle {.cdecl.} =
    return niupc.GLText()

proc GLDrawImage*(ih: IUPhandle_t; name: string; x: cint; y: cint; active: cint) {.cdecl.} =
    niupc.GLDrawImage(cast[PIhandle](ih), cstring(name), x, y, active)

proc GLDrawText*(ih: IUPhandle_t; str: string; len: cint; x: cint; y: cint) {.cdecl.} =
    niupc.GLDrawText(cast[PIhandle](ih), cstring(str), len, x, y)

proc GLDrawGetTextSize*(ih: IUPhandle_t; str: string; w: var cint; h: var cint) {.cdecl.} =
    niupc.GLDrawGetTextSize(cast[PIhandle](ih), cstring(str), w, h)

proc GLDrawGetImageInfo*(name: string; w: var cint; h: var cint; bpp: var cint) {.cdecl.} =
    niupc.GLDrawGetImageInfo(cstring(name), w, h, bpp)

proc GLCanvasOpen*() {.cdecl.} =
    niupc.GLCanvasOpen()

proc GLCanvas*(action: string): PIhandle {.cdecl.} =
    return niupc.GLCanvas(cstring(action))

proc GLBackgroundBox*(child: IUPhandle_t): PIhandle {.cdecl.} =
    return niupc.GLBackgroundBox(cast[PIhandle](child))

proc GLMakeCurrent*(ih: IUPhandle_t) {.cdecl.} =
    niupc.GLMakeCurrent(cast[PIhandle](ih))

proc GLIsCurrent*(ih: IUPhandle_t): cint {.cdecl.} =
    return niupc.GLIsCurrent(cast[PIhandle](ih))

proc GLSwapBuffers*(ih: IUPhandle_t) {.cdecl.} =
    niupc.GLSwapBuffers(cast[PIhandle](ih))

proc GLPalette*(ih: IUPhandle_t; index: cint; r: cfloat; g: cfloat; b: cfloat) {.cdecl.} =
    niupc.GLPalette(cast[PIhandle](ih), index, r, g, b)

proc GLUseFont*(ih: IUPhandle_t; first: cint; count: cint; list_base: cint) {.cdecl.} =
    niupc.GLUseFont(cast[PIhandle](ih), first, count, list_base)

proc GLWait*(gl: cint) {.cdecl.} =
    niupc.GLWait(gl)

proc ImOpen*() {.cdecl.} =
    niupc.ImOpen()

proc LoadImage*(filename: string): PIhandle {.cdecl.} =
    return niupc.LoadImage(cstring(filename))

proc SaveImage*(ih: IUPhandle_t; filename: string; format: string): cint {.cdecl.} =
    return niupc.SaveImage(cast[PIhandle](ih), cstring(filename), cstring(format))

proc LoadAnimation*(filename: string): PIhandle {.cdecl.} =
    return niupc.LoadAnimation(cstring(filename))

proc LoadAnimationFrames*(filename_list: cstringArray; file_count: cint): PIhandle {.cdecl.} =
    return niupc.LoadAnimationFrames(filename_list, file_count)

proc GetNativeHandleImage*(handle: pointer): ptr imImage {.cdecl.} =
    return niupc.GetNativeHandleImage(handle)

proc GetImageNativeHandle*(image: ptr imImage): pointer {.cdecl.} =
    return niupc.GetImageNativeHandle(image)

proc ImageFromImImage*(image: ptr imImage): PIhandle {.cdecl.} =
    return niupc.ImageFromImImage(image)

proc ImageToImImage*(iup_image: IUPhandle_t): ptr imImage {.cdecl.} =
    return niupc.ImageToImImage(cast[PIhandle](iup_image))

proc MglPlotOpen*() {.cdecl.} =
    niupc.MglPlotOpen()

proc MglPlot*(): PIhandle {.cdecl.} =
    return niupc.MglPlot()

proc MglPlotBegin*(ih: IUPhandle_t; dim: cint) {.cdecl.} =
    niupc.MglPlotBegin(cast[PIhandle](ih), dim)

proc MglPlotAdd1D*(ih: IUPhandle_t; name: string; y: cdouble) {.cdecl.} =
    niupc.MglPlotAdd1D(cast[PIhandle](ih), cstring(name), y)

proc MglPlotAdd2D*(ih: IUPhandle_t; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.MglPlotAdd2D(cast[PIhandle](ih), x, y)

proc MglPlotAdd3D*(ih: IUPhandle_t; x: cdouble; y: cdouble; z: cdouble) {.cdecl.} =
    niupc.MglPlotAdd3D(cast[PIhandle](ih), x, y, z)

proc MglPlotEnd*(ih: IUPhandle_t): cint {.cdecl.} =
    return niupc.MglPlotEnd(cast[PIhandle](ih))

proc MglPlotNewDataSet*(ih: IUPhandle_t; dim: cint): cint {.cdecl.} =
    return niupc.MglPlotNewDataSet(cast[PIhandle](ih), dim)

proc MglPlotInsert1D*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; names: cstringArray; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotInsert1D(cast[PIhandle](ih), ds_index, sample_index, names, y, count)

proc MglPlotInsert2D*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotInsert2D(cast[PIhandle](ih), ds_index, sample_index, x, y, count)

proc MglPlotInsert3D*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotInsert3D(cast[PIhandle](ih), ds_index, sample_index, x, y, z, count)

proc MglPlotSet1D*(ih: IUPhandle_t; ds_index: cint; names: cstringArray; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotSet1D(cast[PIhandle](ih), ds_index, names, y, count)

proc MglPlotSet2D*(ih: IUPhandle_t; ds_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotSet2D(cast[PIhandle](ih), ds_index, x, y, count)

proc MglPlotSet3D*(ih: IUPhandle_t; ds_index: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble; count: cint) {.cdecl.} =
    niupc.MglPlotSet3D(cast[PIhandle](ih), ds_index, x, y, z, count)

proc MglPlotSetFormula*(ih: IUPhandle_t; ds_index: cint; formulaX: string; formulaY: string; formulaZ: string; count: cint) {.cdecl.} =
    niupc.MglPlotSetFormula(cast[PIhandle](ih), ds_index, cstring(formulaX), cstring(formulaY), cstring(formulaZ), count)

proc MglPlotSetData*(ih: IUPhandle_t; ds_index: cint; data: ptr cdouble; count_x: cint; count_y: cint; count_z: cint) {.cdecl.} =
    niupc.MglPlotSetData(cast[PIhandle](ih), ds_index, data, count_x, count_y, count_z)

proc MglPlotLoadData*(ih: IUPhandle_t; ds_index: cint; filename: string; count_x: cint; count_y: cint; count_z: cint) {.cdecl.} =
    niupc.MglPlotLoadData(cast[PIhandle](ih), ds_index, cstring(filename), count_x, count_y, count_z)

proc MglPlotSetFromFormula*(ih: IUPhandle_t; ds_index: cint; formula: string; count_x: cint; count_y: cint; count_z: cint) {.cdecl.} =
    niupc.MglPlotSetFromFormula(cast[PIhandle](ih), ds_index, cstring(formula), count_x, count_y, count_z)

proc MglPlotTransform*(ih: IUPhandle_t; x: cdouble; y: cdouble; z: cdouble; ix: var cint; iy: var cint) {.cdecl.} =
    niupc.MglPlotTransform(cast[PIhandle](ih), x, y, z, ix, iy)

proc MglPlotTransformTo*(ih: IUPhandle_t; ix: cint; iy: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble) {.cdecl.} =
    niupc.MglPlotTransformTo(cast[PIhandle](ih), ix, iy, x, y, z)

proc MglPlotDrawMark*(ih: IUPhandle_t; x: cdouble; y: cdouble; z: cdouble) {.cdecl.} =
    niupc.MglPlotDrawMark(cast[PIhandle](ih), x, y, z)

proc MglPlotDrawLine*(ih: IUPhandle_t; x1: cdouble; y1: cdouble; z1: cdouble; x2: cdouble; y2: cdouble; z2: cdouble) {.cdecl.} =
    niupc.MglPlotDrawLine(cast[PIhandle](ih), x1, y1, z1, x2, y2, z2)

proc MglPlotDrawText*(ih: IUPhandle_t; text: string; x: cdouble; y: cdouble; z: cdouble) {.cdecl.} =
    niupc.MglPlotDrawText(cast[PIhandle](ih), cstring(text), x, y, z)

proc MglPlotPaintTo*(ih: IUPhandle_t; format: string; w: cint; h: cint; dpi: cdouble; data: pointer) {.cdecl.} =
    niupc.MglPlotPaintTo(cast[PIhandle](ih), cstring(format), w, h, dpi, data)

proc MglLabel*(title: string): PIhandle {.cdecl.} =
    return niupc.MglLabel(cstring(title))

proc PlotOpen*() {.cdecl.} =
    niupc.PlotOpen()

proc Plot*(): PIhandle {.cdecl.} =
    return niupc.Plot()

proc PlotBegin*(ih: IUPhandle_t; strXdata: cint) {.cdecl.} =
    niupc.PlotBegin(cast[PIhandle](ih), strXdata)

proc PlotAdd*(ih: IUPhandle_t; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.PlotAdd(cast[PIhandle](ih), x, y)

proc PlotAddStr*(ih: IUPhandle_t; x: string; y: cdouble) {.cdecl.} =
    niupc.PlotAddStr(cast[PIhandle](ih), cstring(x), y)

proc PlotAddSegment*(ih: IUPhandle_t; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.PlotAddSegment(cast[PIhandle](ih), x, y)

proc PlotEnd*(ih: IUPhandle_t): cint {.cdecl.} =
    return niupc.PlotEnd(cast[PIhandle](ih))

proc PlotLoadData*(ih: IUPhandle_t; filename: string; strXdata: cint): cint {.cdecl.} =
    return niupc.PlotLoadData(cast[PIhandle](ih), cstring(filename), strXdata)

proc PlotSetFormula*(ih: IUPhandle_t; sample_count: cint; formula: string; init: string): cint {.cdecl.} =
    return niupc.PlotSetFormula(cast[PIhandle](ih), sample_count, cstring(formula), cstring(init))

proc PlotInsert*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.PlotInsert(cast[PIhandle](ih), ds_index, sample_index, x, y)

proc PlotInsertStr*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: string; y: cdouble) {.cdecl.} =
    niupc.PlotInsertStr(cast[PIhandle](ih), ds_index, sample_index, cstring(x), y)

proc PlotInsertSegment*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.PlotInsertSegment(cast[PIhandle](ih), ds_index, sample_index, x, y)

proc PlotInsertStrSamples*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: cstringArray; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.PlotInsertStrSamples(cast[PIhandle](ih), ds_index, sample_index, x, y, count)

proc PlotInsertSamples*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.PlotInsertSamples(cast[PIhandle](ih), ds_index, sample_index, x, y, count)

proc PlotAddSamples*(ih: IUPhandle_t; ds_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.PlotAddSamples(cast[PIhandle](ih), ds_index, x, y, count)

proc PlotAddStrSamples*(ih: IUPhandle_t; ds_index: cint; x: cstringArray; y: ptr cdouble; count: cint) {.cdecl.} =
    niupc.PlotAddStrSamples(cast[PIhandle](ih), ds_index, x, y, count)

proc PlotGetSample*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble) {.cdecl.} =
    niupc.PlotGetSample(cast[PIhandle](ih), ds_index, sample_index, x, y)

proc PlotGetSampleStr*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: cstringArray; y: ptr cdouble) {.cdecl.} =
    niupc.PlotGetSampleStr(cast[PIhandle](ih), ds_index, sample_index, x, y)

proc PlotGetSampleSelection*(ih: IUPhandle_t; ds_index: cint; sample_index: cint): cint {.cdecl.} =
    return niupc.PlotGetSampleSelection(cast[PIhandle](ih), ds_index, sample_index)

proc PlotGetSampleExtra*(ih: IUPhandle_t; ds_index: cint; sample_index: cint): cdouble {.cdecl.} =
    return niupc.PlotGetSampleExtra(cast[PIhandle](ih), ds_index, sample_index)

proc PlotSetSample*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl.} =
    niupc.PlotSetSample(cast[PIhandle](ih), ds_index, sample_index, x, y)

proc PlotSetSampleStr*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; x: string; y: cdouble) {.cdecl.} =
    niupc.PlotSetSampleStr(cast[PIhandle](ih), ds_index, sample_index, cstring(x), y)

proc PlotSetSampleSelection*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; selected: cint) {.cdecl.} =
    niupc.PlotSetSampleSelection(cast[PIhandle](ih), ds_index, sample_index, selected)

proc PlotSetSampleExtra*(ih: IUPhandle_t; ds_index: cint; sample_index: cint; extra: cdouble) {.cdecl.} =
    niupc.PlotSetSampleExtra(cast[PIhandle](ih), ds_index, sample_index, extra)

proc PlotTransform*(ih: IUPhandle_t; x: cdouble; y: cdouble; cnv_x: ptr cdouble; cnv_y: ptr cdouble) {.cdecl.} =
    niupc.PlotTransform(cast[PIhandle](ih), x, y, cnv_x, cnv_y)

proc PlotTransformTo*(ih: IUPhandle_t; cnv_x: cdouble; cnv_y: cdouble; x: ptr cdouble; y: ptr cdouble) {.cdecl.} =
    niupc.PlotTransformTo(cast[PIhandle](ih), cnv_x, cnv_y, x, y)

proc PlotFindSample*(ih: IUPhandle_t; cnv_x: cdouble; cnv_y: cdouble; ds_index: var cint; sample_index: var cint): cint {.cdecl.} =
    return niupc.PlotFindSample(cast[PIhandle](ih), cnv_x, cnv_y, ds_index, sample_index)

proc PlotFindSegment*(ih: IUPhandle_t; cnv_x: cdouble; cnv_y: cdouble; ds_index: var cint; sample_index1: var cint; sample_index2: var cint): cint {.cdecl.} =
    return niupc.PlotFindSegment(cast[PIhandle](ih), cnv_x, cnv_y, ds_index, sample_index1, sample_index2)

proc PlotPaintTo*(ih: IUPhandle_t; cnv: ptr cdCanvas) {.cdecl.} =
    niupc.PlotPaintTo(cast[PIhandle](ih), cnv)

proc ScintillaOpen*() {.cdecl.} =
    niupc.ScintillaOpen()

proc Scintilla*(): PIhandle {.cdecl.} =
    return niupc.Scintilla()

proc ScintillaDlg*(): PIhandle {.cdecl.} =
    return niupc.ScintillaDlg()

proc ScintillaSendMessage*(ih: IUPhandle_t; iMessage: cuint; wParam: clong; lParam: clong): clong {.cdecl.} =
    return niupc.ScintillaSendMessage(cast[PIhandle](ih), iMessage, wParam, lParam)

proc TuioOpen*(): cint {.cdecl.} =
    return niupc.TuioOpen()

proc TuioClient*(port: cint): PIhandle {.cdecl.} =
    return niupc.TuioClient(port)

proc WebBrowserOpen*(): cint {.cdecl.} =
    return niupc.WebBrowserOpen()

proc WebBrowser*(): PIhandle {.cdecl.} =
    return niupc.WebBrowser()

