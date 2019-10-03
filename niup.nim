{.deadCodeElim: on.}

when defined(Linux):
     # BEGIN workaround for dlopen(RTLD_GLOBAL) in Linux
     # https://forum.nim-lang.org/t/3996
     {. passL:"-rdynamic -Wl,-wrap,dlopen".}
     {.emit: """
     #include <dlfcn.h>
     void *__real_dlopen(const char *filename, int flags);
     void *__wrap_dlopen(const char *filename, int flags)
     {
       return __real_dlopen(filename, flags | RTLD_GLOBAL);
     }
     """.}
     # END workaround

when defined(Windows):
  const 
        libiupSONAME = "iup.dll"
        libiupcdSONAME = "iupcd.dll"
        libcdSONAME = "cd.dll"
        libiupcontrolsSONAME = "iupcontrols.dll"
        libiupglcontrolsSONAME = "iupglcontrols.dll"
        libiupglSONAME = "iupgl.dll"
        libiupimglibSONAME = "iupimglib.dll"
        libiupimSONAME = "iupim.dll"
        libiup_mglplotSONAME = "iup_mglplot.dll"
        libiup_plotSONAME = "iup_plot.dll"
        libiup_scintillaSONAME = "iup_scintilla.dll"
        libiuptuioSONAME = "iuptuio.dll"
        libiupwebSONAME = "iupweb.dll"
elif defined(MacOSX):
  const 
        libiupSONAME = "libiup.dylib"
        libiupcdSONAME = "libiupcd.dylib"
        libcdSONAME = "libcd.dylib"
        libiupcontrolsSONAME = "libiupcontrols.dylib"
        libiupglcontrolsSONAME = "libiupglcontrols.dylib"
        libiupglSONAME = "libiupgl.dylib"
        libiupimglibSONAME = "libiupimglib.dylib"
        libiupimSONAME = "libiupim.dylib"
        libiup_mglplotSONAME = "libiup_mglplot.dylib"
        libiup_plotSONAME = "libiup_plot.dylib"
        libiup_scintillaSONAME = "libiup_scintilla.dylib"
        libiuptuioSONAME = "libiuptuio.dylib"
        libiupwebSONAME = "libiupweb.dylib"
else:
  const 
        libiupSONAME = "libiup.so"
        libiupcdSONAME = "libiupcd.so"
        libcdSONAME = "libcd.so"
        libiupcontrolsSONAME = "libiupcontrols.so"
        libiupglcontrolsSONAME = "libiupglcontrols.so"
        libiupglSONAME = "libiupgl.so"
        libiupimglibSONAME = "libiupimglib.so"
        libiupimSONAME = "libiupim.so"
        libiup_mglplotSONAME = "libiup_mglplot.so"
        libiup_plotSONAME = "libiup_plot.so"
        libiup_scintillaSONAME = "libiup_scintilla.so"
        libiuptuioSONAME = "libiuptuio.so"
        libiupwebSONAME = "libiupweb.so"


#Lib IM
type
  imDataType* {.size: sizeof(cint).} = enum
    IM_BYTE, IM_SHORT, IM_USHORT, IM_INT, IM_FLOAT, IM_DOUBLE, IM_CFLOAT, IM_CDOUBLE


type
  imColorSpace* {.size: sizeof(cint).} = enum
    IM_RGB, IM_MAP, IM_GRAY, IM_BINARY, IM_CMYK, IM_YCBCR, IM_LAB, IM_LUV, IM_XYZ


type
  imColorModeConfig* {.size: sizeof(cint).} = enum
    IM_ALPHA = 0x00000100, IM_PACKED = 0x00000200, IM_TOPDOWN = 0x00000400


type
  imErrorCodes* {.size: sizeof(cint).} = enum
    IM_ERR_NONE, IM_ERR_OPEN, IM_ERR_ACCESS, IM_ERR_FORMAT, IM_ERR_DATA,
    IM_ERR_COMPRESS, IM_ERR_MEM, IM_ERR_COUNTER


type
  imFile* = object

proc imFileOpen*(file_name: cstring; error: ptr imErrorCodes): ptr imFile {.cdecl, importc: "imFileOpen", dynlib: libiupimSONAME.}
proc imFileOpenAs*(file_name: cstring; format: cstring; error: ptr imErrorCodes): ptr imFile {. cdecl, importc: "imFileOpenAs", dynlib: libiupimSONAME.}
proc imFileNew*(file_name: cstring; format: cstring; error: ptr imErrorCodes): ptr imFile {.cdecl, importc: "imFileNew", dynlib: libiupimSONAME.}
proc imFileClose*(ifile: ptr imFile) {.cdecl, importc: "imFileClose", dynlib: libiupimSONAME.}
proc imFileHandle*(ifile: ptr imFile; index: cint): pointer {.cdecl, importc: "imFileHandle", dynlib: libiupimSONAME.}
proc imFileGetInfo*(ifile: ptr imFile; format: cstring; compression: cstring; image_count: ptr cint) {.cdecl, importc: "imFileGetInfo", dynlib: libiupimSONAME.}
proc imFileSetInfo*(ifile: ptr imFile; compression: cstring) {.cdecl, importc: "imFileSetInfo", dynlib: libiupimSONAME.}
proc imFileSetAttribute*(ifile: ptr imFile; attrib: cstring; data_type: imDataType; count: cint; data: pointer) {.cdecl, importc: "imFileSetAttribute", dynlib: libiupimSONAME.}
proc imFileSetAttribInteger*(ifile: ptr imFile; attrib: cstring; data_type: imDataType; value: cint) {.cdecl, importc: "imFileSetAttribInteger", dynlib: libiupimSONAME.}
proc imFileSetAttribReal*(ifile: ptr imFile; attrib: cstring; data_type: imDataType; value: cdouble) {.cdecl, importc: "imFileSetAttribReal", dynlib: libiupimSONAME.}
proc imFileSetAttribString*(ifile: ptr imFile; attrib: cstring; value: cstring) {.cdecl, importc: "imFileSetAttribString", dynlib: libiupimSONAME.}
proc imFileGetAttribute*(ifile: ptr imFile; attrib: cstring; data_type: ptr cint; count: ptr cint): pointer {.cdecl, importc: "imFileGetAttribute", dynlib: libiupimSONAME.}
proc imFileGetAttribInteger*(ifile: ptr imFile; attrib: cstring; index: cint): cint {. cdecl, importc: "imFileGetAttribInteger", dynlib: libiupimSONAME, discardable.}
proc imFileGetAttribReal*(ifile: ptr imFile; attrib: cstring; index: cint): cdouble {. cdecl, importc: "imFileGetAttribReal", dynlib: libiupimSONAME.}
proc imFileGetAttribString*(ifile: ptr imFile; attrib: cstring): cstring {.cdecl, importc: "imFileGetAttribString", dynlib: libiupimSONAME.}
proc imFileGetAttributeList*(ifile: ptr imFile; attrib: cstringArray; attrib_count: ptr cint) {.cdecl, importc: "imFileGetAttributeList", dynlib: libiupimSONAME.}
proc imFileGetPalette*(ifile: ptr imFile; palette: ptr clong; palette_count: ptr cint) {. cdecl, importc: "imFileGetPalette", dynlib: libiupimSONAME.}
proc imFileSetPalette*(ifile: ptr imFile; palette: ptr clong; palette_count: cint) {. cdecl, importc: "imFileSetPalette", dynlib: libiupimSONAME.}
proc imFileReadImageInfo*(ifile: ptr imFile; index: cint; width: ptr cint; height: ptr cint; file_color_mode: ptr cint; file_data_type: ptr cint): cint {.cdecl, importc: "imFileReadImageInfo", dynlib: libiupimSONAME, discardable.}
proc imFileWriteImageInfo*(ifile: ptr imFile; width: cint; height: cint; user_color_mode: cint; user_data_type: cint): cint {.cdecl, importc: "imFileWriteImageInfo", dynlib: libiupimSONAME, discardable.}
proc imFileReadImageData*(ifile: ptr imFile; data: pointer; convert2bitmap: cint; color_mode_flags: cint): cint {.cdecl, importc: "imFileReadImageData", dynlib: libiupimSONAME, discardable.}
proc imFileWriteImageData*(ifile: ptr imFile; data: pointer): cint {.cdecl, importc: "imFileWriteImageData", dynlib: libiupimSONAME, discardable.}
proc imFormatRegisterInternal*() {.cdecl, importc: "imFormatRegisterInternal", dynlib: libiupimSONAME.}
proc imFormatRemoveAll*() {.cdecl, importc: "imFormatRemoveAll", dynlib: libiupimSONAME.}
proc imFormatList*(format_list: cstringArray; format_count: ptr cint) {.cdecl, importc: "imFormatList", dynlib: libiupimSONAME.}
proc imFormatInfo*(format: cstring; desc: cstring; ext: cstring; can_sequence: ptr cint): cint {. cdecl, importc: "imFormatInfo", dynlib: libiupimSONAME, discardable.}
proc imFormatInfoExtra*(format: cstring; extra: cstring): cint {.cdecl, importc: "imFormatInfoExtra", dynlib: libiupimSONAME, discardable.}
proc imFormatCompressions*(format: cstring; comp: cstringArray; comp_count: ptr cint; color_mode: cint; data_type: imDataType): cint {.cdecl, importc: "imFormatCompressions", dynlib: libiupimSONAME, discardable.}
proc imFormatCanWriteImage*(format: cstring; compression: cstring; color_mode: cint; data_type: imDataType): cint {.cdecl, importc: "imFormatCanWriteImage", dynlib: libiupimSONAME, discardable.}
type
  imImage* {.bycopy.} = object
    width*: cint
    height*: cint
    color_space*: imColorSpace
    data_type*: cint
    has_alpha*: cint
    depth*: cint
    line_size*: cint
    plane_size*: cint
    size*: cint
    count*: cint
    data*: ptr cstring
    palette*: ptr clong
    palette_count*: cint
    attrib_table*: pointer


proc imImageCreate*(width: cint; height: cint; color_space: imColorSpace; data_type: imDataType): ptr imImage {. cdecl, importc: "imImageCreate", dynlib: libiupimSONAME.}
proc imImageInit*(width: cint; height: cint; color_mode: cint; data_type: imDataType; data_buffer: pointer; palette: ptr clong; palette_count: cint): ptr imImage {. cdecl, importc: "imImageInit", dynlib: libiupimSONAME.}
proc imImageCreateBased*(image: ptr imImage; width: cint; height: cint; color_space: imColorSpace; data_type: imDataType): ptr imImage {.cdecl, importc: "imImageCreateBased", dynlib: libiupimSONAME.}
proc imImageDestroy*(image: ptr imImage) {.cdecl, importc: "imImageDestroy", dynlib: libiupimSONAME.}
proc imImageAddAlpha*(image: ptr imImage) {.cdecl, importc: "imImageAddAlpha", dynlib: libiupimSONAME.}
proc imImageSetAlpha*(image: ptr imImage; alpha: cfloat) {.cdecl, importc: "imImageSetAlpha", dynlib: libiupimSONAME.}
proc imImageRemoveAlpha*(image: ptr imImage) {.cdecl, importc: "imImageRemoveAlpha", dynlib: libiupimSONAME.}
proc imImageReshape*(image: ptr imImage; width: cint; height: cint) {.cdecl, importc: "imImageReshape", dynlib: libiupimSONAME.}
proc imImageCopy*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl, importc: "imImageCopy", dynlib: libiupimSONAME.}
proc imImageCopyData*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl, importc: "imImageCopyData", dynlib: libiupimSONAME.}
proc imImageCopyAttributes*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl, importc: "imImageCopyAttributes", dynlib: libiupimSONAME.}
proc imImageMergeAttributes*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl, importc: "imImageMergeAttributes", dynlib: libiupimSONAME.}
proc imImageCopyPlane*(src_image: ptr imImage; src_plane: cint; dst_image: ptr imImage; dst_plane: cint) {.cdecl, importc: "imImageCopyPlane", dynlib: libiupimSONAME.}
proc imImageDuplicate*(image: ptr imImage): ptr imImage {.cdecl, importc: "imImageDuplicate", dynlib: libiupimSONAME.}
proc imImageClone*(image: ptr imImage): ptr imImage {.cdecl, importc: "imImageClone", dynlib: libiupimSONAME.}
proc imImageSetAttribute*(image: ptr imImage; attrib: cstring; data_type: imDataType; count: cint; data: pointer) {.cdecl, importc: "imImageSetAttribute", dynlib: libiupimSONAME.}
proc imImageSetAttribInteger*(image: ptr imImage; attrib: cstring; data_type: imDataType; value: cint) {.cdecl, importc: "imImageSetAttribInteger", dynlib: libiupimSONAME.}
proc imImageSetAttribReal*(image: ptr imImage; attrib: cstring; data_type: imDataType; value: cdouble) {.cdecl, importc: "imImageSetAttribReal", dynlib: libiupimSONAME.}
proc imImageSetAttribString*(image: ptr imImage; attrib: cstring; value: cstring) {. cdecl, importc: "imImageSetAttribString", dynlib: libiupimSONAME.}
proc imImageGetAttribute*(image: ptr imImage; attrib: cstring; data_type: ptr cint; count: ptr cint): pointer {.cdecl, importc: "imImageGetAttribute", dynlib: libiupimSONAME.}
proc imImageGetAttribInteger*(image: ptr imImage; attrib: cstring; index: cint): cint {. cdecl, importc: "imImageGetAttribInteger", dynlib: libiupimSONAME, discardable.}
proc imImageGetAttribReal*(image: ptr imImage; attrib: cstring; index: cint): cdouble {. cdecl, importc: "imImageGetAttribReal", dynlib: libiupimSONAME.}
proc imImageGetAttribString*(image: ptr imImage; attrib: cstring): cstring {.cdecl, importc: "imImageGetAttribString", dynlib: libiupimSONAME.}
proc imImageGetAttributeList*(image: ptr imImage; attrib: cstringArray; attrib_count: ptr cint) {.cdecl, importc: "imImageGetAttributeList", dynlib: libiupimSONAME.}
proc imImageClear*(image: ptr imImage) {.cdecl, importc: "imImageClear", dynlib: libiupimSONAME.}
proc imImageIsBitmap*(image: ptr imImage): cint {.cdecl, importc: "imImageIsBitmap", dynlib: libiupimSONAME, discardable.}
proc imImageSetPalette*(image: ptr imImage; palette: ptr clong; palette_count: cint) {. cdecl, importc: "imImageSetPalette", dynlib: libiupimSONAME.}
proc imImageMatchSize*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl, importc: "imImageMatchSize", dynlib: libiupimSONAME, discardable.}
proc imImageMatchColor*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl, importc: "imImageMatchColor", dynlib: libiupimSONAME, discardable.}
proc imImageMatchDataType*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl, importc: "imImageMatchDataType", dynlib: libiupimSONAME, discardable.}
proc imImageMatchColorSpace*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl, importc: "imImageMatchColorSpace", dynlib: libiupimSONAME, discardable.}
proc imImageMatch*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl, importc: "imImageMatch", dynlib: libiupimSONAME, discardable.}
proc imImageSetMap*(image: ptr imImage) {.cdecl, importc: "imImageSetMap", dynlib: libiupimSONAME.}
proc imImageSetBinary*(image: ptr imImage) {.cdecl, importc: "imImageSetBinary", dynlib: libiupimSONAME.}
proc imImageSetGray*(image: ptr imImage) {.cdecl, importc: "imImageSetGray", dynlib: libiupimSONAME.}
proc imImageMakeBinary*(image: ptr imImage) {.cdecl, importc: "imImageMakeBinary", dynlib: libiupimSONAME.}
proc imImageMakeGray*(image: ptr imImage) {.cdecl, importc: "imImageMakeGray", dynlib: libiupimSONAME.}
proc imFileLoadImage*(ifile: ptr imFile; index: cint; error: ptr imErrorCodes): ptr imImage {. cdecl, importc: "imFileLoadImage", dynlib: libiupimSONAME.}
proc imFileLoadImageFrame*(ifile: ptr imFile; index: cint; image: ptr imImage; error: ptr imErrorCodes) {.cdecl, importc: "imFileLoadImageFrame", dynlib: libiupimSONAME.}
proc imFileLoadBitmap*(ifile: ptr imFile; index: cint; error: ptr imErrorCodes): ptr imImage {. cdecl, importc: "imFileLoadBitmap", dynlib: libiupimSONAME.}
proc imFileLoadImageRegion*(ifile: ptr imFile; index: cint; bitmap: cint; error: ptr imErrorCodes; xmin: cint; xmax: cint; ymin: cint; ymax: cint; width: cint; height: cint): ptr imImage {.cdecl, importc: "imFileLoadImageRegion", dynlib: libiupimSONAME.}
proc imFileLoadBitmapFrame*(ifile: ptr imFile; index: cint; image: ptr imImage; error: ptr imErrorCodes) {.cdecl, importc: "imFileLoadBitmapFrame", dynlib: libiupimSONAME.}
proc imFileSaveImage*(ifile: ptr imFile; image: ptr imImage): cint {.cdecl, importc: "imFileSaveImage", dynlib: libiupimSONAME, discardable.}
proc imFileImageLoad*(file_name: cstring; index: cint; error: ptr imErrorCodes): ptr imImage {. cdecl, importc: "imFileImageLoad", dynlib: libiupimSONAME.}
proc imFileImageLoadBitmap*(file_name: cstring; index: cint; error: ptr imErrorCodes): ptr imImage {. cdecl, importc: "imFileImageLoadBitmap", dynlib: libiupimSONAME.}
proc imFileImageLoadRegion*(file_name: cstring; index: cint; bitmap: cint; error: ptr imErrorCodes; xmin: cint; xmax: cint; ymin: cint; ymax: cint; width: cint; height: cint): ptr imImage {.cdecl, importc: "imFileImageLoadRegion", dynlib: libiupimSONAME.}
proc imFileImageSave*(file_name: cstring; format: cstring; image: ptr imImage): imErrorCodes {. cdecl, importc: "imFileImageSave", dynlib: libiupimSONAME.}
template imcdCanvasPutImage*(x_canvas, x_image, x_x, x_y, x_w, x_h, x_xmin, x_xmax, x_ymin, x_ymax: untyped): void =
  if x_image.color_space == IM_RGB:
    if x_image.has_alpha > 0:
      cdCanvasPutImageRectRGBA(x_canvas, x_image.width, x_image.height,
                               cast[ptr cuchar](cast[ByteAddress](x_image.data[]) +% 0 * x_image.plane_size),
                               cast[ptr cuchar](cast[ByteAddress](x_image.data[]) +% 1 * x_image.plane_size),
                               cast[ptr cuchar](cast[ByteAddress](x_image.data[]) +% 2 * x_image.plane_size),
                               cast[ptr cuchar](cast[ByteAddress](x_image.data[]) +% 3 * x_image.plane_size), x_x, x_y, x_w, x_h,
                               x_xmin, x_xmax, x_ymin, x_ymax)
    else:
      cdCanvasPutImageRectRGB(x_canvas, x_image.width, x_image.height,
                              cast[ptr cuchar](cast[ByteAddress](x_image.data[]) +% 0 * x_image.plane_size),
                              cast[ptr cuchar](cast[ByteAddress](x_image.data[]) +% 1 * x_image.plane_size),
                              cast[ptr cuchar](cast[ByteAddress](x_image.data[]) +% 2 * x_image.plane_size), x_x, x_y, x_w, x_h, x_xmin,
                              x_xmax, x_ymin, x_ymax)
  else:
    cdCanvasPutImageRectMap(x_canvas, x_image.width, x_image.height,
                            cast[ptr cuchar](cast[ByteAddress](x_image.data[]) +% 0 * x_image.plane_size), x_image.palette, x_x,
                            x_y, x_w, x_h, x_xmin, x_xmax, x_ymin, x_ymax)

type
  imComplex2Real* {.size: sizeof(cint).} = enum
    IM_CPX_REAL, IM_CPX_IMAG, IM_CPX_MAG, IM_CPX_PHASE


type
  imGammaFactor* {.size: sizeof(cint).} = enum
    IM_GAMMA_LOGHEAVY = -1000, IM_GAMMA_LOGLITE = -10, IM_GAMMA_LINEAR = 0,
    IM_GAMMA_EXPLITE = 2, IM_GAMMA_EXPHEAVY = 7


type
  imCastMode* {.size: sizeof(cint).} = enum
    IM_CAST_MINMAX, IM_CAST_FIXED, IM_CAST_DIRECT, IM_CAST_USER


proc imConvertDataType*(src_image: ptr imImage; dst_image: ptr imImage; cpx2real: cint; gamma: cfloat; absolute: cint; cast_mode: cint): cint {.cdecl, importc: "imConvertDataType", dynlib: libiupimSONAME, discardable.}
proc imConvertColorSpace*(src_image: ptr imImage; dst_image: ptr imImage): cint {.cdecl, importc: "imConvertColorSpace", dynlib: libiupimSONAME, discardable.}
proc imConvertToBitmap*(src_image: ptr imImage; dst_image: ptr imImage; cpx2real: cint; gamma: cfloat; absolute: cint; cast_mode: cint): cint {.cdecl, importc: "imConvertToBitmap", dynlib: libiupimSONAME, discardable.}
proc imImageGetOpenGLData*(image: ptr imImage; glformat: ptr cint): pointer {.cdecl, importc: "imImageGetOpenGLData", dynlib: libiupimSONAME.}
proc imImageCreateFromOpenGLData*(width: cint; height: cint; glformat: cint; gldata: pointer): ptr imImage {.cdecl, importc: "imImageCreateFromOpenGLData", dynlib: libiupimSONAME.}
proc imConvertPacking*(src_data: pointer; dst_data: pointer; width: cint; height: cint; src_depth: cint; dst_depth: cint; data_type: imDataType; src_is_packed: cint) {.cdecl, importc: "imConvertPacking", dynlib: libiupimSONAME.}
proc imConvertMapToRGB*(data: ptr cuchar; count: cint; depth: cint; packed: cint; palette: ptr clong; palette_count: cint) {.cdecl, importc: "imConvertMapToRGB", dynlib: libiupimSONAME.}
proc imConvertRGB2Map*(width: cint; height: cint; red: ptr cuchar; green: ptr cuchar; blue: ptr cuchar; map: ptr cuchar; palette: ptr clong; palette_count: ptr cint): cint {.cdecl, importc: "imConvertRGB2Map", dynlib: libiupimSONAME, discardable.}
#Lib CD
const
  CD_NAME* = "CD - A 2D Graphics Library"
  CD_DESCRIPTION* = "Vector Graphics Toolkit with Device Independent Output"
  CD_COPYRIGHT* = "Copyright (C) 1994-2019 Tecgraf/PUC-Rio"
  CD_VERSION* = "5.12"
  CD_VERSION_NUMBER* = 512000
  CD_VERSION_DATE* = "2019/01/07"

