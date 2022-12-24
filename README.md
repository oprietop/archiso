# archiso
My archiso livecd setup.

# installing    
```
pacman -S archiso
```

# building and flashing  
Take care of the if and of values on dd
```
git clone https://github.com/oprietop/archiso.git
cd archiso
mkarchiso -v archiso
dd bs=4M if=out/archlinux-2022.12.20-x86_64.iso of=/dev/sdb conv=fsync oflag=direct status=progress
```
