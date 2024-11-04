# https://github.com/realogicman/lamp
FROM registry.fedoraproject.org/fedora
LABEL maintainer="Marco Angeli <mangeli774@gmail.com>"
RUN dnf -y upgrade && dnf -y install httpd mariadb-server php php-mysqlnd php-mbstring php-gd php-json phpmyadmin nano mc unzip unrar git wget nmap fastfetch
ADD file_aggiunti.tgz /
RUN systemctl enable httpd && systemctl enable mariadb && systemctl enable lamp-1st-boot
VOLUME ["/srv/storage"]
EXPOSE 80 3306
CMD ["/sbin/init"]

# Containerfile Podman (= Dockerfile) per la creazione del container "Fedora LAMP" per lo sviluppo locale di siti web
# Progetto iniziato il 27/12/2023
# Ultimo aggiornamento: 04/11/2024
# L'archivio "file_aggiunti.tgz" contiene tutte le modifiche applicate.
# Il volume montato serve solo per il caricamento dei file e la sua funzione è puramente di servizio.
# In caso di "commit" il contenuto di quella cartella del container ("/srv/storage") verrà ovviamente scartato.
# 
### 
# 
# === Creazione immagine ===
#   podman build -t lamp .
# 
# === Salvataggio dell'immagine per archiviazione ===
#   podman save -o lamp.podman-image lamp
# 
# === Compressione dell'immagine salvata per archiviazione ===
#   tar -cJvf lamp.podman-image.tar.xz lamp.podman-image
# 
# ==== Copia / Ripristino in un sistema __dove non sia presente__ la stessa immagine ====
# 
# === Decompressione dell'immagine archiviata ===
#   tar -xvf lamp.podman-image.tar.xz
# 
# === Ripristino dell'immagine del container ===
#   podman load -i lamp.podman-image
# 
# === Eseguire il container ===
#   podman run -d --name container_lamp -p 8080:80 lamp
# 
# ----
# 
# === Utilizzo quotidiano - non privilegiato===
#   podman start container_lamp
#   podman inspect -f '{{.Mounts}}' container_lamp
#   podman exec -ti container_lamp /bin/bash
#   podman stop container_lamp
#
# === Installazione come servizio - in esecuzione permanente ===
#   sudo systemctl enable podman-restart.service
#   sudo podman load -i lamp.podman-image
#   sudo podman run -d --name container_lamp -p 80:80 --restart=always lamp
