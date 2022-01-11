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
             iupweb.h )


rm -f iup_concat.h

for h in "${HEADERS[@]}"
do
    ./prepare.sh /usr/include/iup/$h '-DSCINTILLA_H -D__IM_IMAGE_H' >> iup_concat.h
done

#iupdef.h multiple re-defines
./prepare.sh /usr/include/iup/iupdef.h |sort | uniq >> iup_concat.h

sed -i -E '/ CD_IUPDRAW /d;
	/struct _cdCanvas;/d;
	0,/IUP_YES/{/IUP_YES/d};
	0,/IUP_NO /{/IUP_NO /d};
	s/^(IUP_API|IUPIMGLIB_API|IUPWEB_API) //;
	' iup_concat.h

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
                 /^(proc| Iparamcb).*[^}]$/{ N; s/\n// }; 
                 /^(proc| Iparamcb).*[^}]$/b a; 
                 /^proc/{ s/\s+/ /g; }
                 s/_([cs][:\[\)])/X\1/;
                 s/K_([A-Z][\*\)])/K_upper\1/;
                 s/K_([a-z]\*)/K_lower\1/;
                 s/K_(ccedilla\*)/K_lower\1/;
                 s/K_c([A-Z]\*)/K_cupper\1/;
                 /isxkey\*/d;
                 s/_cdCanvas/cdCanvas/g;
		 /^  (isshift|iscontrol|isbutton|isdouble|isalt|issys)/d;
		 /^template iup_(isshift|iscontrol|isbutton|isdouble|isalt|issys)/{s/ iup_/ /};
                 /'"$fnregex"'/{s/libiupSONAME/'"$SONAME"'/}' iup_concat.nim
done

sed -i -E '
    /IUP_VERSION/d;
    s/ptr Ihandle/PIhandle/g;
    s/Ihandle\* = Ihandle_/Ihandle = object\n  PIhandle* = ptr Ihandle\n  uptr_t = clong\n  sptr_t = clong/;
    s/= (-?\d+|0x[[:xdigit:]]+)$/= cint(\1)/;
    /K_\w+\* =/{ s/('"'.*'"')/cint(ord(\1))/};
    /IUPMASK_/d;
    s/ptr cint/var cint/g;
    /proc ImageLibOpen/{ s/libiupSONAME./libiupimglibSONAME/ }
    /(SetCallback|SetHandle|SetFocus|SetAttributes)/{
        s/\.\}/, discardable.\}/
    }
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
    : a; 
    /^(proc| Iparamcb).*[^}]$/{ N; s/\n// }; 
    /^(proc| Iparamcb).*[^}]$/b a; 
    /^proc/{ s/\s+/ /g; }
    s/_imFile/object/;
    s/(\(| )_/\1x_/g;
    /color_space\*:/{s/cint/imColorSpace/};
    /color_space:/{s/color_space: cint/color_space: imColorSpace/};
    /proc imFileImageSave/{s/: cint/: imErrorCodes/};
    s/error: ptr cint/error: ptr imErrorCodes/;
    s/ data_type: cint/ data_type: imDataType/;
    s/if x_image.has_alpha:/if x_image.has_alpha > 0:/;
    s/cast\[ptr cuchar\]\(x_image.data\[([0-9])\]\)/cast[ptr cuchar](cast[ByteAddress](x_image.data[]) +% \1 * x_image.plane_size)/;
    s/data\*: ptr pointer/data*: ptr cstring/;
    /(imImageGetOpenGLData)/{
        s/\.\}/, discardable.\}/
    }
    ' im_concat.nim
#~Lib IM

#Lib CD
HEADERS=(cd.h \
             cdiup.h \
             cdprint.h \
	     cdirgb.h
        )

rm -f cd_concat.h

for h in "${HEADERS[@]}"
do
    ./prepare.sh /usr/include/cd/$h >> cd_concat.h
done

sed -i '/CD_IUP\|CD_IUPDBUFFER\|CD_IUPDBUFFERRGB\|CD_PRINTER\|CD_IMAGERGB\|CD_DBUFFERRGB/d' cd_concat.h

