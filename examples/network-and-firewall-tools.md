# Network and firewall tools

These examples supplement RH124 chapter 18, section 1 (configuring network connections) and RH134 chapter 14, section 1 (controlling network traffic with firewalls). They cover RHCSA-8.1, RHCSA-8.4 and RHCSA-10.1.

## What you will learn

Use `nmtui` for safer network configuration edits, and understand how `firewall-cmd` applies rules permanently versus temporarily.

```
[root@rhel ~]# nmtui
```

It edits NetworkManager connection profiles, which is what `nmcli` edits.
Nothing in the menu is beyond `nmcli` and nothing in it is a separate system.
The gain is narrow and it is real. A long `nmcli` line carrying an address, a
prefix, a gateway and a DNS server is easy to mistype when you are against the
clock, and the menu asks for each field by name. It also shows you the current
settings without you having to recall the query that prints them.

The tool will be there. `NetworkManager-tui` ships in BaseOS on RHEL 10, and
it is a default member of the `core` package group. Every RHEL 10 system gets
`core`, including a minimal install. You may read online that RHEL 10 removed
it. That is wrong, and we checked the package set instead of the claim.

Learn `nmcli` anyway. RHCSA-8.1 and RHCSA-8.2 are what the exam scores, and
RH124 18.01 teaches `nmcli` because that is the tool the exam expects. Chapter
17 names no configuration tool at all, so do not go hunting for one there. A
student who can only drive the menu stops dead the moment a task wants
something the menu does not offer. Use `nmtui` to fill in a long profile
safely and to read back what is set. Do not use it to avoid the command.

Red Hat's own documentation shows the two tools side by side.

| Page | Why it is worth your time |
| --- | --- |
| [Configuring an Ethernet connection](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/configuring_and_managing_networking/configuring-an-ethernet-connection) | Red Hat builds one connection profile by several routes, with `nmcli` and with `nmtui` among them. Read those two sections one after the other and you will see that they write the same profile |

## Zones, services and the two-step

Nothing you type at `firewall-cmd` reaches anywhere until `firewalld` is
running, so check the daemon before you blame your rules. Stop the service and
the command has nobody left to speak to. It is a client, it talks to the daemon
over D-Bus, and with the daemon down it exits and tells you so. Adding
`--permanent` changes none of that. There is a separate `firewall-offline-cmd`
for editing the saved configuration while the service is stopped, which is what
an installer uses. In this module, start the service before you try anything
else in this example.

A zone is a named set of rules with interfaces and source addresses attached
to it. The package ships a dozen of them and you will use two.

```
[root@rhel ~]# firewall-cmd --get-zones
[root@rhel ~]# firewall-cmd --get-default-zone
[root@rhel ~]# firewall-cmd --info-zone=public
```

Read the third output as far as the `services` line and stop. What sits below
it, for forwarding, masquerading, port forwarding and rich rules, belongs to
work no objective asks of you. The `firewalld.zones(5)` manual page says what
each shipped zone is for. Look it up there instead of online, because that is
RHCSA-1.11 practice and the exam gives you no browser.

Service names are the other half. A service is a small XML file naming the
ports one application needs.

```
[root@rhel ~]# firewall-cmd --get-services | tr ' ' '\n' | wc -l
[root@rhel ~]# ls /usr/lib/firewalld/services/
```

The count comes back in the hundreds and nobody memorises it. The point is
that `--add-service=nfs` beats remembering which ports NFS wants, and that
you can open the file and read the answer when you need it.

Now watch the two-step work. Run the listing before and after every command.

```
[root@rhel ~]# firewall-cmd --list-services
cockpit dhcpv6-client ssh
[root@rhel ~]# firewall-cmd --permanent --add-service=smtp
success
[root@rhel ~]# firewall-cmd --list-services
cockpit dhcpv6-client ssh
[root@rhel ~]# firewall-cmd --reload
success
[root@rhel ~]# firewall-cmd --list-services
cockpit dhcpv6-client smtp ssh
```

The listing does not move in the middle. `--permanent` writes to the file on
disk and leaves the running firewall alone. `--reload` is what loads the file.
Removal behaves the same way and goes wrong in the same way.

```
[root@rhel ~]# firewall-cmd --permanent --remove-service=smtp
[root@rhel ~]# firewall-cmd --reload
[root@rhel ~]# firewall-cmd --list-services
cockpit dhcpv6-client ssh
```

Miss the reload and you will test a rule that is not loaded. Miss
`--permanent` and your rule disappears at the next boot. Both faults look
exactly like a rule that does not work.

When a port is open, prove that something answers on it. `curl` is the tool
for that, and against a lab server on 443 it stops before it tells you
anything useful. The certificate is self-signed or missing, no local authority
vouches for it and `curl` declines the connection instead of trusting it.

```
[root@rhel ~]# curl -k https://web.example.com
```

The `-k` option skips that check, and `--insecure` is the same option written
out. RH134 14.02 uses it twice in exactly this way and describes it as the way
past strict host checking. So it is not a trick and it needs no apology. It is
the normal move when you want to tell a firewall problem apart from a
certificate problem.

Know what you have switched off. The certificate check is what proves you are
talking to the machine you meant to reach. Without it, anything sitting
between you and the server can answer in its place and you will not know.
Testing your own server, on a lab network, on a port you opened a minute ago,
that costs you nothing. Away from the lab it costs you the guarantee. Reach
for `-k` to answer whether a service is up, then put it down.

## An open port you did not put there

A port is open and you do not know why. That is a question with a fixed shape,
and four commands answer it in order.

```
[root@rhel ~]# firewall-cmd --info-zone=public
[root@rhel ~]# ss -tulnp
[root@rhel ~]# rpm -qf /usr/bin/name
[root@rhel ~]# rpm -qi package
```

Each one answers a different question. The zone listing says what the firewall
allows through, on its `ports` and `services` lines. `ss` says what is
listening and names the process holding the socket. `rpm -qf` takes the path of
that program and names the package it arrived in. `rpm -qi` prints the
description of the package, which is usually where the answer finally is. Most
surprises end there. Nothing is broken and something is simply running, and now
you know what.

Use `ss` and not `netstat`. RH124 17.03 states that `ss` superseded `netstat`,
which arrives in the `net-tools` package. That package sits in the `base`
package group and not in `core`, so a minimal install leaves you with a command
that is not found. `ss` comes from `iproute`, which every install gets. The
options are the same on both and RH124 17.03 tables them, so learn them once.
You meet `ss` in week 6 of the module, and this is what it is for.
