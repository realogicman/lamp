# https://github.com/realogicman/lamp
FROM registry.fedoraproject.org/fedora
LABEL maintainer="Marco Angeli <mangeli774@gmail.com>"
RUN dnf -y upgrade && dnf -y install httpd mariadb-server php php-mysqlnd php-mbstring php-gd php-json phpmyadmin nano mc unzip unrar git wget nmap
ADD file_aggiunti.tgz /
RUN systemctl enable httpd && systemctl enable mariadb && systemctl enable f40lamp-1st-boot
VOLUME ["/srv/storage"]
EXPOSE 80 3306
CMD ["/sbin/init"]

# Containerfile Podman (= Dockerfile) per la creazione del container "Fedora 40 LAMP" per lo sviluppo locale di siti web
# Progetto iniziato il 27/12/2023
# Ultimo aggiornamento: 16/06/2024
# L'archivio "file_aggiunti.tgz" contiene tutte le modifiche applicate.
# Il volume montato serve solo per il caricamento dei file e la sua funzione è puramente di servizio.
# In caso di "commit" il contenuto di quella cartella del container ("/srv/storage") verrà ovviamente scartato.
# 
### 
# 
# === Creazione immagine ===
#   podman build -t f40lamp .
# 
# === Salvataggio dell'immagine per archiviazione ===
#   podman save -o f40lamp.podman-image f40lamp
# 
# === Compressione dell'immagine salvata per archiviazione ===
#   tar -cJvf f40lamp.podman-image.tar.xz f40lamp.podman-image
# 
# ==== Copia / Ripristino in un sistema __dove non sia presente__ la stessa immagine ====
# 
# === Decompressione dell'immagine archiviata ===
#   tar -xvf f40lamp.podman-image.tar.xz
# 
# === Ripristino dell'immagine del container ===
#   podman load -i f40lamp.podman-image
# 
# === Eseguire il container ===
#   podman run -d --name f40_lamp -p 8080:80 f40lamp
# 
# ----
# 
# === Utilizzo quotidiano ===
#   podman start f40_lamp
#   podman inspect -f '{{.Mounts}}' f40_lamp
#   podman exec -ti f40_lamp /bin/bash
#   podman stop f40_lamp