c2nim --dynlib:libiupcdSONAME --cdecl cd_concat.h

sed -i -E '
    : a; 
    /^(proc| Iparamcb).*[^}]$/{ N; s/\n// }; 
    /^(proc| Iparamcb).*[^}]$/b a; 
    /^proc/{ s/\s+/ /g; }
    s/(_cdContext|_cdCanvas|_cdCanvas|_cdImage)/object/;
    /^proc cd/{s/dynlib: libiupcdSONAME.\}/dynlib: libcdSONAME, dynlib: libiupcdSONAME.\}/};
    /(cdCanvasBackground|cdCanvasForeground)/{
        s/\.\}/, discardable.\}/
    }
    ' cd_concat.nim
#~Lib CD


cat << 'EOF' > niupc.nim
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

EOF

rm -rf inc
mkdir inc

sed -n '/^const/,/^$/p' im_concat.nim > inc/im_const.nim
sed -n '/^type/,/^$/p' im_concat.nim > inc/im_type.nim
sed -n '/^template/,/^$/p' im_concat.nim > inc/im_template.nim
sed -n '/^\(const\|template\|type\)/,/^$/!p' im_concat.nim > inc/im_proc.nim

sed -n '/^const/,/^$/p' cd_concat.nim > inc/cd_const.nim
sed -n '/^type/,/^$/p' cd_concat.nim > inc/cd_type.nim
sed -n '/^template/,/^$/p' cd_concat.nim > inc/cd_template.nim
sed -n '/^\(const\|template\|type\)/,/^$/!p' cd_concat.nim > inc/cd_proc.nim

sed -n '/^const/,/^$/p' iup_concat.nim > inc/iup_const.nim
sed -n '/^type/,/^$/p' iup_concat.nim > inc/iup_type.nim
sed -n '/^template/,/^$/p' iup_concat.nim > inc/iup_template.nim
sed -n '/^\(const\|template\|type\)/,/^$/!p' iup_concat.nim > inc/iup_proc.nim

echo -e "when defined(gendoc):\n  include niup/inc/sonames\n" >> inc/libim.nim
echo -e "include niup/inc/c/im_template" >> inc/libim.nim
echo -e "include niup/inc/c/im_const" >> inc/libim.nim
echo -e "include niup/inc/c/im_type" >> inc/libim.nim
echo -e "include niup/inc/c/im_proc" >> inc/libim.nim
echo -e "include niup/inc/c/libim" >> niupc.nim

echo -e "when defined(gendoc):\n  include niup/inc/sonames\n" >> inc/libcd.nim
echo -e "include niup/inc/c/cd_template" >> inc/libcd.nim
echo -e "include niup/inc/c/cd_const" >> inc/libcd.nim
echo -e "include niup/inc/c/cd_type" >> inc/libcd.nim
echo -e "include niup/inc/c/cd_proc" >> inc/libcd.nim
echo -e "include niup/inc/c/libcd" >> niupc.nim

echo -e "when defined(gendoc):" >> inc/libiup.nim
echo -e "  include niup/inc/sonames" >> inc/libiup.nim
echo -e "  include niup/inc/c/im_type" >> inc/libiup.nim
echo -e "  include niup/inc/c/cd_type\n" >> inc/libiup.nim
echo -e "include niup/inc/c/iup_template" >> inc/libiup.nim
echo -e "include niup/inc/c/iup_const" >> inc/libiup.nim
echo -e "include niup/inc/c/iup_type" >> inc/libiup.nim
echo -e "include niup/inc/c/iup_proc" >> inc/libiup.nim
echo -e "include niup/inc/c/libiup" >> niupc.nim

rm iup_concat.*
rm im_concat.*
rm cd_concat.*

#discardable
sed -i -E '
    /^proc .*\): cint \{/{
        s/\.\}/, discardable.\}/
    };
    /^proc SetFunction\*/ {
        s/\.\}/, discardable.\}/
    };
    s/cuchar/uint8/g
    ' inc/*.nim

mv niupc.nim ../src/niup/
mkdir -p ../src/niup/inc
rm -rf ../src/niup/inc/c
mv inc ../src/niup/inc/c

