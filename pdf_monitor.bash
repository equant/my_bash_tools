#!/usr/bin/bash
pdfjam `find . -type f -name '*.pdf' -printf '%T@ %p\n' | sort -rn | head -100 | while read x; do echo "$x" | awk '{printf($2 " "); system("od " $2 " 2> /dev/null| head -200 | sha1sum")}'; done | awk '!a[$2]++' | awk '{print $1}' | head -32` 1 --nup 2x2 --outfile ~/tmp/monitor.pdf
zathura ~/tmp/monitor.pdf &
inotifywait --recursive --monitor -e close_write,moved_to,create,delete  . |
while read -r directory events filename; do
  if [[ $filename == *pdf ]]; then
      pdfjam `find . -type f -name '*.pdf' -printf '%T@ %p\n' | sort -rn | head -100 | while read x; do echo "$x" | awk '{printf($2 " "); system("od " $2 " 2> /dev/null| head -200 | sha1sum")}'; done | awk '!a[$2]++' | awk '{print $1}' | head -32` 1 --nup 2x2 --outfile ~/tmp/monitor.pdf
  fi
done
