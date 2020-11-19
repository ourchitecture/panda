# GNU make

[GNU `make`][make-book] improves task execution workflows with consistent and standardized commands. For example, a Java engineer using Maven might execute `./mvnw package` while another Java engineer using Gradle might execute `./gradlew build`, a Node.js engineer executes `npm run build`, `npm build` or `yarn build`, a GO engineer executes `go build`, a .NET engineer executes `dotnet build`, maybe a C++ engineer uses GCC to execute `g++ -o <name> <file>.cpp`, while a web front-end Angular engineer executes `ng build` and a React engineer executes `cd packages/react-scripts && node bin/react-scripts.js build"` as a Node.js script under `npm build` or `yarn build`. Wow! That's a lot of variety!

All of the above examples can be simplified as `make build`, where a "makefile" contains the details of the commands above and simplifies the engineering experience.

macOS and most \*nix distributions come with `make` already installed.

## Windows engineers

Windows has traditionally presented some challenges to developing cross-platform applications.

Most Windows users can also install [Cygwin][cygwin] that also comes with `make`. This is one of the simpler options available and is recommended by the authors of the book ["Managing Projects with GNU Make"][make-book].

If you have one of the latest versions of Windows 10, you may be able to install ["Windows Subsystem for Linux" (WSL2)][wsl]. GNU `make` will be available with WSL2 and a Linux distribution like Ubuntu.

If your version of Windows 10 does not support WSL (WSL2 preferred), you might use a Virtual Machine for your engineering environment, like [Docker Desktop][docker-desktop] docker images with Remote Desktop support, [Hyper-V][hyper-v], or [VirtualBox][virtualbox]. For example, these options would enable you to run an Ubuntu virtual machine with `make` already installed and generally improve your cross-platform experience.

[make-book]: https://www.oreilly.com/openbook/make3/book/
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[cygwin]: https://cygwin.com/install.html
[docker-desktop]: https://www.docker.com/products/docker-desktop
[hyper-v]: https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/about/
[virtualbox]: https://www.virtualbox.org/
