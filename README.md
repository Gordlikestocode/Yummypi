# YummyPi

A script for Raspberry Pi that creates the ultimate Pi Server

## Description

This is a bash script that automaticly installs and setup the Samba Protocal, Nextcloud, Potainer, Home Assistant and duplicati all on docker. All you got to do is clone the project and run the script. To access your server, for Samba the defult username is nas. Port 8080 is for Next Cloud, Port 9000 is for Portainer, Port 8123 is for Home Assistant and Duplicati is on port 8200. Samba is a protocal to create a network drive, Next Cloud is used to make a self hosted cloud, Portainer is used for managing your docker containers. Home Assistant is used to manage your smart home devices. Duplicati is to backup your data to dropbox or google drive.

## Getting Started

### Dependencies

* Install Raspberry Pi os lite https://downloads.raspberrypi.org/imager/imager_latest.exe
* Raspberry Pi 3 or 4 (preferably Raspberry Pi 4 4gb) https://www.amazon.com/CanaKit-Raspberry-8GB-Starter-Kit/dp/B07V5JTMV9/ref=sr_1_3?adgrpid=1334807689179044&dchild=1&hvadid=83425552820538&hvbmt=be&hvdev=c&hvlocphy=80050&hvnetw=o&hvqmt=e&hvtargid=kwd-83425844971996%3Aloc-190&hydadcr=18009_10501201&keywords=raspberry-pi&qid=1623780781&sr=8-3&th=1
* Connect a external ssd to the pi

### Installing

* First you need to install git
```

sudo apt-get install git -y
```

* Now you need to clone the project 
```

git clone https://github.com/Gordlikestocode/Yummypi.git
```

* Now Run Yummypi.sh
```

sudo ./Yummypi.sh
```

* When a splash screen ask for DCHP navigate and click yes
* Now just imput information when prompted
Once its done restart the pi 
```

sudo reboot now
```

* Now its time to install Docker and its containers
* If you are on a raspberry pi 3 type the command below
```
sudo ./Yummypi3d
```
* If you are on a pi 4 type
```

sudo ./Yummypi4d
```
* Not sure what version? type the command below to find your version
```

cat /proc/cpuinfo | grep Model
```
## Now let it install meanwhile connect to your new nas

### Windows

* Right click windows and click run, then type two backslashes and "urip" then enter nas for user and what ever you set your password

### Mac

* Open Finder, then click go, select connect to server, then type smb://uripofpi. Finally type in your credentials

## Now we should go and access our nextcloud server

* Type "uripaddress" with :8080 at the end
* Now create a Admin acount username and password
* Click Postgres and type postgres for stoarage and database, for the datausername type postgres, for type 123456, for database name type postgres, and replace localhost with postgres

## Access Portainer

* type "uripaddress" with :9000 at the end
* Create an account
* Click docker, and press connect

## Access Home Assistant

* Type your "ipaddress" with :8123 at the end
* Create an account, and put in your timezone

## Backup

* "type ur ip" with :8200 at the end
* go to backup and choose google drive or your choice, and sign in to create a key give Duplicaty the correct perms and choose the folder which is the home folder

## You Are All Done!

## Help

You might have issues with the Nas and drive mounting to fix that by typing
```

lsblk
```
See where your drive is mounted if it is somewhere else then type
```

mount /dev/sda1 /PiServer/
```
Replace sda1 with where ever the drive is mounted
Next you want to type
```

cd etc
nano fstab
```
and replace the last line with
```

/dev/sda1 /PiServer auto defaults, user 0 2
```
And replace sda1 with where ever the drive is mounted

You will rarly run into this but it is possible

* Script not running try typing sudo infront of the command.

## Version History
* 1 initial release

## Acknowledgments
* [read-me template] (https://gist.github.com/DomPizzie/7a5ff55ffa9081f2de27c315f5018afc)
* [samba] (https://www.samba.org/)
* [NextCloud] (https://nextcloud.com/)
* [Portainer] (https://www.portainer.io/)
* [Home Assistant] (https://www.home-assistant.io/)
* [Duplicati] (https://github.com/duplicati/duplicati)
* [Docker] (https://www.docker.com/)
