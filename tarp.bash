# This function will display a progress bar while it tars and gzips a directory 
#
# Example run:
#
# user $ tarp big_directory
# 31.5GiB 0:22:57 [17.7MiB/s] [======>                    ] 29% ETA 0:54:56
# user $ ls
# big_directory.tgz

function tarp() {
    USAGE=" Usage: tarup directory Result:" ;

    if [ $# -eq 0 ] ; then
		# number of arguments is zero
        echo "You must specify a directory or file to tar/gzip." >&2
        return
    fi

    if  [ ! -d $1 ] ; then
        echo "Directory not found." >&2
        return
    fi

    if ! [ -x "$(command -v pv)" ]; then
        echo 'Error: pv is not installed.  Please install it.' >&2
        return
    fi

    directory=$1
    tar cf - $directory -P | pv -s $(du -sb $directory | awk '{print $1}') | gzip > $directory.tgz
}

# Benchmarking
#
# Tests all performed from the same root directory on the same SSD.
#
# (1) For a small (2.67MiB) directory there appears to be no performance hit:
#
# equant@biko:git $ time tarp horse
# 2.67MiB 0:00:00 [30.8MiB/s] [==============> ] 98%
# 
# real	0m0.097s
# user	0m0.095s
# sys	0m0.008s
# equant@biko:git $ rm horse.tgz
# equant@biko:git $ time tar -zcf horse.tgz horse
# 
# real	0m0.093s
# user	0m0.096s
# sys	0m0.000s
#
# (2) For a much bigger (738MiB) directory there is also no noticable performance hit:
#
# equant@biko:research $ time tarp gap_edge_stats.old
#  738MiB 0:00:39 [18.7MiB/s] [==============>] 100%            
# 
# real	0m39.442s
# user	0m38.776s
# sys	0m1.261s
# equant@biko:research $ rm gap_edge_stats.old.tgz 
# equant@biko:research $ time tar -zcf gap_edge_stats.old.tgz gap_edge_stats.old
# 
# real	0m38.605s
# user	0m38.266s
# sys	0m0.832s
# 
# (3) For an even much bigger (1.87GiB) directory there is also no noticable performance hit:
#
# equant@biko:research $ time tarp gap_edge_stats
# 1.87GiB 0:01:07 [28.5MiB/s] [==============> ] 99%
# 
# real	1m6.229s
# user	1m4.766s
# sys	0m3.093s
# 
# equant@biko:research $ rm gap_edge_stats.tgz 
# equant@biko:research $ time tar -zcf gap_edge_stats.tgz gap_edge_stats
# 
# real	1m5.279s
# user	1m4.003s
# sys	0m2.194s

