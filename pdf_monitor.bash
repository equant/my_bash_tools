#!/usr/bin/bash
pdfjam `find . -type f -name '*pdf' -printf '%T@ %p\n' | sort -n | tail -8 | cut -f2- -d" "` --nup 3x3 --landscape --outfile ~/tmp/monitor.pdf
zathura ~/tmp/monitor.pdf &
inotifywait --recursive --monitor -e close_write,moved_to,create,delete  . |
while read -r directory events filename; do
  if [[ $filename == *pdf ]]; then
      pdfjam `find . -type f -name '*pdf' -printf '%T@ %p\n' | sort -n | tail -9 | cut -f2- -d" "` --nup 3x3 --landscape --outfile ~/tmp/monitor.pdf
  fi
done
