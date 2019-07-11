{.deadCodeElim: on.}

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

when defined(windows):
  const 
        libiupSONAME = "iup.dll"
        libiupcdSONAME = "libiupcd.dll"
        libiupcontrolsSONAME = "libiupcontrols.dll"
        libiupglcontrolsSONAME = "libiupglcontrols.dll"
        libiupglSONAME = "libiupgl.dll"
        libiupimglibSONAME = "libiupimglib.dll"
        libiupimSONAME = "libiupim.dll"
        libiup_mglplotSONAME = "libiup_mglplot.dll"
        libiup_plotSONAME = "libiup_plot.dll"
        libiup_scintillaSONAME = "libiup_scintilla.dll"
        libiuptuioSONAME = "libiuptuio.dll"
        libiupwebSONAME = "libiupweb.dll"
elif defined(macosx):
  const 
        libiupSONAME = "libiup.dylib"
        libiupcdSONAME = "libiupcd.dylib"
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

proc imFileOpen*(file_name: cstring; error: ptr imErrorCodes): ptr imFile {.cdecl,
    importc: "imFileOpen", dynlib: libiupimSONAME.}
proc imFileOpenAs*(file_name: cstring; format: cstring; error: ptr imErrorCodes): ptr imFile {.
    cdecl, importc: "imFileOpenAs", dynlib: libiupimSONAME.}
proc imFileNew*(file_name: cstring; format: cstring; error: ptr imErrorCodes): ptr imFile {.cdecl,
    importc: "imFileNew", dynlib: libiupimSONAME.}
proc imFileClose*(ifile: ptr imFile) {.cdecl, importc: "imFileClose",
                                   dynlib: libiupimSONAME.}
proc imFileHandle*(ifile: ptr imFile; index: cint): pointer {.cdecl,
    importc: "imFileHandle", dynlib: libiupimSONAME.}
proc imFileGetInfo*(ifile: ptr imFile; format: cstring; compression: cstring;
                   image_count: ptr cint) {.cdecl, importc: "imFileGetInfo",
    dynlib: libiupimSONAME.}
proc imFileSetInfo*(ifile: ptr imFile; compression: cstring) {.cdecl,
    importc: "imFileSetInfo", dynlib: libiupimSONAME.}
proc imFileSetAttribute*(ifile: ptr imFile; attrib: cstring; data_type: imDataType;
                        count: cint; data: pointer) {.cdecl,
    importc: "imFileSetAttribute", dynlib: libiupimSONAME.}
proc imFileSetAttribInteger*(ifile: ptr imFile; attrib: cstring; data_type: imDataType;
                            value: cint) {.cdecl,
    importc: "imFileSetAttribInteger", dynlib: libiupimSONAME.}
proc imFileSetAttribReal*(ifile: ptr imFile; attrib: cstring; data_type: imDataType;
                         value: cdouble) {.cdecl, importc: "imFileSetAttribReal",
    dynlib: libiupimSONAME.}
proc imFileSetAttribString*(ifile: ptr imFile; attrib: cstring; value: cstring) {.cdecl,
    importc: "imFileSetAttribString", dynlib: libiupimSONAME.}
proc imFileGetAttribute*(ifile: ptr imFile; attrib: cstring; data_type: ptr cint;
                        count: ptr cint): pointer {.cdecl,
    importc: "imFileGetAttribute", dynlib: libiupimSONAME.}
proc imFileGetAttribInteger*(ifile: ptr imFile; attrib: cstring; index: cint): cint {.
    cdecl, importc: "imFileGetAttribInteger", dynlib: libiupimSONAME.}
proc imFileGetAttribReal*(ifile: ptr imFile; attrib: cstring; index: cint): cdouble {.
    cdecl, importc: "imFileGetAttribReal", dynlib: libiupimSONAME.}
proc imFileGetAttribString*(ifile: ptr imFile; attrib: cstring): cstring {.cdecl,
    importc: "imFileGetAttribString", dynlib: libiupimSONAME.}
proc imFileGetAttributeList*(ifile: ptr imFile; attrib: cstringArray;
                            attrib_count: ptr cint) {.cdecl,
    importc: "imFileGetAttributeList", dynlib: libiupimSONAME.}
proc imFileGetPalette*(ifile: ptr imFile; palette: ptr clong; palette_count: ptr cint) {.
    cdecl, importc: "imFileGetPalette", dynlib: libiupimSONAME.}
proc imFileSetPalette*(ifile: ptr imFile; palette: ptr clong; palette_count: cint) {.
    cdecl, importc: "imFileSetPalette", dynlib: libiupimSONAME.}
proc imFileReadImageInfo*(ifile: ptr imFile; index: cint; width: ptr cint;
                         height: ptr cint; file_color_mode: ptr cint;
                         file_data_type: ptr cint): cint {.cdecl,
    importc: "imFileReadImageInfo", dynlib: libiupimSONAME.}
proc imFileWriteImageInfo*(ifile: ptr imFile; width: cint; height: cint;
                          user_color_mode: cint; user_data_type: cint): cint {.cdecl,
    importc: "imFileWriteImageInfo", dynlib: libiupimSONAME.}
proc imFileReadImageData*(ifile: ptr imFile; data: pointer; convert2bitmap: cint;
                         color_mode_flags: cint): cint {.cdecl,
    importc: "imFileReadImageData", dynlib: libiupimSONAME.}
proc imFileWriteImageData*(ifile: ptr imFile; data: pointer): cint {.cdecl,
    importc: "imFileWriteImageData", dynlib: libiupimSONAME.}
proc imFormatRegisterInternal*() {.cdecl, importc: "imFormatRegisterInternal",
                                 dynlib: libiupimSONAME.}
proc imFormatRemoveAll*() {.cdecl, importc: "imFormatRemoveAll",
                          dynlib: libiupimSONAME.}
proc imFormatList*(format_list: cstringArray; format_count: ptr cint) {.cdecl,
    importc: "imFormatList", dynlib: libiupimSONAME.}
proc imFormatInfo*(format: cstring; desc: cstring; ext: cstring; can_sequence: ptr cint): cint {.
    cdecl, importc: "imFormatInfo", dynlib: libiupimSONAME.}
proc imFormatInfoExtra*(format: cstring; extra: cstring): cint {.cdecl,
    importc: "imFormatInfoExtra", dynlib: libiupimSONAME.}
proc imFormatCompressions*(format: cstring; comp: cstringArray; comp_count: ptr cint;
                          color_mode: cint; data_type: imDataType): cint {.cdecl,
    importc: "imFormatCompressions", dynlib: libiupimSONAME.}
