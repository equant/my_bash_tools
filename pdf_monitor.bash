#!/usr/bin/bash
pdfjam `find . -type f -name '*.pdf' -printf '%T@ %p\n' | sort -rn | head -50 | while read x; do echo "$x" | awk '{printf($2 " "); system("od " $2 " 2> /dev/null| head -200 | sha1sum")}'; done | awk '!a[$2]++' | awk '{print $1}' | head -9` 1 --nup 3x3 --outfile ~/tmp/monitor.pdf
zathura ~/tmp/monitor.pdf &
inotifywait --recursive --monitor -e close_write,moved_to,create,delete  . |
while read -r directory events filename; do
  if [[ $filename == *pdf ]]; then
      pdfjam `find . -type f -name '*.pdf' -printf '%T@ %p\n' | sort -rn | head -50 | while read x; do echo "$x" | awk '{printf($2 " "); system("od " $2 " 2> /dev/null| head -200 | sha1sum")}'; done | awk '!a[$2]++' | awk '{print $1}' | head -9` 1 --nup 3x3 --outfile ~/tmp/monitor.pdf
  fi
done
