export MMGG_CONF_DIR = "~/.config/mmgg"

function mm() {
    USAGE="Usage: mm [bookmark tag]" ;

    if  [ ! -d ~/.config/mmgg ] ; then
        echo "Making config directory"
        mkdir -p ~/.config/mmgg
    fi

    if [ $# -eq 0 ] ; then
		# number of arguments is zero
        echo "cd `pwd`" > ~/.config/mmgg/m;
    else
        case $1 in
            -h)
                echo "$USAGE";
                ;;
            *)
                echo "cd `pwd`" > ~/.config/mmgg/"$1";
                ;;
        esac
    fi
}

function gg() {
    USAGE="Usage: gg [bookmark tag]" ;

    if  [ ! -d ~/.config/mmgg ] ; then
        echo "You have no bookmarks"
    fi

    if [ $# -eq 0 ] ; then
		# number of arguments is zero
        source ~/.config/mmgg/m;
    else
        case $1 in
            -h)
                echo "$USAGE";
                ;;
            *)
                source ~/.config/mmgg/"$1";
                ;;
        esac
    fi
}
