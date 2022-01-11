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

include niup/inc/sonames

include niup/inc/c/libim
include niup/inc/c/libcd
include niup/inc/c/libiup
