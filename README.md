# Prepare SD card
[ArchLinux ARM ARMv8 Generic instruction](https://archlinuxarm.org/platforms/armv8/generic)

## Partitioning
You will need two partition on SD card: one for Horizon OS(p1) and another for Linux(p2).

use your favorite partitioning tool to make two partition on card. (you have to set size approprietary)

## Formatting
Format your SD card's first partition with vfat and second one with ext4

## RootFS installation
Download this GNOME rootfs image [https://0w0.st/gnome__rootfs.tar.bz2]

and untar it using `bsdtar -xpf ArchLinuxARM-aarch64-latest.tar.gz -C mountpoint`

## Firmware installation
Use [NX-FWExtract](https://gitlab.com/perillamint/nx-fwextract) to extract Broadcom FW blob from your Switch system image

and copy it into `/lib/firmware/brcm` of your sd card Linux rootfs

# Build and load Nintendo Switch Linux with exploit
## How to run without Docker (Deprecated)
Run this scripts in order. You may have to handle your platform-specific errors. YMMV.

1. clone.sh
2. toolchain.sh
3. build.sh
4. u-boot-scr.sh
5. load.sh

## How to run with docker
### Building Docker image and Enter to Docker
Run this

```
sudo ./docker_run.sh
```

### Building stuffs

Run this scripts in order. It should be run WITHOUT any errors

1. `./clone.sh`
2. `./toolchain.sh`
3. `./build.sh`
4. `./u-boot-scr.sh`
5. `./artifact.sh`

### Escape from Docker

Run this

```
exit
```

### Module installation
Mount rootfs on SD card and put your modules located in `docker-artifact/modules` into `/lib/modules/`

### Loading Linux via RCM
First, put your switch into RCM mode and run following command

```
./load-docker.sh
```

### Module dependency generation
After you boot into Linux on Switch, you should run `sudo depmod` to generate module dependency

## Cheat mode -- use precompiled blob
### Download and extract blob
Run this command

```
./get_precompiled_blob.sh
```

This will check signature of tarball and extract artifacts into `docker-result` directory

### Loading Linux via RCM
First, put your switch into RCM mode and run following command

```
./load-docker.sh
```

## License
[CC0](https://creativecommons.org/share-your-work/public-domain/cc0/)
