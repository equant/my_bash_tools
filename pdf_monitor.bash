#!/usr/bin/bash
pdfjam `find . -type f -name '*.pdf' -printf '%T@ %p\n' | sort -n | while read x; do awk '{printf($2 " "); system("od " $2 " 2> /dev/null| head -200 | sha1sum")}'; done | sort -u -k2 | awk '{print($1)}' | tail -9 | cut -f2- -d" "` --nup 3x3 --landscape --outfile ~/tmp/monitor.pdf
zathura ~/tmp/monitor.pdf &
inotifywait --recursive --monitor -e close_write,moved_to,create,delete  . |
while read -r directory events filename; do
  if [[ $filename == *pdf ]]; then
pdfjam `find . -type f -name '*.pdf' -printf '%T@ %p\n' | sort -n | while read x; do awk '{printf($2 " "); system("od " $2 " 2> /dev/null| head -200 | sha1sum")}'; done | sort -u -k2 | awk '{print($1)}' | tail -9 | cut -f2- -d" "` --nup 3x3 --landscape --outfile ~/tmp/monitor.pdf
  fi
done
