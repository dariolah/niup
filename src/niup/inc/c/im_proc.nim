



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

proc imImageCreate*(width: cint; height: cint; color_space: imColorSpace; data_type: imDataType): ptr imImage {. cdecl, importc: "imImageCreate", dynlib: libiupimSONAME.}
proc imImageInit*(width: cint; height: cint; color_mode: cint; data_type: imDataType; data_buffer: pointer; palette: ptr clong; palette_count: cint): ptr imImage {. cdecl, importc: "imImageInit", dynlib: libiupimSONAME.}
proc imImageCreateBased*(image: ptr imImage; width: cint; height: cint; color_space: imColorSpace; data_type: imDataType): ptr imImage {.cdecl, importc: "imImageCreateBased", dynlib: libiupimSONAME.}
proc imImageDestroy*(image: ptr imImage) {.cdecl, importc: "imImageDestroy", dynlib: libiupimSONAME.}
proc imImageAddAlpha*(image: ptr imImage) {.cdecl, importc: "imImageAddAlpha", dynlib: libiupimSONAME.}
proc imImageSetAlpha*(image: ptr imImage; alpha: cdouble) {.cdecl, importc: "imImageSetAlpha", dynlib: libiupimSONAME.}
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



proc imConvertDataType*(src_image: ptr imImage; dst_image: ptr imImage; cpx2real: cint; gamma: cdouble; absolute: cint; cast_mode: cint): cint {.cdecl, importc: "imConvertDataType", dynlib: libiupimSONAME, discardable.}
proc imConvertColorSpace*(src_image: ptr imImage; dst_image: ptr imImage): cint {.cdecl, importc: "imConvertColorSpace", dynlib: libiupimSONAME, discardable.}
proc imConvertToBitmap*(src_image: ptr imImage; dst_image: ptr imImage; cpx2real: cint; gamma: cdouble; absolute: cint; cast_mode: cint): cint {.cdecl, importc: "imConvertToBitmap", dynlib: libiupimSONAME, discardable.}
proc imImageGetOpenGLData*(image: ptr imImage; glformat: ptr cint): pointer {.cdecl, importc: "imImageGetOpenGLData", dynlib: libiupimSONAME, discardable.}
proc imImageCreateFromOpenGLData*(width: cint; height: cint; glformat: cint; gldata: pointer): ptr imImage {.cdecl, importc: "imImageCreateFromOpenGLData", dynlib: libiupimSONAME.}
proc imConvertPacking*(src_data: pointer; dst_data: pointer; width: cint; height: cint; src_depth: cint; dst_depth: cint; data_type: imDataType; src_is_packed: cint) {.cdecl, importc: "imConvertPacking", dynlib: libiupimSONAME.}
proc imConvertMapToRGB*(data: ptr uint8; count: cint; depth: cint; packed: cint; palette: ptr clong; palette_count: cint) {.cdecl, importc: "imConvertMapToRGB", dynlib: libiupimSONAME.}
proc imConvertRGB2Map*(width: cint; height: cint; red: ptr uint8; green: ptr uint8; blue: ptr uint8; map: ptr uint8; palette: ptr clong; palette_count: ptr cint): cint {.cdecl, importc: "imConvertRGB2Map", dynlib: libiupimSONAME, discardable.}
proc imConvertRGB2MapCounter*(width: cint; height: cint; red: ptr uint8; green: ptr uint8; blue: ptr uint8; map: ptr uint8; palette: ptr clong; palette_count: ptr cint; counter: cint): cint {.cdecl, importc: "imConvertRGB2MapCounter", dynlib: libiupimSONAME, discardable.}