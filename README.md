# LAMP

## Podman container: Fedora 40 LAMP + phpMyAdmin + DokuWiki_ITA

Container initially made for personal use.

Mainly intended for Italian users.

Documentation included under "CC BY-NC-SA 4.0 Deed" license.

"ReaLoGiCMaN" is the acronym for "Marco Angeli".

Last modified: 13/06/2024

----

Instructions for installing the LAMP container as a non-privileged user:

```bash
wget https://github.com/realogicman/lamp/archive/refs/heads/main.zip
unzip main.zip
cd lamp-main/ 
podman build -t f40lamp .
podman run -d --name f40_lamp -p 8080:80 f40lamp
```

----

Instructions to install the LAMP container on your system, running it automatically on every boot:

```bash
sudo systemctl enable podman-restart.service
wget https://github.com/realogicman/lamp/archive/refs/heads/main.zip
unzip main.zip
cd lamp-main/ 
sudo podman build -t f40lamp .
sudo podman run -d --name f40_lamp -p 80:80 --restart=always f40lamp
```

----

Documentation integrated into the container.
