#!/bin/bash

#CHANGE YOUR PASSWD



# Install Packages for NAS
echo "Installing Necessary Packeges for NAS"
apt-get update
apt-get upgrade -y
apt-get install ntfs-3g
apt-get install exfat-utils exfat-fuse
apt-get install samba samba-common-bin -y


#Creating a Directory inside the root
echo "Creating Directory and permissions"
mkdir /PiServer   #You can change PiServer to anything

#Change the Permissions to that Directory
chmod 777 /PiServer   #If you changed the name then change PiServer to whatever you put above


#This is to mount the drive plug in and type lsblk to see the mounted drivethe defult is sda1 and change it to the
#correct drive if necesary
mount /dev/sda1 /PiServer/



#Configuring samba
echo "Configering samba"
SMBCONF="/etc/samba/smb.conf"

#Samba Server Information
echo "[Raspberry Pi Home Nas]" >> $SMBCONF
echo "comment = \"Pi-Nas\"" >> $SMBCONF
echo "path = /PiServer" >> $SMBCONF
echo "read only = no" >> $SMBCONF
echo "writeable = yes" >> $SMBCONF
echo "browseable = yes" >> $SMBCONF
echo "create mask = 0777" >> $SMBCONF
echo "directory mask = 0777" >> $SMBCONF
echo "public = no" >> $SMBCONF
echo "force user = root" >> $SMBCONF



#Adding a user to
echo "--------------------"
echo "Please Fill in info"
echo "--------------------"
adduser nas

#add a password to smb
smbpasswd -a nas


#reastart samba
/etc/init.d/smbd restart
/etc/init.d/nmbd restart



#making sure drive doesnt unmount after restarting
DRIVE="/etc/fstab"


echo "/dev/sda1 /PiServer auto defaults, user 0 2" >> $DRIVE

echo "-------------------------"
echo "Nas Install is complete!"
echo "-------------------------"
echo "Username is nas"
#Installing Docker
echo "---------------------"
echo "Installing Docker"
echo "---------------------"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker pi
echo "--------------------------------------------------"
echo "PLEASE RESTART YOUR PI BY TYPING sudo reboot now"
echo "--------------------------------------------------"
echo "Once Finished rebooting either type sudo ./Yummypi3d if "
echo "you have a raspberry pi 3 and type sudo ./Yummypi4d "
echo "if you are on a raspberry pi 4"