proc imFormatCanWriteImage*(format: cstring; compression: cstring; color_mode: cint;
                           data_type: imDataType): cint {.cdecl,
    importc: "imFormatCanWriteImage", dynlib: libiupimSONAME.}
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
    data*: ptr pointer
    palette*: ptr clong
    palette_count*: cint
    attrib_table*: pointer


proc imImageCreate*(width: cint; height: cint; color_space: imColorSpace; data_type: imDataType): ptr imImage {.
    cdecl, importc: "imImageCreate", dynlib: libiupimSONAME.}
proc imImageInit*(width: cint; height: cint; color_mode: cint; data_type: imDataType;
                 data_buffer: pointer; palette: ptr clong; palette_count: cint): ptr imImage {.
    cdecl, importc: "imImageInit", dynlib: libiupimSONAME.}
proc imImageCreateBased*(image: ptr imImage; width: cint; height: cint;
                        color_space: imColorSpace; data_type: imDataType): ptr imImage {.cdecl,
    importc: "imImageCreateBased", dynlib: libiupimSONAME.}
proc imImageDestroy*(image: ptr imImage) {.cdecl, importc: "imImageDestroy",
                                       dynlib: libiupimSONAME.}
proc imImageAddAlpha*(image: ptr imImage) {.cdecl, importc: "imImageAddAlpha",
                                        dynlib: libiupimSONAME.}
proc imImageSetAlpha*(image: ptr imImage; alpha: cfloat) {.cdecl,
    importc: "imImageSetAlpha", dynlib: libiupimSONAME.}
proc imImageRemoveAlpha*(image: ptr imImage) {.cdecl, importc: "imImageRemoveAlpha",
    dynlib: libiupimSONAME.}
proc imImageReshape*(image: ptr imImage; width: cint; height: cint) {.cdecl,
    importc: "imImageReshape", dynlib: libiupimSONAME.}
proc imImageCopy*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl,
    importc: "imImageCopy", dynlib: libiupimSONAME.}
proc imImageCopyData*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl,
    importc: "imImageCopyData", dynlib: libiupimSONAME.}
proc imImageCopyAttributes*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl,
    importc: "imImageCopyAttributes", dynlib: libiupimSONAME.}
proc imImageMergeAttributes*(src_image: ptr imImage; dst_image: ptr imImage) {.cdecl,
    importc: "imImageMergeAttributes", dynlib: libiupimSONAME.}
proc imImageCopyPlane*(src_image: ptr imImage; src_plane: cint;
                      dst_image: ptr imImage; dst_plane: cint) {.cdecl,
    importc: "imImageCopyPlane", dynlib: libiupimSONAME.}
proc imImageDuplicate*(image: ptr imImage): ptr imImage {.cdecl,
    importc: "imImageDuplicate", dynlib: libiupimSONAME.}
proc imImageClone*(image: ptr imImage): ptr imImage {.cdecl, importc: "imImageClone",
    dynlib: libiupimSONAME.}
proc imImageSetAttribute*(image: ptr imImage; attrib: cstring; data_type: imDataType;
                         count: cint; data: pointer) {.cdecl,
    importc: "imImageSetAttribute", dynlib: libiupimSONAME.}
proc imImageSetAttribInteger*(image: ptr imImage; attrib: cstring; data_type: imDataType;
                             value: cint) {.cdecl,
    importc: "imImageSetAttribInteger", dynlib: libiupimSONAME.}
proc imImageSetAttribReal*(image: ptr imImage; attrib: cstring; data_type: imDataType;
                          value: cdouble) {.cdecl, importc: "imImageSetAttribReal",
    dynlib: libiupimSONAME.}
proc imImageSetAttribString*(image: ptr imImage; attrib: cstring; value: cstring) {.
    cdecl, importc: "imImageSetAttribString", dynlib: libiupimSONAME.}
proc imImageGetAttribute*(image: ptr imImage; attrib: cstring; data_type: ptr cint;
                         count: ptr cint): pointer {.cdecl,
    importc: "imImageGetAttribute", dynlib: libiupimSONAME.}
proc imImageGetAttribInteger*(image: ptr imImage; attrib: cstring; index: cint): cint {.
    cdecl, importc: "imImageGetAttribInteger", dynlib: libiupimSONAME.}
proc imImageGetAttribReal*(image: ptr imImage; attrib: cstring; index: cint): cdouble {.
    cdecl, importc: "imImageGetAttribReal", dynlib: libiupimSONAME.}
proc imImageGetAttribString*(image: ptr imImage; attrib: cstring): cstring {.cdecl,
    importc: "imImageGetAttribString", dynlib: libiupimSONAME.}
proc imImageGetAttributeList*(image: ptr imImage; attrib: cstringArray;
                             attrib_count: ptr cint) {.cdecl,
    importc: "imImageGetAttributeList", dynlib: libiupimSONAME.}
proc imImageClear*(image: ptr imImage) {.cdecl, importc: "imImageClear",
                                     dynlib: libiupimSONAME.}
proc imImageIsBitmap*(image: ptr imImage): cint {.cdecl, importc: "imImageIsBitmap",
    dynlib: libiupimSONAME.}
proc imImageSetPalette*(image: ptr imImage; palette: ptr clong; palette_count: cint) {.
    cdecl, importc: "imImageSetPalette", dynlib: libiupimSONAME.}
proc imImageMatchSize*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl,
    importc: "imImageMatchSize", dynlib: libiupimSONAME.}
proc imImageMatchColor*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl,
    importc: "imImageMatchColor", dynlib: libiupimSONAME.}
proc imImageMatchDataType*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl,
    importc: "imImageMatchDataType", dynlib: libiupimSONAME.}
proc imImageMatchColorSpace*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl,
    importc: "imImageMatchColorSpace", dynlib: libiupimSONAME.}
proc imImageMatch*(image1: ptr imImage; image2: ptr imImage): cint {.cdecl,
    importc: "imImageMatch", dynlib: libiupimSONAME.}
proc imImageSetMap*(image: ptr imImage) {.cdecl, importc: "imImageSetMap",
                                      dynlib: libiupimSONAME.}
proc imImageSetBinary*(image: ptr imImage) {.cdecl, importc: "imImageSetBinary",
    dynlib: libiupimSONAME.}
proc imImageSetGray*(image: ptr imImage) {.cdecl, importc: "imImageSetGray",
                                       dynlib: libiupimSONAME.}
proc imImageMakeBinary*(image: ptr imImage) {.cdecl, importc: "imImageMakeBinary",
    dynlib: libiupimSONAME.}
