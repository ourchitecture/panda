# Docker containers and images

[Docker](https://www.docker.com/get-started) is used to isolate and standardize OS and software setup and configuration, providing a more consistent experience when executing software.

This repository broadly uses Docker to execute various DevOps tasks across engineer machines and by automation machines executing DevOps pipeline workflows like Continuous Integration and Deployment. This provides a consistent, cross-platform experience that can help rule out environment-specific configuration issues (e.g. engineers arguing that something "works on my machine" or an engineer "poking the server" with changes to get something working). See the tasks executed in the root "./makefile" for examples and see how GitHub Actions executes many of these same tasks in "./.github/workflows/\*.yml".
