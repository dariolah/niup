#!/bin/bash
# $1 = header file
# $2 = gcc flags, eg. '-DSCINTILLA_H'

sed 's/a/aA/g; s/__/aB/g; s/#define/aC/g; /#include/d' "$1" |
          gcc -P -E $2 - |
          sed 's/aC/#define/g; s/aB/__/g; s/aA/a/g' |
          sed 's/^[ \t]*//;s/[ \t]*$//' |
	  sed -E ': a; /^[^#]\w+.*[^;]$/{ N ; s/\n// }; /^[^#]\w+.*[^;]$/b a' |
          sed '/__.*_H/d'
