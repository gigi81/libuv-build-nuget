# libuv-shared

Native shared library binaries for [libuv](https://libuv.org) — a multi-platform asynchronous I/O library.

> **Note:** This is an **unofficial** third-party build of libuv. It is not produced or endorsed by the libuv project or its maintainers.

## Supported platforms

| Runtime ID     | OS      | Architecture |
|----------------|---------|--------------|
| `win-x64`      | Windows | x64          |
| `win-x86`      | Windows | x86          |
| `win-arm64`    | Windows | ARM64        |
| `linux-x64`    | Linux   | x64          |
| `linux-arm64`  | Linux   | ARM64        |
| `linux-arm`    | Linux   | ARM          |
| `osx-x64`      | macOS   | x64          |
| `osx-arm64`    | macOS   | ARM64 (Apple Silicon) |

## Usage

Add the package to your project:

```bash
dotnet add package libuv-shared
```

The native library is placed under `runtimes/<rid>/native/` and the .NET runtime will resolve it automatically based on the target platform. You can load it explicitly with:

```csharp
NativeLibrary.Load("libuv");
```

## About libuv

libuv is the library that powers the I/O event loop in Node.js. It provides cross-platform abstractions for asynchronous TCP/UDP sockets, file system operations, timers, child processes, and more.

Source: https://github.com/libuv/libuv
