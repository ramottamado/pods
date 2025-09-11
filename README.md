# PODS

Podman pods & containers for devel and testing.

## Usage

### Installing quadlet files

* Copy `.pod`, `.container` and `.volume` files to `/etc/containers/systemd/`

### Systemd service generation

* Reload systemd `sudo systemctl daemon-reload`
* Systemd will generate services from the installed files
* Run container using `systemctl start`, e.g. for `postgres.container`, run `systemctl start postgres.service`

## Why quadlet?

* Supports podman auto-update
* Easier to maintain as quadlet files (podman-compose sucks)