proc imImageMakeGray*(image: ptr imImage) {.cdecl, importc: "imImageMakeGray",
                                        dynlib: libiupimSONAME.}
proc imFileLoadImage*(ifile: ptr imFile; index: cint; error: ptr imErrorCodes): ptr imImage {.
    cdecl, importc: "imFileLoadImage", dynlib: libiupimSONAME.}
proc imFileLoadImageFrame*(ifile: ptr imFile; index: cint; image: ptr imImage;
                          error: ptr imErrorCodes) {.cdecl, importc: "imFileLoadImageFrame",
    dynlib: libiupimSONAME.}
proc imFileLoadBitmap*(ifile: ptr imFile; index: cint; error: ptr imErrorCodes): ptr imImage {.
    cdecl, importc: "imFileLoadBitmap", dynlib: libiupimSONAME.}
proc imFileLoadImageRegion*(ifile: ptr imFile; index: cint; bitmap: cint;
                           error: ptr imErrorCodes; xmin: cint; xmax: cint; ymin: cint;
                           ymax: cint; width: cint; height: cint): ptr imImage {.cdecl,
    importc: "imFileLoadImageRegion", dynlib: libiupimSONAME.}
proc imFileLoadBitmapFrame*(ifile: ptr imFile; index: cint; image: ptr imImage;
                           error: ptr imErrorCodes) {.cdecl,
    importc: "imFileLoadBitmapFrame", dynlib: libiupimSONAME.}
proc imFileSaveImage*(ifile: ptr imFile; image: ptr imImage): cint {.cdecl,
    importc: "imFileSaveImage", dynlib: libiupimSONAME.}
proc imFileImageLoad*(file_name: cstring; index: cint; error: ptr imErrorCodes): ptr imImage {.
    cdecl, importc: "imFileImageLoad", dynlib: libiupimSONAME.}
proc imFileImageLoadBitmap*(file_name: cstring; index: cint; error: ptr imErrorCodes): ptr imImage {.
    cdecl, importc: "imFileImageLoadBitmap", dynlib: libiupimSONAME.}
proc imFileImageLoadRegion*(file_name: cstring; index: cint; bitmap: cint;
                           error: ptr imErrorCodes; xmin: cint; xmax: cint; ymin: cint;
                           ymax: cint; width: cint; height: cint): ptr imImage {.cdecl,
    importc: "imFileImageLoadRegion", dynlib: libiupimSONAME.}
proc imFileImageSave*(file_name: cstring; format: cstring; image: ptr imImage): imErrorCodes {.
    cdecl, importc: "imFileImageSave", dynlib: libiupimSONAME.}
