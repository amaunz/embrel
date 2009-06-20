for d in `find -type d`; do export LD_LIBRARY_PATH=`pwd`/$d:$LD_LIBRARY_PATH; done
