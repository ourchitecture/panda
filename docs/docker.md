# Docker

[Docker](https://www.docker.com/get-started) is used to isolate and standardize OS and software setup and configuration, providing a more consistent experience when executing software.

Executing software consistently across computers is difficult, especially cross-platform software. The platform, software versions, and environment can vary substantially, especially across individual engineer computers. Containers simplifies this by encapsulating or "containerizing" the platform, software, and environment into a unique package or "image".

Container tooling, like [`docker`][docker-get-started] or [`podman`][podman-get-started] enable engineers and automation to consistently run standardized environments. And, standards like the [Open Container Initiative (OCI)][oci] provide a consistent experience when working with container technology.

This repository broadly uses Docker to execute various DevOps tasks across engineer machines and by automation machines executing DevOps pipeline workflows like Continuous Integration and Deployment. This provides a consistent, cross-platform experience that can help rule out environment-specific configuration issues (e.g. engineers arguing that something "works on my machine" or an engineer "poking the server" with changes to get something working). See the tasks executed in the root "./makefile" for examples and see how GitHub Actions executes many of these same tasks in "./.github/workflows/\*.yml".

[docker-get-started]: https://www.docker.com/get-started
[podman-get-started]: https://podman.io/getting-started/
[oci]: https://opencontainers.org/
