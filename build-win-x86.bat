cd libuv
vcbuild.bat release test vs2017 x86 shared
if errorlevel 1 exit /b 1
