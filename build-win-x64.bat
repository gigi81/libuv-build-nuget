@echo off

@python --version

SET vs_toolset=x64

echo Looking for Visual Studio 2017
@rem Check if VS2017 is already setup, and for the requested arch.
if "_%VisualStudioVersion%_" == "_15.0_" if "_%VSCMD_ARG_TGT_ARCH%_"=="_%vs_toolset%_" goto found_vs2017
set "VSINSTALLDIR="
call libuv\tools\vswhere_usability_wrapper.cmd
if "_%VCINSTALLDIR%_" == "__" goto vs-set-2015
@rem Need to clear VSINSTALLDIR for vcvarsall to work as expected.
@rem Keep current working directory after call to vcvarsall
set "VSCMD_START_DIR=%CD%"
set vcvars_call="%VCINSTALLDIR%\Auxiliary\Build\vcvarsall.bat" %vs_toolset%
echo calling: %vcvars_call%
call %vcvars_call%

:found_vs2017
echo Found MSVS version %VisualStudioVersion%
if %VSCMD_ARG_TGT_ARCH%==x64 set target_arch=x64&set msbuild_platform=x64&set vs_toolset=x64
set GYP_MSVS_VERSION=2017

cd libuv
echo Generating solution and projects files
python ..\gyp\gyp_main.py -I common.gypi test/test.gyp -f msvs --depth=. -Duv_library=shared_library -Dtarget_arch=x64
if errorlevel 1 goto create-msvs-files-failed
if not exist uv.sln goto create-msvs-files-failed

echo Running msbuild
msbuild uv.sln /t:build /p:Configuration=Release /p:Platform=x64 /clp:NoSummary;NoItemAndPropertyList;Verbosity=minimal /nologo
if errorlevel 1 goto msbuild-failed

cd test
msbuild test.sln /t:build /p:Configuration=Release /p:Platform=x64 /clp:NoSummary;NoItemAndPropertyList;Verbosity=minimal /nologo
if errorlevel 1 goto msbuild-failed

cd ..
test\release\run-tests
if errorlevel 1 exit /b 1

cd ..
mkdir contents\runtimes\\win-x64\native
copy libuv\release\libuv.dll contents\runtimes\\win-x64\native

goto exit

:vsstudio_not_found
echo Visual Studio %VisualStudioVersion% not found
exit /b 1

:create-msvs-files-failed
echo Failed to create vc project files.
exit /b 1

:msbuild-failed
echo Msbuild failed
exit /b 1

:exit