template imcdCanvasPutImage*(x_canvas, x_image, x_x, x_y, x_w, x_h, x_xmin, x_xmax, x_ymin, x_ymax: untyped): void =
  if x_image.color_space == IM_RGB:
    if x_image.has_alpha:
      cdCanvasPutImageRectRGBA(x_canvas, x_image.width, x_image.height,
                               cast[ptr cuchar](x_image.data[0]),
                               cast[ptr cuchar](x_image.data[1]),
                               cast[ptr cuchar](x_image.data[2]),
                               cast[ptr cuchar](x_image.data[3]), x_x, x_y, x_w, x_h,
                               x_xmin, x_xmax, x_ymin, x_ymax)
    else:
      cdCanvasPutImageRectRGB(x_canvas, x_image.width, x_image.height,
                              cast[ptr cuchar](x_image.data[0]),
                              cast[ptr cuchar](x_image.data[1]),
                              cast[ptr cuchar](x_image.data[2]), x_x, x_y, x_w, x_h, x_xmin,
                              x_xmax, x_ymin, x_ymax)
  else:
    cdCanvasPutImageRectMap(x_canvas, x_image.width, x_image.height,
                            cast[ptr cuchar](x_image.data[0]), x_image.palette, x_x,
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


proc imConvertDataType*(src_image: ptr imImage; dst_image: ptr imImage; cpx2real: cint;
                       gamma: cfloat; absolute: cint; cast_mode: cint): cint {.cdecl,
    importc: "imConvertDataType", dynlib: libiupimSONAME.}
proc imConvertColorSpace*(src_image: ptr imImage; dst_image: ptr imImage): cint {.cdecl,
    importc: "imConvertColorSpace", dynlib: libiupimSONAME.}
proc imConvertToBitmap*(src_image: ptr imImage; dst_image: ptr imImage; cpx2real: cint;
                       gamma: cfloat; absolute: cint; cast_mode: cint): cint {.cdecl,
    importc: "imConvertToBitmap", dynlib: libiupimSONAME.}
proc imImageGetOpenGLData*(image: ptr imImage; glformat: ptr cint): pointer {.cdecl,
    importc: "imImageGetOpenGLData", dynlib: libiupimSONAME.}
proc imImageCreateFromOpenGLData*(width: cint; height: cint; glformat: cint;
                                 gldata: pointer): ptr imImage {.cdecl,
    importc: "imImageCreateFromOpenGLData", dynlib: libiupimSONAME.}
proc imConvertPacking*(src_data: pointer; dst_data: pointer; width: cint; height: cint;
                      src_depth: cint; dst_depth: cint; data_type: imDataType;
                      src_is_packed: cint) {.cdecl, importc: "imConvertPacking",
    dynlib: libiupimSONAME.}
proc imConvertMapToRGB*(data: ptr cuchar; count: cint; depth: cint; packed: cint;
                       palette: ptr clong; palette_count: cint) {.cdecl,
    importc: "imConvertMapToRGB", dynlib: libiupimSONAME.}
proc imConvertRGB2Map*(width: cint; height: cint; red: ptr cuchar; green: ptr cuchar;
                      blue: ptr cuchar; map: ptr cuchar; palette: ptr clong;
                      palette_count: ptr cint): cint {.cdecl,
    importc: "imConvertRGB2Map", dynlib: libiupimSONAME.}
#Lib IUP
const
 IUP_NAME* = "IUP - Portable User Interface"
 IUP_DESCRIPTION* = "Multi-platform Toolkit for Building Graphical User Interfaces"
 IUP_COPYRIGHT* = "Copyright (C) 1994-2019 Tecgraf/PUC-Rio"

type
 Ihandle = object
 PIhandle* = ptr Ihandle
 cdContext = object
 uptr_t = clong
 sptr_t = clong
 Icallback* = proc (a1: PIhandle): cint {.cdecl.}

proc Open*(argc: var cint; argv: ptr cstringArray): cint {.cdecl, importc: "IupOpen", dynlib: libiupSONAME.}
proc Close*() {.cdecl, importc: "IupClose", dynlib: libiupSONAME.}
proc ImageLibOpen*() {.cdecl, importc: "IupImageLibOpen", dynlib: libiupimglibSONAME.}
proc MainLoop*(): cint {.cdecl, importc: "IupMainLoop", dynlib: libiupSONAME.}
proc LoopStep*(): cint {.cdecl, importc: "IupLoopStep", dynlib: libiupSONAME.}
proc LoopStepWait*(): cint {.cdecl, importc: "IupLoopStepWait", dynlib: libiupSONAME.}
proc MainLoopLevel*(): cint {.cdecl, importc: "IupMainLoopLevel", dynlib: libiupSONAME.}
proc Flush*() {.cdecl, importc: "IupFlush", dynlib: libiupSONAME.}
proc ExitLoop*() {.cdecl, importc: "IupExitLoop", dynlib: libiupSONAME.}
proc RecordInput*(filename: cstring; mode: cint): cint {.cdecl, importc: "IupRecordInput", dynlib: libiupSONAME.}
proc PlayInput*(filename: cstring): cint {.cdecl, importc: "IupPlayInput", dynlib: libiupSONAME.}
proc Update*(ih: PIhandle) {.cdecl, importc: "IupUpdate", dynlib: libiupSONAME.}
proc UpdateChildren*(ih: PIhandle) {.cdecl, importc: "IupUpdateChildren", dynlib: libiupSONAME.}
proc Redraw*(ih: PIhandle; children: cint) {.cdecl, importc: "IupRedraw", dynlib: libiupSONAME.}
proc Refresh*(ih: PIhandle) {.cdecl, importc: "IupRefresh", dynlib: libiupSONAME.}
proc RefreshChildren*(ih: PIhandle) {.cdecl, importc: "IupRefreshChildren", dynlib: libiupSONAME.}
proc Execute*(filename: cstring; parameters: cstring): cint {.cdecl, importc: "IupExecute", dynlib: libiupSONAME.}
proc ExecuteWait*(filename: cstring; parameters: cstring): cint {.cdecl, importc: "IupExecuteWait", dynlib: libiupSONAME.}
proc Help*(url: cstring): cint {.cdecl, importc: "IupHelp", dynlib: libiupSONAME.}
proc Log*(`type`: cstring; format: cstring) {.varargs, cdecl, importc: "IupLog", dynlib: libiupSONAME.}
proc Load*(filename: cstring): cstring {.cdecl, importc: "IupLoad", dynlib: libiupSONAME.}
proc LoadBuffer*(buffer: cstring): cstring {.cdecl, importc: "IupLoadBuffer", dynlib: libiupSONAME.}
proc Version*(): cstring {.cdecl, importc: "IupVersion", dynlib: libiupSONAME.}
proc VersionDate*(): cstring {.cdecl, importc: "IupVersionDate", dynlib: libiupSONAME.}
proc VersionNumber*(): cint {.cdecl, importc: "IupVersionNumber", dynlib: libiupSONAME.}
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
proc GetChildPos*(ih: PIhandle; child: PIhandle): cint {.cdecl, importc: "IupGetChildPos", dynlib: libiupSONAME.}
proc GetChildCount*(ih: PIhandle): cint {.cdecl, importc: "IupGetChildCount", dynlib: libiupSONAME.}
proc GetNextChild*(ih: PIhandle; child: PIhandle): PIhandle {.cdecl, importc: "IupGetNextChild", dynlib: libiupSONAME.}
proc GetBrother*(ih: PIhandle): PIhandle {.cdecl, importc: "IupGetBrother", dynlib: libiupSONAME.}
proc GetParent*(ih: PIhandle): PIhandle {.cdecl, importc: "IupGetParent", dynlib: libiupSONAME.}
proc GetDialog*(ih: PIhandle): PIhandle {.cdecl, importc: "IupGetDialog", dynlib: libiupSONAME.}
proc GetDialogChild*(ih: PIhandle; name: cstring): PIhandle {.cdecl, importc: "IupGetDialogChild", dynlib: libiupSONAME.}
proc Reparent*(ih: PIhandle; new_parent: PIhandle; ref_child: PIhandle): cint {. cdecl, importc: "IupReparent", dynlib: libiupSONAME.}
proc Popup*(ih: PIhandle; x: cint; y: cint): cint {.cdecl, importc: "IupPopup", dynlib: libiupSONAME.}
proc Show*(ih: PIhandle): cint {.cdecl, importc: "IupShow", dynlib: libiupSONAME.}
proc ShowXY*(ih: PIhandle; x: cint; y: cint): cint {.cdecl, importc: "IupShowXY", dynlib: libiupSONAME.}
proc Hide*(ih: PIhandle): cint {.cdecl, importc: "IupHide", dynlib: libiupSONAME.}
proc Map*(ih: PIhandle): cint {.cdecl, importc: "IupMap", dynlib: libiupSONAME.}
proc Unmap*(ih: PIhandle) {.cdecl, importc: "IupUnmap", dynlib: libiupSONAME.}
proc ResetAttribute*(ih: PIhandle; name: cstring) {.cdecl, importc: "IupResetAttribute", dynlib: libiupSONAME.}
proc GetAllAttributes*(ih: PIhandle; names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllAttributes", dynlib: libiupSONAME.}
proc CopyAttributes*(src_ih: PIhandle; dst_ih: PIhandle) {.cdecl, importc: "IupCopyAttributes", dynlib: libiupSONAME.}
proc SetAtt*(handle_name: cstring; ih: PIhandle; name: cstring): PIhandle {.varargs, cdecl, importc: "IupSetAtt", dynlib: libiupSONAME.}
proc SetAttributes*(ih: PIhandle; str: cstring): PIhandle {.cdecl, importc: "IupSetAttributes", dynlib: libiupSONAME.}
proc GetAttributes*(ih: PIhandle): cstring {.cdecl, importc: "IupGetAttributes", dynlib: libiupSONAME.}
proc SetAttribute*(ih: PIhandle; name: cstring; value: cstring) {.cdecl, importc: "IupSetAttribute", dynlib: libiupSONAME.}
proc SetStrAttribute*(ih: PIhandle; name: cstring; value: cstring) {.cdecl, importc: "IupSetStrAttribute", dynlib: libiupSONAME.}
proc SetStrf*(ih: PIhandle; name: cstring; format: cstring) {.varargs, cdecl, importc: "IupSetStrf", dynlib: libiupSONAME.}
proc SetInt*(ih: PIhandle; name: cstring; value: cint) {.cdecl, importc: "IupSetInt", dynlib: libiupSONAME.}
proc SetFloat*(ih: PIhandle; name: cstring; value: cfloat) {.cdecl, importc: "IupSetFloat", dynlib: libiupSONAME.}
proc SetDouble*(ih: PIhandle; name: cstring; value: cdouble) {.cdecl, importc: "IupSetDouble", dynlib: libiupSONAME.}
proc SetRGB*(ih: PIhandle; name: cstring; r: cuchar; g: cuchar; b: cuchar) {.cdecl, importc: "IupSetRGB", dynlib: libiupSONAME.}
proc GetAttribute*(ih: PIhandle; name: cstring): cstring {.cdecl, importc: "IupGetAttribute", dynlib: libiupSONAME.}
proc GetInt*(ih: PIhandle; name: cstring): cint {.cdecl, importc: "IupGetInt", dynlib: libiupSONAME.}
proc GetInt2*(ih: PIhandle; name: cstring): cint {.cdecl, importc: "IupGetInt2", dynlib: libiupSONAME.}
proc GetIntInt*(ih: PIhandle; name: cstring; i1: var cint; i2: var cint): cint {.cdecl, importc: "IupGetIntInt", dynlib: libiupSONAME.}
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
proc GetIntId*(ih: PIhandle; name: cstring; id: cint): cint {.cdecl, importc: "IupGetIntId", dynlib: libiupSONAME.}
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
proc GetIntId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cint {.cdecl, importc: "IupGetIntId2", dynlib: libiupSONAME.}
proc GetFloatId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cfloat {.cdecl, importc: "IupGetFloatId2", dynlib: libiupSONAME.}
proc GetDoubleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): cdouble {.cdecl, importc: "IupGetDoubleId2", dynlib: libiupSONAME.}
proc GetRGBId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar) {.cdecl, importc: "IupGetRGBId2", dynlib: libiupSONAME.}
proc SetGlobal*(name: cstring; value: cstring) {.cdecl, importc: "IupSetGlobal", dynlib: libiupSONAME.}
proc SetStrGlobal*(name: cstring; value: cstring) {.cdecl, importc: "IupSetStrGlobal", dynlib: libiupSONAME.}
proc GetGlobal*(name: cstring): cstring {.cdecl, importc: "IupGetGlobal", dynlib: libiupSONAME.}
proc SetFocus*(ih: PIhandle): PIhandle {.cdecl, importc: "IupSetFocus", dynlib: libiupSONAME.}
proc GetFocus*(): PIhandle {.cdecl, importc: "IupGetFocus", dynlib: libiupSONAME.}
proc PreviousField*(ih: PIhandle): PIhandle {.cdecl, importc: "IupPreviousField", dynlib: libiupSONAME.}
proc NextField*(ih: PIhandle): PIhandle {.cdecl, importc: "IupNextField", dynlib: libiupSONAME.}
proc GetCallback*(ih: PIhandle; name: cstring): Icallback {.cdecl, importc: "IupGetCallback", dynlib: libiupSONAME.}
proc SetCallback*(ih: PIhandle; name: cstring; `func`: Icallback): Icallback {.cdecl, importc: "IupSetCallback", dynlib: libiupSONAME.}
proc SetCallbacks*(ih: PIhandle; name: cstring; `func`: Icallback): PIhandle {. varargs, cdecl, importc: "IupSetCallbacks", dynlib: libiupSONAME.}
proc GetFunction*(name: cstring): Icallback {.cdecl, importc: "IupGetFunction", dynlib: libiupSONAME.}
proc SetFunction*(name: cstring; `func`: Icallback): Icallback {.cdecl, importc: "IupSetFunction", dynlib: libiupSONAME.}
proc GetHandle*(name: cstring): PIhandle {.cdecl, importc: "IupGetHandle", dynlib: libiupSONAME.}
proc SetHandle*(name: cstring; ih: PIhandle): PIhandle {.cdecl, importc: "IupSetHandle", dynlib: libiupSONAME.}
proc GetAllNames*(names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllNames", dynlib: libiupSONAME.}
proc GetAllDialogs*(names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllDialogs", dynlib: libiupSONAME.}
proc GetName*(ih: PIhandle): cstring {.cdecl, importc: "IupGetName", dynlib: libiupSONAME.}
proc SetAttributeHandle*(ih: PIhandle; name: cstring; ih_named: PIhandle) {.cdecl, importc: "IupSetAttributeHandle", dynlib: libiupSONAME.}
proc GetAttributeHandle*(ih: PIhandle; name: cstring): PIhandle {.cdecl, importc: "IupGetAttributeHandle", dynlib: libiupSONAME.}
proc SetAttributeHandleId*(ih: PIhandle; name: cstring; id: cint; ih_named: PIhandle) {.cdecl, importc: "IupSetAttributeHandleId", dynlib: libiupSONAME.}
proc GetAttributeHandleId*(ih: PIhandle; name: cstring; id: cint): PIhandle {.cdecl, importc: "IupGetAttributeHandleId", dynlib: libiupSONAME.}
proc SetAttributeHandleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; ih_named: PIhandle) {.cdecl, importc: "IupSetAttributeHandleId2", dynlib: libiupSONAME.}
proc GetAttributeHandleId2*(ih: PIhandle; name: cstring; lin: cint; col: cint): PIhandle {. cdecl, importc: "IupGetAttributeHandleId2", dynlib: libiupSONAME.}
proc GetClassName*(ih: PIhandle): cstring {.cdecl, importc: "IupGetClassName", dynlib: libiupSONAME.}
proc GetClassType*(ih: PIhandle): cstring {.cdecl, importc: "IupGetClassType", dynlib: libiupSONAME.}
proc GetAllClasses*(names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetAllClasses", dynlib: libiupSONAME.}
proc GetClassAttributes*(classname: cstring; names: cstringArray; n: cint): cint {. cdecl, importc: "IupGetClassAttributes", dynlib: libiupSONAME.}
proc GetClassCallbacks*(classname: cstring; names: cstringArray; n: cint): cint {.cdecl, importc: "IupGetClassCallbacks", dynlib: libiupSONAME.}
proc SaveClassAttributes*(ih: PIhandle) {.cdecl, importc: "IupSaveClassAttributes", dynlib: libiupSONAME.}
proc CopyClassAttributes*(src_ih: PIhandle; dst_ih: PIhandle) {.cdecl, importc: "IupCopyClassAttributes", dynlib: libiupSONAME.}
proc SetClassDefaultAttribute*(classname: cstring; name: cstring; value: cstring) {. cdecl, importc: "IupSetClassDefaultAttribute", dynlib: libiupSONAME.}
proc ClassMatch*(ih: PIhandle; classname: cstring): cint {.cdecl, importc: "IupClassMatch", dynlib: libiupSONAME.}
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
proc StringCompare*(str1: cstring; str2: cstring; casesensitive: cint; lexicographic: cint): cint {.cdecl, importc: "IupStringCompare", dynlib: libiupSONAME.}
proc SaveImageAsText*(ih: PIhandle; file_name: cstring; format: cstring; name: cstring): cint {.cdecl, importc: "IupSaveImageAsText", dynlib: libiupimSONAME.}
proc TextConvertLinColToPos*(ih: PIhandle; lin: cint; col: cint; pos: var cint) {.cdecl, importc: "IupTextConvertLinColToPos", dynlib: libiupSONAME.}
proc TextConvertPosToLinCol*(ih: PIhandle; pos: cint; lin: var cint; col: var cint) {. cdecl, importc: "IupTextConvertPosToLinCol", dynlib: libiupSONAME.}
proc ConvertXYToPos*(ih: PIhandle; x: cint; y: cint): cint {.cdecl, importc: "IupConvertXYToPos", dynlib: libiupSONAME.}
proc StoreGlobal*(name: cstring; value: cstring) {.cdecl, importc: "IupStoreGlobal", dynlib: libiupSONAME.}
proc StoreAttribute*(ih: PIhandle; name: cstring; value: cstring) {.cdecl, importc: "IupStoreAttribute", dynlib: libiupSONAME.}
proc SetfAttribute*(ih: PIhandle; name: cstring; format: cstring) {.varargs, cdecl, importc: "IupSetfAttribute", dynlib: libiupSONAME.}
proc StoreAttributeId*(ih: PIhandle; name: cstring; id: cint; value: cstring) {.cdecl, importc: "IupStoreAttributeId", dynlib: libiupSONAME.}
proc SetfAttributeId*(ih: PIhandle; name: cstring; id: cint; f: cstring) {.varargs, cdecl, importc: "IupSetfAttributeId", dynlib: libiupSONAME.}
proc StoreAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; value: cstring) {.cdecl, importc: "IupStoreAttributeId2", dynlib: libiupSONAME.}
proc SetfAttributeId2*(ih: PIhandle; name: cstring; lin: cint; col: cint; format: cstring) {.varargs, cdecl, importc: "IupSetfAttributeId2", dynlib: libiupSONAME.}
proc TreeSetUserId*(ih: PIhandle; id: cint; userid: pointer): cint {.cdecl, importc: "IupTreeSetUserId", dynlib: libiupSONAME.}
proc TreeGetUserId*(ih: PIhandle; id: cint): pointer {.cdecl, importc: "IupTreeGetUserId", dynlib: libiupSONAME.}
proc TreeGetId*(ih: PIhandle; userid: pointer): cint {.cdecl, importc: "IupTreeGetId", dynlib: libiupSONAME.}
proc TreeSetAttributeHandle*(ih: PIhandle; name: cstring; id: cint; ih_named: PIhandle) {.cdecl, importc: "IupTreeSetAttributeHandle", dynlib: libiupSONAME.}
proc FileDlg*(): PIhandle {.cdecl, importc: "IupFileDlg", dynlib: libiupSONAME.}
proc MessageDlg*(): PIhandle {.cdecl, importc: "IupMessageDlg", dynlib: libiupSONAME.}
proc ColorDlg*(): PIhandle {.cdecl, importc: "IupColorDlg", dynlib: libiupSONAME.}
proc FontDlg*(): PIhandle {.cdecl, importc: "IupFontDlg", dynlib: libiupSONAME.}
proc ProgressDlg*(): PIhandle {.cdecl, importc: "IupProgressDlg", dynlib: libiupSONAME.}
proc GetFile*(arq: cstring): cint {.cdecl, importc: "IupGetFile", dynlib: libiupSONAME.}
proc Message*(title: cstring; msg: cstring) {.cdecl, importc: "IupMessage", dynlib: libiupSONAME.}
proc Messagef*(title: cstring; format: cstring) {.varargs, cdecl, importc: "IupMessagef", dynlib: libiupSONAME.}
proc MessageError*(parent: PIhandle; message: cstring) {.cdecl, importc: "IupMessageError", dynlib: libiupSONAME.}
proc MessageAlarm*(parent: PIhandle; title: cstring; message: cstring; buttons: cstring): cint {.cdecl, importc: "IupMessageAlarm", dynlib: libiupSONAME.}
proc Alarm*(title: cstring; msg: cstring; b1: cstring; b2: cstring; b3: cstring): cint {. cdecl, importc: "IupAlarm", dynlib: libiupSONAME.}
proc Scanf*(format: cstring): cint {.varargs, cdecl, importc: "IupScanf", dynlib: libiupSONAME.}
proc ListDialog*(`type`: cint; title: cstring; size: cint; list: cstringArray; op: cint; max_col: cint; max_lin: cint; marks: var cint): cint {.cdecl, importc: "IupListDialog", dynlib: libiupSONAME.}
proc GetText*(title: cstring; text: cstring; maxsize: cint): cint {.cdecl, importc: "IupGetText", dynlib: libiupSONAME.}
proc GetColor*(x: cint; y: cint; r: ptr cuchar; g: ptr cuchar; b: ptr cuchar): cint {.cdecl, importc: "IupGetColor", dynlib: libiupSONAME.}
type
 Iparamcb* = proc (dialog: PIhandle; param_index: cint; user_data: pointer): cint {. cdecl.}

proc GetParam*(title: cstring; action: Iparamcb; user_data: pointer; format: cstring): cint {. varargs, cdecl, importc: "IupGetParam", dynlib: libiupSONAME.}
proc GetParamv*(title: cstring; action: Iparamcb; user_data: pointer; format: cstring; param_count: cint; param_extra: cint; param_data: ptr pointer): cint {. cdecl, importc: "IupGetParamv", dynlib: libiupSONAME.}
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
proc ConfigLoad*(ih: PIhandle): cint {.cdecl, importc: "IupConfigLoad", dynlib: libiupSONAME.}
proc ConfigSave*(ih: PIhandle): cint {.cdecl, importc: "IupConfigSave", dynlib: libiupSONAME.}
proc ConfigSetVariableStr*(ih: PIhandle; group: cstring; key: cstring; value: cstring) {. cdecl, importc: "IupConfigSetVariableStr", dynlib: libiupSONAME.}
proc ConfigSetVariableStrId*(ih: PIhandle; group: cstring; key: cstring; id: cint; value: cstring) {.cdecl, importc: "IupConfigSetVariableStrId", dynlib: libiupSONAME.}
proc ConfigSetVariableInt*(ih: PIhandle; group: cstring; key: cstring; value: cint) {. cdecl, importc: "IupConfigSetVariableInt", dynlib: libiupSONAME.}
proc ConfigSetVariableIntId*(ih: PIhandle; group: cstring; key: cstring; id: cint; value: cint) {.cdecl, importc: "IupConfigSetVariableIntId", dynlib: libiupSONAME.}
proc ConfigSetVariableDouble*(ih: PIhandle; group: cstring; key: cstring; value: cdouble) {.cdecl, importc: "IupConfigSetVariableDouble", dynlib: libiupSONAME.}
proc ConfigSetVariableDoubleId*(ih: PIhandle; group: cstring; key: cstring; id: cint; value: cdouble) {.cdecl, importc: "IupConfigSetVariableDoubleId", dynlib: libiupSONAME.}
proc ConfigGetVariableStr*(ih: PIhandle; group: cstring; key: cstring): cstring {. cdecl, importc: "IupConfigGetVariableStr", dynlib: libiupSONAME.}
proc ConfigGetVariableStrId*(ih: PIhandle; group: cstring; key: cstring; id: cint): cstring {. cdecl, importc: "IupConfigGetVariableStrId", dynlib: libiupSONAME.}
proc ConfigGetVariableInt*(ih: PIhandle; group: cstring; key: cstring): cint {.cdecl, importc: "IupConfigGetVariableInt", dynlib: libiupSONAME.}
proc ConfigGetVariableIntId*(ih: PIhandle; group: cstring; key: cstring; id: cint): cint {. cdecl, importc: "IupConfigGetVariableIntId", dynlib: libiupSONAME.}
proc ConfigGetVariableDouble*(ih: PIhandle; group: cstring; key: cstring): cdouble {. cdecl, importc: "IupConfigGetVariableDouble", dynlib: libiupSONAME.}
proc ConfigGetVariableDoubleId*(ih: PIhandle; group: cstring; key: cstring; id: cint): cdouble {. cdecl, importc: "IupConfigGetVariableDoubleId", dynlib: libiupSONAME.}
proc ConfigGetVariableStrDef*(ih: PIhandle; group: cstring; key: cstring; def: cstring): cstring {.cdecl, importc: "IupConfigGetVariableStrDef", dynlib: libiupSONAME.}
proc ConfigGetVariableStrIdDef*(ih: PIhandle; group: cstring; key: cstring; id: cint; def: cstring): cstring {.cdecl, importc: "IupConfigGetVariableStrIdDef", dynlib: libiupSONAME.}
proc ConfigGetVariableIntDef*(ih: PIhandle; group: cstring; key: cstring; def: cint): cint {. cdecl, importc: "IupConfigGetVariableIntDef", dynlib: libiupSONAME.}
proc ConfigGetVariableIntIdDef*(ih: PIhandle; group: cstring; key: cstring; id: cint; def: cint): cint {.cdecl, importc: "IupConfigGetVariableIntIdDef", dynlib: libiupSONAME.}
proc ConfigGetVariableDoubleDef*(ih: PIhandle; group: cstring; key: cstring; def: cdouble): cdouble {.cdecl, importc: "IupConfigGetVariableDoubleDef", dynlib: libiupSONAME.}
proc ConfigGetVariableDoubleIdDef*(ih: PIhandle; group: cstring; key: cstring; id: cint; def: cdouble): cdouble {.cdecl, importc: "IupConfigGetVariableDoubleIdDef", dynlib: libiupSONAME.}
proc ConfigCopy*(ih1: PIhandle; ih2: PIhandle; exclude_prefix: cstring) {.cdecl, importc: "IupConfigCopy", dynlib: libiupSONAME.}
proc ConfigSetListVariable*(ih: PIhandle; group: cstring; key: cstring; value: cstring; add: cint) {.cdecl, importc: "IupConfigSetListVariable", dynlib: libiupSONAME.}
proc ConfigRecentInit*(ih: PIhandle; menu: PIhandle; recent_cb: Icallback; max_recent: cint) {.cdecl, importc: "IupConfigRecentInit", dynlib: libiupSONAME.}
proc ConfigRecentUpdate*(ih: PIhandle; filename: cstring) {.cdecl, importc: "IupConfigRecentUpdate", dynlib: libiupSONAME.}
proc ConfigDialogShow*(ih: PIhandle; dialog: PIhandle; name: cstring) {.cdecl, importc: "IupConfigDialogShow", dynlib: libiupSONAME.}
proc ConfigDialogClosed*(ih: PIhandle; dialog: PIhandle; name: cstring) {.cdecl, importc: "IupConfigDialogClosed", dynlib: libiupSONAME.}
proc ControlsOpen*(): cint {.cdecl, importc: "IupControlsOpen", dynlib: libiupcontrolsSONAME.}
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
proc NewFileDlgOpen*(): cint {.cdecl, importc: "IupNewFileDlgOpen", dynlib: libiupSONAME.}
proc GLControlsOpen*(): cint {.cdecl, importc: "IupGLControlsOpen", dynlib: libiupglcontrolsSONAME.}
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
 IUP_YES* = "YES"
 IUP_NO* = "NO"

proc GLCanvasOpen*() {.cdecl, importc: "IupGLCanvasOpen", dynlib: libiupglSONAME.}
proc GLCanvas*(action: cstring): PIhandle {.cdecl, importc: "IupGLCanvas", dynlib: libiupglSONAME.}
proc GLBackgroundBox*(child: PIhandle): PIhandle {.cdecl, importc: "IupGLBackgroundBox", dynlib: libiupglSONAME.}
proc GLMakeCurrent*(ih: PIhandle) {.cdecl, importc: "IupGLMakeCurrent", dynlib: libiupglSONAME.}
proc GLIsCurrent*(ih: PIhandle): cint {.cdecl, importc: "IupGLIsCurrent", dynlib: libiupglSONAME.}
proc GLSwapBuffers*(ih: PIhandle) {.cdecl, importc: "IupGLSwapBuffers", dynlib: libiupglSONAME.}
proc GLPalette*(ih: PIhandle; index: cint; r: cfloat; g: cfloat; b: cfloat) {.cdecl, importc: "IupGLPalette", dynlib: libiupglSONAME.}
proc GLUseFont*(ih: PIhandle; first: cint; count: cint; list_base: cint) {.cdecl, importc: "IupGLUseFont", dynlib: libiupglSONAME.}
proc GLWait*(gl: cint) {.cdecl, importc: "IupGLWait", dynlib: libiupglSONAME.}
proc LoadImage*(file_name: cstring): PIhandle {.cdecl, importc: "IupLoadImage", dynlib: libiupimSONAME.}
proc SaveImage*(ih: PIhandle; file_name: cstring; format: cstring): cint {.cdecl, importc: "IupSaveImage", dynlib: libiupimSONAME.}
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
proc MglPlotEnd*(ih: PIhandle): cint {.cdecl, importc: "IupMglPlotEnd", dynlib: libiup_mglplotSONAME.}
proc MglPlotNewDataSet*(ih: PIhandle; dim: cint): cint {.cdecl, importc: "IupMglPlotNewDataSet", dynlib: libiup_mglplotSONAME.}
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
proc PlotEnd*(ih: PIhandle): cint {.cdecl, importc: "IupPlotEnd", dynlib: libiup_plotSONAME.}
proc PlotLoadData*(ih: PIhandle; filename: cstring; strXdata: cint): cint {.cdecl, importc: "IupPlotLoadData", dynlib: libiup_plotSONAME.}
proc PlotSetFormula*(ih: PIhandle; sample_count: cint; formula: cstring; init: cstring): cint {.cdecl, importc: "IupPlotSetFormula", dynlib: libiup_plotSONAME.}
proc PlotInsert*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotInsert", dynlib: libiup_plotSONAME.}
proc PlotInsertStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstring; y: cdouble) {.cdecl, importc: "IupPlotInsertStr", dynlib: libiup_plotSONAME.}
proc PlotInsertSegment*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotInsertSegment", dynlib: libiup_plotSONAME.}
proc PlotInsertStrSamples*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstringArray; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotInsertStrSamples", dynlib: libiup_plotSONAME.}
proc PlotInsertSamples*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotInsertSamples", dynlib: libiup_plotSONAME.}
proc PlotAddSamples*(ih: PIhandle; ds_index: cint; x: ptr cdouble; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotAddSamples", dynlib: libiup_plotSONAME.}
proc PlotAddStrSamples*(ih: PIhandle; ds_index: cint; x: cstringArray; y: ptr cdouble; count: cint) {.cdecl, importc: "IupPlotAddStrSamples", dynlib: libiup_plotSONAME.}
proc PlotGetSample*(ih: PIhandle; ds_index: cint; sample_index: cint; x: ptr cdouble; y: ptr cdouble) {.cdecl, importc: "IupPlotGetSample", dynlib: libiup_plotSONAME.}
proc PlotGetSampleStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstringArray; y: ptr cdouble) {.cdecl, importc: "IupPlotGetSampleStr", dynlib: libiup_plotSONAME.}
proc PlotGetSampleSelection*(ih: PIhandle; ds_index: cint; sample_index: cint): cint {. cdecl, importc: "IupPlotGetSampleSelection", dynlib: libiup_plotSONAME.}
proc PlotGetSampleExtra*(ih: PIhandle; ds_index: cint; sample_index: cint): cdouble {. cdecl, importc: "IupPlotGetSampleExtra", dynlib: libiup_plotSONAME.}
proc PlotSetSample*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cdouble; y: cdouble) {.cdecl, importc: "IupPlotSetSample", dynlib: libiup_plotSONAME.}
proc PlotSetSampleStr*(ih: PIhandle; ds_index: cint; sample_index: cint; x: cstring; y: cdouble) {.cdecl, importc: "IupPlotSetSampleStr", dynlib: libiup_plotSONAME.}
proc PlotSetSampleSelection*(ih: PIhandle; ds_index: cint; sample_index: cint; selected: cint) {.cdecl, importc: "IupPlotSetSampleSelection", dynlib: libiup_plotSONAME.}
proc PlotSetSampleExtra*(ih: PIhandle; ds_index: cint; sample_index: cint; extra: cdouble) {.cdecl, importc: "IupPlotSetSampleExtra", dynlib: libiup_plotSONAME.}
proc PlotTransform*(ih: PIhandle; x: cdouble; y: cdouble; cnv_x: ptr cdouble; cnv_y: ptr cdouble) {.cdecl, importc: "IupPlotTransform", dynlib: libiup_plotSONAME.}
proc PlotTransformTo*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; x: ptr cdouble; y: ptr cdouble) {.cdecl, importc: "IupPlotTransformTo", dynlib: libiup_plotSONAME.}
proc PlotFindSample*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; ds_index: var cint; sample_index: var cint): cint {.cdecl, importc: "IupPlotFindSample", dynlib: libiup_plotSONAME.}
proc PlotFindSegment*(ih: PIhandle; cnv_x: cdouble; cnv_y: cdouble; ds_index: var cint; sample_index1: var cint; sample_index2: var cint): cint {.cdecl, importc: "IupPlotFindSegment", dynlib: libiup_plotSONAME.}
type
 cdCanvas* {.bycopy.} = object


