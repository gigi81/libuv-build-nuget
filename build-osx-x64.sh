#!/bin/sh

python --version

cd libuv
../gyp/gyp -I common.gypi test/test.gyp -f xcode --depth=. -Duv_library=shared_library
find . -name "*.xcodeproj"

xcodebuild ARCHS="x86_64" -project uv.xcodeproj -configuration Release -alltargets

xcodebuild ARCHS="x86_64" -project ./test/test.xcodeproj -configuration Release -alltargets

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$PWD/build/Release
test/build/Release/run-tests