type
  cdContext* = object
  cdCanvas* = object
  cdState* = object
  cdImage* = object
  cdBitmap* {.bycopy.} = object
    w*: cint
    h*: cint
    `type`*: cint
    data*: pointer


proc cdVersion*(): cstring {.cdecl, importc: "cdVersion", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdVersionDate*(): cstring {.cdecl, importc: "cdVersionDate", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdVersionNumber*(): cint {.cdecl, importc: "cdVersionNumber", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCreateCanvas*(context: ptr cdContext; data: pointer): ptr cdCanvas {.cdecl, importc: "cdCreateCanvas", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCreateCanvasf*(context: ptr cdContext; format: cstring): ptr cdCanvas {.varargs, cdecl, importc: "cdCreateCanvasf", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdKillCanvas*(canvas: ptr cdCanvas) {.cdecl, importc: "cdKillCanvas", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetContext*(canvas: ptr cdCanvas): ptr cdContext {.cdecl, importc: "cdCanvasGetContext", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasActivate*(canvas: ptr cdCanvas): cint {.cdecl, importc: "cdCanvasActivate", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasDeactivate*(canvas: ptr cdCanvas) {.cdecl, importc: "cdCanvasDeactivate", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdUseContextPlus*(use: cint): cint {.cdecl, importc: "cdUseContextPlus", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdInitContextPlus*() {.cdecl, importc: "cdInitContextPlus", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdFinishContextPlus*() {.cdecl, importc: "cdFinishContextPlus", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
type
  cdCallback* = proc (canvas: ptr cdCanvas): cint {.cdecl, varargs.}

proc cdContextRegisterCallback*(context: ptr cdContext; cb: cint; `func`: cdCallback): cint {. cdecl, importc: "cdContextRegisterCallback", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdContextCaps*(context: ptr cdContext): culong {.cdecl, importc: "cdContextCaps", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdContextIsPlus*(context: ptr cdContext): cint {.cdecl, importc: "cdContextIsPlus", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdContextType*(context: ptr cdContext): cint {.cdecl, importc: "cdContextType", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasSimulate*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl, importc: "cdCanvasSimulate", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasFlush*(canvas: ptr cdCanvas) {.cdecl, importc: "cdCanvasFlush", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasClear*(canvas: ptr cdCanvas) {.cdecl, importc: "cdCanvasClear", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasSaveState*(canvas: ptr cdCanvas): ptr cdState {.cdecl, importc: "cdCanvasSaveState", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasRestoreState*(canvas: ptr cdCanvas; state: ptr cdState) {.cdecl, importc: "cdCanvasRestoreState", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdReleaseState*(state: ptr cdState) {.cdecl, importc: "cdReleaseState", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasSetAttribute*(canvas: ptr cdCanvas; name: cstring; data: cstring) {.cdecl, importc: "cdCanvasSetAttribute", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasSetfAttribute*(canvas: ptr cdCanvas; name: cstring; format: cstring) {. varargs, cdecl, importc: "cdCanvasSetfAttribute", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetAttribute*(canvas: ptr cdCanvas; name: cstring): cstring {.cdecl, importc: "cdCanvasGetAttribute", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasPlay*(canvas: ptr cdCanvas; context: ptr cdContext; xmin: cint; xmax: cint; ymin: cint; ymax: cint; data: pointer): cint {.cdecl, importc: "cdCanvasPlay", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasGetSize*(canvas: ptr cdCanvas; width: ptr cint; height: ptr cint; width_mm: ptr cdouble; height_mm: ptr cdouble) {.cdecl, importc: "cdCanvasGetSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasUpdateYAxis*(canvas: ptr cdCanvas; y: ptr cint): cint {.cdecl, importc: "cdCanvasUpdateYAxis", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdfCanvasUpdateYAxis*(canvas: ptr cdCanvas; y: ptr cdouble): cdouble {.cdecl, importc: "cdfCanvasUpdateYAxis", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasInvertYAxis*(canvas: ptr cdCanvas; y: cint): cint {.cdecl, importc: "cdCanvasInvertYAxis", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdfCanvasInvertYAxis*(canvas: ptr cdCanvas; y: cdouble): cdouble {.cdecl, importc: "cdfCanvasInvertYAxis", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasMM2Pixel*(canvas: ptr cdCanvas; mm_dx: cdouble; mm_dy: cdouble; dx: ptr cint; dy: ptr cint) {.cdecl, importc: "cdCanvasMM2Pixel", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasPixel2MM*(canvas: ptr cdCanvas; dx: cint; dy: cint; mm_dx: ptr cdouble; mm_dy: ptr cdouble) {.cdecl, importc: "cdCanvasPixel2MM", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasMM2Pixel*(canvas: ptr cdCanvas; mm_dx: cdouble; mm_dy: cdouble; dx: ptr cdouble; dy: ptr cdouble) {.cdecl, importc: "cdfCanvasMM2Pixel", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasPixel2MM*(canvas: ptr cdCanvas; dx: cdouble; dy: cdouble; mm_dx: ptr cdouble; mm_dy: ptr cdouble) {.cdecl, importc: "cdfCanvasPixel2MM", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasOrigin*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl, importc: "cdCanvasOrigin", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasOrigin*(canvas: ptr cdCanvas; x: cdouble; y: cdouble) {.cdecl, importc: "cdfCanvasOrigin", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetOrigin*(canvas: ptr cdCanvas; x: ptr cint; y: ptr cint) {.cdecl, importc: "cdCanvasGetOrigin", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasGetOrigin*(canvas: ptr cdCanvas; x: ptr cdouble; y: ptr cdouble) {.cdecl, importc: "cdfCanvasGetOrigin", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasTransform*(canvas: ptr cdCanvas; matrix: ptr cdouble) {.cdecl, importc: "cdCanvasTransform", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetTransform*(canvas: ptr cdCanvas): ptr cdouble {.cdecl, importc: "cdCanvasGetTransform", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasTransformMultiply*(canvas: ptr cdCanvas; matrix: ptr cdouble) {.cdecl, importc: "cdCanvasTransformMultiply", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasTransformRotate*(canvas: ptr cdCanvas; angle: cdouble) {.cdecl, importc: "cdCanvasTransformRotate", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasTransformScale*(canvas: ptr cdCanvas; sx: cdouble; sy: cdouble) {.cdecl, importc: "cdCanvasTransformScale", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasTransformTranslate*(canvas: ptr cdCanvas; dx: cdouble; dy: cdouble) {. cdecl, importc: "cdCanvasTransformTranslate", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasTransformPoint*(canvas: ptr cdCanvas; x: cint; y: cint; tx: ptr cint; ty: ptr cint) {.cdecl, importc: "cdCanvasTransformPoint", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasTransformPoint*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; tx: ptr cdouble; ty: ptr cdouble) {.cdecl, importc: "cdfCanvasTransformPoint", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasClip*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl, importc: "cdCanvasClip", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasClipArea*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdCanvasClipArea", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetClipArea*(canvas: ptr cdCanvas; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint): cint {.cdecl, importc: "cdCanvasGetClipArea", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdfCanvasClipArea*(canvas: ptr cdCanvas; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble) {.cdecl, importc: "cdfCanvasClipArea", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasGetClipArea*(canvas: ptr cdCanvas; xmin: ptr cdouble; xmax: ptr cdouble; ymin: ptr cdouble; ymax: ptr cdouble): cint {.cdecl, importc: "cdfCanvasGetClipArea", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasIsPointInRegion*(canvas: ptr cdCanvas; x: cint; y: cint): cint {.cdecl, importc: "cdCanvasIsPointInRegion", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasOffsetRegion*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl, importc: "cdCanvasOffsetRegion", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetRegionBox*(canvas: ptr cdCanvas; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint) {.cdecl, importc: "cdCanvasGetRegionBox", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasRegionCombineMode*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl, importc: "cdCanvasRegionCombineMode", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasPixel*(canvas: ptr cdCanvas; x: cint; y: cint; color: clong) {.cdecl, importc: "cdCanvasPixel", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasMark*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl, importc: "cdCanvasMark", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasPixel*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; color: clong) {.cdecl, importc: "cdfCanvasPixel", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasMark*(canvas: ptr cdCanvas; x: cdouble; y: cdouble) {.cdecl, importc: "cdfCanvasMark", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasBegin*(canvas: ptr cdCanvas; mode: cint) {.cdecl, importc: "cdCanvasBegin", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasPathSet*(canvas: ptr cdCanvas; action: cint) {.cdecl, importc: "cdCanvasPathSet", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasEnd*(canvas: ptr cdCanvas) {.cdecl, importc: "cdCanvasEnd", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasLine*(canvas: ptr cdCanvas; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "cdCanvasLine", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasVertex*(canvas: ptr cdCanvas; x: cint; y: cint) {.cdecl, importc: "cdCanvasVertex", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasRect*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {. cdecl, importc: "cdCanvasRect", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasBox*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {. cdecl, importc: "cdCanvasBox", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasArc*(canvas: ptr cdCanvas; xc: cint; yc: cint; w: cint; h: cint; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdCanvasArc", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasSector*(canvas: ptr cdCanvas; xc: cint; yc: cint; w: cint; h: cint; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdCanvasSector", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasChord*(canvas: ptr cdCanvas; xc: cint; yc: cint; w: cint; h: cint; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdCanvasChord", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasText*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring) {.cdecl, importc: "cdCanvasText", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasLine*(canvas: ptr cdCanvas; x1: cdouble; y1: cdouble; x2: cdouble; y2: cdouble) {.cdecl, importc: "cdfCanvasLine", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasVertex*(canvas: ptr cdCanvas; x: cdouble; y: cdouble) {.cdecl, importc: "cdfCanvasVertex", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasRect*(canvas: ptr cdCanvas; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble) {.cdecl, importc: "cdfCanvasRect", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasBox*(canvas: ptr cdCanvas; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble) {.cdecl, importc: "cdfCanvasBox", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasArc*(canvas: ptr cdCanvas; xc: cdouble; yc: cdouble; w: cdouble; h: cdouble; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdfCanvasArc", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasSector*(canvas: ptr cdCanvas; xc: cdouble; yc: cdouble; w: cdouble; h: cdouble; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdfCanvasSector", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasChord*(canvas: ptr cdCanvas; xc: cdouble; yc: cdouble; w: cdouble; h: cdouble; angle1: cdouble; angle2: cdouble) {.cdecl, importc: "cdfCanvasChord", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasText*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring) {.cdecl, importc: "cdfCanvasText", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasSetBackground*(canvas: ptr cdCanvas; color: clong) {.cdecl, importc: "cdCanvasSetBackground", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasSetForeground*(canvas: ptr cdCanvas; color: clong) {.cdecl, importc: "cdCanvasSetForeground", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasBackground*(canvas: ptr cdCanvas; color: clong): clong {.cdecl, importc: "cdCanvasBackground", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasForeground*(canvas: ptr cdCanvas; color: clong): clong {.cdecl, importc: "cdCanvasForeground", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasBackOpacity*(canvas: ptr cdCanvas; opacity: cint): cint {.cdecl, importc: "cdCanvasBackOpacity", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasWriteMode*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl, importc: "cdCanvasWriteMode", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasLineStyle*(canvas: ptr cdCanvas; style: cint): cint {.cdecl, importc: "cdCanvasLineStyle", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasLineStyleDashes*(canvas: ptr cdCanvas; dashes: ptr cint; count: cint) {. cdecl, importc: "cdCanvasLineStyleDashes", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasLineWidth*(canvas: ptr cdCanvas; width: cint): cint {.cdecl, importc: "cdCanvasLineWidth", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasLineJoin*(canvas: ptr cdCanvas; join: cint): cint {.cdecl, importc: "cdCanvasLineJoin", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasLineCap*(canvas: ptr cdCanvas; cap: cint): cint {.cdecl, importc: "cdCanvasLineCap", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasInteriorStyle*(canvas: ptr cdCanvas; style: cint): cint {.cdecl, importc: "cdCanvasInteriorStyle", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasHatch*(canvas: ptr cdCanvas; style: cint): cint {.cdecl, importc: "cdCanvasHatch", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasStipple*(canvas: ptr cdCanvas; w: cint; h: cint; stipple: ptr cuchar) {.cdecl, importc: "cdCanvasStipple", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetStipple*(canvas: ptr cdCanvas; n: ptr cint; m: ptr cint): ptr cuchar {. cdecl, importc: "cdCanvasGetStipple", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasPattern*(canvas: ptr cdCanvas; w: cint; h: cint; pattern: ptr clong) {.cdecl, importc: "cdCanvasPattern", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetPattern*(canvas: ptr cdCanvas; n: ptr cint; m: ptr cint): ptr clong {.cdecl, importc: "cdCanvasGetPattern", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasFillMode*(canvas: ptr cdCanvas; mode: cint): cint {.cdecl, importc: "cdCanvasFillMode", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasFont*(canvas: ptr cdCanvas; type_face: cstring; style: cint; size: cint): cint {. cdecl, importc: "cdCanvasFont", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasGetFont*(canvas: ptr cdCanvas; type_face: cstring; style: ptr cint; size: ptr cint) {.cdecl, importc: "cdCanvasGetFont", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasNativeFont*(canvas: ptr cdCanvas; font: cstring): cstring {.cdecl, importc: "cdCanvasNativeFont", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasTextAlignment*(canvas: ptr cdCanvas; alignment: cint): cint {.cdecl, importc: "cdCanvasTextAlignment", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasTextOrientation*(canvas: ptr cdCanvas; angle: cdouble): cdouble {.cdecl, importc: "cdCanvasTextOrientation", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasMarkType*(canvas: ptr cdCanvas; `type`: cint): cint {.cdecl, importc: "cdCanvasMarkType", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasMarkSize*(canvas: ptr cdCanvas; size: cint): cint {.cdecl, importc: "cdCanvasMarkSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasVectorText*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring) {.cdecl, importc: "cdCanvasVectorText", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasMultiLineVectorText*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring) {. cdecl, importc: "cdCanvasMultiLineVectorText", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasVectorFont*(canvas: ptr cdCanvas; filename: cstring): cstring {.cdecl, importc: "cdCanvasVectorFont", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasVectorTextDirection*(canvas: ptr cdCanvas; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "cdCanvasVectorTextDirection", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasVectorTextTransform*(canvas: ptr cdCanvas; matrix: ptr cdouble): ptr cdouble {. cdecl, importc: "cdCanvasVectorTextTransform", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasVectorTextSize*(canvas: ptr cdCanvas; size_x: cint; size_y: cint; s: cstring) {.cdecl, importc: "cdCanvasVectorTextSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasVectorCharSize*(canvas: ptr cdCanvas; size: cint): cint {.cdecl, importc: "cdCanvasVectorCharSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasVectorFontSize*(canvas: ptr cdCanvas; size_x: cdouble; size_y: cdouble) {. cdecl, importc: "cdCanvasVectorFontSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetVectorFontSize*(canvas: ptr cdCanvas; size_x: ptr cdouble; size_y: ptr cdouble) {.cdecl, importc: "cdCanvasGetVectorFontSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetVectorTextSize*(canvas: ptr cdCanvas; s: cstring; x: ptr cint; y: ptr cint) {.cdecl, importc: "cdCanvasGetVectorTextSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetVectorTextBounds*(canvas: ptr cdCanvas; s: cstring; x: cint; y: cint; rect: ptr cint) {.cdecl, importc: "cdCanvasGetVectorTextBounds", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetVectorTextBox*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint) {.cdecl, importc: "cdCanvasGetVectorTextBox", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasVectorTextDirection*(canvas: ptr cdCanvas; x1: cdouble; y1: cdouble; x2: cdouble; y2: cdouble) {.cdecl, importc: "cdfCanvasVectorTextDirection", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasVectorTextSize*(canvas: ptr cdCanvas; size_x: cdouble; size_y: cdouble; s: cstring) {.cdecl, importc: "cdfCanvasVectorTextSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasGetVectorTextSize*(canvas: ptr cdCanvas; s: cstring; x: ptr cdouble; y: ptr cdouble) {.cdecl, importc: "cdfCanvasGetVectorTextSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasVectorCharSize*(canvas: ptr cdCanvas; size: cdouble): cdouble {.cdecl, importc: "cdfCanvasVectorCharSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasVectorText*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring) {. cdecl, importc: "cdfCanvasVectorText", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasMultiLineVectorText*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring) {.cdecl, importc: "cdfCanvasMultiLineVectorText", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasGetVectorTextBounds*(canvas: ptr cdCanvas; s: cstring; x: cdouble; y: cdouble; rect: ptr cdouble) {.cdecl, importc: "cdfCanvasGetVectorTextBounds", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasGetVectorTextBox*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring; xmin: ptr cdouble; xmax: ptr cdouble; ymin: ptr cdouble; ymax: ptr cdouble) {.cdecl, importc: "cdfCanvasGetVectorTextBox", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetFontDim*(canvas: ptr cdCanvas; max_width: ptr cint; height: ptr cint; ascent: ptr cint; descent: ptr cint) {.cdecl, importc: "cdCanvasGetFontDim", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetTextSize*(canvas: ptr cdCanvas; s: cstring; width: ptr cint; height: ptr cint) {.cdecl, importc: "cdCanvasGetTextSize", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetTextBox*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring; xmin: ptr cint; xmax: ptr cint; ymin: ptr cint; ymax: ptr cint) {. cdecl, importc: "cdCanvasGetTextBox", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasGetTextBox*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring; xmin: ptr cdouble; xmax: ptr cdouble; ymin: ptr cdouble; ymax: ptr cdouble) {.cdecl, importc: "cdfCanvasGetTextBox", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetTextBounds*(canvas: ptr cdCanvas; x: cint; y: cint; s: cstring; rect: ptr cint) {.cdecl, importc: "cdCanvasGetTextBounds", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasGetTextBounds*(canvas: ptr cdCanvas; x: cdouble; y: cdouble; s: cstring; rect: ptr cdouble) {.cdecl, importc: "cdfCanvasGetTextBounds", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetColorPlanes*(canvas: ptr cdCanvas): cint {.cdecl, importc: "cdCanvasGetColorPlanes", dynlib: libiupcdSONAME, dynlib: libcdSONAME, discardable.}
proc cdCanvasPalette*(canvas: ptr cdCanvas; n: cint; palette: ptr clong; mode: cint) {. cdecl, importc: "cdCanvasPalette", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetImageRGB*(canvas: ptr cdCanvas; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar; x: cint; y: cint; iw: cint; ih: cint) {.cdecl, importc: "cdCanvasGetImageRGB", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasPutImageRectRGB*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar; x: cint; y: cint; w: cint; h: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {. cdecl, importc: "cdCanvasPutImageRectRGB", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasPutImageRectRGBA*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar; a: ptr cuchar; x: cint; y: cint; w: cint; h: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdCanvasPutImageRectRGBA", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasPutImageRectMap*(canvas: ptr cdCanvas; iw: cint; ih: cint; index: ptr cuchar; colors: ptr clong; x: cint; y: cint; w: cint; h: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdCanvasPutImageRectMap", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasPutImageRectRGB*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar; x: cdouble; y: cdouble; w: cdouble; h: cdouble; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdfCanvasPutImageRectRGB", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasPutImageRectRGBA*(canvas: ptr cdCanvas; iw: cint; ih: cint; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar; a: ptr cuchar; x: cdouble; y: cdouble; w: cdouble; h: cdouble; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdfCanvasPutImageRectRGBA", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdfCanvasPutImageRectMap*(canvas: ptr cdCanvas; iw: cint; ih: cint; index: ptr cuchar; colors: ptr clong; x: cdouble; y: cdouble; w: cdouble; h: cdouble; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdfCanvasPutImageRectMap", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasCreateImage*(canvas: ptr cdCanvas; w: cint; h: cint): ptr cdImage {.cdecl, importc: "cdCanvasCreateImage", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdKillImage*(image: ptr cdImage) {.cdecl, importc: "cdKillImage", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetImage*(canvas: ptr cdCanvas; image: ptr cdImage; x: cint; y: cint) {.cdecl, importc: "cdCanvasGetImage", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasPutImageRect*(canvas: ptr cdCanvas; image: ptr cdImage; x: cint; y: cint; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {.cdecl, importc: "cdCanvasPutImageRect", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasScrollArea*(canvas: ptr cdCanvas; xmin: cint; xmax: cint; ymin: cint; ymax: cint; dx: cint; dy: cint) {.cdecl, importc: "cdCanvasScrollArea", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCreateBitmap*(w: cint; h: cint; `type`: cint): ptr cdBitmap {.cdecl, importc: "cdCreateBitmap", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdInitBitmap*(w: cint; h: cint; `type`: cint): ptr cdBitmap {.varargs, cdecl, importc: "cdInitBitmap", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdKillBitmap*(bitmap: ptr cdBitmap) {.cdecl, importc: "cdKillBitmap", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdBitmapGetData*(bitmap: ptr cdBitmap; dataptr: cint): ptr cuchar {.cdecl, importc: "cdBitmapGetData", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdBitmapSetRect*(bitmap: ptr cdBitmap; xmin: cint; xmax: cint; ymin: cint; ymax: cint) {. cdecl, importc: "cdBitmapSetRect", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasPutBitmap*(canvas: ptr cdCanvas; bitmap: ptr cdBitmap; x: cint; y: cint; w: cint; h: cint) {.cdecl, importc: "cdCanvasPutBitmap", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdCanvasGetBitmap*(canvas: ptr cdCanvas; bitmap: ptr cdBitmap; x: cint; y: cint) {. cdecl, importc: "cdCanvasGetBitmap", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdBitmapRGB2Map*(bitmap_rgb: ptr cdBitmap; bitmap_map: ptr cdBitmap) {.cdecl, importc: "cdBitmapRGB2Map", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdEncodeColor*(red: cuchar; green: cuchar; blue: cuchar): clong {.cdecl, importc: "cdEncodeColor", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdEncodeColorAlpha*(red: cuchar; green: cuchar; blue: cuchar; alpha: cuchar): clong {. cdecl, importc: "cdEncodeColorAlpha", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdEncodeAlpha*(color: clong; alpha: cuchar): clong {.cdecl, importc: "cdEncodeAlpha", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdDecodeColor*(color: clong; red: ptr cuchar; green: ptr cuchar; blue: ptr cuchar) {. cdecl, importc: "cdDecodeColor", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdDecodeColorAlpha*(color: clong; red: ptr cuchar; green: ptr cuchar; blue: ptr cuchar; alpha: ptr cuchar) {.cdecl, importc: "cdDecodeColorAlpha", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdDecodeAlpha*(color: clong): cuchar {.cdecl, importc: "cdDecodeAlpha", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
template cdAlpha*(_: untyped): untyped =
  cast[cuchar]((not (((_) shr 24) and 0x000000FF)))

template cdReserved*(_: untyped): untyped =
  cast[cuchar]((((_) shr 24) and 0x000000FF))

template cdRed*(_: untyped): untyped =
  cast[cuchar]((((_) shr 16) and 0x000000FF))

template cdGreen*(_: untyped): untyped =
  cast[cuchar]((((_) shr 8) and 0x000000FF))

template cdBlue*(_: untyped): untyped =
  cast[cuchar]((((_) shr 0) and 0x000000FF))

proc cdRGB2Map*(width: cint; height: cint; red: ptr cuchar; green: ptr cuchar; blue: ptr cuchar; index: ptr cuchar; pal_size: cint; color: ptr clong) {. cdecl, importc: "cdRGB2Map", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
const
  CD_QUERY* = -1

const
  CD_RGB* = 0
  CD_MAP* = 1
  CD_RGBA* = 0x00000100

const
  CD_IRED* = 0
  CD_IGREEN* = 1
  CD_IBLUE* = 2
  CD_IALPHA* = 3
  CD_INDEX* = 4
  CD_COLORS* = 5

const
  CD_ERROR* = -1
  CD_OK* = 0

const
  CD_CLIPOFF* = 0
  CD_CLIPAREA* = 1
  CD_CLIPPOLYGON* = 2
  CD_CLIPREGION* = 3
  CD_CLIPPATH* = 4

const
  CD_UNION* = 0
  CD_INTERSECT* = 1
  CD_DIFFERENCE* = 2
  CD_NOTINTERSECT* = 3

const
  CD_FILL* = 0
  CD_OPEN_LINES* = 1
  CD_CLOSED_LINES* = 2
  CD_CLIP* = 3
  CD_BEZIER* = 4
  CD_REGION* = 5
  CD_PATH* = 6

const
  CD_POLYCUSTOM* = 10

const
  CD_PATH_NEW* = 0
  CD_PATH_MOVETO* = 1
  CD_PATH_LINETO* = 2
  CD_PATH_ARC* = 3
  CD_PATH_CURVETO* = 4
  CD_PATH_CLOSE* = 5
  CD_PATH_FILL* = 6
  CD_PATH_STROKE* = 7
  CD_PATH_FILLSTROKE* = 8
  CD_PATH_CLIP* = 9

const
  CD_EVENODD* = 0
  CD_WINDING* = 1

const
  CD_MITER* = 0
  CD_BEVEL* = 1
  CD_ROUND* = 2

const
  CD_CAPFLAT* = 0
  CD_CAPSQUARE* = 1
  CD_CAPROUND* = 2

const
  CD_OPAQUE* = 0
  CD_TRANSPARENT* = 1

const
  CD_REPLACE* = 0
  CD_XOR* = 1
  CD_NOT_XOR* = 2

const
  CD_POLITE* = 0
  CD_FORCE* = 1

const
  CD_CONTINUOUS* = 0
  CD_DASHED* = 1
  CD_DOTTED* = 2
  CD_DASH_DOT* = 3
  CD_DASH_DOT_DOT* = 4
  CD_CUSTOM* = 5

const
  CD_PLUS* = 0
  CD_STAR* = 1
  CD_CIRCLE* = 2
  CD_X* = 3
  CD_BOX* = 4
  CD_DIAMOND* = 5
  CD_HOLLOW_CIRCLE* = 6
  CD_HOLLOW_BOX* = 7
  CD_HOLLOW_DIAMOND* = 8

const
  CD_HORIZONTAL* = 0
  CD_VERTICAL* = 1
  CD_FDIAGONAL* = 2
  CD_BDIAGONAL* = 3
  CD_CROSS* = 4
  CD_DIAGCROSS* = 5

const
  CD_SOLID* = 0
  CD_HATCH* = 1
  CD_STIPPLE* = 2
  CD_PATTERN* = 3
  CD_HOLLOW* = 4
  CD_CUSTOMPATTERN* = 5

const
  CD_NORTH* = 0
  CD_SOUTH* = 1
  CD_EAST* = 2
  CD_WEST* = 3
  CD_NORTH_EAST* = 4
  CD_NORTH_WEST* = 5
  CD_SOUTH_EAST* = 6
  CD_SOUTH_WEST* = 7
  CD_CENTER* = 8
  CD_BASE_LEFT* = 9
  CD_BASE_CENTER* = 10
  CD_BASE_RIGHT* = 11

const
  CD_PLAIN* = 0
  CD_BOLD* = 1
  CD_ITALIC* = 2
  CD_UNDERLINE* = 4
  CD_STRIKEOUT* = 8

const
  CD_BOLD_ITALIC* = (CD_BOLD or CD_ITALIC)

const
  CD_SMALL* = 8
  CD_STANDARD* = 12
  CD_LARGE* = 18

const
  CD_CAP_NONE* = 0x00000000
  CD_CAP_FLUSH* = 0x00000001
  CD_CAP_CLEAR* = 0x00000002
  CD_CAP_PLAY* = 0x00000004
  CD_CAP_YAXIS* = 0x00000008
  CD_CAP_CLIPAREA* = 0x00000010
  CD_CAP_CLIPPOLY* = 0x00000020
  CD_CAP_REGION* = 0x00000040
  CD_CAP_RECT* = 0x00000080
  CD_CAP_CHORD* = 0x00000100
  CD_CAP_IMAGERGB* = 0x00000200
  CD_CAP_IMAGERGBA* = 0x00000400
  CD_CAP_IMAGEMAP* = 0x00000800
  CD_CAP_GETIMAGERGB* = 0x00001000
  CD_CAP_IMAGESRV* = 0x00002000
  CD_CAP_BACKGROUND* = 0x00004000
  CD_CAP_BACKOPACITY* = 0x00008000
  CD_CAP_WRITEMODE* = 0x00010000
  CD_CAP_LINESTYLE* = 0x00020000
  CD_CAP_LINEWITH* = 0x00040000
  CD_CAP_FPRIMTIVES* = 0x00080000
  CD_CAP_HATCH* = 0x00100000
  CD_CAP_STIPPLE* = 0x00200000
  CD_CAP_PATTERN* = 0x00400000
  CD_CAP_FONT* = 0x00800000
  CD_CAP_FONTDIM* = 0x01000000
  CD_CAP_TEXTSIZE* = 0x02000000
  CD_CAP_TEXTORIENTATION* = 0x04000000
  CD_CAP_PALETTE* = 0x08000000
  CD_CAP_LINECAP* = 0x10000000
  CD_CAP_LINEJOIN* = 0x20000000
  CD_CAP_PATH* = 0x40000000
  CD_CAP_BEZIER* = 0x80000000
  CD_CAP_ALL* = 0xFFFFFFFF

const
  CD_CTX_WINDOW* = 0
  CD_CTX_DEVICE* = 1
  CD_CTX_IMAGE* = 2
  CD_CTX_FILE* = 3

const
  CD_SIZECB* = 0

type
  cdSizeCB* = proc (canvas: ptr cdCanvas; w: cint; h: cint; w_mm: cdouble; h_mm: cdouble): cint {.
      cdecl.}

const
  CD_ABORT* = 1
  CD_CONTINUE* = 0
  CD_SIM_NONE* = 0x00000000
  CD_SIM_LINE* = 0x00000001
  CD_SIM_RECT* = 0x00000002
  CD_SIM_BOX* = 0x00000004
  CD_SIM_ARC* = 0x00000008
  CD_SIM_SECTOR* = 0x00000010
  CD_SIM_CHORD* = 0x00000020
  CD_SIM_POLYLINE* = 0x00000040
  CD_SIM_POLYGON* = 0x00000080
  CD_SIM_TEXT* = 0x00000100
  CD_SIM_ALL* = 0x0000FFFF
  CD_SIM_LINES* = (CD_SIM_LINE or CD_SIM_RECT or CD_SIM_ARC or CD_SIM_POLYLINE)
  CD_SIM_FILLS* = (CD_SIM_BOX or CD_SIM_SECTOR or CD_SIM_CHORD or CD_SIM_POLYGON)
  CD_RED* = 0x00FF0000
  CD_DARK_RED* = 0x00800000
  CD_GREEN* = 0x0000FF00
  CD_DARK_GREEN* = 0x00008000
  CD_BLUE* = 0x000000FF
  CD_DARK_BLUE* = 0x00000080
  CD_YELLOW* = 0x00FFFF00
  CD_DARK_YELLOW* = 0x00808000
  CD_MAGENTA* = 0x00FF00FF
  CD_DARK_MAGENTA* = 0x00800080
  CD_CYAN* = 0x0000FFFF
  CD_DARK_CYAN* = 0x00008080
  CD_WHITE* = 0x00FFFFFF
  CD_BLACK* = 0x00000000
  CD_DARK_GRAY* = 0x00808080
  CD_GRAY* = 0x00C0C0C0
  CD_MM2PT* = 2.834645669
  CD_RAD2DEG* = 57.295779513
  CD_DEG2RAD* = 0.01745329252

const
  CD_A0* = 0
  CD_A1* = 1
  CD_A2* = 2
  CD_A3* = 3
  CD_A4* = 4
  CD_A5* = 5
  CD_LETTER* = 6
  CD_LEGAL* = 7

proc cdContextIup*(): ptr cdContext {.cdecl, importc: "cdContextIup", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdContextIupDBuffer*(): ptr cdContext {.cdecl, importc: "cdContextIupDBuffer", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdContextIupDBufferRGB*(): ptr cdContext {.cdecl, importc: "cdContextIupDBufferRGB", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdContextPrinter*(): ptr cdContext {.cdecl, importc: "cdContextPrinter", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdContextImageRGB*(): ptr cdContext {.cdecl, importc: "cdContextImageRGB", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdContextDBufferRGB*(): ptr cdContext {.cdecl, importc: "cdContextDBufferRGB", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdRedImage*(cnv: ptr cdCanvas): ptr cuchar {.cdecl, importc: "cdRedImage", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdGreenImage*(cnv: ptr cdCanvas): ptr cuchar {.cdecl, importc: "cdGreenImage", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdBlueImage*(cnv: ptr cdCanvas): ptr cuchar {.cdecl, importc: "cdBlueImage", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
proc cdAlphaImage*(cnv: ptr cdCanvas): ptr cuchar {.cdecl, importc: "cdAlphaImage", dynlib: libiupcdSONAME, dynlib: libcdSONAME.}
#Lib IUP
const
  IUP_NAME* = "IUP - Portable User Interface"
  IUP_DESCRIPTION* = "Multi-platform Toolkit for Building Graphical User Interfaces"
  IUP_COPYRIGHT* = "Copyright (C) 1994-2019 Tecgraf/PUC-Rio"

type
  Ihandle = object
  PIhandle* = ptr Ihandle

  uptr_t = clong
  sptr_t = clong
  Icallback* = proc (a1: PIhandle): cint {.cdecl.}

proc Open*(argc: var cint; argv: ptr cstringArray): cint {.cdecl, importc: "IupOpen", dynlib: libiupSONAME, discardable.}
proc Close*() {.cdecl, importc: "IupClose", dynlib: libiupSONAME.}
proc ImageLibOpen*() {.cdecl, importc: "IupImageLibOpen", dynlib: libiupimglibSONAME.}
proc MainLoop*(): cint {.cdecl, importc: "IupMainLoop", dynlib: libiupSONAME, discardable.}
proc LoopStep*(): cint {.cdecl, importc: "IupLoopStep", dynlib: libiupSONAME, discardable.}
proc LoopStepWait*(): cint {.cdecl, importc: "IupLoopStepWait", dynlib: libiupSONAME, discardable.}
proc MainLoopLevel*(): cint {.cdecl, importc: "IupMainLoopLevel", dynlib: libiupSONAME, discardable.}
proc Flush*() {.cdecl, importc: "IupFlush", dynlib: libiupSONAME.}
proc ExitLoop*() {.cdecl, importc: "IupExitLoop", dynlib: libiupSONAME.}
proc RecordInput*(filename: cstring; mode: cint): cint {.cdecl, importc: "IupRecordInput", dynlib: libiupSONAME, discardable.}
proc PlayInput*(filename: cstring): cint {.cdecl, importc: "IupPlayInput", dynlib: libiupSONAME, discardable.}
proc Update*(ih: PIhandle) {.cdecl, importc: "IupUpdate", dynlib: libiupSONAME.}
proc UpdateChildren*(ih: PIhandle) {.cdecl, importc: "IupUpdateChildren", dynlib: libiupSONAME.}
proc Redraw*(ih: PIhandle; children: cint) {.cdecl, importc: "IupRedraw", dynlib: libiupSONAME.}
proc Refresh*(ih: PIhandle) {.cdecl, importc: "IupRefresh", dynlib: libiupSONAME.}
proc RefreshChildren*(ih: PIhandle) {.cdecl, importc: "IupRefreshChildren", dynlib: libiupSONAME.}
proc Execute*(filename: cstring; parameters: cstring): cint {.cdecl, importc: "IupExecute", dynlib: libiupSONAME, discardable.}
proc ExecuteWait*(filename: cstring; parameters: cstring): cint {.cdecl, importc: "IupExecuteWait", dynlib: libiupSONAME, discardable.}
proc Help*(url: cstring): cint {.cdecl, importc: "IupHelp", dynlib: libiupSONAME, discardable.}
proc Log*(`type`: cstring; format: cstring) {.varargs, cdecl, importc: "IupLog", dynlib: libiupSONAME.}
proc Load*(filename: cstring): cstring {.cdecl, importc: "IupLoad", dynlib: libiupSONAME.}
proc LoadBuffer*(buffer: cstring): cstring {.cdecl, importc: "IupLoadBuffer", dynlib: libiupSONAME.}
proc Version*(): cstring {.cdecl, importc: "IupVersion", dynlib: libiupSONAME.}
proc VersionDate*(): cstring {.cdecl, importc: "IupVersionDate", dynlib: libiupSONAME.}
proc VersionNumber*(): cint {.cdecl, importc: "IupVersionNumber", dynlib: libiupSONAME, discardable.}
proc SetLanguage*(lng: cstring) {.cdecl, importc: "IupSetLanguage", dynlib: libiupSONAME.}
proc GetLanguage*(): cstring {.cdecl, importc: "IupGetLanguage", dynlib: libiupSONAME.}
proc SetLanguageString*(name: cstring; str: cstring) {.cdecl, importc: "IupSetLanguageString", dynlib: libiupSONAME.}
proc StoreLanguageString*(name: cstring; str: cstring) {.cdecl, importc: "IupStoreLanguageString", dynlib: libiupSONAME.}
proc GetLanguageString*(name: cstring): cstring {.cdecl, importc: "IupGetLanguageString", dynlib: libiupSONAME.}
proc SetLanguagePack*(ih: PIhandle) {.cdecl, importc: "IupSetLanguagePack", dynlib: libiupSONAME.}
proc Destroy*(ih: PIhandle) {.cdecl, importc: "IupDestroy", dynlib: libiupSONAME.}
proc Detach*(child: PIhandle) {.cdecl, importc: "IupDetach", dynlib: libiupSONAME.}
proc Append*(ih: PIhandle; child: PIhandle): PIhandle {.cdecl, importc: "IupAppend", dynlib: libiupSONAME.}
proc Insert*(ih: PIhandle; ref_child: PIhandle; child: PIhandle): PIhandle {. cdecl, importc: "IupInsert", dynlib: libiupSONAME.}
proc GetChild*(ih: PIhandle; pos: cint): PIhandle {.cdecl, importc: "IupGetChild", dynlib: libiupSONAME.}
proc GetChildPos*(ih: PIhandle; child: PIhandle): cint {.cdecl, importc: "IupGetChildPos", dynlib: libiupSONAME, discardable.}
proc GetChildCount*(ih: PIhandle): cint {.cdecl, importc: "IupGetChildCount", dynlib: libiupSONAME, discardable.}
proc GetNextChild*(ih: PIhandle; child: PIhandle): PIhandle {.cdecl, importc: "IupGetNextChild", dynlib: libiupSONAME.}
proc GetBrother*(ih: PIhandle): PIhandle {.cdecl, importc: "IupGetBrother", dynlib: libiupSONAME.}
proc GetParent*(ih: PIhandle): PIhandle {.cdecl, importc: "IupGetParent", dynlib: libiupSONAME.}
proc GetDialog*(ih: PIhandle): PIhandle {.cdecl, importc: "IupGetDialog", dynlib: libiupSONAME.}
proc GetDialogChild*(ih: PIhandle; name: cstring): PIhandle {.cdecl, importc: "IupGetDialogChild", dynlib: libiupSONAME.}
proc Reparent*(ih: PIhandle; new_parent: PIhandle; ref_child: PIhandle): cint {. cdecl, importc: "IupReparent", dynlib: libiupSONAME, discardable.}
proc Popup*(ih: PIhandle; x: cint; y: cint): cint {.cdecl, importc: "IupPopup", dynlib: libiupSONAME, discardable.}
proc Show*(ih: PIhandle): cint {.cdecl, importc: "IupShow", dynlib: libiupSONAME, discardable.}
proc ShowXY*(ih: PIhandle; x: cint; y: cint): cint {.cdecl, importc: "IupShowXY", dynlib: libiupSONAME, discardable.}
proc Hide*(ih: PIhandle): cint {.cdecl, importc: "IupHide", dynlib: libiupSONAME, discardable.}
proc Map*(ih: PIhandle): cint {.cdecl, importc: "IupMap", dynlib: libiupSONAME, discardable.}
proc Unmap*(ih: PIhandle) {.cdecl, importc: "IupUnmap", dynlib: libiupSONAME.}
proc ResetAttribute*(ih: PIhandle; name: cstring) {.cdecl, importc: "IupResetAttribute", dynlib: libiupSONAME.}
proc GetAllAttributes*(ih: PIhandle; names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllAttributes", dynlib: libiupSONAME, discardable.}
proc CopyAttributes*(src_ih: PIhandle; dst_ih: PIhandle) {.cdecl, importc: "IupCopyAttributes", dynlib: libiupSONAME.}
proc SetAtt*(handle_name: cstring; ih: PIhandle; name: cstring): PIhandle {.varargs, cdecl, importc: "IupSetAtt", dynlib: libiupSONAME.}
proc SetAttributes*(ih: PIhandle; str: cstring): PIhandle {.cdecl, importc: "IupSetAttributes", dynlib: libiupSONAME, discardable.}
proc GetAttributes*(ih: PIhandle): cstring {.cdecl, importc: "IupGetAttributes", dynlib: libiupSONAME.}
proc SetAttribute*(ih: PIhandle; name: cstring; value: cstring) {.cdecl, importc: "IupSetAttribute", dynlib: libiupSONAME.}
proc SetStrAttribute*(ih: PIhandle; name: cstring; value: cstring) {.cdecl, importc: "IupSetStrAttribute", dynlib: libiupSONAME.}
proc SetStrf*(ih: PIhandle; name: cstring; format: cstring) {.varargs, cdecl, importc: "IupSetStrf", dynlib: libiupSONAME.}
proc SetInt*(ih: PIhandle; name: cstring; value: cint) {.cdecl, importc: "IupSetInt", dynlib: libiupSONAME.}
proc SetFloat*(ih: PIhandle; name: cstring; value: cfloat) {.cdecl, importc: "IupSetFloat", dynlib: libiupSONAME.}
proc SetDouble*(ih: PIhandle; name: cstring; value: cdouble) {.cdecl, importc: "IupSetDouble", dynlib: libiupSONAME.}
proc SetRGB*(ih: PIhandle; name: cstring; r: cuchar; g: cuchar; b: cuchar) {.cdecl, importc: "IupSetRGB", dynlib: libiupSONAME.}
proc GetAttribute*(ih: PIhandle; name: cstring): cstring {.cdecl, importc: "IupGetAttribute", dynlib: libiupSONAME.}
proc GetInt*(ih: PIhandle; name: cstring): cint {.cdecl, importc: "IupGetInt", dynlib: libiupSONAME, discardable.}
proc GetInt2*(ih: PIhandle; name: cstring): cint {.cdecl, importc: "IupGetInt2", dynlib: libiupSONAME, discardable.}
proc GetIntInt*(ih: PIhandle; name: cstring; i1: var cint; i2: var cint): cint {.cdecl, importc: "IupGetIntInt", dynlib: libiupSONAME, discardable.}
proc GetFloat*(ih: PIhandle; name: cstring): cfloat {.cdecl, importc: "IupGetFloat", dynlib: libiupSONAME.}
proc GetDouble*(ih: PIhandle; name: cstring): cdouble {.cdecl, importc: "IupGetDouble", dynlib: libiupSONAME.}
proc GetRGB*(ih: PIhandle; name: cstring; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar) {. cdecl, importc: "IupGetRGB", dynlib: libiupSONAME.}
proc SetAttributeId*(ih: PIhandle; name: cstring; id: cint; value: cstring) {.cdecl, importc: "IupSetAttributeId", dynlib: libiupSONAME.}
proc SetStrAttributeId*(ih: PIhandle; name: cstring; id: cint; value: cstring) {.cdecl, importc: "IupSetStrAttributeId", dynlib: libiupSONAME.}
proc SetStrfId*(ih: PIhandle; name: cstring; id: cint; format: cstring) {.varargs, cdecl, importc: "IupSetStrfId", dynlib: libiupSONAME.}
proc SetIntId*(ih: PIhandle; name: cstring; id: cint; value: cint) {.cdecl, importc: "IupSetIntId", dynlib: libiupSONAME.}
proc SetFloatId*(ih: PIhandle; name: cstring; id: cint; value: cfloat) {.cdecl, importc: "IupSetFloatId", dynlib: libiupSONAME.}
proc SetDoubleId*(ih: PIhandle; name: cstring; id: cint; value: cdouble) {.cdecl, importc: "IupSetDoubleId", dynlib: libiupSONAME.}
proc SetRGBId*(ih: PIhandle; name: cstring; id: cint; r: cuchar; g: cuchar; b: cuchar) {. cdecl, importc: "IupSetRGBId", dynlib: libiupSONAME.}
proc GetAttributeId*(ih: PIhandle; name: cstring; id: cint): cstring {.cdecl, importc: "IupGetAttributeId", dynlib: libiupSONAME.}
proc GetIntId*(ih: PIhandle; name: cstring; id: cint): cint {.cdecl, importc: "IupGetIntId", dynlib: libiupSONAME, discardable.}
proc GetFloatId*(ih: PIhandle; name: cstring; id: cint): cfloat {.cdecl, importc: "IupGetFloatId", dynlib: libiupSONAME.}
proc GetDoubleId*(ih: PIhandle; name: cstring; id: cint): cdouble {.cdecl, importc: "IupGetDoubleId", dynlib: libiupSONAME.}
proc GetRGBId*(ih: PIhandle; name: cstring; id: cint; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar) {.cdecl, importc: "IupGetRGBId", dynlib: libiupSONAME.}
proc SetAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cstring) {. cdecl, importc: "IupSetAttributeId2", dynlib: libiupSONAME.}
proc SetStrAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cstring) {.cdecl, importc: "IupSetStrAttributeId2", dynlib: libiupSONAME.}
proc SetStrfId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; format: cstring) {. varargs, cdecl, importc: "IupSetStrfId2", dynlib: libiupSONAME.}
proc SetIntId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cint) {.cdecl, importc: "IupSetIntId2", dynlib: libiupSONAME.}
proc SetFloatId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cfloat) {. cdecl, importc: "IupSetFloatId2", dynlib: libiupSONAME.}
proc SetDoubleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cdouble) {. cdecl, importc: "IupSetDoubleId2", dynlib: libiupSONAME.}
proc SetRGBId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; r: cuchar; g: cuchar; b: cuchar) {.cdecl, importc: "IupSetRGBId2", dynlib: libiupSONAME.}
proc GetAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cstring {. cdecl, importc: "IupGetAttributeId2", dynlib: libiupSONAME.}
proc GetIntId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cint {.cdecl, importc: "IupGetIntId2", dynlib: libiupSONAME, discardable.}
proc GetFloatId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cfloat {.cdecl, importc: "IupGetFloatId2", dynlib: libiupSONAME.}
proc GetDoubleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cdouble {.cdecl, importc: "IupGetDoubleId2", dynlib: libiupSONAME.}
proc GetRGBId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar) {.cdecl, importc: "IupGetRGBId2", dynlib: libiupSONAME.}
proc SetGlobal*(name: cstring; value: cstring) {.cdecl, importc: "IupSetGlobal", dynlib: libiupSONAME.}
proc SetStrGlobal*(name: cstring; value: cstring) {.cdecl, importc: "IupSetStrGlobal", dynlib: libiupSONAME.}
proc GetGlobal*(name: cstring): cstring {.cdecl, importc: "IupGetGlobal", dynlib: libiupSONAME.}
proc SetFocus*(ih: PIhandle): PIhandle {.cdecl, importc: "IupSetFocus", dynlib: libiupSONAME, discardable.}
proc GetFocus*(): PIhandle {.cdecl, importc: "IupGetFocus", dynlib: libiupSONAME.}
proc PreviousField*(ih: PIhandle): PIhandle {.cdecl, importc: "IupPreviousField", dynlib: libiupSONAME.}
proc NextField*(ih: PIhandle): PIhandle {.cdecl, importc: "IupNextField", dynlib: libiupSONAME.}
proc GetCallback*(ih: PIhandle; name: cstring): Icallback {.cdecl, importc: "IupGetCallback", dynlib: libiupSONAME.}
proc SetCallback*(ih: PIhandle; name: cstring; `func`: Icallback): Icallback {.cdecl, importc: "IupSetCallback", dynlib: libiupSONAME, discardable.}
proc SetCallbacks*(ih: PIhandle; name: cstring; `func`: Icallback): PIhandle {. varargs, cdecl, importc: "IupSetCallbacks", dynlib: libiupSONAME, discardable.}
proc GetFunction*(name: cstring): Icallback {.cdecl, importc: "IupGetFunction", dynlib: libiupSONAME.}
proc SetFunction*(name: cstring; `func`: Icallback): Icallback {.cdecl, importc: "IupSetFunction", dynlib: libiupSONAME.}
proc GetHandle*(name: cstring): PIhandle {.cdecl, importc: "IupGetHandle", dynlib: libiupSONAME.}
proc SetHandle*(name: cstring; ih: PIhandle): PIhandle {.cdecl, importc: "IupSetHandle", dynlib: libiupSONAME, discardable.}
proc GetAllNames*(names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllNames", dynlib: libiupSONAME, discardable.}
proc GetAllDialogs*(names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllDialogs", dynlib: libiupSONAME, discardable.}
proc GetName*(ih: PIhandle): cstring {.cdecl, importc: "IupGetName", dynlib: libiupSONAME.}
proc SetAttributeHandle*(ih: PIhandle; name: cstring; ih_named: PIhandle) {.cdecl, importc: "IupSetAttributeHandle", dynlib: libiupSONAME.}
proc GetAttributeHandle*(ih: PIhandle; name: cstring): PIhandle {.cdecl, importc: "IupGetAttributeHandle", dynlib: libiupSONAME.}
proc SetAttributeHandleId*(ih: PIhandle; name: cstring; id: cint; ih_named: PIhandle) {.cdecl, importc: "IupSetAttributeHandleId", dynlib: libiupSONAME.}
proc GetAttributeHandleId*(ih: PIhandle; name: cstring; id: cint): PIhandle {.cdecl, importc: "IupGetAttributeHandleId", dynlib: libiupSONAME.}
proc SetAttributeHandleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; ih_named: PIhandle) {.cdecl, importc: "IupSetAttributeHandleId2", dynlib: libiupSONAME.}
proc GetAttributeHandleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): PIhandle {. cdecl, importc: "IupGetAttributeHandleId2", dynlib: libiupSONAME.}
proc GetClassName*(ih: PIhandle): cstring {.cdecl, importc: "IupGetClassName", dynlib: libiupSONAME.}
proc GetClassType*(ih: PIhandle): cstring {.cdecl, importc: "IupGetClassType", dynlib: libiupSONAME.}
proc GetAllClasses*(names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllClasses", dynlib: libiupSONAME, discardable.}
proc GetClassAttributes*(classname: cstring; names: cstringArray; n: cint): cint {. cdecl, importc: "IupGetClassAttributes", dynlib: libiupSONAME, discardable.}
proc GetClassCallbacks*(classname: cstring; names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetClassCallbacks", dynlib: libiupSONAME, discardable.}
proc SaveClassAttributes*(ih: PIhandle) {.cdecl, importc: "IupSaveClassAttributes", dynlib: libiupSONAME.}
proc CopyClassAttributes*(src_ih: PIhandle; dst_ih: PIhandle) {.cdecl, importc: "IupCopyClassAttributes", dynlib: libiupSONAME.}
proc SetClassDefaultAttribute*(classname: cstring; name: cstring; value: cstring) {. cdecl, importc: "IupSetClassDefaultAttribute", dynlib: libiupSONAME.}
proc ClassMatch*(ih: PIhandle; classname: cstring): cint {.cdecl, importc: "IupClassMatch", dynlib: libiupSONAME, discardable.}
proc Create*(classname: cstring): PIhandle {.cdecl, importc: "IupCreate", dynlib: libiupSONAME.}
proc Createv*(classname: cstring; params: ptr pointer): PIhandle {.cdecl, importc: "IupCreatev", dynlib: libiupSONAME.}
proc Createp*(classname: cstring; first: pointer): PIhandle {.varargs, cdecl, importc: "IupCreatep", dynlib: libiupSONAME.}
proc Fill*(): PIhandle {.cdecl, importc: "IupFill", dynlib: libiupSONAME.}
proc Space*(): PIhandle {.cdecl, importc: "IupSpace", dynlib: libiupSONAME.}
proc Radio*(child: PIhandle): PIhandle {.cdecl, importc: "IupRadio", dynlib: libiupSONAME.}
proc Vbox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupVbox", dynlib: libiupSONAME.}
proc Vboxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupVboxv", dynlib: libiupSONAME.}
proc Zbox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupZbox", dynlib: libiupSONAME.}
proc Zboxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupZboxv", dynlib: libiupSONAME.}
proc Hbox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupHbox", dynlib: libiupSONAME.}
proc Hboxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupHboxv", dynlib: libiupSONAME.}
proc Normalizer*(ih_first: PIhandle): PIhandle {.varargs, cdecl, importc: "IupNormalizer", dynlib: libiupSONAME.}
proc Normalizerv*(ih_list: ptr PIhandle): PIhandle {.cdecl, importc: "IupNormalizerv", dynlib: libiupSONAME.}
proc Cbox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupCbox", dynlib: libiupSONAME.}
proc Cboxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupCboxv", dynlib: libiupSONAME.}
proc Sbox*(child: PIhandle): PIhandle {.cdecl, importc: "IupSbox", dynlib: libiupSONAME.}
proc Split*(child1: PIhandle; child2: PIhandle): PIhandle {.cdecl, importc: "IupSplit", dynlib: libiupSONAME.}
proc ScrollBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupScrollBox", dynlib: libiupSONAME.}
proc FlatScrollBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupFlatScrollBox", dynlib: libiupSONAME.}
proc GridBox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupGridBox", dynlib: libiupSONAME.}
proc GridBoxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupGridBoxv", dynlib: libiupSONAME.}
proc MultiBox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupMultiBox", dynlib: libiupSONAME.}
proc MultiBoxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupMultiBoxv", dynlib: libiupSONAME.}
proc Expander*(child: PIhandle): PIhandle {.cdecl, importc: "IupExpander", dynlib: libiupSONAME.}
proc DetachBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupDetachBox", dynlib: libiupSONAME.}
proc BackgroundBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupBackgroundBox", dynlib: libiupSONAME.}
proc Frame*(child: PIhandle): PIhandle {.cdecl, importc: "IupFrame", dynlib: libiupSONAME.}
proc FlatFrame*(child: PIhandle): PIhandle {.cdecl, importc: "IupFlatFrame", dynlib: libiupSONAME.}
proc Image*(width: cint; height: cint; pixmap: ptr cuchar): PIhandle {.cdecl, importc: "IupImage", dynlib: libiupSONAME.}
proc ImageRGB*(width: cint; height: cint; pixmap: ptr cuchar): PIhandle {.cdecl, importc: "IupImageRGB", dynlib: libiupSONAME.}
proc ImageRGBA*(width: cint; height: cint; pixmap: ptr cuchar): PIhandle {.cdecl, importc: "IupImageRGBA", dynlib: libiupSONAME.}
proc Item*(title: cstring; action: cstring): PIhandle {.cdecl, importc: "IupItem", dynlib: libiupSONAME.}
proc Submenu*(title: cstring; child: PIhandle): PIhandle {.cdecl, importc: "IupSubmenu", dynlib: libiupSONAME.}
proc Separator*(): PIhandle {.cdecl, importc: "IupSeparator", dynlib: libiupSONAME.}
proc Menu*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupMenu", dynlib: libiupSONAME.}
proc Menuv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupMenuv", dynlib: libiupSONAME.}
proc Button*(title: cstring; action: cstring): PIhandle {.cdecl, importc: "IupButton", dynlib: libiupSONAME.}
proc FlatButton*(title: cstring): PIhandle {.cdecl, importc: "IupFlatButton", dynlib: libiupSONAME.}
proc FlatToggle*(title: cstring): PIhandle {.cdecl, importc: "IupFlatToggle", dynlib: libiupSONAME.}
proc DropButton*(dropchild: PIhandle): PIhandle {.cdecl, importc: "IupDropButton", dynlib: libiupSONAME.}
proc FlatLabel*(title: cstring): PIhandle {.cdecl, importc: "IupFlatLabel", dynlib: libiupSONAME.}
proc FlatSeparator*(): PIhandle {.cdecl, importc: "IupFlatSeparator", dynlib: libiupSONAME.}
proc Canvas*(action: cstring): PIhandle {.cdecl, importc: "IupCanvas", dynlib: libiupSONAME.}
proc Dialog*(child: PIhandle): PIhandle {.cdecl, importc: "IupDialog", dynlib: libiupSONAME.}
proc User*(): PIhandle {.cdecl, importc: "IupUser", dynlib: libiupSONAME.}
proc Label*(title: cstring): PIhandle {.cdecl, importc: "IupLabel", dynlib: libiupSONAME.}
proc List*(action: cstring): PIhandle {.cdecl, importc: "IupList", dynlib: libiupSONAME.}
proc FlatList*(): PIhandle {.cdecl, importc: "IupFlatList", dynlib: libiupSONAME.}
proc Text*(action: cstring): PIhandle {.cdecl, importc: "IupText", dynlib: libiupSONAME.}
proc MultiLine*(action: cstring): PIhandle {.cdecl, importc: "IupMultiLine", dynlib: libiupSONAME.}
proc Toggle*(title: cstring; action: cstring): PIhandle {.cdecl, importc: "IupToggle", dynlib: libiupSONAME.}
proc Timer*(): PIhandle {.cdecl, importc: "IupTimer", dynlib: libiupSONAME.}
proc Clipboard*(): PIhandle {.cdecl, importc: "IupClipboard", dynlib: libiupSONAME.}
proc ProgressBar*(): PIhandle {.cdecl, importc: "IupProgressBar", dynlib: libiupSONAME.}
proc Val*(`type`: cstring): PIhandle {.cdecl, importc: "IupVal", dynlib: libiupSONAME.}
proc Tabs*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupTabs", dynlib: libiupSONAME.}
proc Tabsv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupTabsv", dynlib: libiupSONAME.}
proc FlatTabs*(first: PIhandle): PIhandle {.varargs, cdecl, importc: "IupFlatTabs", dynlib: libiupSONAME.}
proc FlatTabsv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupFlatTabsv", dynlib: libiupSONAME.}
proc Tree*(): PIhandle {.cdecl, importc: "IupTree", dynlib: libiupSONAME.}
proc Link*(url: cstring; title: cstring): PIhandle {.cdecl, importc: "IupLink", dynlib: libiupSONAME.}
proc AnimatedLabel*(animation: PIhandle): PIhandle {.cdecl, importc: "IupAnimatedLabel", dynlib: libiupSONAME.}
proc DatePick*(): PIhandle {.cdecl, importc: "IupDatePick", dynlib: libiupSONAME.}
proc Calendar*(): PIhandle {.cdecl, importc: "IupCalendar", dynlib: libiupSONAME.}
proc Colorbar*(): PIhandle {.cdecl, importc: "IupColorbar", dynlib: libiupSONAME.}
proc Gauge*(): PIhandle {.cdecl, importc: "IupGauge", dynlib: libiupSONAME.}
proc Dial*(`type`: cstring): PIhandle {.cdecl, importc: "IupDial", dynlib: libiupSONAME.}
proc ColorBrowser*(): PIhandle {.cdecl, importc: "IupColorBrowser", dynlib: libiupSONAME.}
proc Spin*(): PIhandle {.cdecl, importc: "IupSpin", dynlib: libiupSONAME.}
proc Spinbox*(child: PIhandle): PIhandle {.cdecl, importc: "IupSpinbox", dynlib: libiupSONAME.}
proc StringCompare*(str1: cstring; str2: cstring; casesensitive: cint; lexicographic: cint): cint {.cdecl, importc: "IupStringCompare", dynlib: libiupSONAME, discardable.}
proc SaveImageAsText*(ih: PIhandle; file_name: cstring; format: cstring; name: cstring): cint {.cdecl, importc: "IupSaveImageAsText", dynlib: libiupimSONAME, discardable.}
proc TextConvertLinColToPos*(ih: PIhandle; lin: cint; col: cint; pos: var cint) {.cdecl, importc: "IupTextConvertLinColToPos", dynlib: libiupSONAME.}
proc TextConvertPosToLinCol*(ih: PIhandle; pos: cint; lin: var cint; col: var cint) {. cdecl, importc: "IupTextConvertPosToLinCol", dynlib: libiupSONAME.}
proc ConvertXYToPos*(ih: PIhandle; x: cint; y: cint): cint {.cdecl, importc: "IupConvertXYToPos", dynlib: libiupSONAME, discardable.}
proc StoreGlobal*(name: cstring; value: cstring) {.cdecl, importc: "IupStoreGlobal", dynlib: libiupSONAME.}
proc StoreAttribute*(ih: PIhandle; name: cstring; value: cstring) {.cdecl, importc: "IupStoreAttribute", dynlib: libiupSONAME.}
proc SetfAttribute*(ih: PIhandle; name: cstring; format: cstring) {.varargs, cdecl, importc: "IupSetfAttribute", dynlib: libiupSONAME.}
proc StoreAttributeId*(ih: PIhandle; name: cstring; id: cint; value: cstring) {.cdecl, importc: "IupStoreAttributeId", dynlib: libiupSONAME.}
proc SetfAttributeId*(ih: PIhandle; name: cstring; id: cint; f: cstring) {.varargs, cdecl, importc: "IupSetfAttributeId", dynlib: libiupSONAME.}
proc StoreAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cstring) {.cdecl, importc: "IupStoreAttributeId2", dynlib: libiupSONAME.}
proc SetfAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; format: cstring) {.varargs, cdecl, importc: "IupSetfAttributeId2", dynlib: libiupSONAME.}
proc TreeSetUserId*(ih: PIhandle; id: cint; userid: pointer): cint {.cdecl, importc: "IupTreeSetUserId", dynlib: libiupSONAME, discardable.}
proc TreeGetUserId*(ih: PIhandle; id: cint): pointer {.cdecl, importc: "IupTreeGetUserId", dynlib: libiupSONAME.}
proc TreeGetId*(ih: PIhandle; userid: pointer): cint {.cdecl, importc: "IupTreeGetId", dynlib: libiupSONAME, discardable.}
proc TreeSetAttributeHandle*(ih: PIhandle; name: cstring; id: cint; ih_named: PIhandle) {.cdecl, importc: "IupTreeSetAttributeHandle", dynlib: libiupSONAME.}
proc FileDlg*(): PIhandle {.cdecl, importc: "IupFileDlg", dynlib: libiupSONAME.}
proc MessageDlg*(): PIhandle {.cdecl, importc: "IupMessageDlg", dynlib: libiupSONAME.}
proc ColorDlg*(): PIhandle {.cdecl, importc: "IupColorDlg", dynlib: libiupSONAME.}
proc FontDlg*(): PIhandle {.cdecl, importc: "IupFontDlg", dynlib: libiupSONAME.}
proc ProgressDlg*(): PIhandle {.cdecl, importc: "IupProgressDlg", dynlib: libiupSONAME.}
proc GetFile*(arq: cstring): cint {.cdecl, importc: "IupGetFile", dynlib: libiupSONAME, discardable.}
proc Message*(title: cstring; msg: cstring) {.cdecl, importc: "IupMessage", dynlib: libiupSONAME.}
proc Messagef*(title: cstring; format: cstring) {.varargs, cdecl, importc: "IupMessagef", dynlib: libiupSONAME.}
proc MessageError*(parent: PIhandle; message: cstring) {.cdecl, importc: "IupMessageError", dynlib: libiupSONAME.}
proc MessageAlarm*(parent: PIhandle; title: cstring; message: cstring; buttons: cstring): cint {.cdecl, importc: "IupMessageAlarm", dynlib: libiupSONAME, discardable.}
proc Alarm*(title: cstring; msg: cstring; b1: cstring; b2: cstring; b3: cstring): cint {. cdecl, importc: "IupAlarm", dynlib: libiupSONAME, discardable.}
proc Scanf*(format: cstring): cint {.varargs, cdecl, importc: "IupScanf", dynlib: libiupSONAME, discardable.}
proc ListDialog*(`type`: cint; title: cstring; size: cint; list: cstringArray; op: cint; max_col: cint; max_lin: cint; marks: var cint): cint {.cdecl, importc: "IupListDialog", dynlib: libiupSONAME, discardable.}
proc GetText*(title: cstring; text: cstring; maxsize: cint): cint {.cdecl, importc: "IupGetText", dynlib: libiupSONAME, discardable.}
proc GetColor*(x: cint; y: cint; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar): cint {.cdecl, importc: "IupGetColor", dynlib: libiupSONAME, discardable.}
type
  Iparamcb* = proc (dialog: PIhandle; param_index: cint; user_data: pointer): cint {.
      cdecl.}

proc GetParam*(title: cstring; action: Iparamcb; user_data: pointer; format: cstring): cint {. varargs, cdecl, importc: "IupGetParam", dynlib: libiupSONAME, discardable.}
proc GetParamv*(title: cstring; action: Iparamcb; user_data: pointer; format: cstring; param_count: cint; param_extra: cint; param_data: ptr pointer): cint {. cdecl, importc: "IupGetParamv", dynlib: libiupSONAME, discardable.}
proc Param*(format: cstring): PIhandle {.cdecl, importc: "IupParam", dynlib: libiupSONAME.}
proc ParamBox*(param: PIhandle): PIhandle {.varargs, cdecl, importc: "IupParamBox", dynlib: libiupSONAME.}
proc ParamBoxv*(param_array: ptr PIhandle): PIhandle {.cdecl, importc: "IupParamBoxv", dynlib: libiupSONAME.}
proc LayoutDialog*(dialog: PIhandle): PIhandle {.cdecl, importc: "IupLayoutDialog", dynlib: libiupSONAME.}
proc ElementPropertiesDialog*(elem: PIhandle): PIhandle {.cdecl, importc: "IupElementPropertiesDialog", dynlib: libiupSONAME.}
proc GlobalsDialog*(): PIhandle {.cdecl, importc: "IupGlobalsDialog", dynlib: libiupSONAME.}
const
  IUP_ERROR* = 1
  IUP_NOERROR* = 0
  IUP_OPENED* = -1
  IUP_INVALID* = -1
  IUP_INVALID_ID* = -10
  IUP_IGNORE* = -1
  IUP_DEFAULT* = -2
  IUP_CLOSE* = -3
  IUP_CONTINUE* = -4
  IUP_CENTER* = cint(0x0000FFFF)
  IUP_LEFT* = cint(0x0000FFFE)
  IUP_RIGHT* = cint(0x0000FFFD)
  IUP_MOUSEPOS* = cint(0x0000FFFC)
  IUP_CURRENT* = cint(0x0000FFFB)
  IUP_CENTERPARENT* = cint(0x0000FFFA)
  IUP_TOP* = IUP_LEFT
  IUP_BOTTOM* = IUP_RIGHT

const
  IUP_SHOW* = 0
  IUP_RESTORE* = 1
  IUP_MINIMIZE* = 2
  IUP_MAXIMIZE* = 3
  IUP_HIDE* = 4

const
  IUP_SBUP* = 0
  IUP_SBDN* = 1
  IUP_SBPGUP* = 2
  IUP_SBPGDN* = 3
  IUP_SBPOSV* = 4
  IUP_SBDRAGV* = 5
  IUP_SBLEFT* = 6
  IUP_SBRIGHT* = 7
  IUP_SBPGLEFT* = 8
  IUP_SBPGRIGHT* = 9
  IUP_SBPOSH* = 10
  IUP_SBDRAGH* = 11

const
  IUP_BUTTON1* = '1'
  IUP_BUTTON2* = '2'
  IUP_BUTTON3* = '3'
  IUP_BUTTON4* = '4'
  IUP_BUTTON5* = '5'

template iup_isshift*(Xs: untyped): untyped =
  (Xs[0] == 'S')

template iup_iscontrol*(Xs: untyped): untyped =
  (Xs[1] == 'C')

template iup_isbutton1*(Xs: untyped): untyped =
  (Xs[2] == '1')

template iup_isbutton2*(Xs: untyped): untyped =
  (Xs[3] == '2')

template iup_isbutton3*(Xs: untyped): untyped =
  (Xs[4] == '3')

template iup_isdouble*(Xs: untyped): untyped =
  (Xs[5] == 'D')

template iup_isalt*(Xs: untyped): untyped =
  (Xs[6] == 'A')

template iup_issys*(Xs: untyped): untyped =
  (Xs[7] == 'Y')

template iup_isbutton4*(Xs: untyped): untyped =
  (Xs[8] == '4')

template iup_isbutton5*(Xs: untyped): untyped =
  (Xs[9] == '5')

const
  isshift* = iup_isshift
  iscontrol* = iup_iscontrol
  isbutton1* = iup_isbutton1
  isbutton2* = iup_isbutton2
  isbutton3* = iup_isbutton3
  isdouble* = iup_isdouble
  isalt* = iup_isalt
  issys* = iup_issys
  isbutton4* = iup_isbutton4
  isbutton5* = iup_isbutton5
  IUP_MASK_FLOAT* = "[+/-]?(/d+/.?/d*|/./d+)"
  IUP_MASK_UFLOAT* = "(/d+/.?/d*|/./d+)"
  IUP_MASK_EFLOAT* = "[+/-]?(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?"
  IUP_MASK_UEFLOAT* = "(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?"
  IUP_MASK_FLOATCOMMA* = "[+/-]?(/d+/,?/d*|/,/d+)"
  IUP_MASK_UFLOATCOMMA* = "(/d+/,?/d*|/,/d+)"
  IUP_MASK_INT* = "[+/-]?/d+"
  IUP_MASK_UINT* = "/d+"
  IUP_GETPARAM_BUTTON1* = -1
  IUP_GETPARAM_INIT* = -2
  IUP_GETPARAM_BUTTON2* = -3
  IUP_GETPARAM_BUTTON3* = -4
  IUP_GETPARAM_CLOSE* = -5
  IUP_GETPARAM_MAP* = -6
  IUP_GETPARAM_OK* = IUP_GETPARAM_BUTTON1
  IUP_GETPARAM_CANCEL* = IUP_GETPARAM_BUTTON2
  IUP_GETPARAM_HELP* = IUP_GETPARAM_BUTTON3
  IUP_PRIMARY* = -1
  IUP_SECONDARY* = -2

const
  IUP_RECBINARY* = 0
  IUP_RECTEXT* = 1

const
  IUP_CONFIG_H* = true

proc Config*(): PIhandle {.cdecl, importc: "IupConfig", dynlib: libiupSONAME.}
proc ConfigLoad*(ih: PIhandle): cint {.cdecl, importc: "IupConfigLoad", dynlib: libiupSONAME, discardable.}
proc ConfigSave*(ih: PIhandle): cint {.cdecl, importc: "IupConfigSave", dynlib: libiupSONAME, discardable.}
proc ConfigSetVariableStr*(ih: PIhandle; group: cstring; key: cstring; value: cstring) {. cdecl, importc: "IupConfigSetVariableStr", dynlib: libiupSONAME.}
proc ConfigSetVariableStrId*(ih: PIhandle; group: cstring; key: cstring; id: cint; value: cstring) {.cdecl, importc: "IupConfigSetVariableStrId", dynlib: libiupSONAME.}
proc ConfigSetVariableInt*(ih: PIhandle; group: cstring; key: cstring; value: cint) {. cdecl, importc: "IupConfigSetVariableInt", dynlib: libiupSONAME.}
proc ConfigSetVariableIntId*(ih: PIhandle; group: cstring; key: cstring; id: cint; value: cint) {.cdecl, importc: "IupConfigSetVariableIntId", dynlib: libiupSONAME.}
proc ConfigSetVariableDouble*(ih: PIhandle; group: cstring; key: cstring; value: cdouble) {.cdecl, importc: "IupConfigSetVariableDouble", dynlib: libiupSONAME.}
proc ConfigSetVariableDoubleId*(ih: PIhandle; group: cstring; key: cstring; id: cint; value: cdouble) {.cdecl, importc: "IupConfigSetVariableDoubleId", dynlib: libiupSONAME.}
proc ConfigGetVariableStr*(ih: PIhandle; group: cstring; key: cstring): cstring {. cdecl, importc: "IupConfigGetVariableStr", dynlib: libiupSONAME.}
proc ConfigGetVariableStrId*(ih: PIhandle; group: cstring; key: cstring; id: cint): cstring {. cdecl, importc: "IupConfigGetVariableStrId", dynlib: libiupSONAME.}
proc ConfigGetVariableInt*(ih: PIhandle; group: cstring; key: cstring): cint {.cdecl, importc: "IupConfigGetVariableInt", dynlib: libiupSONAME, discardable.}
proc ConfigGetVariableIntId*(ih: PIhandle; group: cstring; key: cstring; id: cint): cint {. cdecl, importc: "IupConfigGetVariableIntId", dynlib: libiupSONAME, discardable.}
proc ConfigGetVariableDouble*(ih: PIhandle; group: cstring; key: cstring): cdouble {. cdecl, importc: "IupConfigGetVariableDouble", dynlib: libiupSONAME.}
proc ConfigGetVariableDoubleId*(ih: PIhandle; group: cstring; key: cstring; id: cint): cdouble {. cdecl, importc: "IupConfigGetVariableDoubleId", dynlib: libiupSONAME.}
proc ConfigGetVariableStrDef*(ih: PIhandle; group: cstring; key: cstring; def: cstring): cstring {.cdecl, importc: "IupConfigGetVariableStrDef", dynlib: libiupSONAME.}
proc ConfigGetVariableStrIdDef*(ih: PIhandle; group: cstring; key: cstring; id: cint; def: cstring): cstring {.cdecl, importc: "IupConfigGetVariableStrIdDef", dynlib: libiupSONAME.}
proc ConfigGetVariableIntDef*(ih: PIhandle; group: cstring; key: cstring; def: cint): cint {. cdecl, importc: "IupConfigGetVariableIntDef", dynlib: libiupSONAME, discardable.}
proc ConfigGetVariableIntIdDef*(ih: PIhandle; group: cstring; key: cstring; id: cint; def: cint): cint {.cdecl, importc: "IupConfigGetVariableIntIdDef", dynlib: libiupSONAME, discardable.}
proc ConfigGetVariableDoubleDef*(ih: PIhandle; group: cstring; key: cstring; def: cdouble): cdouble {.cdecl, importc: "IupConfigGetVariableDoubleDef", dynlib: libiupSONAME.}
proc ConfigGetVariableDoubleIdDef*(ih: PIhandle; group: cstring; key: cstring; id: cint; def: cdouble): cdouble {.cdecl, importc: "IupConfigGetVariableDoubleIdDef", dynlib: libiupSONAME.}
proc ConfigCopy*(ih1: PIhandle; ih2: PIhandle; exclude_prefix: cstring) {.cdecl, importc: "IupConfigCopy", dynlib: libiupSONAME.}
proc ConfigSetListVariable*(ih: PIhandle; group: cstring; key: cstring; value: cstring; add: cint) {.cdecl, importc: "IupConfigSetListVariable", dynlib: libiupSONAME.}
proc ConfigRecentInit*(ih: PIhandle; menu: PIhandle; recent_cb: Icallback; max_recent: cint) {.cdecl, importc: "IupConfigRecentInit", dynlib: libiupSONAME.}
proc ConfigRecentUpdate*(ih: PIhandle; filename: cstring) {.cdecl, importc: "IupConfigRecentUpdate", dynlib: libiupSONAME.}
proc ConfigDialogShow*(ih: PIhandle; dialog: PIhandle; name: cstring) {.cdecl, importc: "IupConfigDialogShow", dynlib: libiupSONAME.}
proc ConfigDialogClosed*(ih: PIhandle; dialog: PIhandle; name: cstring) {.cdecl, importc: "IupConfigDialogClosed", dynlib: libiupSONAME.}
proc ControlsOpen*(): cint {.cdecl, importc: "IupControlsOpen", dynlib: libiupcontrolsSONAME, discardable.}
proc Cells*(): PIhandle {.cdecl, importc: "IupCells", dynlib: libiupcontrolsSONAME.}
proc Matrix*(action: cstring): PIhandle {.cdecl, importc: "IupMatrix", dynlib: libiupcontrolsSONAME.}
proc MatrixList*(): PIhandle {.cdecl, importc: "IupMatrixList", dynlib: libiupcontrolsSONAME.}
proc MatrixEx*(): PIhandle {.cdecl, importc: "IupMatrixEx", dynlib: libiupcontrolsSONAME.}
proc MatrixSetFormula*(ih: PIhandle; col: cint; formula: cstring; init: cstring) {. cdecl, importc: "IupMatrixSetFormula", dynlib: libiupcontrolsSONAME.}
proc MatrixSetDynamic*(ih: PIhandle; init: cstring) {.cdecl, importc: "IupMatrixSetDynamic", dynlib: libiupcontrolsSONAME.}
proc cdContextIupDraw*(): ptr cdContext {.cdecl, importc: "cdContextIupDraw", dynlib: libiupSONAME.}
proc DrawBegin*(ih: PIhandle) {.cdecl, importc: "IupDrawBegin", dynlib: libiupSONAME.}
proc DrawEnd*(ih: PIhandle) {.cdecl, importc: "IupDrawEnd", dynlib: libiupSONAME.}
proc DrawSetClipRect*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "IupDrawSetClipRect", dynlib: libiupSONAME.}
proc DrawGetClipRect*(ih: PIhandle; x1: var cint; y1: var cint; x2: var cint; y2: var cint) {. cdecl, importc: "IupDrawGetClipRect", dynlib: libiupSONAME.}
proc DrawResetClip*(ih: PIhandle) {.cdecl, importc: "IupDrawResetClip", dynlib: libiupSONAME.}
proc DrawParentBackground*(ih: PIhandle) {.cdecl, importc: "IupDrawParentBackground", dynlib: libiupSONAME.}
proc DrawLine*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "IupDrawLine", dynlib: libiupSONAME.}
proc DrawRectangle*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "IupDrawRectangle", dynlib: libiupSONAME.}
proc DrawArc*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint; a1: cdouble; a2: cdouble) {.cdecl, importc: "IupDrawArc", dynlib: libiupSONAME.}
proc DrawPolygon*(ih: PIhandle; points: var cint; count: cint) {.cdecl, importc: "IupDrawPolygon", dynlib: libiupSONAME.}
proc DrawText*(ih: PIhandle; text: cstring; len: cint; x: cint; y: cint; w: cint; h: cint) {. cdecl, importc: "IupDrawText", dynlib: libiupSONAME.}
proc DrawImage*(ih: PIhandle; name: cstring; x: cint; y: cint; w: cint; h: cint) {.cdecl, importc: "IupDrawImage", dynlib: libiupSONAME.}
proc DrawSelectRect*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "IupDrawSelectRect", dynlib: libiupSONAME.}
proc DrawFocusRect*(ih: PIhandle; x1: cint; y1: cint; x2: cint; y2: cint) {.cdecl, importc: "IupDrawFocusRect", dynlib: libiupSONAME.}
proc DrawGetSize*(ih: PIhandle; w: var cint; h: var cint) {.cdecl, importc: "IupDrawGetSize", dynlib: libiupSONAME.}
proc DrawGetTextSize*(ih: PIhandle; text: cstring; len: cint; w: var cint; h: var cint) {. cdecl, importc: "IupDrawGetTextSize", dynlib: libiupSONAME.}
proc DrawGetImageInfo*(name: cstring; w: var cint; h: var cint; bpp: var cint) {.cdecl, importc: "IupDrawGetImageInfo", dynlib: libiupSONAME.}
proc NewFileDlgOpen*(): cint {.cdecl, importc: "IupNewFileDlgOpen", dynlib: libiupSONAME, discardable.}
proc GLControlsOpen*(): cint {.cdecl, importc: "IupGLControlsOpen", dynlib: libiupglcontrolsSONAME, discardable.}
proc GLCanvasBoxv*(children: ptr PIhandle): PIhandle {.cdecl, importc: "IupGLCanvasBoxv", dynlib: libiupglcontrolsSONAME.}
proc GLCanvasBox*(child: PIhandle): PIhandle {.varargs, cdecl, importc: "IupGLCanvasBox", dynlib: libiupglcontrolsSONAME.}
proc GLSubCanvas*(): PIhandle {.cdecl, importc: "IupGLSubCanvas", dynlib: libiupglcontrolsSONAME.}
proc GLLabel*(title: cstring): PIhandle {.cdecl, importc: "IupGLLabel", dynlib: libiupglcontrolsSONAME.}
proc GLSeparator*(): PIhandle {.cdecl, importc: "IupGLSeparator", dynlib: libiupglcontrolsSONAME.}
proc GLButton*(title: cstring): PIhandle {.cdecl, importc: "IupGLButton", dynlib: libiupglcontrolsSONAME.}
proc GLToggle*(title: cstring): PIhandle {.cdecl, importc: "IupGLToggle", dynlib: libiupglcontrolsSONAME.}
proc GLLink*(url: cstring; title: cstring): PIhandle {.cdecl, importc: "IupGLLink", dynlib: libiupglcontrolsSONAME.}
proc GLProgressBar*(): PIhandle {.cdecl, importc: "IupGLProgressBar", dynlib: libiupglcontrolsSONAME.}
proc GLVal*(): PIhandle {.cdecl, importc: "IupGLVal", dynlib: libiupglcontrolsSONAME.}
proc GLFrame*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLFrame", dynlib: libiupglcontrolsSONAME.}
proc GLExpander*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLExpander", dynlib: libiupglcontrolsSONAME.}
proc GLScrollBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLScrollBox", dynlib: libiupglcontrolsSONAME.}
proc GLSizeBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLSizeBox", dynlib: libiupglcontrolsSONAME.}
proc GLText*(): PIhandle {.cdecl, importc: "IupGLText", dynlib: libiupglcontrolsSONAME.}
proc GLDrawImage*(ih: PIhandle; name: cstring; x: cint; y: cint; active: cint) {.cdecl, importc: "IupGLDrawImage", dynlib: libiupglcontrolsSONAME.}
proc GLDrawText*(ih: PIhandle; str: cstring; len: cint; x: cint; y: cint) {.cdecl, importc: "IupGLDrawText", dynlib: libiupglcontrolsSONAME.}
proc GLDrawGetTextSize*(ih: PIhandle; str: cstring; w: var cint; h: var cint) {.cdecl, importc: "IupGLDrawGetTextSize", dynlib: libiupglcontrolsSONAME.}
proc GLDrawGetImageInfo*(name: cstring; w: var cint; h: var cint; bpp: var cint) {.cdecl, importc: "IupGLDrawGetImageInfo", dynlib: libiupglcontrolsSONAME.}
const
  IUP_BUFFER* = "BUFFER"
  IUP_STEREO* = "STEREO"
  IUP_BUFFER_SIZE* = "BUFFER_SIZE"
  IUP_RED_SIZE* = "RED_SIZE"
  IUP_GREEN_SIZE* = "GREEN_SIZE"
  IUP_BLUE_SIZE* = "BLUE_SIZE"
  IUP_ALPHA_SIZE* = "ALPHA_SIZE"
  IUP_DEPTH_SIZE* = "DEPTH_SIZE"
  IUP_STENCIL_SIZE* = "STENCIL_SIZE"
  IUP_ACCUM_RED_SIZE* = "ACCUM_RED_SIZE"
  IUP_ACCUM_GREEN_SIZE* = "ACCUM_GREEN_SIZE"
  IUP_ACCUM_BLUE_SIZE* = "ACCUM_BLUE_SIZE"
  IUP_ACCUM_ALPHA_SIZE* = "ACCUM_ALPHA_SIZE"
  IUP_DOUBLE* = "DOUBLE"
  IUP_SINGLE* = "SINGLE"
  IUP_INDEX* = "INDEX"
  IUP_RGBA* = "RGBA"

proc GLCanvasOpen*() {.cdecl, importc: "IupGLCanvasOpen", dynlib: libiupglSONAME.}
proc GLCanvas*(action: cstring): PIhandle {.cdecl, importc: "IupGLCanvas", dynlib: libiupglSONAME.}
proc GLBackgroundBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLBackgroundBox", dynlib: libiupglSONAME.}
proc GLMakeCurrent*(ih: PIhandle) {.cdecl, importc: "IupGLMakeCurrent", dynlib: libiupglSONAME.}
proc GLIsCurrent*(ih: PIhandle): cint {.cdecl, importc: "IupGLIsCurrent", dynlib: libiupglSONAME, discardable.}
proc GLSwapBuffers*(ih: PIhandle) {.cdecl, importc: "IupGLSwapBuffers", dynlib: libiupglSONAME.}
proc GLPalette*(ih: PIhandle; index: cint; r: cfloat; g: cfloat; b: cfloat) {.cdecl, importc: "IupGLPalette", dynlib: libiupglSONAME.}
proc GLUseFont*(ih: PIhandle; first: cint; count: cint; list_base: cint) {.cdecl, importc: "IupGLUseFont", dynlib: libiupglSONAME.}
proc GLWait*(gl: cint) {.cdecl, importc: "IupGLWait", dynlib: libiupglSONAME.}
proc LoadImage*(file_name: cstring): PIhandle {.cdecl, importc: "IupLoadImage", dynlib: libiupimSONAME.}
proc SaveImage*(ih: PIhandle; file_name: cstring; format: cstring): cint {.cdecl, importc: "IupSaveImage", dynlib: libiupimSONAME, discardable.}
proc LoadAnimation*(file_name: cstring): PIhandle {.cdecl, importc: "IupLoadAnimation", dynlib: libiupimSONAME.}
proc LoadAnimationFrames*(file_name_list: cstringArray; file_count: cint): PIhandle {. cdecl, importc: "IupLoadAnimationFrames", dynlib: libiupimSONAME.}
proc GetNativeHandleImage*(handle: pointer): ptr imImage {.cdecl, importc: "IupGetNativeHandleImage", dynlib: libiupimSONAME.}
proc GetImageNativeHandle*(image: ptr imImage): pointer {.cdecl, importc: "IupGetImageNativeHandle", dynlib: libiupimSONAME.}
proc ImageFromImImage*(image: ptr imImage): PIhandle {.cdecl, importc: "IupImageFromImImage", dynlib: libiupimSONAME.}
proc ImageToImImage*(iup_image: PIhandle): ptr imImage {.cdecl, importc: "IupImageToImImage", dynlib: libiupimSONAME.}
const
  K_SP* = cint(ord(' '))
  K_exclam* = cint(ord('!'))
  K_quotedbl* = cint(ord('\"'))
  K_numbersign* = cint(ord('#'))
  K_dollar* = cint(ord('$'))
  K_percent* = cint(ord('%'))
  K_ampersand* = cint(ord('&'))
  K_apostrophe* = cint(ord('\''))
  K_parentleft* = cint(ord('('))
  K_parentright* = cint(ord(')'))
  K_asterisk* = cint(ord('*'))
  K_plus* = cint(ord('+'))
  K_comma* = cint(ord(','))
  K_minus* = cint(ord('-'))
  K_period* = cint(ord('.'))
  K_slash* = cint(ord('/'))
  K_0* = cint(ord('0'))
  K_1* = cint(ord('1'))
  K_2* = cint(ord('2'))
  K_3* = cint(ord('3'))
  K_4* = cint(ord('4'))
  K_5* = cint(ord('5'))
  K_6* = cint(ord('6'))
  K_7* = cint(ord('7'))
  K_8* = cint(ord('8'))
  K_9* = cint(ord('9'))
  K_colon* = cint(ord(':'))
  K_semicolon* = cint(ord(';'))
  K_less* = cint(ord('<'))
  K_equal* = cint(ord('='))
  K_greater* = cint(ord('>'))
  K_question* = cint(ord('?'))
  K_at* = cint(ord('@'))
  K_upperA* = cint(ord('A'))
  K_upperB* = cint(ord('B'))
  K_upperC* = cint(ord('C'))
  K_upperD* = cint(ord('D'))
  K_upperE* = cint(ord('E'))
  K_upperF* = cint(ord('F'))
  K_upperG* = cint(ord('G'))
  K_upperH* = cint(ord('H'))
  K_upperI* = cint(ord('I'))
  K_upperJ* = cint(ord('J'))
  K_upperK* = cint(ord('K'))
  K_upperL* = cint(ord('L'))
  K_upperM* = cint(ord('M'))
  K_upperN* = cint(ord('N'))
  K_upperO* = cint(ord('O'))
  K_upperP* = cint(ord('P'))
  K_upperQ* = cint(ord('Q'))
  K_upperR* = cint(ord('R'))
  K_upperS* = cint(ord('S'))
  K_upperT* = cint(ord('T'))
  K_upperU* = cint(ord('U'))
  K_upperV* = cint(ord('V'))
  K_upperW* = cint(ord('W'))
  K_upperX* = cint(ord('X'))
  K_upperY* = cint(ord('Y'))
  K_upperZ* = cint(ord('Z'))
  K_bracketleft* = cint(ord('['))
  K_backslash* = cint(ord('\b'))
  K_bracketright* = cint(ord(']'))
  K_circum* = cint(ord('^'))
  K_underscore* = cint(ord('_'))
  K_grave* = cint(ord('`'))
  K_lowera* = cint(ord('a'))
  K_lowerb* = cint(ord('b'))
  K_lowerc* = cint(ord('c'))
  K_lowerd* = cint(ord('d'))
  K_lowere* = cint(ord('e'))
  K_lowerf* = cint(ord('f'))
  K_lowerg* = cint(ord('g'))
  K_lowerh* = cint(ord('h'))
  K_loweri* = cint(ord('i'))
  K_lowerj* = cint(ord('j'))
  K_lowerk* = cint(ord('k'))
  K_lowerl* = cint(ord('l'))
  K_lowerm* = cint(ord('m'))
  K_lowern* = cint(ord('n'))
  K_lowero* = cint(ord('o'))
  K_lowerp* = cint(ord('p'))
  K_lowerq* = cint(ord('q'))
  K_lowerr* = cint(ord('r'))
  K_lowers* = cint(ord('s'))
  K_lowert* = cint(ord('t'))
  K_loweru* = cint(ord('u'))
  K_lowerv* = cint(ord('v'))
  K_lowerw* = cint(ord('w'))
  K_lowerx* = cint(ord('x'))
  K_lowery* = cint(ord('y'))
  K_lowerz* = cint(ord('z'))
  K_braceleft* = cint(ord('{'))
  K_bar* = cint(ord('|'))
  K_braceright* = cint(ord('}'))
  K_tilde* = cint(ord('~'))

template iup_isprint*(Xc: untyped): untyped =
  ((Xc) > 31 and (Xc) < 127)

const
  K_BS* = cint(ord('\b'))
  K_TAB* = cint(ord('\t'))
  K_LF* = cint(ord('\n'))
  K_CR* = cint(ord('\c'))
  K_quoteleft* = K_grave
  K_quoteright* = K_apostrophe

template iup_isXkey*(Xc: untyped): untyped =
  ((Xc) >= 128)

const
  K_PAUSE* = cint(0x0000FF13)
  K_ESC* = cint(0x0000FF1B)
  K_HOME* = cint(0x0000FF50)
  K_LEFT* = cint(0x0000FF51)
  K_UP* = cint(0x0000FF52)
  K_RIGHT* = cint(0x0000FF53)
  K_DOWN* = cint(0x0000FF54)
  K_PGUP* = cint(0x0000FF55)
  K_PGDN* = cint(0x0000FF56)
  K_END* = cint(0x0000FF57)
  K_MIDDLE* = cint(0x0000FF0B)
  K_Print* = cint(0x0000FF61)
  K_INS* = cint(0x0000FF63)
  K_Menu* = cint(0x0000FF67)
  K_DEL* = cint(0x0000FFFF)
  K_F1* = cint(0x0000FFBE)
  K_F2* = cint(0x0000FFBF)
  K_F3* = cint(0x0000FFC0)
  K_F4* = cint(0x0000FFC1)
  K_F5* = cint(0x0000FFC2)
  K_F6* = cint(0x0000FFC3)
  K_F7* = cint(0x0000FFC4)
  K_F8* = cint(0x0000FFC5)
  K_F9* = cint(0x0000FFC6)
  K_F10* = cint(0x0000FFC7)
  K_F11* = cint(0x0000FFC8)
  K_F12* = cint(0x0000FFC9)
  K_LSHIFT* = cint(0x0000FFE1)
  K_RSHIFT* = cint(0x0000FFE2)
  K_LCTRL* = cint(0x0000FFE3)
  K_RCTRL* = cint(0x0000FFE4)
  K_LALT* = cint(0x0000FFE9)
  K_RALT* = cint(0x0000FFEA)
  K_NUM* = cint(0x0000FF7F)
  K_SCROLL* = cint(0x0000FF14)
  K_CAPS* = cint(0x0000FFE5)
  K_lowerccedilla* = cint(0x000000E7)
  K_Ccedilla* = cint(0x000000C7)
  K_acute* = cint(0x000000B4)
  K_diaeresis* = cint(0x000000A8)

template iup_isShiftXkey*(Xc: untyped): untyped =
  ((Xc) and 0x10000000)

template iup_isCtrlXkey*(Xc: untyped): untyped =
  ((Xc) and 0x20000000)

template iup_isAltXkey*(Xc: untyped): untyped =
  ((Xc) and 0x40000000)

template iup_isSysXkey*(Xc: untyped): untyped =
  ((Xc) and 0x80000000)

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

const
  K_sHOME* = iup_XkeyShift(K_HOME)
  K_sUP* = iup_XkeyShift(K_UP)
  K_sPGUP* = iup_XkeyShift(K_PGUP)
  K_sLEFT* = iup_XkeyShift(K_LEFT)
  K_sMIDDLE* = iup_XkeyShift(K_MIDDLE)
  K_sRIGHT* = iup_XkeyShift(K_RIGHT)
  K_sEND* = iup_XkeyShift(K_END)
  K_sDOWN* = iup_XkeyShift(K_DOWN)
  K_sPGDN* = iup_XkeyShift(K_PGDN)
  K_sINS* = iup_XkeyShift(K_INS)
  K_sDEL* = iup_XkeyShift(K_DEL)
  K_sSP* = iup_XkeyShift(K_SP)
  K_sTAB* = iup_XkeyShift(K_TAB)
  K_sCR* = iup_XkeyShift(K_CR)
  K_sBS* = iup_XkeyShift(K_BS)
  K_sPAUSE* = iup_XkeyShift(K_PAUSE)
  K_sESC* = iup_XkeyShift(K_ESC)
  K_sF1* = iup_XkeyShift(K_F1)
  K_sF2* = iup_XkeyShift(K_F2)
  K_sF3* = iup_XkeyShift(K_F3)
  K_sF4* = iup_XkeyShift(K_F4)
  K_sF5* = iup_XkeyShift(K_F5)
  K_sF6* = iup_XkeyShift(K_F6)
  K_sF7* = iup_XkeyShift(K_F7)
  K_sF8* = iup_XkeyShift(K_F8)
  K_sF9* = iup_XkeyShift(K_F9)
  K_sF10* = iup_XkeyShift(K_F10)
  K_sF11* = iup_XkeyShift(K_F11)
  K_sF12* = iup_XkeyShift(K_F12)
  K_sPrint* = iup_XkeyShift(K_Print)
  K_sMenu* = iup_XkeyShift(K_Menu)
  K_cHOME* = iup_XkeyCtrl(K_HOME)
  K_cUP* = iup_XkeyCtrl(K_UP)
  K_cPGUP* = iup_XkeyCtrl(K_PGUP)
  K_cLEFT* = iup_XkeyCtrl(K_LEFT)
  K_cMIDDLE* = iup_XkeyCtrl(K_MIDDLE)
  K_cRIGHT* = iup_XkeyCtrl(K_RIGHT)
  K_cEND* = iup_XkeyCtrl(K_END)
  K_cDOWN* = iup_XkeyCtrl(K_DOWN)
  K_cPGDN* = iup_XkeyCtrl(K_PGDN)
  K_cINS* = iup_XkeyCtrl(K_INS)
  K_cDEL* = iup_XkeyCtrl(K_DEL)
  K_cSP* = iup_XkeyCtrl(K_SP)
  K_cTAB* = iup_XkeyCtrl(K_TAB)
  K_cCR* = iup_XkeyCtrl(K_CR)
  K_cBS* = iup_XkeyCtrl(K_BS)
  K_cPAUSE* = iup_XkeyCtrl(K_PAUSE)
  K_cESC* = iup_XkeyCtrl(K_ESC)
  K_cCcedilla* = iup_XkeyCtrl(K_Ccedilla)
  K_cF1* = iup_XkeyCtrl(K_F1)
  K_cF2* = iup_XkeyCtrl(K_F2)
  K_cF3* = iup_XkeyCtrl(K_F3)
  K_cF4* = iup_XkeyCtrl(K_F4)
  K_cF5* = iup_XkeyCtrl(K_F5)
  K_cF6* = iup_XkeyCtrl(K_F6)
  K_cF7* = iup_XkeyCtrl(K_F7)
  K_cF8* = iup_XkeyCtrl(K_F8)
  K_cF9* = iup_XkeyCtrl(K_F9)
  K_cF10* = iup_XkeyCtrl(K_F10)
  K_cF11* = iup_XkeyCtrl(K_F11)
  K_cF12* = iup_XkeyCtrl(K_F12)
  K_cPrint* = iup_XkeyCtrl(K_Print)
  K_cMenu* = iup_XkeyCtrl(K_Menu)
  K_mHOME* = iup_XkeyAlt(K_HOME)
  K_mUP* = iup_XkeyAlt(K_UP)
  K_mPGUP* = iup_XkeyAlt(K_PGUP)
  K_mLEFT* = iup_XkeyAlt(K_LEFT)
  K_mMIDDLE* = iup_XkeyAlt(K_MIDDLE)
  K_mRIGHT* = iup_XkeyAlt(K_RIGHT)
  K_mEND* = iup_XkeyAlt(K_END)
  K_mDOWN* = iup_XkeyAlt(K_DOWN)
  K_mPGDN* = iup_XkeyAlt(K_PGDN)
  K_mINS* = iup_XkeyAlt(K_INS)
  K_mDEL* = iup_XkeyAlt(K_DEL)
  K_mSP* = iup_XkeyAlt(K_SP)
  K_mTAB* = iup_XkeyAlt(K_TAB)
  K_mCR* = iup_XkeyAlt(K_CR)
  K_mBS* = iup_XkeyAlt(K_BS)
  K_mPAUSE* = iup_XkeyAlt(K_PAUSE)
  K_mESC* = iup_XkeyAlt(K_ESC)
  K_mCcedilla* = iup_XkeyAlt(K_Ccedilla)
  K_mF1* = iup_XkeyAlt(K_F1)
  K_mF2* = iup_XkeyAlt(K_F2)
  K_mF3* = iup_XkeyAlt(K_F3)
  K_mF4* = iup_XkeyAlt(K_F4)
  K_mF5* = iup_XkeyAlt(K_F5)
  K_mF6* = iup_XkeyAlt(K_F6)
  K_mF7* = iup_XkeyAlt(K_F7)
  K_mF8* = iup_XkeyAlt(K_F8)
  K_mF9* = iup_XkeyAlt(K_F9)
  K_mF10* = iup_XkeyAlt(K_F10)
  K_mF11* = iup_XkeyAlt(K_F11)
  K_mF12* = iup_XkeyAlt(K_F12)
  K_mPrint* = iup_XkeyAlt(K_Print)
  K_mMenu* = iup_XkeyAlt(K_Menu)
  K_yHOME* = iup_XkeySys(K_HOME)
  K_yUP* = iup_XkeySys(K_UP)
  K_yPGUP* = iup_XkeySys(K_PGUP)
  K_yLEFT* = iup_XkeySys(K_LEFT)
  K_yMIDDLE* = iup_XkeySys(K_MIDDLE)
  K_yRIGHT* = iup_XkeySys(K_RIGHT)
  K_yEND* = iup_XkeySys(K_END)
  K_yDOWN* = iup_XkeySys(K_DOWN)
  K_yPGDN* = iup_XkeySys(K_PGDN)
  K_yINS* = iup_XkeySys(K_INS)
  K_yDEL* = iup_XkeySys(K_DEL)
  K_ySP* = iup_XkeySys(K_SP)
  K_yTAB* = iup_XkeySys(K_TAB)
  K_yCR* = iup_XkeySys(K_CR)
  K_yBS* = iup_XkeySys(K_BS)
  K_yPAUSE* = iup_XkeySys(K_PAUSE)
  K_yESC* = iup_XkeySys(K_ESC)
  K_yCcedilla* = iup_XkeySys(K_Ccedilla)
  K_yF1* = iup_XkeySys(K_F1)
  K_yF2* = iup_XkeySys(K_F2)
  K_yF3* = iup_XkeySys(K_F3)
  K_yF4* = iup_XkeySys(K_F4)
  K_yF5* = iup_XkeySys(K_F5)
  K_yF6* = iup_XkeySys(K_F6)
  K_yF7* = iup_XkeySys(K_F7)
  K_yF8* = iup_XkeySys(K_F8)
  K_yF9* = iup_XkeySys(K_F9)
  K_yF10* = iup_XkeySys(K_F10)
  K_yF11* = iup_XkeySys(K_F11)
  K_yF12* = iup_XkeySys(K_F12)
  K_yPrint* = iup_XkeySys(K_Print)
  K_yMenu* = iup_XkeySys(K_Menu)
  K_sPlus* = iup_XkeyShift(K_plus)
  K_sComma* = iup_XkeyShift(K_comma)
  K_sMinus* = iup_XkeyShift(K_minus)
  K_sPeriod* = iup_XkeyShift(K_period)
  K_sSlash* = iup_XkeyShift(K_slash)
  K_sAsterisk* = iup_XkeyShift(K_asterisk)
  K_cupperA* = iup_XkeyCtrl(K_upperA)
  K_cupperB* = iup_XkeyCtrl(K_upperB)
  K_cupperC* = iup_XkeyCtrl(K_upperC)
  K_cupperD* = iup_XkeyCtrl(K_upperD)
  K_cupperE* = iup_XkeyCtrl(K_upperE)
  K_cupperF* = iup_XkeyCtrl(K_upperF)
  K_cupperG* = iup_XkeyCtrl(K_upperG)
  K_cupperH* = iup_XkeyCtrl(K_upperH)
  K_cupperI* = iup_XkeyCtrl(K_upperI)
  K_cupperJ* = iup_XkeyCtrl(K_upperJ)
  K_cupperK* = iup_XkeyCtrl(K_upperK)
  K_cupperL* = iup_XkeyCtrl(K_upperL)
  K_cupperM* = iup_XkeyCtrl(K_upperM)
  K_cupperN* = iup_XkeyCtrl(K_upperN)
  K_cupperO* = iup_XkeyCtrl(K_upperO)
  K_cupperP* = iup_XkeyCtrl(K_upperP)
  K_cupperQ* = iup_XkeyCtrl(K_upperQ)
  K_cupperR* = iup_XkeyCtrl(K_upperR)
  K_cupperS* = iup_XkeyCtrl(K_upperS)
  K_cupperT* = iup_XkeyCtrl(K_upperT)
  K_cupperU* = iup_XkeyCtrl(K_upperU)
  K_cupperV* = iup_XkeyCtrl(K_upperV)
  K_cupperW* = iup_XkeyCtrl(K_upperW)
  K_cupperX* = iup_XkeyCtrl(K_upperX)
  K_cupperY* = iup_XkeyCtrl(K_upperY)
  K_cupperZ* = iup_XkeyCtrl(K_upperZ)
  K_c1* = iup_XkeyCtrl(K_1)
  K_c2* = iup_XkeyCtrl(K_2)
  K_c3* = iup_XkeyCtrl(K_3)
  K_c4* = iup_XkeyCtrl(K_4)
  K_c5* = iup_XkeyCtrl(K_5)
  K_c6* = iup_XkeyCtrl(K_6)
  K_c7* = iup_XkeyCtrl(K_7)
  K_c8* = iup_XkeyCtrl(K_8)
  K_c9* = iup_XkeyCtrl(K_9)
  K_c0* = iup_XkeyCtrl(K_0)
  K_cPlus* = iup_XkeyCtrl(K_plus)
  K_cComma* = iup_XkeyCtrl(K_comma)
  K_cMinus* = iup_XkeyCtrl(K_minus)
  K_cPeriod* = iup_XkeyCtrl(K_period)
  K_cSlash* = iup_XkeyCtrl(K_slash)
  K_cSemicolon* = iup_XkeyCtrl(K_semicolon)
  K_cEqual* = iup_XkeyCtrl(K_equal)
  K_cBracketleft* = iup_XkeyCtrl(K_bracketleft)
  K_cBracketright* = iup_XkeyCtrl(K_bracketright)
  K_cBackslash* = iup_XkeyCtrl(K_backslash)
  K_cAsterisk* = iup_XkeyCtrl(K_asterisk)
  K_mA* = iup_XkeyAlt(K_upperA)
  K_mB* = iup_XkeyAlt(K_upperB)
  K_mC* = iup_XkeyAlt(K_upperC)
  K_mD* = iup_XkeyAlt(K_upperD)
  K_mE* = iup_XkeyAlt(K_upperE)
  K_mF* = iup_XkeyAlt(K_upperF)
  K_mG* = iup_XkeyAlt(K_upperG)
  K_mH* = iup_XkeyAlt(K_upperH)
  K_mI* = iup_XkeyAlt(K_upperI)
  K_mJ* = iup_XkeyAlt(K_upperJ)
  K_mK* = iup_XkeyAlt(K_upperK)
  K_mL* = iup_XkeyAlt(K_upperL)
  K_mM* = iup_XkeyAlt(K_upperM)
  K_mN* = iup_XkeyAlt(K_upperN)
  K_mO* = iup_XkeyAlt(K_upperO)
  K_mP* = iup_XkeyAlt(K_upperP)
  K_mQ* = iup_XkeyAlt(K_upperQ)
  K_mR* = iup_XkeyAlt(K_upperR)
  K_mS* = iup_XkeyAlt(K_upperS)
  K_mT* = iup_XkeyAlt(K_upperT)
  K_mU* = iup_XkeyAlt(K_upperU)
  K_mV* = iup_XkeyAlt(K_upperV)
  K_mW* = iup_XkeyAlt(K_upperW)
  K_mX* = iup_XkeyAlt(K_upperX)
  K_mY* = iup_XkeyAlt(K_upperY)
  K_mZ* = iup_XkeyAlt(K_upperZ)
  K_m1* = iup_XkeyAlt(K_1)
  K_m2* = iup_XkeyAlt(K_2)
  K_m3* = iup_XkeyAlt(K_3)
  K_m4* = iup_XkeyAlt(K_4)
  K_m5* = iup_XkeyAlt(K_5)
  K_m6* = iup_XkeyAlt(K_6)
  K_m7* = iup_XkeyAlt(K_7)
  K_m8* = iup_XkeyAlt(K_8)
  K_m9* = iup_XkeyAlt(K_9)
  K_m0* = iup_XkeyAlt(K_0)
  K_mPlus* = iup_XkeyAlt(K_plus)
  K_mComma* = iup_XkeyAlt(K_comma)
  K_mMinus* = iup_XkeyAlt(K_minus)
  K_mPeriod* = iup_XkeyAlt(K_period)
  K_mSlash* = iup_XkeyAlt(K_slash)
  K_mSemicolon* = iup_XkeyAlt(K_semicolon)
  K_mEqual* = iup_XkeyAlt(K_equal)
  K_mBracketleft* = iup_XkeyAlt(K_bracketleft)
  K_mBracketright* = iup_XkeyAlt(K_bracketright)
  K_mBackslash* = iup_XkeyAlt(K_backslash)
  K_mAsterisk* = iup_XkeyAlt(K_asterisk)
  K_yA* = iup_XkeySys(K_upperA)
  K_yB* = iup_XkeySys(K_upperB)
  K_yC* = iup_XkeySys(K_upperC)
  K_yD* = iup_XkeySys(K_upperD)
  K_yE* = iup_XkeySys(K_upperE)
  K_yF* = iup_XkeySys(K_upperF)
  K_yG* = iup_XkeySys(K_upperG)
  K_yH* = iup_XkeySys(K_upperH)
  K_yI* = iup_XkeySys(K_upperI)
  K_yJ* = iup_XkeySys(K_upperJ)
  K_yK* = iup_XkeySys(K_upperK)
  K_yL* = iup_XkeySys(K_upperL)
  K_yM* = iup_XkeySys(K_upperM)
  K_yN* = iup_XkeySys(K_upperN)
  K_yO* = iup_XkeySys(K_upperO)
  K_yP* = iup_XkeySys(K_upperP)
  K_yQ* = iup_XkeySys(K_upperQ)
  K_yR* = iup_XkeySys(K_upperR)
  K_yS* = iup_XkeySys(K_upperS)
  K_yT* = iup_XkeySys(K_upperT)
  K_yU* = iup_XkeySys(K_upperU)
  K_yV* = iup_XkeySys(K_upperV)
  K_yW* = iup_XkeySys(K_upperW)
  K_yX* = iup_XkeySys(K_upperX)
  K_yY* = iup_XkeySys(K_upperY)
  K_yZ* = iup_XkeySys(K_upperZ)
  K_y1* = iup_XkeySys(K_1)
  K_y2* = iup_XkeySys(K_2)
  K_y3* = iup_XkeySys(K_3)
  K_y4* = iup_XkeySys(K_4)
  K_y5* = iup_XkeySys(K_5)
  K_y6* = iup_XkeySys(K_6)
  K_y7* = iup_XkeySys(K_7)
  K_y8* = iup_XkeySys(K_8)
  K_y9* = iup_XkeySys(K_9)
  K_y0* = iup_XkeySys(K_0)
  K_yPlus* = iup_XkeySys(K_plus)
  K_yComma* = iup_XkeySys(K_comma)
  K_yMinus* = iup_XkeySys(K_minus)
  K_yPeriod* = iup_XkeySys(K_period)
  K_ySlash* = iup_XkeySys(K_slash)
  K_ySemicolon* = iup_XkeySys(K_semicolon)
  K_yEqual* = iup_XkeySys(K_equal)
  K_yBracketleft* = iup_XkeySys(K_bracketleft)
  K_yBracketright* = iup_XkeySys(K_bracketright)
  K_yBackslash* = iup_XkeySys(K_backslash)
  K_yAsterisk* = iup_XkeySys(K_asterisk)

proc MglPlotOpen*() {.cdecl, importc: "IupMglPlotOpen", dynlib: libiup_mglplotSONAME.}
proc MglPlot*(): PIhandle {.cdecl, importc: "IupMglPlot", dynlib: libiup_mglplotSONAME.}
proc MglPlotBegin*(ih: PIhandle; dim: cint) {.cdecl, importc: "IupMglPlotBegin", dynlib: libiup_mglplotSONAME.}
proc MglPlotAdd1D*(ih: PIhandle; name: cstring; y: cdouble) {.cdecl, importc: "IupMglPlotAdd1D", dynlib: libiup_mglplotSONAME.}
proc MglPlotAdd2D*(ih: PIhandle; x: cdouble; y: cdouble) {.cdecl, importc: "IupMglPlotAdd2D", dynlib: libiup_mglplotSONAME.}
proc MglPlotAdd3D*(ih: PIhandle; x: cdouble; y: cdouble; z: cdouble) {.cdecl, importc: "IupMglPlotAdd3D", dynlib: libiup_mglplotSONAME.}
proc MglPlotEnd*(ih: PIhandle): cint {.cdecl, importc: "IupMglPlotEnd", dynlib: libiup_mglplotSONAME, discardable.}
proc MglPlotNewDataSet*(ih: PIhandle; dim: cint): cint {.cdecl, importc: "IupMglPlotNewDataSet", dynlib: libiup_mglplotSONAME, discardable.}
proc MglPlotInsert1D*(ih: PIhandle; ds_index: cint; sample_index: cint; names: cstringArray; y: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotInsert1D", dynlib: libiup_mglplotSONAME.}
proc MglPlotInsert2D*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotInsert2D", dynlib: libiup_mglplotSONAME.}
proc MglPlotInsert3D*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotInsert3D", dynlib: libiup_mglplotSONAME.}
proc MglPlotSet1D*(ih: PIhandle; ds_index: cint; names: cstringArray; y: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotSet1D", dynlib: libiup_mglplotSONAME.}
proc MglPlotSet2D*(ih: PIhandle; ds_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotSet2D", dynlib: libiup_mglplotSONAME.}
proc MglPlotSet3D*(ih: PIhandle; ds_index: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble; count: cint) {.cdecl, importc: "IupMglPlotSet3D", dynlib: libiup_mglplotSONAME.}
proc MglPlotSetFormula*(ih: PIhandle; ds_index: cint; formulaX: cstring; formulaY: cstring; formulaZ: cstring; count: cint) {.cdecl, importc: "IupMglPlotSetFormula", dynlib: libiup_mglplotSONAME.}
proc MglPlotSetData*(ih: PIhandle; ds_index: cint; data: ptr cdouble; count_x: cint; count_y: cint; count_z: cint) {.cdecl, importc: "IupMglPlotSetData", dynlib: libiup_mglplotSONAME.}
proc MglPlotLoadData*(ih: PIhandle; ds_index: cint; filename: cstring; count_x: cint; count_y: cint; count_z: cint) {.cdecl, importc: "IupMglPlotLoadData", dynlib: libiup_mglplotSONAME.}
proc MglPlotSetFromFormula*(ih: PIhandle; ds_index: cint; formula: cstring; count_x: cint; count_y: cint; count_z: cint) {.cdecl, importc: "IupMglPlotSetFromFormula", dynlib: libiup_mglplotSONAME.}
proc MglPlotTransform*(ih: PIhandle; x: cdouble; y: cdouble; z: cdouble; ix: var cint; iy: var cint) {.cdecl, importc: "IupMglPlotTransform", dynlib: libiup_mglplotSONAME.}
proc MglPlotTransformTo*(ih: PIhandle; ix: cint; iy: cint; x: ptr cdouble; y: ptr cdouble; z: ptr cdouble) {.cdecl, importc: "IupMglPlotTransformTo", dynlib: libiup_mglplotSONAME.}
proc MglPlotDrawMark*(ih: PIhandle; x: cdouble; y: cdouble; z: cdouble) {.cdecl, importc: "IupMglPlotDrawMark", dynlib: libiup_mglplotSONAME.}
proc MglPlotDrawLine*(ih: PIhandle; x1: cdouble; y1: cdouble; z1: cdouble; x2: cdouble; y2: cdouble; z2: cdouble) {.cdecl, importc: "IupMglPlotDrawLine", dynlib: libiup_mglplotSONAME.}
proc MglPlotDrawText*(ih: PIhandle; text: cstring; x: cdouble; y: cdouble; z: cdouble) {. cdecl, importc: "IupMglPlotDrawText", dynlib: libiup_mglplotSONAME.}
proc MglPlotPaintTo*(ih: PIhandle; format: cstring; w: cint; h: cint; dpi: cdouble; data: pointer) {.cdecl, importc: "IupMglPlotPaintTo", dynlib: libiup_mglplotSONAME.}
proc MglLabel*(title: cstring): PIhandle {.cdecl, importc: "IupMglLabel", dynlib: libiup_mglplotSONAME.}
proc PlotOpen*() {.cdecl, importc: "IupPlotOpen", dynlib: libiup_plotSONAME.}
proc Plot*(): PIhandle {.cdecl, importc: "IupPlot", dynlib: libiup_plotSONAME.}
proc PlotBegin*(ih: PIhandle; strXdata: cint) {.cdecl, importc: "IupPlotBegin", dynlib: libiup_plotSONAME.}
proc PlotAdd*(ih: PIhandle; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotAdd", dynlib: libiup_plotSONAME.}
proc PlotAddStr*(ih: PIhandle; x: cstring; y: cdouble) {.cdecl, importc: "IupPlotAddStr", dynlib: libiup_plotSONAME.}
proc PlotAddSegment*(ih: PIhandle; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotAddSegment", dynlib: libiup_plotSONAME.}
proc PlotEnd*(ih: PIhandle): cint {.cdecl, importc: "IupPlotEnd", dynlib: libiup_plotSONAME, discardable.}
proc PlotLoadData*(ih: PIhandle; filename: cstring; strXdata: cint): cint {.cdecl, importc: "IupPlotLoadData", dynlib: libiup_plotSONAME, discardable.}
proc PlotSetFormula*(ih: PIhandle; sample_count: cint; formula: cstring; init: cstring): cint {.cdecl, importc: "IupPlotSetFormula", dynlib: libiup_plotSONAME, discardable.}
proc PlotInsert*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotInsert", dynlib: libiup_plotSONAME.}
proc PlotInsertStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstring; y: cdouble) {.cdecl, importc: "IupPlotInsertStr", dynlib: libiup_plotSONAME.}
proc PlotInsertSegment*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotInsertSegment", dynlib: libiup_plotSONAME.}
proc PlotInsertStrSamples*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstringArray; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotInsertStrSamples", dynlib: libiup_plotSONAME.}
proc PlotInsertSamples*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotInsertSamples", dynlib: libiup_plotSONAME.}
proc PlotAddSamples*(ih: PIhandle; ds_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotAddSamples", dynlib: libiup_plotSONAME.}
proc PlotAddStrSamples*(ih: PIhandle; ds_index: cint; x: cstringArray; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotAddStrSamples", dynlib: libiup_plotSONAME.}
proc PlotGetSample*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble) {.cdecl, importc: "IupPlotGetSample", dynlib: libiup_plotSONAME.}
proc PlotGetSampleStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstringArray; y: ptr cdouble) {.cdecl, importc: "IupPlotGetSampleStr", dynlib: libiup_plotSONAME.}
proc PlotGetSampleSelection*(ih: PIhandle; ds_index: cint; sample_index: cint): cint {. cdecl, importc: "IupPlotGetSampleSelection", dynlib: libiup_plotSONAME, discardable.}
proc PlotGetSampleExtra*(ih: PIhandle; ds_index: cint; sample_index: cint): cdouble {. cdecl, importc: "IupPlotGetSampleExtra", dynlib: libiup_plotSONAME.}
proc PlotSetSample*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotSetSample", dynlib: libiup_plotSONAME.}
proc PlotSetSampleStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstring; y: cdouble) {.cdecl, importc: "IupPlotSetSampleStr", dynlib: libiup_plotSONAME.}
proc PlotSetSampleSelection*(ih: PIhandle; ds_index: cint; sample_index: cint; selected: cint) {.cdecl, importc: "IupPlotSetSampleSelection", dynlib: libiup_plotSONAME.}
proc PlotSetSampleExtra*(ih: PIhandle; ds_index: cint; sample_index: cint; extra: cdouble) {.cdecl, importc: "IupPlotSetSampleExtra", dynlib: libiup_plotSONAME.}
proc PlotTransform*(ih: PIhandle; x: cdouble; y: cdouble; cnv_x: ptr cdouble; cnv_y: ptr cdouble) {.cdecl, importc: "IupPlotTransform", dynlib: libiup_plotSONAME.}
proc PlotTransformTo*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; x: ptr cdouble; y: ptr cdouble) {.cdecl, importc: "IupPlotTransformTo", dynlib: libiup_plotSONAME.}
proc PlotFindSample*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; ds_index: var cint; sample_index: var cint): cint {.cdecl, importc: "IupPlotFindSample", dynlib: libiup_plotSONAME, discardable.}
proc PlotFindSegment*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; ds_index: var cint; sample_index1: var cint; sample_index2: var cint): cint {.cdecl, importc: "IupPlotFindSegment", dynlib: libiup_plotSONAME, discardable.}
proc PlotPaintTo*(ih: PIhandle; cnv: ptr cdCanvas) {.cdecl, importc: "IupPlotPaintTo", dynlib: libiup_plotSONAME.}
proc ScintillaOpen*() {.cdecl, importc: "IupScintillaOpen", dynlib: libiup_scintillaSONAME.}
proc Scintilla*(): PIhandle {.cdecl, importc: "IupScintilla", dynlib: libiup_scintillaSONAME.}
proc ScintillaDlg*(): PIhandle {.cdecl, importc: "IupScintillaDlg", dynlib: libiup_scintillaSONAME.}
proc ScintillaSendMessage*(ih: PIhandle; iMessage: cuint; wParam: uptr_t; lParam: sptr_t): sptr_t {.cdecl, importc: "IupScintillaSendMessage", dynlib: libiup_scintillaSONAME.}
proc TuioOpen*(): cint {.cdecl, importc: "IupTuioOpen", dynlib: libiuptuioSONAME, discardable.}
proc TuioClient*(port: cint): PIhandle {.cdecl, importc: "IupTuioClient", dynlib: libiuptuioSONAME.}
proc WebBrowserOpen*(): cint {.cdecl, importc: "IupWebBrowserOpen", dynlib: libiupwebSONAME, discardable.}
proc WebBrowser*(): PIhandle {.cdecl, importc: "IupWebBrowser", dynlib: libiupwebSONAME.}
const
  ICTL_BOTTOM* = "BOTTOM"
  ICTL_BUTTON_PRESS_CB* = "BUTTON_PRESS_CB"
  ICTL_BUTTON_RELEASE_CB* = "BUTTON_RELEASE_CB"
  ICTL_CIRCULAR* = "CIRCULAR"
  ICTL_DASHED* = "DASHED"
  ICTL_DENSITY* = "DENSITY"
  ICTL_FONT_ACTIVE* = "FONT_ACTIVE"
  ICTL_FONT* = "FONT"
  ICTL_FONT_INACTIVE* = "FONT_INACTIVE"
  ICTL_HORIZONTAL* = "HORIZONTAL"
  ICTL_LEFT* = "LEFT"
  ICTL_MARGIN* = "MARGIN"
  ICTL_MOUSEMOVE_CB* = "MOUSEMOVE_CB"
  ICTL_RIGHT* = "RIGHT"
  ICTL_SHOW_TEXT* = "SHOW_TEXT"
  ICTL_SHOWTICKS* = "SHOWTICKS"
  ICTL_TABCHANGE_CB* = "TABCHANGE_CB"
  ICTL_TABSIZE* = "TABSIZE"
  ICTL_TABTITLE* = "TABTITLE"
  ICTL_TABTYPE* = "TABTYPE"
  ICTL_TEXT* = "TEXT"
  ICTL_TOP* = "TOP"
  ICTL_UNIT* = "UNIT"
  ICTL_VERTICAL* = "VERTICAL"
  IUP_ABOTTOM* = "ABOTTOM"
  IUP_ACENTER* = "ACENTER"
  IUP_ACTION* = "ACTION"
  IUP_ACTIVE* = "ACTIVE"
  IUP_ADDBRANCH* = "ADDBRANCH"
  IUP_ADDCOL* = "ADDCOL"
  IUP_ADDEXPANDED* = "ADDEXPANDED"
  IUP_ADDLEAF* = "ADDLEAF"
  IUP_ADDLIN* = "ADDLIN"
  IUP_ALEFT* = "ALEFT"
  IUP_ALIGNMENT* = "ALIGNMENT"
  IUP_ALL* = "ALL"
  IUP_ALLOWNEW* = "ALLOWNEW"
  IUP_APPEND* = "APPEND"
  IUP_AREA* = "AREA"
  IUP_ARIGHT* = "ARIGHT"
  IUP_ARROW* = "ARROW"
  IUP_ATOP* = "ATOP"
  IUP_BGCOLOR* = "BGCOLOR"
  IUP_BLOCK* = "BLOCK"
  IUP_BLUE* = "0 0 255"
  IUP_BORDER* = "BORDER"
  IUP_BOXED* = "BOXED"
  IUP_BRANCH* = "BRANCH"
  IUP_BRANCHCLOSE_CB* = "BRANCHCLOSE_CB"
  IUP_BRANCHOPEN_CB* = "BRANCHOPEN_CB"
  IUP_BUFFERIZE* = "BUFFERIZE"
  IUP_BUSY* = "BUSY"
  IUP_BUTTON_CB* = "BUTTON_CB"
  IUP_CANVAS* = "CANVAS"
  IUP_CARET* = "CARET"
  IUP_CELL_CB* = "CELL_CB"
  IUP_CELL* = "CELL"
  IUP_CHANGE_CB* = "CHANGE_CB"
  IUP_CHILDREN* = "CHILDREN"
  IUP_CLEARALL* = "CLEARALL"
  IUP_CLICK_CB* = "CLICK_CB"
  IUP_CLIPCHILDREN* = "CLIPCHILDREN"
  IUP_CLIPPED* = "CLIPPED"
  IUP_CLOSE_CB* = "CLOSE_CB"
  IUP_COL* = "COL"
  IUP_COLLAPSED* = "COLLAPSED"
  IUP_COLOR* = "COLOR"
  IUP_COMPUTERNAME* = "COMPUTERNAME"
  IUP_CONID* = "CONID"
  IUP_CONTROL* = "CONTROL"
  IUP_CROSS* = "CROSS"
  IUP_CTRL* = "CTRL"
  IUP_CURSOR* = "CURSOR"
  IUP_DEFAULTENTER* = "DEFAULTENTER"
  IUP_DEFAULTESC* = "DEFAULTESC"
  IUP_DELCOL* = "DELCOL"
  IUP_DELLIN* = "DELLIN"
  IUP_DELNODE* = "DELNODE"
  IUP_DEPTH* = "DEPTH"
  IUP_DIALOGTYPE* = "DIALOGTYPE"
  IUP_DIR* = "DIR"
  IUP_DIRECTION* = "DIRECTION"
  IUP_DIRECTORY* = "DIRECTORY"
  IUP_DOUBLE_BUFFER* = "DOUBLE_BUFFER"
  IUP_DRAG_CB* = "DRAG_CB"
  IUP_DRAG* = "DRAG"
  IUP_DRAW_CB* = "DRAW_CB"
  IUP_DRIVER* = "DRIVER"
  IUP_DROP_CB* = "DROP_CB"
  IUP_DROPCHECK_CB* = "DROPCHECK_CB"
  IUP_DROPDOWN* = "DROPDOWN"
  IUP_DROP* = "DROP"
  IUP_DROPFILES_CB* = "DROPFILES_CB"
  IUP_DROPSELECT_CB* = "DROPSELECT_CB"
  IUP_DX* = "DX"
  IUP_DY* = "DY"
  IUP_EAST* = "EAST"
  IUP_EDITION_CB* = "EDITION_CB"
  IUP_EDIT_MODE* = "EDIT_MODE"
  IUP_EIGHTH* = "EIGHTH"
  IUP_ENGLISH* = "ENGLISH"
  IUP_ENTERITEM_CB* = "ENTERITEM_CB"
  IUP_ENTERWINDOW_CB* = "ENTERWINDOW_CB"
  IUP_EXECUTELEAF_CB* = "EXECUTELEAF_CB"
  IUP_EXPANDED* = "EXPANDED"
  IUP_EXPAND* = "EXPAND"
  IUP_EXTENDED_CB* = "EXTENDED_CB"
  IUP_EXTFILTER* = "EXTFILTER"
  IUP_FGCOLOR* = "FGCOLOR"
  IUP_FIELD_CB* = "FIELD_CB"
  IUP_FILEEXIST* = "FILEEXIST"
  IUP_FILE* = "FILE"
  IUP_FILTER* = "FILTER"
  IUP_FILTERINFO* = "FILTERINFO"
  IUP_FILTERUSED* = "FILTERUSED"
  IUP_FIRST_COL* = "FIRST_COL"
  IUP_FIRST_LINE* = "FIRST_LINE"
  IUP_FOCUS_CELL* = "FOCUS_CELL"
  IUP_FONT* = "FONT"
  IUP_FRAMECOLOR* = "FRAMECOLOR"
  IUP_FULL* = "FULL"
  IUP_FULLSCREEN* = "FULLSCREEN"
  IUP_FULL_VISIBLE* = "FULL_VISIBLE"
  IUP_GAP* = "GAP"
  IUP_GETFOCUS_CB* = "GETFOCUS_CB"
  IUP_GREEN* = "0 255 0"
  IUP_HALF* = "HALF"
  IUP_HAND* = "HAND"
  IUP_HEIGHT_CB* = "HEIGHT_CB"
  IUP_HEIGHTDEF* = "HEIGHTDEF"
  IUP_HEIGHT* = "HEIGHT"
  IUP_HELP_CB* = "HELP_CB"
  IUP_HIGHLIGHT_CB* = "HIGHLIGHT_CB"
  IUP_HORIZONTAL* = "HORIZONTAL"
  IUP_HOTSPOT* = "HOTSPOT"
  IUP_HSPAN_CB* = "HSPAN_CB"
  IUP_ICON* = "ICON"
  IUP_IDLE_ACTION* = "IDLE_ACTION"
  IUP_IMAGEBRANCHCOLLAPSED* = "IMAGEBRANCHCOLLAPSED"
  IUP_IMAGEBRANCHEXPANDED* = "IMAGEBRANCHEXPANDED"
  IUP_IMAGE_CANVAS* = "IMAGE_CANVAS"
  IUP_IMAGEEXPANDED* = "IMAGEEXPANDED"
  IUP_IMAGE* = "IMAGE"
  IUP_IMAGELEAF* = "IMAGELEAF"
  IUP_IMGBLANK* = "IMGBLANK"
  IUP_IMGCOLLAPSED* = "IMGCOLLAPSED"
  IUP_IMGEXPANDED* = "IMGEXPANDED"
  IUP_IMGLEAF* = "IMGLEAF"
  IUP_IMGPAPER* = "IMGPAPER"
  IUP_IMINACTIVE* = "IMINACTIVE"
  IUP_IMPRESS* = "IMPRESS"
  IUP_INSERT* = "INSERT"
  IUP_INVERTALL* = "INVERTALL"
  IUP_INVERT* = "INVERT"
  IUP_IUP* = "IUP"
  IUP_K_0* = "K_0"
  IUP_K_1* = "K_1"
  IUP_K_2* = "K_2"
  IUP_K_3* = "K_3"
  IUP_K_4* = "K_4"
  IUP_K_5* = "K_5"
  IUP_K_6* = "K_6"
  IUP_K_7* = "K_7"
  IUP_K_8* = "K_8"
  IUP_K_9* = "K_9"
  IUP_K_lowera* = "K_a"
  IUP_K_upperA* = "K_A"
  IUP_K_ampersand* = "K_ampersand"
  IUP_K_ANY* = "K_ANY"
  IUP_K_asterisk* = "K_asterisk"
  IUP_K_at* = "K_at"
  IUP_K_backslash* = "K_backslash"
  IUP_K_bar* = "K_bar"
  IUP_K_lowerb* = "K_b"
  IUP_K_upperB* = "K_B"
  IUP_K_braceleft* = "K_braceleft"
  IUP_K_braceright* = "K_braceright"
  IUP_K_bracketleft* = "K_bracketleft"
  IUP_K_bracketright* = "K_bracketright"
  IUP_K_BS* = "K_BS"
  IUP_K_cupperA* = "K_cA"
  IUP_K_cupperB* = "K_cB"
  IUP_K_cupperC* = "K_cC"
  IUP_K_cDEL* = "K_cDEL"
  IUP_K_cupperD* = "K_cD"
  IUP_K_cDOWN* = "K_cDOWN"
  IUP_K_cupperE* = "K_cE"
  IUP_K_cEND* = "K_cEND"
  IUP_K_cF10* = "K_cF10"
  IUP_K_cF11* = "K_cF11"
  IUP_K_cF12* = "K_cF12"
  IUP_K_cF1* = "K_cF1"
  IUP_K_cF2* = "K_cF2"
  IUP_K_cF3* = "K_cF3"
  IUP_K_cF4* = "K_cF4"
  IUP_K_cF5* = "K_cF5"
  IUP_K_cF6* = "K_cF6"
  IUP_K_cF7* = "K_cF7"
  IUP_K_cF8* = "K_cF8"
  IUP_K_cF9* = "K_cF9"
  IUP_K_cupperF* = "K_cF"
  IUP_K_cupperG* = "K_cG"
  IUP_K_cHOME* = "K_cHOME"
  IUP_K_cINS* = "K_cINS"
  IUP_K_circum* = "K_circum"
  IUP_K_cupperJ* = "K_cJ"
  IUP_K_lowerc* = "K_c"
  IUP_K_upperC* = "K_C"
  IUP_K_cupperK* = "K_cK"
  IUP_K_cLEFT* = "K_cLEFT"
  IUP_K_cupperL* = "K_cL"
  IUP_K_cMIDDLE* = "K_cMIDDLE"
  IUP_K_cupperN* = "K_cN"
  IUP_K_cupperO* = "K_cO"
  IUP_K_colon* = "K_colon"
  IUP_K_comma* = "K_comma"
  IUP_K_cPGDN* = "K_cPGDN"
  IUP_K_cPGUP* = "K_cPGUP"
  IUP_K_cupperP* = "K_cP"
  IUP_K_cupperQ* = "K_cQ"
  IUP_K_cRIGHT* = "K_cRIGHT"
  IUP_K_cupperR* = "K_cR"
  IUP_K_CR* = "K_CR"
  IUP_K_cupperS* = "K_cS"
  IUP_K_cTAB* = "K_cTAB"
  IUP_K_cupperT* = "K_cT"
  IUP_K_cupperU* = "K_cU"
  IUP_K_cUP* = "K_cUP"
  IUP_K_cupperV* = "K_cV"
  IUP_K_cupperW* = "K_cW"
  IUP_K_cupperX* = "K_cX"
  IUP_K_cupperY* = "K_cY"
  IUP_K_cupperZ* = "K_cZ"
  IUP_K_DEL* = "K_DEL"
  IUP_K_lowerd* = "K_d"
  IUP_K_upperD* = "K_D"
  IUP_K_dollar* = "K_dollar"
  IUP_K_DOWN* = "K_DOWN"
  IUP_K_lowere* = "K_e"
  IUP_K_upperE* = "K_E"
  IUP_K_END* = "K_END"
  IUP_K_equal* = "K_equal"
  IUP_K_ESC* = "K_ESC"
  IUP_K_exclam* = "K_exclam"
  IUP_KEY* = "KEY"
  IUP_KEYPRESS_CB* = "KEYPRESS_CB"
  IUP_K_F10* = "K_F10"
  IUP_K_F11* = "K_F11"
  IUP_K_F12* = "K_F12"
  IUP_K_F1* = "K_F1"
  IUP_K_F2* = "K_F2"
  IUP_K_F3* = "K_F3"
  IUP_K_F4* = "K_F4"
  IUP_K_F5* = "K_F5"
  IUP_K_F6* = "K_F6"
  IUP_K_F7* = "K_F7"
  IUP_K_F8* = "K_F8"
  IUP_K_F9* = "K_F9"
  IUP_K_lowerf* = "K_f"
  IUP_K_upperF* = "K_F"
  IUP_K_lowerg* = "K_g"
  IUP_K_upperG* = "K_G"
  IUP_K_greater* = "K_greater"
  IUP_K_lowerh* = "K_h"
  IUP_K_upperH* = "K_H"
  IUP_K_HOME* = "K_HOME"
  IUP_K_loweri* = "K_i"
  IUP_K_upperI* = "K_I"
  IUP_KILLFOCUS_CB* = "KILLFOCUS_CB"
  IUP_KIND* = "KIND"
  IUP_K_INS* = "K_INS"
  IUP_K_lowerj* = "K_j"
  IUP_K_upperJ* = "K_J"
  IUP_K_lowerk* = "K_k"
  IUP_K_upperK* = "K_K"
  IUP_K_LEFT* = "K_LEFT"
  IUP_K_less* = "K_less"
  IUP_K_lowerl* = "K_l"
  IUP_K_upperL* = "K_L"
  IUP_K_m0* = "K_m0"
  IUP_K_m1* = "K_m1"
  IUP_K_m2* = "K_m2"
  IUP_K_m3* = "K_m3"
  IUP_K_m4* = "K_m4"
  IUP_K_m5* = "K_m5"
  IUP_K_m6* = "K_m6"
  IUP_K_m7* = "K_m7"
  IUP_K_m8* = "K_m8"
  IUP_K_m9* = "K_m9"
  IUP_K_mA* = "K_mA"
  IUP_K_mB* = "K_mB"
  IUP_K_mC* = "K_mC"
  IUP_K_mDEL* = "K_mDEL"
  IUP_K_mD* = "K_mD"
  IUP_K_mDOWN* = "K_mDOWN"
  IUP_K_mE* = "K_mE"
  IUP_K_mEND* = "K_mEND"
  IUP_K_mF10* = "K_mF10"
  IUP_K_mF1* = "K_mF1"
  IUP_K_mF2* = "K_mF2"
  IUP_K_mF3* = "K_mF3"
  IUP_K_mF4* = "K_mF4"
  IUP_K_mF5* = "K_mF5"
  IUP_K_mF6* = "K_mF6"
  IUP_K_mF7* = "K_mF7"
  IUP_K_mF8* = "K_mF8"
  IUP_K_mF9* = "K_mF9"
  IUP_K_mF* = "K_mF"
  IUP_K_mG* = "K_mG"
  IUP_K_mH* = "K_mH"
  IUP_K_mHOME* = "K_mHOME"
  IUP_K_MIDDLE* = "K_MIDDLE"
  IUP_K_mI* = "K_mI"
  IUP_K_mINS* = "K_mINS"
  IUP_K_minus* = "K_minus"
  IUP_K_mJ* = "K_mJ"
  IUP_K_mK* = "K_mK"
  IUP_K_lowerm* = "K_m"
  IUP_K_upperM* = "K_M"
  IUP_K_mLEFT* = "K_mLEFT"
  IUP_K_mL* = "K_mL"
  IUP_K_mM* = "K_mM"
  IUP_K_mN* = "K_mN"
  IUP_K_mO* = "K_mO"
  IUP_K_mPGDN* = "K_mPGDN"
  IUP_K_mPGUP* = "K_mPGUP"
  IUP_K_mP* = "K_mP"
  IUP_K_mQ* = "K_mQ"
  IUP_K_mRIGHT* = "K_mRIGHT"
  IUP_K_mR* = "K_mR"
  IUP_K_mS* = "K_mS"
  IUP_K_mTAB* = "K_mTAB"
  IUP_K_mT* = "K_mT"
  IUP_K_mU* = "K_mU"
  IUP_K_mUP* = "K_mUP"
  IUP_K_mV* = "K_mV"
  IUP_K_mW* = "K_mW"
  IUP_K_mX* = "K_mX"
  IUP_K_mY* = "K_mY"
  IUP_K_mZ* = "K_mZ"
  IUP_K_lowern* = "K_n"
  IUP_K_upperN* = "K_N"
  IUP_K_numbersign* = "K_numbersign"
  IUP_K_lowero* = "K_o"
  IUP_K_upperO* = "K_O"
  IUP_K_parentleft* = "K_parentleft"
  IUP_K_parentright* = "K_parentright"
  IUP_K_percent* = "K_percent"
  IUP_K_period* = "K_period"
  IUP_K_PGDN* = "K_PGDN"
  IUP_K_PGUP* = "K_PGUP"
  IUP_K_lowerp* = "K_p"
  IUP_K_upperP* = "K_P"
  IUP_K_plus* = "K_plus"
  IUP_K_lowerq* = "K_q"
  IUP_K_upperQ* = "K_Q"
  IUP_K_question* = "K_question"
  IUP_K_quotedbl* = "K_quotedbl"
  IUP_K_quoteleft* = "K_quoteleft"
  IUP_K_quoteright* = "K_quoteright"
  IUP_K_RIGHT* = "K_RIGHT"
  IUP_K_lowerr* = "K_r"
  IUP_K_upperR* = "K_R"
  IUP_K_sCR* = "K_sCR"
  IUP_K_sDOWN* = "K_sDOWN"
  IUP_K_semicolon* = "K_semicolon "
  IUP_K_sEND* = "K_sEND"
  IUP_K_sF10* = "K_sF10"
  IUP_K_sF11* = "K_sF11"
  IUP_K_sF12* = "K_sF12"
  IUP_K_sF1* = "K_sF1"
  IUP_K_sF2* = "K_sF2"
  IUP_K_sF3* = "K_sF3"
  IUP_K_sF4* = "K_sF4"
  IUP_K_sF5* = "K_sF5"
  IUP_K_sF6* = "K_sF6"
  IUP_K_sF7* = "K_sF7"
  IUP_K_sF8* = "K_sF8"
  IUP_K_sF9* = "K_sF9"
  IUP_K_sHOME* = "K_sHOME"
  IUP_K_lowers* = "K_s"
  IUP_K_upperS* = "K_S"
  IUP_K_slash* = "K_slash"
  IUP_K_sLEFT* = "K_sLEFT"
  IUP_K_sPGDN* = "K_sPGDN"
  IUP_K_sPGUP* = "K_sPGUP"
  IUP_K_SP* = "K_SP"
  IUP_K_sRIGHT* = "K_sRIGHT"
  IUP_K_sTAB* = "K_sTAB"
  IUP_K_sUP* = "K_sUP"
  IUP_K_TAB* = "K_TAB"
  IUP_K_tilde* = "K_tilde"
  IUP_K_lowert* = "K_t"
  IUP_K_upperT* = "K_T"
  IUP_K_loweru* = "K_u"
  IUP_K_upperU* = "K_U"
  IUP_K_underscore* = "K_underscore"
  IUP_K_UP* = "K_UP"
  IUP_K_lowerv* = "K_v"
  IUP_K_upperV* = "K_V"
  IUP_K_lowerw* = "K_w"
  IUP_K_upperW* = "K_W"
  IUP_K_lowerx* = "K_x"
  IUP_K_upperX* = "K_X"
  IUP_K_lowery* = "K_y"
  IUP_K_upperY* = "K_Y"
  IUP_K_lowerz* = "K_z"
  IUP_K_upperZ* = "K_Z"
  IUP_LAST* = "LAST"
  IUP_LEAF* = "LEAF"
  IUP_LEAVEITEM_CB* = "LEAVEITEM_CB"
  IUP_LEAVEWINDOW_CB* = "LEAVEWINDOW_CB"
  IUP_LIMITS* = "LIMITS"
  IUP_LINCOL* = "LINCOL"
  IUP_LIN* = "LIN"
  IUP_LOCKLOOP* = "LOCKLOOP"
  IUP_MAP_CB* = "MAP_CB"
  IUP_MARGIN* = "MARGIN"
  IUP_MARKALL* = "MARKALL"
  IUP_MARKED* = "MARKED"
  IUP_MARK_MODE* = "MARK_MODE"
  IUP_MASK_CB* = "MASK_CB"
  IUP_MASK* = "MASK"
  IUP_MAXBOX* = "MAXBOX"
  IUP_MAX* = "MAX"
  IUP_MENUBOX* = "MENUBOX"
  IUP_MENUCLOSE_CB* = "MENUCLOSE_CB"
  IUP_MENU* = "MENU"
  IUP_MINBOX* = "MINBOX"
  IUP_MIN* = "MIN"
  IUP_MOTION_CB* = "MOTION_CB"
  IUP_MOUSECLICK_CB* = "MOUSECLICK_CB"
  IUP_MOUSEMOTION_CB* = "MOUSEMOTION_CB"
  IUP_MOUSEMOVE_CB* = "MOUSEMOVE_CB"
  IUP_MOVE* = "MOVE"
  IUP_MULTIPLEFILES* = "MULTIPLEFILES"
  IUP_MULTIPLE* = "MULTIPLE"
  IUP_NC* = "NC"
  IUP_NCOLS_CB* = "NCOLS_CB"
  IUP_NE* = "NE"
  IUP_NEXT* = "NEXT"
  IUP_NLINES_CB* = "NLINES_CB"
  IUP_NOCHANGEDIR* = "NOCHANGEDIR"
  IUP_NO_COLOR* = "NO_COLOR"
  IUP_NONE* = "NONE"
  IUP_NO* = "NO"
  IUP_NON_SCROLLABLE_COLS* = "NON_SCROLLABLE_COLS"
  IUP_NON_SCROLLABLE_LINES* = "NON_SCROLLABLE_LINES"
  IUP_NOOVERWRITEPROMPT* = "NOOVERWRITEPROMPT"
  IUP_NORTH* = "NORTH"
  IUP_NUM_CELLS* = "NUM_CELLS"
  IUP_NUMCOL* = "NUMCOL"
  IUP_NUMCOL_VISIBLE* = "NUMCOL_VISIBLE"
  IUP_NUMLIN* = "NUMLIN"
  IUP_NUMLIN_VISIBLE* = "NUMLIN_VISIBLE"
  IUP_NUM_PARTS* = "NUM_PARTS"
  IUP_NW* = "NW"
  IUP_OFF* = "OFF"
  IUP_ON* = "ON"
  IUP_OPEN_CB* = "OPEN_CB"
  IUP_OPENHAND* = "OPENHAND"
  IUP_OPEN* = "OPEN"
  IUP_ORIENTATION* = "ORIENTATION"
  IUP_ORIGIN* = "ORIGIN"
  IUP_PARENTDIALOG* = "PARENTDIALOG"
  IUP_PARENT* = "PARENT"
  IUP_PEN* = "PEN"
  IUP_PGDN* = "PGDN"
  IUP_PGUP* = "PGUP"
  IUP_PORTUGUESE* = "PORTUGUESE"
  IUP_POSX* = "POSX"
  IUP_POSY* = "POSY"
  IUP_PREVIEW_SIZE* = "PREVIEW_SIZE"
  IUP_PREVIOUS* = "PREVIOUS"
  IUP_PREVIOUSVALUE* = "PREVIOUSVALUE"
  IUP_PRIMARY_CELL* = "PRIMARY_CELL"
  IUP_QUARTER* = "QUARTER"
  IUP_RASTERSIZE* = "RASTERSIZE"
  IUP_READONLY* = "READONLY"
  IUP_RED* = "255 0 0"
  IUP_REDRAW* = "REDRAW"
  IUP_RENAMENODE_CB* = "RENAMENODE_CB"
  IUP_REPAINT* = "REPAINT"
  IUP_RESIZE_CB* = "RESIZE_CB"
  IUP_RESIZE_C* = "RESIZE_C"
  IUP_RESIZE_E* = "RESIZE_E"
  IUP_RESIZEMATRIX* = "RESIZEMATRIX"
  IUP_RESIZE_NE* = "RESIZE_NE"
  IUP_RESIZE_N* = "RESIZE_N"
  IUP_RESIZE_NW* = "RESIZE_NW"
  IUP_RESIZE* = "RESIZE"
  IUP_RESIZE_SE* = "RESIZE_SE"
  IUP_RESIZE_S* = "RESIZE_S"
  IUP_RESIZE_SW* = "RESIZE_SW"
  IUP_RESIZE_W* = "RESIZE_W"
  IUP_RGB* = "RGB"
  IUP_RIGHTCLICK_CB* = "RIGHTCLICK_CB"
  IUP_ROOT* = "ROOT"
  IUP_RUN* = "RUN"
  IUP_SAVE* = "SAVE"
  IUP_SBH* = "SBH"
  IUP_SBV* = "SBV"
  IUP_SCREENSIZE* = "SCREENSIZE"
  IUP_SCROLLBAR* = "SCROLLBAR"
  IUP_SCROLL_CB* = "SCROLL_CB"
  IUP_SCROLLING_CB* = "SCROLLING_CB"
  IUP_SECONDARY_CELL* = "SECONDARY_CELL"
  IUP_SELECT_CB* = "SELECT_CB"
  IUP_SELECTED* = "SELECTED"
  IUP_SELECTEDTEXT* = "SELECTEDTEXT"
  IUP_SELECTION_CB* = "SELECTION_CB"
  IUP_SELECTION* = "SELECTION"
  IUP_SEPARATOR* = "SEPARATOR"
  IUP_SE* = "SE"
  IUP_SHADOWED* = "SHADOWED"
  IUP_SHIFT* = "SHIFT"
  IUP_SHOW_CB* = "SHOW_CB"
  IUP_SHOW_PREVIEW* = "SHOW_PREVIEW"
  IUP_SHOW_SECONDARY* = "SHOW_SECONDARY"
  IUP_SHRINK* = "SHRINK"
  IUP_SIZE* = "SIZE"
  IUP_SOUTH* = "SOUTH"
  IUP_SQUARED* = "SQUARED"
  IUP_STARTFOCUS* = "STARTFOCUS"
  IUP_STARTING* = "STARTING"
  IUP_STATE* = "STATE"
  IUP_STATUS* = "STATUS"
  IUP_SWITCH_CB* = "SWITCH_CB"
  IUP_SW* = "SW"
  IUP_SYSTEMLANGUAGE* = "SYSTEMLANGUAGE"
  IUP_SYSTEM* = "SYSTEM"
  IUP_TEXT* = "TEXT"
  IUP_THIRD* = "THIRD"
  IUP_TIME* = "TIME"
  IUP_TIP* = "TIP"
  IUP_TITLE* = "TITLE"
  IUP_TOOLBOX* = "TOOLBOX"
  IUP_TOPMOST* = "TOPMOST"
  IUP_TRANSPARENCY* = "TRANSPARENCY"
  IUP_TRANSPARENT* = "TRANSPARENT"
  IUP_USERNAME* = "USERNAME"
  IUP_VALUE_CB* = "VALUE_CB"
  IUP_VALUE_EDIT_CB* = "VALUE_EDIT_CB"
  IUP_VALUE* = "VALUE"
  IUP_VERTICAL* = "VERTICAL"
  IUP_VISIBLE_ITEMS* = "VISIBLE_ITEMS"
  IUP_VISIBLE* = "VISIBLE"
  IUP_VSPAN_CB* = "VSPAN_CB"
  IUP_WEST* = "WEST"
  IUP_WHEEL_CB* = "WHEEL_CB"
  IUP_WIDTH_CB* = "WIDTH_CB"
  IUP_WIDTHDEF* = "WIDTHDEF"
  IUP_WIDTH* = "WIDTH"
  IUP_WID* = "WID"
  IUP_WIN_SAVEBITS* = "WIN_SAVEBITS"
  IUP_WOM_CB* = "WOM_CB"
  IUP_XMAX* = "XMAX"
  IUP_XMIN* = "XMIN"
  IUP_X* = "X"
  IUP_YES* = "YES"
  IUP_YMAX* = "YMAX"
  IUP_YMIN* = "YMIN"
  IUP_Y* = "Y"
