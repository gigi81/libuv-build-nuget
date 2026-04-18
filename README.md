[![NuGet](https://img.shields.io/nuget/v/libuv-shared)](https://www.nuget.org/packages/libuv-shared)
[![Build Status](https://github.com/gigi81/libuv-build-nuget/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/gigi81/libuv-build-nuget/actions/workflows/build.yml)

# Introduction
This is a project containing a GitHub Actions build pipeline to produce the nuget package for libuv.
The package contains the native libuv library for Windows (x64/x86/arm64), Linux (x64/arm64/arm) and Osx (x64/arm64)

# Install Package
You can install the package in a dotnet project with the command

```bash
dotnet install libuv-shared
```
