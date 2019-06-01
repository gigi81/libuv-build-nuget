cd libuv/
rm -rf build
rm -rf uv.xcodeproj
mkdir -p build
git clone https://git.chromium.org/external/gyp.git build/gyp
./gyp_uv.py -f make -Duv_library=shared_library
BUILDTYPE=Release make -C out
