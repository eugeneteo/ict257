# Persisting Flatpak registry credentials

This example supplements RH124 chapter 13, section 1 (enabling the Red Hat
Flatpak remote). That is RHCSA-2.3.

## What you will learn

Credentials for an OCI-based Flatpak remote expire when you log out. Write the
credentials straight into a location Flatpak reads at startup to keep using
the remote in later sessions — without ever copying a file that may hold more
credentials than you intend to publish.

If the system has an active subscription, no registry credentials are needed
at all. The steps below are for unsubscribed systems.

## Save the credentials for your own account

Add the remote first, if it is not already enabled:

```console
$ flatpak remote-add --if-not-exists rhel \
     https://flatpaks.redhat.io/rhel.flatpakrepo
```

Then log in with `--authfile` pointing at the file Flatpak reads. Podman
creates the file with `0600` permissions, private to your user, and writes
only the credential for the registry you name:

```console
$ podman login --authfile "$HOME/.config/flatpak/oci-auth.json" \
     flatpaks.registry.redhat.io
```

Never pass the password with `-p`: it lands in your shell history and in the
process list. Type it at the prompt, or read it from stdin:

```console
$ printenv REGISTRY_TOKEN | podman login --authfile \
     "$HOME/.config/flatpak/oci-auth.json" -u "$REGISTRY_USERNAME" \
     --password-stdin flatpaks.registry.redhat.io
```

`$XDG_RUNTIME_DIR` — where Podman keeps its default, session-only
`containers/auth.json` — is an environment variable that points to a per-user
directory for runtime files: files that only matter while you are logged in
and should vanish when you log out. With `--authfile` you bypass that
temporary file entirely, so there is nothing to copy.

## Save the credentials system-wide

The system-wide file `/etc/flatpak/oci-auth.json` must be world-readable,
because Flatpak reads it as any local user. A world-readable credential file
is only acceptable if the credential inside is a **registry service account
token**: a credential created separately from your personal login, limited to
registry access, and revocable on its own. Create one before you log in, and
use its tokens instead of your own username and password.

Log in as root into a private file first, so the credentials never sit
world-readable while you work:

```console
# podman login --authfile /root/flatpak-auth.json \
     -u <service-account-username> --password-stdin \
     flatpaks.registry.redhat.io
```

Then install the file with its final permissions in one step:

```console
# install -m 644 /root/flatpak-auth.json /etc/flatpak/oci-auth.json
# rm /root/flatpak-auth.json
```

Because you logged into a fresh `--authfile`, the file holds only the
service-account token. Never reuse Podman's default `auth.json` here: a
shared login history for other registries — quay.io, for example — would be
published to every user on the system. And never put your personal
credentials in the system-wide file: every user could read them, and you
cannot revoke them without changing your own account password.

## Verify

List the enabled Flatpak remotes:

```console
$ flatpak remotes

Name    Options
rhel    system,oci,no-gpg-verify
```
