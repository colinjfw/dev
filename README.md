# Dev

Scripts for setting up development environments using the VSCode remote
containers plugin. Only supports Mac at the moment.

This allows you to specify development environments in an `environments.json`
file as follows:

```javascript
// environments.json
{
  "rustysnek": {
    // Environment name.
    "name": "rustysnek",
    // Base container image.
    "base": "colinjfw/rust:latest",
    // Port forwarding.
    "ports": ["3000:3000"],
    // VSCode extensions for this environment.
    "extensions": ["vscjava.vscode-java-pack"],
    // Environment variables.
    "env": ["FOO=Bar"],
    // Services to boot. These will toggle running `/bin/init<service>` in the
    // container and mount specific volumes.
    "services": ["postgres"]
  }
}
```

The [`dev`](bin/dev) command provides the following commands to control your
dev environments:

```
Setup a development environment:

  boot       Boot a development environment
  start      Start a development environment
  stop       Stop a development environment
  list       List all development environments
  edit       Edit development environments
  exec       Shell into a development environment
  install    Link the install script

Configuration:

  DEV_ROOT = /Users/colinwalker/Documents/workspace/dev
  ENV_FILE = /Users/colinwalker/Documents/workspace/dev/environments.json
```

After running `boot` on a development environment you can then connect to the
environment using the `Attach to Running Container` command in VSCode.

#### Init system

I've chosen for the base image an alpine container since it's lighter weight and
doesn't have as many security vulnerabilities as a larger base image. The pid 1
process of the container is an init system (Openrc in this case) so that it can
manage booting different processes and clean up orphaned processes in the
container.

Services are implemented as Openrc services that are included when the container
boots. Currently I've only implemented postgresql.

#### Mounts

Since host volume mounts are slow on Docker for Mac this set of scripts
implements a named volume approach for storing code persistently. It mounts the
main project folder in a named volume as well as any volumes needed for attached
services.
