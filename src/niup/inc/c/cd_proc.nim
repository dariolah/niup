
proc cdVersion*(): cstring {.cdecl, importc: "cdVersion", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdVersionDate*(): cstring {.cdecl, importc: "cdVersionDate", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdVersionNumber*(): cint {.cdecl, importc: "cdVersionNumber", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCreateCanvas*(context: ptr cdContext; data: pointer): ptr cdCanvas {.cdecl, importc: "cdCreateCanvas", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCreateCanvasf*(context: ptr cdContext; format: cstring): ptr cdCanvas {.varargs, cdecl, importc: "cdCreateCanvasf", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdKillCanvas*(canvas: ptr cdCanvas) {.cdecl, importc: "cdKillCanvas", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetContext*(canvas: ptr cdCanvas): ptr cdContext {.cdecl, importc: "cdCanvasGetContext", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasActivate*(canvas: ptr cdCanvas): cint {.cdecl, importc: "cdCanvasActivate", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasDeactivate*(canvas: ptr cdCanvas) {.cdecl, importc: "cdCanvasDeactivate", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdUseContextPlus*(use: cint): cint {.cdecl, importc: "cdUseContextPlus", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdInitContextPlus*() {.cdecl, importc: "cdInitContextPlus", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdFinishContextPlus*() {.cdecl, importc: "cdFinishContextPlus", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdContextRegisterCallback*(context: ptr cdContext; cb: cint; `func`: cdCallback): cint {. cdecl, importc: "cdContextRegisterCallback", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdContextCaps*(context: ptr cdContext): culong {.cdecl, importc: "cdContextCaps", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdContextIsPlus*(context: ptr cdContext): cint {.cdecl, importc: "cdContextIsPlus", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdContextType*(context: ptr cdContext): cint {.cdecl, importc: "cdContextType", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasSimulate*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl, importc: "cdCanvasSimulate", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasFlush*(canvas: ptr cdCanvas) {.cdecl, importc: "cdCanvasFlush", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasClear*(canvas: ptr cdCanvas) {.cdecl, importc: "cdCanvasClear", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasSaveState*(canvas: ptr cdCanvas): ptr cdState {.cdecl, importc: "cdCanvasSaveState", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasRestoreState*(canvas: ptr cdCanvas; state: ptr cdState) {.cdecl, importc: "cdCanvasRestoreState", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdReleaseState*(state: ptr cdState) {.cdecl, importc: "cdReleaseState", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasSetAttribute*(canvas: ptr cdCanvas; name: cstring; data: cstring) {.cdecl, importc: "cdCanvasSetAttribute", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasSetfAttribute*(canvas: ptr cdCanvas; name: cstring; format: cstring) {. varargs, cdecl, importc: "cdCanvasSetfAttribute", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetAttribute*(canvas: ptr cdCanvas; name: cstring): cstring {.cdecl, importc: "cdCanvasGetAttribute", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasPlay*(canvas: ptr cdCanvas; context: ptr cdContext; xmin: cint; xmax: cint; ymin: cint; ymax: cint; data: pointer): cint {.cdecl, importc: "cdCanvasPlay", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasGetSize*(canvas: ptr cdCanvas; width: ptr cint; height: ptr cint; width_mm: ptr cdouble; height_mm: ptr cdouble) {.cdecl, importc: "cdCanvasGetSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasUpdateYAxis*(canvas: ptr cdCanvas; y: ptr cint): cint {.cdecl, importc: "cdCanvasUpdateYAxis", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdfCanvasUpdateYAxis*(canvas: ptr cdCanvas; y: ptr cdouble): cdouble {.cdecl, importc: "cdfCanvasUpdateYAxis", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasInvertYAxis*(canvas: ptr cdCanvas; y: cint): cint {.cdecl, importc: "cdCanvasInvertYAxis", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdfCanvasInvertYAxis*(canvas: ptr cdCanvas; y: cdouble): cdouble {.cdecl, importc: "cdfCanvasInvertYAxis", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasMM2Pixel*(canvas: ptr cdCanvas; mm_dx: cdouble; mm_dy: cdouble; dx: ptr cint; dy: ptr cint) {.cdecl, importc: "cdCanvasMM2Pixel", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasPixel2MM*(canvas: ptr cdCanvas; dx: cint; dy: cint; mm_dx: ptr cdouble; mm_dy: ptr cdouble) {.cdecl, importc: "cdCanvasPixel2MM", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasMM2Pixel*(canvas: ptr cdCanvas; mm_dx: cdouble; mm_dy: cdouble; dx: ptr cdouble; dy: ptr cdouble) {.cdecl, importc: "cdfCanvasMM2Pixel", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasPixel2MM*(canvas: ptr cdCanvas; dx: cdouble; dy: cdouble; mm_dx: ptr cdouble; mm_dy: ptr cdouble) {.cdecl, importc: "cdfCanvasPixel2MM", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasOrigin*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl, importc: "cdCanvasOrigin", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasOrigin*(canvas: ptr cdCanvas; x: cdouble; y: cdouble) {.cdecl, importc: "cdfCanvasOrigin", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetOrigin*(canvas: ptr cdCanvas; x: ptr cint; y: ptr cint) {.cdecl, importc: "cdCanvasGetOrigin", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasGetOrigin*(canvas: ptr cdCanvas; x: ptr cdouble; y: ptr cdouble) {.cdecl, importc: "cdfCanvasGetOrigin", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasTransform*(canvas: ptr cdCanvas; matrix: ptr cdouble) {.cdecl, importc: "cdCanvasTransform", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetTransform*(canvas: ptr cdCanvas): ptr cdouble {.cdecl, importc: "cdCanvasGetTransform", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasTransformMultiply*(canvas: ptr cdCanvas; matrix: ptr cdouble) {.cdecl, importc: "cdCanvasTransformMultiply", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasTransformRotate*(canvas: ptr cdCanvas; angle: cdouble) {.cdecl, importc: "cdCanvasTransformRotate", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasTransformScale*(canvas: ptr cdCanvas; sx: cdouble; sy: cdouble) {.cdecl, importc: "cdCanvasTransformScale", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasTransformTranslate*(canvas: ptr cdCanvas; dx: cdouble; dy: cdouble) {. cdecl, importc: "cdCanvasTransformTranslate", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasTransformPoint*(canvas: ptr cdCanvas; x: cint; y: cint; tx: ptr cint; ty: ptr cint) {.cdecl, importc: "cdCanvasTransformPoint", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasTransformPoint*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; tx: ptr cdouble; ty: ptr cdouble) {.cdecl, importc: "cdfCanvasTransformPoint", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasClip*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl, importc: "cdCanvasClip", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasClipArea*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdCanvasClipArea", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetClipArea*(canvas: ptr cdCanvas; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint): cint {.cdecl, importc: "cdCanvasGetClipArea", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdfCanvasClipArea*(canvas: ptr cdCanvas; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble) {.cdecl, importc: "cdfCanvasClipArea", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasGetClipArea*(canvas: ptr cdCanvas; xmin: ptr cdouble; xmax: ptr cdouble; ymin: ptr cdouble; ymax: ptr cdouble): cint {.cdecl, importc: "cdfCanvasGetClipArea", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasIsPointInRegion*(canvas: ptr cdCanvas; x: cint; y: cint): cint {.cdecl, importc: "cdCanvasIsPointInRegion", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasOffsetRegion*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl, importc: "cdCanvasOffsetRegion", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetRegionBox*(canvas: ptr cdCanvas; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint) {.cdecl, importc: "cdCanvasGetRegionBox", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasRegionCombineMode*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl, importc: "cdCanvasRegionCombineMode", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasPixel*(canvas: ptr cdCanvas; x: cint; y: cint; color: clong) {.cdecl, importc: "cdCanvasPixel", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasMark*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl, importc: "cdCanvasMark", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasPixel*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; color: clong) {.cdecl, importc: "cdfCanvasPixel", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasMark*(canvas: ptr cdCanvas; x: cdouble; y: cdouble) {.cdecl, importc: "cdfCanvasMark", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasBegin*(canvas: ptr cdCanvas; mode: cint) {.cdecl, importc: "cdCanvasBegin", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasPathSet*(canvas: ptr cdCanvas; action: cint) {.cdecl, importc: "cdCanvasPathSet", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasEnd*(canvas: ptr cdCanvas) {.cdecl, importc: "cdCanvasEnd", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasLine*(canvas: ptr cdCanvas; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "cdCanvasLine", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasVertex*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl, importc: "cdCanvasVertex", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasRect*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {. cdecl, importc: "cdCanvasRect", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasBox*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {. cdecl, importc: "cdCanvasBox", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasArc*(canvas: ptr cdCanvas; xc: cint; yc: cint; w: cint; h: cint; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdCanvasArc", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasSector*(canvas: ptr cdCanvas; xc: cint; yc: cint; w: cint; h: cint; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdCanvasSector", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasChord*(canvas: ptr cdCanvas; xc: cint; yc: cint; w: cint; h: cint; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdCanvasChord", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasText*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring) {.cdecl, importc: "cdCanvasText", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasLine*(canvas: ptr cdCanvas; x1: cdouble; y1: cdouble; x2: cdouble; y2: cdouble) {.cdecl, importc: "cdfCanvasLine", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasVertex*(canvas: ptr cdCanvas; x: cdouble; y: cdouble) {.cdecl, importc: "cdfCanvasVertex", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasRect*(canvas: ptr cdCanvas; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble) {.cdecl, importc: "cdfCanvasRect", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasBox*(canvas: ptr cdCanvas; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble) {.cdecl, importc: "cdfCanvasBox", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasArc*(canvas: ptr cdCanvas; xc: cdouble; yc: cdouble; w: cdouble; h: cdouble; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdfCanvasArc", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasSector*(canvas: ptr cdCanvas; xc: cdouble; yc: cdouble; w: cdouble; h: cdouble; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdfCanvasSector", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasChord*(canvas: ptr cdCanvas; xc: cdouble; yc: cdouble; w: cdouble; h: cdouble; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdfCanvasChord", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasText*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring) {.cdecl, importc: "cdfCanvasText", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasSetBackground*(canvas: ptr cdCanvas; color: clong) {.cdecl, importc: "cdCanvasSetBackground", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasSetForeground*(canvas: ptr cdCanvas; color: clong) {.cdecl, importc: "cdCanvasSetForeground", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasBackground*(canvas: ptr cdCanvas; color: clong): clong {.cdecl, importc: "cdCanvasBackground", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasForeground*(canvas: ptr cdCanvas; color: clong): clong {.cdecl, importc: "cdCanvasForeground", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasBackOpacity*(canvas: ptr cdCanvas; opacity: cint): cint {.cdecl, importc: "cdCanvasBackOpacity", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasWriteMode*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl, importc: "cdCanvasWriteMode", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasLineStyle*(canvas: ptr cdCanvas; style: cint): cint {.cdecl, importc: "cdCanvasLineStyle", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasLineStyleDashes*(canvas: ptr cdCanvas; dashes: ptr cint; count: cint) {. cdecl, importc: "cdCanvasLineStyleDashes", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasLineWidth*(canvas: ptr cdCanvas; width: cint): cint {.cdecl, importc: "cdCanvasLineWidth", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasLineJoin*(canvas: ptr cdCanvas; join: cint): cint {.cdecl, importc: "cdCanvasLineJoin", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasLineCap*(canvas: ptr cdCanvas; cap: cint): cint {.cdecl, importc: "cdCanvasLineCap", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasInteriorStyle*(canvas: ptr cdCanvas; style: cint): cint {.cdecl, importc: "cdCanvasInteriorStyle", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasHatch*(canvas: ptr cdCanvas; style: cint): cint {.cdecl, importc: "cdCanvasHatch", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasStipple*(canvas: ptr cdCanvas; w: cint; h: cint; stipple: ptr uint8) {.cdecl, importc: "cdCanvasStipple", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetStipple*(canvas: ptr cdCanvas; n: ptr cint; m: ptr cint): ptr uint8 {. cdecl, importc: "cdCanvasGetStipple", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasPattern*(canvas: ptr cdCanvas; w: cint; h: cint; pattern: ptr clong) {.cdecl, importc: "cdCanvasPattern", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetPattern*(canvas: ptr cdCanvas; n: ptr cint; m: ptr cint): ptr clong {.cdecl, importc: "cdCanvasGetPattern", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasFillMode*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl, importc: "cdCanvasFillMode", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasFont*(canvas: ptr cdCanvas; type_face: cstring; style: cint; size: cint): cint {. cdecl, importc: "cdCanvasFont", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasGetFont*(canvas: ptr cdCanvas; type_face: cstring; style: ptr cint; size: ptr cint) {.cdecl, importc: "cdCanvasGetFont", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasNativeFont*(canvas: ptr cdCanvas; font: cstring): cstring {.cdecl, importc: "cdCanvasNativeFont", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasTextAlignment*(canvas: ptr cdCanvas; alignment: cint): cint {.cdecl, importc: "cdCanvasTextAlignment", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasTextOrientation*(canvas: ptr cdCanvas; angle: cdouble): cdouble {.cdecl, importc: "cdCanvasTextOrientation", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasMarkType*(canvas: ptr cdCanvas; `type`: cint): cint {.cdecl, importc: "cdCanvasMarkType", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasMarkSize*(canvas: ptr cdCanvas; size: cint): cint {.cdecl, importc: "cdCanvasMarkSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasVectorText*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring) {.cdecl, importc: "cdCanvasVectorText", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasMultiLineVectorText*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring) {. cdecl, importc: "cdCanvasMultiLineVectorText", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasVectorFont*(canvas: ptr cdCanvas; filename: cstring): cstring {.cdecl, importc: "cdCanvasVectorFont", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasVectorTextDirection*(canvas: ptr cdCanvas; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "cdCanvasVectorTextDirection", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasVectorTextTransform*(canvas: ptr cdCanvas; matrix: ptr cdouble): ptr cdouble {. cdecl, importc: "cdCanvasVectorTextTransform", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasVectorTextSize*(canvas: ptr cdCanvas; size_x: cint; size_y: cint; s: cstring) {.cdecl, importc: "cdCanvasVectorTextSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasVectorCharSize*(canvas: ptr cdCanvas; size: cint): cint {.cdecl, importc: "cdCanvasVectorCharSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasVectorFontSize*(canvas: ptr cdCanvas; size_x: cdouble; size_y: cdouble) {. cdecl, importc: "cdCanvasVectorFontSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetVectorFontSize*(canvas: ptr cdCanvas; size_x: ptr cdouble; size_y: ptr cdouble) {.cdecl, importc: "cdCanvasGetVectorFontSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetVectorTextSize*(canvas: ptr cdCanvas; s: cstring; x: ptr cint; y: ptr cint) {.cdecl, importc: "cdCanvasGetVectorTextSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetVectorTextBounds*(canvas: ptr cdCanvas; s: cstring; x: cint; y: cint; rect: ptr cint) {.cdecl, importc: "cdCanvasGetVectorTextBounds", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetVectorTextBox*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint) {.cdecl, importc: "cdCanvasGetVectorTextBox", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasVectorTextDirection*(canvas: ptr cdCanvas; x1: cdouble; y1: cdouble; x2: cdouble; y2: cdouble) {.cdecl, importc: "cdfCanvasVectorTextDirection", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasVectorTextSize*(canvas: ptr cdCanvas; size_x: cdouble; size_y: cdouble; s: cstring) {.cdecl, importc: "cdfCanvasVectorTextSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasGetVectorTextSize*(canvas: ptr cdCanvas; s: cstring; x: ptr cdouble; y: ptr cdouble) {.cdecl, importc: "cdfCanvasGetVectorTextSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasVectorCharSize*(canvas: ptr cdCanvas; size: cdouble): cdouble {.cdecl, importc: "cdfCanvasVectorCharSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasVectorText*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring) {. cdecl, importc: "cdfCanvasVectorText", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasMultiLineVectorText*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring) {.cdecl, importc: "cdfCanvasMultiLineVectorText", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasGetVectorTextBounds*(canvas: ptr cdCanvas; s: cstring; x: cdouble; y: cdouble; rect: ptr cdouble) {.cdecl, importc: "cdfCanvasGetVectorTextBounds", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasGetVectorTextBox*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring; xmin: ptr cdouble; xmax: ptr cdouble; ymin: ptr cdouble; ymax: ptr cdouble) {.cdecl, importc: "cdfCanvasGetVectorTextBox", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetFontDim*(canvas: ptr cdCanvas; max_width: ptr cint; height: ptr cint; ascent: ptr cint; descent: ptr cint) {.cdecl, importc: "cdCanvasGetFontDim", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetTextSize*(canvas: ptr cdCanvas; s: cstring; width: ptr cint; height: ptr cint) {.cdecl, importc: "cdCanvasGetTextSize", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetTextBox*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint) {. cdecl, importc: "cdCanvasGetTextBox", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasGetTextBox*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring; xmin: ptr cdouble; xmax: ptr cdouble; ymin: ptr cdouble; ymax: ptr cdouble) {.cdecl, importc: "cdfCanvasGetTextBox", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetTextBounds*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring; rect: ptr cint) {.cdecl, importc: "cdCanvasGetTextBounds", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasGetTextBounds*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring; rect: ptr cdouble) {.cdecl, importc: "cdfCanvasGetTextBounds", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetColorPlanes*(canvas: ptr cdCanvas): cint {.cdecl, importc: "cdCanvasGetColorPlanes", dynlib: libcdSONAME, dynlib: libiupcdSONAME, discardable.}
proc cdCanvasPalette*(canvas: ptr cdCanvas; n: cint; palette: ptr clong; mode: cint) {. cdecl, importc: "cdCanvasPalette", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetImageRGB*(canvas: ptr cdCanvas; r: ptr uint8; g: ptr uint8; b: ptr uint8; x: cint; y: cint; iw: cint; ih: cint) {.cdecl, importc: "cdCanvasGetImageRGB", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasPutImageRectRGB*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: ptr uint8; g: ptr uint8; b: ptr uint8; x: cint; y: cint; w: cint; h: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {. cdecl, importc: "cdCanvasPutImageRectRGB", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasPutImageRectRGBA*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: ptr uint8; g: ptr uint8; b: ptr uint8; a: ptr uint8; x: cint; y: cint; w: cint; h: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdCanvasPutImageRectRGBA", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasPutImageRectMap*(canvas: ptr cdCanvas; iw: cint; ih: cint; index: ptr uint8; colors: ptr clong; x: cint; y: cint; w: cint; h: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdCanvasPutImageRectMap", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasPutImageRectRGB*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: ptr uint8; g: ptr uint8; b: ptr uint8; x: cdouble; y: cdouble; w: cdouble; h: cdouble; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdfCanvasPutImageRectRGB", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasPutImageRectRGBA*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: ptr uint8; g: ptr uint8; b: ptr uint8; a: ptr uint8; x: cdouble; y: cdouble; w: cdouble; h: cdouble; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdfCanvasPutImageRectRGBA", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdfCanvasPutImageRectMap*(canvas: ptr cdCanvas; iw: cint; ih: cint; index: ptr uint8; colors: ptr clong; x: cdouble; y: cdouble; w: cdouble; h: cdouble; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdfCanvasPutImageRectMap", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasCreateImage*(canvas: ptr cdCanvas; w: cint; h: cint): ptr cdImage {.cdecl, importc: "cdCanvasCreateImage", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdKillImage*(image: ptr cdImage) {.cdecl, importc: "cdKillImage", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetImage*(canvas: ptr cdCanvas; image: ptr cdImage; x: cint; y: cint) {.cdecl, importc: "cdCanvasGetImage", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasPutImageRect*(canvas: ptr cdCanvas; image: ptr cdImage; x: cint; y: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdCanvasPutImageRect", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasScrollArea*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint; dx: cint; dy: cint) {.cdecl, importc: "cdCanvasScrollArea", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCreateBitmap*(w: cint; h: cint; `type`: cint): ptr cdBitmap {.cdecl, importc: "cdCreateBitmap", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdInitBitmap*(w: cint; h: cint; `type`: cint): ptr cdBitmap {.varargs, cdecl, importc: "cdInitBitmap", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdKillBitmap*(bitmap: ptr cdBitmap) {.cdecl, importc: "cdKillBitmap", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdBitmapGetData*(bitmap: ptr cdBitmap; dataptr: cint): ptr uint8 {.cdecl, importc: "cdBitmapGetData", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdBitmapSetRect*(bitmap: ptr cdBitmap; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {. cdecl, importc: "cdBitmapSetRect", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasPutBitmap*(canvas: ptr cdCanvas; bitmap: ptr cdBitmap; x: cint; y: cint; w: cint; h: cint) {.cdecl, importc: "cdCanvasPutBitmap", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdCanvasGetBitmap*(canvas: ptr cdCanvas; bitmap: ptr cdBitmap; x: cint; y: cint) {. cdecl, importc: "cdCanvasGetBitmap", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdBitmapRGB2Map*(bitmap_rgb: ptr cdBitmap; bitmap_map: ptr cdBitmap) {.cdecl, importc: "cdBitmapRGB2Map", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdEncodeColor*(red: uint8; green: uint8; blue: uint8): clong {.cdecl, importc: "cdEncodeColor", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdEncodeColorAlpha*(red: uint8; green: uint8; blue: uint8; alpha: uint8): clong {. cdecl, importc: "cdEncodeColorAlpha", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdEncodeAlpha*(color: clong; alpha: uint8): clong {.cdecl, importc: "cdEncodeAlpha", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdDecodeColor*(color: clong; red: ptr uint8; green: ptr uint8; blue: ptr uint8) {. cdecl, importc: "cdDecodeColor", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdDecodeColorAlpha*(color: clong; red: ptr uint8; green: ptr uint8; blue: ptr uint8; alpha: ptr uint8) {.cdecl, importc: "cdDecodeColorAlpha", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdDecodeAlpha*(color: clong): uint8 {.cdecl, importc: "cdDecodeAlpha", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdRGB2Map*(width: cint; height: cint; red: ptr uint8; green: ptr uint8; blue: ptr uint8; index: ptr uint8; pal_size: cint; color: ptr clong) {. cdecl, importc: "cdRGB2Map", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdContextIup*(): ptr cdContext {.cdecl, importc: "cdContextIup", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdContextIupDBuffer*(): ptr cdContext {.cdecl, importc: "cdContextIupDBuffer", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdContextIupDBufferRGB*(): ptr cdContext {.cdecl, importc: "cdContextIupDBufferRGB", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdContextPrinter*(): ptr cdContext {.cdecl, importc: "cdContextPrinter", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdContextImageRGB*(): ptr cdContext {.cdecl, importc: "cdContextImageRGB", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdContextDBufferRGB*(): ptr cdContext {.cdecl, importc: "cdContextDBufferRGB", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdRedImage*(cnv: ptr cdCanvas): ptr uint8 {.cdecl, importc: "cdRedImage", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdGreenImage*(cnv: ptr cdCanvas): ptr uint8 {.cdecl, importc: "cdGreenImage", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdBlueImage*(cnv: ptr cdCanvas): ptr uint8 {.cdecl, importc: "cdBlueImage", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}
proc cdAlphaImage*(cnv: ptr cdCanvas): ptr uint8 {.cdecl, importc: "cdAlphaImage", dynlib: libcdSONAME, dynlib: libiupcdSONAME.}