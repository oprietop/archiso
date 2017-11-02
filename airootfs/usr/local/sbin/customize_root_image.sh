#!/bin/bash

set -e -u

locale-gen

ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root
sed -i 's/^root:x:/root:U6aMy0wojraho:/g' /etc/passwd

useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /usr/bin/zsh arch

chown -R arch:users /home/arch
find /home/arch -type f -exec chmod 600 {} \;
find /home/arch -type d -exec chmod 700 {} \;


chown -R privoxy:privoxy /etc/privoxy

chmod 750 /etc/sudoers.d
chmod 440 /etc/sudoers.d/g_wheel

chown -R root:root /usr/local/sbin
chmod 755 /usr/local/sbin/*

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist

systemctl enable pacman-init.service choose-mirror.service wicd.service gpm.service tor.service privoxy.service
systemctl set-default multi-user.target

if [ -f "/var/lib/mpd" ]; then
    chown -R mpd /var/lib/mpd
    systemctl enable mpd.service
fi
