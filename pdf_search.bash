#!/usr/bin/bash
function pdf {
	#find . -name '*.pdf' -exec sh -c 'pdftotext "{}" - | grep -i --with-filename --label="{}" --color "$1"' \; 2> /dev/null
	find . -name '*.pdf' -exec sh -c 'pdftotext "{}" - | grep -i --with-filename --label="{}" --color "'"$1"'"' \; 2> /dev/null
}
