cd libuv
call vcbuild.bat release test vs2017 x64 shared
type uv.sln
type test\test.sln

if errorlevel 1 exit /b 1