proc PlotPaintTo*(ih: PIhandle; cnv: ptr cdCanvas) {.cdecl, importc: "IupPlotPaintTo", dynlib: libiup_plotSONAME.}
proc ScintillaOpen*() {.cdecl, importc: "IupScintillaOpen", dynlib: libiup_scintillaSONAME.}
proc Scintilla*(): PIhandle {.cdecl, importc: "IupScintilla", dynlib: libiup_scintillaSONAME.}
proc ScintillaDlg*(): PIhandle {.cdecl, importc: "IupScintillaDlg", dynlib: libiup_scintillaSONAME.}
proc ScintillaSendMessage*(ih: PIhandle; iMessage: cuint; wParam: uptr_t; lParam: sptr_t): sptr_t {.cdecl, importc: "IupScintillaSendMessage", dynlib: libiup_scintillaSONAME.}
proc TuioOpen*(): cint {.cdecl, importc: "IupTuioOpen", dynlib: libiuptuioSONAME.}
proc TuioClient*(port: cint): PIhandle {.cdecl, importc: "IupTuioClient", dynlib: libiuptuioSONAME.}
proc WebBrowserOpen*(): cint {.cdecl, importc: "IupWebBrowserOpen", dynlib: libiupwebSONAME.}
proc WebBrowser*(): PIhandle {.cdecl, importc: "IupWebBrowser", dynlib: libiupwebSONAME.}