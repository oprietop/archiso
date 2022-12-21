# archiso
My archiso livecd setup.

# building
```
pacman -S archiso
rm -rf out work
mkarchiso -v archiso
dd bs=4M if=out/archlinux-baseline-2022.12.20-x86_64.iso of=/dev/sdb conv=fsync oflag=direct status=progress
```
