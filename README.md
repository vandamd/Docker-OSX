# Docker-OSX

This is a quick guide to get macOS running in Docker for use with AirMessage/BlueBubbles!

# Credits

Full credits go to [Sick.Codes](https://sick.codes/), and all the other contributers that can be listed [here](https://github.com/sickcodes/Docker-OSX/blob/master/CREDITS.md) and [here](https://github.com/sickcodes/Docker-OSX/graphs/contributors). 

[kholia](https://twitter.com/kholia) for maintaining [OSX-KVM](https://github.com/kholia/OSX-KVM).

[thenickdude](https://github.com/thenickdude) for maintaining [KVM-OpenCore](https://github.com/thenickdude/KVM-Opencore), which was started by [Leoyzen](https://github.com/Leoyzen/).

The OpenCore team (https://github.com/acidanthera/OpenCorePkg).

If you like this project, consider contributing [here](https://github.com/sickcodes/Docker-OSX)!

# Quick Start Docker-OSX

This guide uses Ubuntu 22.04 LTS ([download](https://ubuntu.com/download/desktop/thank-you?version=22.04.1&architecture=amd64))

## Prerequisite Setup ([source](https://github.com/sickcodes/Docker-OSX#initial-setup))
1. Turn on hardware virtualisation in your BIOS
2. Install QEMU and other dependancies with:

```
sudo apt install qemu qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager libguestfs-tools make gcc
```

3. Clone this repo for a copy of the bash scripts

```
git clone https://github.com/vandamd/Docker-OSX.git
```

4. On a different machine, download a VNC Viewer such as [TigerVNC](https://tigervnc.org/) or [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/macos/). This is used for remotely accessing macOS inside the Docker container


## Initiating the base image ([source](https://docs.bluebubbles.app/server/advanced/macos-virtualization/running-macos-via-docker#initiate-base-image))
5. Run the first bash script to initiate the base image:

```
bash Docker-OSX/1_baseimage.sh
```

6. Connect to macOS via VNC, your VNC Server address may look like `192.168.1.77:5999`. Your IP Address is probably something else, can find it using `hostname -I`


## Install macOS ([source](https://github.com/sickcodes/Docker-OSX#additional-boot-instructions-for-when-you-are-creating-your-container))
7. Boot into macOS Base System (Press Enter)

8. Click `Disk Utility`

9. Erase the BIGGEST disk (around 200gb default), DO NOT MODIFY THE SMALLER DISKS. If you can't click `erase`, you may need to reduce the disk size by 1kb

10. Click `Reinstall macOS`. The system may require multiple reboots during installation

11. Setup macOS as normal. You can sign into iCloud during setup or do it later, it doesn't matter

12. Once finished, DO NOT OPEN iMessage

13. Shutdown macOS as normal


## Extract image ([source](https://docs.bluebubbles.app/server/advanced/macos-virtualization/running-macos-via-docker#extract-image))
14. Run the second bash script:

```
bash Docker-OSX/2_extractimage.sh
```

This script finds `mac_hdd_ng.img` from `/var/lib/docker`, then copies it to the home folder.

NOTE: This may take a while!


## Generate Unique Serial ([source](https://docs.bluebubbles.app/server/advanced/macos-virtualization/running-macos-via-docker#generate-unique-serial))
15. Run the third bash script:

```
bash Docker-OSX/3_genserial.sh
```

This generates credentials such as SMBIOS, Serial Number, UUID so that the VM looks like an actual Mac! These credentials are placed in the home folder.

You can verify if your serial number is suitable by entering into Apple's [Check Coverage site](https://checkcoverage.apple.com/). You should get the message 'Unable to check coverage for this serial number.' in red font. If not, run delete the file called `my_permanent_serial_number.sh` in your home folder and run the third bash script again.


## First Run ([source](https://docs.bluebubbles.app/server/advanced/macos-virtualization/running-macos-via-docker#first-run))
16. Run the fourth bash script:

```
bash Docker-OSX/4_firstrun.sh
```

17. Connect via VNC using the same address as before

18. Login to macOS as usual, open iMessage and setup iCloud Sync

19. Setup AirMessage/BlueBubbles!


## Subsequent Runs [source](https://docs.bluebubbles.app/server/advanced/macos-virtualization/running-macos-via-docker#subsequent-run)
20. From now on you only need to run the fifth bash script to turn on the Docker container

```
bash Docker-OSX/5_subrun.sh
```

If you want macOS to turn on when you boot up Ubuntu, you can change the restart policy. You can find out [here](https://docs.docker.com/config/containers/start-containers-automatically/). I used [Portainer](https://www.portainer.io/) to do it as I also manage other containers!

If it's a bit slow you can look at [this](https://github.com/sickcodes/osx-optimizer) to optimise macOS.
