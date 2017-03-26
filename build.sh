version=${1?version?}
name="${2-Live Coding Broadcast Studio (LCBS)}"

[[ ! -z $3 ]] && rm -rf build && mkdir build

cd build && 
    gsed "s|LCBS_VERSION_NUMBER|${version}|" ../cmake/osxbundle/Info.plist.in > ../cmake/osxbundle/Info.plist &&
    cmake .. &&
    make -j17 package 
    # TODO: remove old .app

app="$(list -type d -name "${name}.app")"
echo App: "${app}"

if [[ -z "${app}" ]]; then exit 1; fi

rm -rf ../"${name}.app"
cp -a "${app}" ..
cd .. &&
    ./sign.sh &&
    cp -a build/"${app}" "${name}.app,${version}"

