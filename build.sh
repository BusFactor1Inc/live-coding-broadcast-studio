[[ ! -z $1 ]] && rm -rf build && mkdir build

cd build && 
    cmake .. && 
    make -j17 package && 
# TODO: remove old .app
    cp -a "$(list -type d -name '*.app')" ~ &&
    cd ..
