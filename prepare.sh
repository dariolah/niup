#!/bin/bash

[ $# -eq 2 ] && arg="$1" || arg=""
eval file="\$$#"
sed 's/a/aA/g; s/__/aB/g; s/#define/aC/g; /#include/d' "$file" |
          gcc -P -E $arg - |
          sed 's/aC/#define/g; s/aB/__/g; s/aA/a/g' |
          sed 's/^[ \t]*//;s/[ \t]*$//' |
	  sed -E ': a; /^[^#]\w+.*[^;]$/{ N ; s/\n// }; /^[^#]\w+.*[^;]$/b a' |
          sed '/__.*_H/d'
