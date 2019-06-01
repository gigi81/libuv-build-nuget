cd libuv
vcbuild.bat release test vs2017 x64 shared
if errorlevel 1 exit /b 1
