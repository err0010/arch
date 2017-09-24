##更改软件源
echo "## China
Server = http://mirrors.163.com/archlinux/\$repo/os/\$arch
Server = http://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
Server = http://mirror.lzu.edu.cn/archlinux/\$repo/os/\$arch
Server = http://mirrors.shuosc.org/archlinux/\$repo/os/\$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch
Server = http://mirrors.xjtu.edu.cn/archlinux/\$repo/os/\$arch
Server = http://mirror.xtom.com.hk/archlinux/\$repo/os/\$arch
Server = http://mirrors.zju.edu.cn/archlinux/\$repo/os/\$arch
" > /etc/pacman.d/mirrorlist
read -p "Edit the pacman.conf ? (y or Enter  " TMP
if [ "$TMP" == y ]
then
    nano /etc/pacman.conf
fi
##安装基本系统
TMP=n
while [ "$TMP" == n ]
do
    pacstrap /mnt base base-devel --force
    genfstab -U -p /mnt > /mnt/etc/fstab
    read -p "Successfully installed ? (n or Enter  " TMP
done
##进入已安装的系统
wget https://raw.githubusercontent.com/err0010/arch/2.sh
mv 2.sh /mnt/root/2.sh
chmod +x /mnt/root/2.sh
arch-chroot /mnt /root/2.sh
