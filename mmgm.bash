function mm() {
    CONF_DIR="~/.config/mmgm"
    USAGE="Usage: mm [bookmark]" ;

    if  [ ! -d ~/.config/mmgm ] ; then
        echo "Making config directory"
        mkdir -p ~/.config/mmgm
    fi

    if [ $# -eq 0 ] ; then
		# number of arguments is zero
        echo "cd `pwd`" > ~/.config/mmgm/m;
    else
        case $1 in
            -h)
                echo "$USAGE";
                ;;
            *)
                echo "cd `pwd`" > ~/.config/mmgm/"$1";
                ;;
        esac
    fi
}

function gm() {
    CONF_DIR="~/.config/mmgm"
    USAGE="Usage: gm [bookmark]" ;

    if  [ ! -d ~/.config/mmgm ] ; then
        echo "You have no bookmarks"
    fi

    if [ $# -eq 0 ] ; then
		# number of arguments is zero
        source ~/.config/mmgm/m;
    else
        case $1 in
            -h)
                echo "$USAGE";
                ;;
            *)
                source ~/.config/mmgm/"$1";
                ;;
        esac
    fi
}
