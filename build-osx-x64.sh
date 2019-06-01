#!/bin/sh

python --version

cd libuv
../gyp/gyp -I common.gypi test/test.gyp -f xcode --depth=. -Duv_library=shared_library
find *.xcodeproj

xcodebuild ARCHS="x86_64" -project uv.xcodeproj -configuration Release -alltargets
