# PODS

Podman pods & containers for devel and testing.

## Usage

### Installing quadlet files

* Copy `.pod`, `.container`, `.build` and `.volume` files to `/etc/containers/systemd/`

### Creating directories for volumes

* All of the volumes here are bind-mounted, hence you need to create the directory first
* Example: In [postgres.volume](postgres/postgres.volume), `Device=/var/opt/containers/postgres` means `/var/opt/containers/postgres` dir should be created first

### Systemd service generation

* Reload systemd `sudo systemctl daemon-reload`
* Systemd will generate services from the installed files
* Run container using `systemctl start`, e.g. for `postgres.container`, run `systemctl start postgres.service`

## Why quadlet?

* Supports podman auto-update
* Easier to maintain as quadlet files (podman-compose sucks)