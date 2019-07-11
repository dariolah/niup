#!/bin/bash

#Lib IUP
HEADERS=(iup.h \
             iup_config.h \
             iupcontrols.h \
             iupdraw_cd.h \
             iupdraw.h \
             iupfiledlg.h \
             iupglcontrols.h \
             iupgl.h \
             iupim.h \
             iupkey.h \
             iup_mglplot.h \
             iup_plot.h \
             iup_scintilla.h \
             iuptuio.h \
             iupweb.h)


rm -f iup_concat.h

for h in "${HEADERS[@]}"
do
    ./prepare.sh /usr/include/iup/$h '-DSCINTILLA_H -D__IM_IMAGE_H' >> iup_concat.h
done

sed -i '/ CD_IUPDRAW /d' iup_concat.h

c2nim --dynlib:libiupSONAME --cdecl --prefix:Iup iup_concat.h

for i in /usr/lib/libiup*.so
do
    if [ $i == "/usr/lib/libiup.so" ]
    then
       continue
    fi
       
    SONAME=${i/\/usr\/lib\//}
    SONAME=${SONAME/\.so/SONAME}

    functions=()
    for s in $(nm -g --defined-only $i | sed -e '/ Iup/!d; s/0.* T //; s/^Iup//')
    do
        functions+=($s)
    done
    printf -v fnregex "%s|" "${functions[@]}"
    fnregex="^proc (${fnregex%?}).*libiupSONAME.*"

    sed -i -E ': a; 
                 /^(proc| Iparamcb).*[^}]$/{ 
                                 N ; s/\n// 
                               }; 
                 /^(proc| Iparamcb).*[^}]$/b a; 
                 s/\s+/ /g;
                 s/_([cs][:\[\)])/X\1/;
                 s/K_([A-Z][\*\)])/K_upper\1/;
                 s/K_([a-z]\*)/K_lower\1/;
                 s/K_(ccedilla\*)/K_lower\1/;
                 s/K_c([A-Z]\*)/K_cupper\1/;
                 /isxkey\*/d;
                 s/_cdCanvas/cdCanvas/g;
                 /'"$fnregex"'/{s/libiupSONAME/'"$SONAME"'/}' iup_concat.nim  
done

sed -i -E '
    /IUP_VERSION/d;
    s/ptr Ihandle/PIhandle/g;
    s/Ihandle\* = Ihandle_/Ihandle = object\n PIhandle* = ptr Ihandle\n cdContext = object\n uptr_t = clong\n sptr_t = clong/;
    s/= (-?\d+|0x[[:xdigit:]]+)$/= cint(\1)/;
    /K_\w+\* =/{ s/('"'.*'"')/cint(ord(\1))/};
    /IUPMASK_/d;
    s/ptr cint/var cint/g;
    /proc ImageLibOpen/{ s/libiupSONAME./libiupimglibSONAME/ }
    ' iup_concat.nim
#~Lib IUP


#Lib IM
HEADERS=(im.h \
         im_image.h \
	 im_convert.h)

rm -f im_concat.h

for h in "${HEADERS[@]}"
do
    ./prepare.sh /usr/include/im/$h >> im_concat.h
done

c2nim --dynlib:libiupimSONAME --cdecl im_concat.h

sed -i -E '
    s/_imFile/object/;
    s/(\(| )_/\1x_/g;
    /color_space\*:/{s/cint/imColorSpace/};
    /color_space:/{s/color_space: cint/color_space: imColorSpace/};
    /proc imFileImageSave/{s/: cint/: imErrorCodes/};
    s/error: ptr cint/error: ptr imErrorCodes/;
    s/ data_type: cint/ data_type: imDataType/;
    ' im_concat.nim
#~Lib IM


cat << 'EOF' > niup.nim
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

EOF

echo -e "\n#Lib IM" >> niup.nim
cat im_concat.nim >> niup.nim
echo -e "\n#Lib IUP" >> niup.nim
cat iup_concat.nim >> niup.nim
rm iup_concat.*
rm im_concat.*
