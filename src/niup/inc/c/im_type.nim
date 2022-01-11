type
  imDataType* {.size: sizeof(cint).} = enum
    IM_BYTE, IM_SHORT, IM_USHORT, IM_INT, IM_FLOAT, IM_DOUBLE, IM_CFLOAT, IM_CDOUBLE

type
  imColorSpace* {.size: sizeof(cint).} = enum
    IM_RGB, IM_MAP, IM_GRAY, IM_BINARY, IM_CMYK, IM_YCBCR, IM_LAB, IM_LUV, IM_XYZ

type
  imColorModeConfig* {.size: sizeof(cint).} = enum
    IM_ALPHA = 0x100, IM_PACKED = 0x200, IM_TOPDOWN = 0x400

type
  imErrorCodes* {.size: sizeof(cint).} = enum
    IM_ERR_NONE, IM_ERR_OPEN, IM_ERR_ACCESS, IM_ERR_FORMAT, IM_ERR_DATA,
    IM_ERR_COMPRESS, IM_ERR_MEM, IM_ERR_COUNTER

type
  imFile* = object

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
    attributes_table*: pointer

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

