cd libuv
set GYP_MSVS_VERSION=2017
..\gyp\gyp -I common.gypi test/test.gyp -f msvs --depth=. -Duv_library=shared_library -Dtarget_arch=x64
msbuild uv.sln /t:build /p:Configuration=Release /p:Platform=x64 /clp:NoSummary;NoItemAndPropertyList;Verbosity=minimal /nologo
test release\run-tests