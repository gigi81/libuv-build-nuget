[![NuGet](https://img.shields.io/nuget/v/libuv-shared)](https://www.nuget.org/packages/libuv-shared)
[![Build Status](https://luigigrilli.visualstudio.com/libuv/_apis/build/status/gigi81.libuv-build-nuget?branchName=main)](https://luigigrilli.visualstudio.com/libuv/_build/latest?definitionId=16&branchName=main)

# Introduction
This is a project containing an ADO build pipeline to produce the nuget package for libuv.
The package contains the native libuv library for Windows (x64/x86/arm/arm64), Linux (x64/arm64/arm/armel) and Osx (x64/arm64)

# Install Package
You can install the package in a dotnet project with the command

```bash
dotnet install libuv-shared
```