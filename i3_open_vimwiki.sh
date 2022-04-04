#xprop -name "erminal"
#xdotool search --name "Terminal"
#retval = $?
#if [ $retval eq 0 ]; then
if xdotool search --name "vimwiki"; then
    echo "FOUND!"
    i3-msg [title="vimwiki"] move position mouse &
else
    echo "NOT FOUND!"
    terminator -T vimwiki -x /usr/bin/nvim -c ':VimwikiDiaryIndex' &
fi

