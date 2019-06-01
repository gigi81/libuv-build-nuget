#!/bin/sh

python --version

cd libuv
../gyp/gyp -I common.gypi test/test.gyp -f make --depth=. -Duv_library=shared_library -Dtarget_arch=x64
BUILDTYPE=Release
make
