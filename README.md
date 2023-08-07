# PODS

Podman pods & containers for devel and testing.

## Usage

### Creating pods and containers

* Run the scripts as root to create rootfull pods and containers
* Run the scripts to generate the pods first to create the pods, networks and infras

### Systemd service generation

* After pods and containers created, run `podman generate-systemd --files --new <pod name>`
* Move the services' files to `/etc/systemd/system`
* Run `chcon system_u:object_r:systemd_unit_file_t:s0 <service file name>` for each of the services
* Reload systemd daemon and remove the pods & containers
* Run the pods by running the systemd services

## Why systemd?

* Supports podman auto-update
* Easier to maintain as systemd service files (podman-compose sucks)