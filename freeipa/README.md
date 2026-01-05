# Creating secrets

## `ipa-server-install-opts`

```sh
printf -- '-U -r SAOIRSE.HOME.ARPA --no-ntp --no-pkinit --http_pin <keystore_password> --dirsrv_pin <keystore_password> --root-ca-file /data/ca.crt --dirsrv-cert-file /data/ipa.p12 --http-cert-file /data/ipa.p12' | podman secret create ipa-server-install-opts -
```

## `ipa-admin-password`

```sh
printf -- '<password>' | podman secret create freeipa-admin-password -
```
