# gdb-playground

Small [dev-container](https://code.visualstudio.com/docs/devcontainers/containers) using based on Amazon Linux 2 for the purpose of debugging fluent-bit core files with [GDB](https://www.sourceware.org/gdb/).

# Requirements

System requirements can be found here - https://code.visualstudio.com/docs/devcontainers/containers#_system-requirements

- [VS Code](https://code.visualstudio.com/)
- [Docker](https://docs.docker.com/get-docker/)
- [Remote Development Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

# Usage

Prior to launching changes should be made to `docker-compose.yaml` to map in a directory containing the fluent-bit binary and core file. This should be done under the [volumes](https://docs.docker.com/compose/compose-file/compose-file-v3/#volumes) section:

```yaml
  volumes:
    - /user/home/core_dumps/:/dumps
```

With all requirements satisfied we can open the folder containing this repository in VS Code. VS Code may present an option to `Reopen in Container` which will start the build process for the dev-container. If this does not occur open up the command palette and search for `Dev Containers: Reopen in Container`.

Once the container has been built it will start up and put the user at a terminal where we can:

- Check out the correct source version of fluent-bit, stored in /playground/src/fluent-bit
- Launch GDB with targeting the binary and core file

To stop the container either:
- Use the command palette and select `Dev Containers: Reopen Folder Locally`
- Close the VS Code Window