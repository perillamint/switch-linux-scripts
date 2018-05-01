# Build and load Nintendo Switch Linux with exploit
## How to run without Docker
Run this scripts in order. You may have to handle your platform-specific errors. YMMV.

1. clone.sh
2. toolchain.sh
3. build.sh
4. u-boot-scr.sh
5. load.sh

## How to run with docker (ALPHA)
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

### Building host side of tools
Run this scripts in order. You have to deal with host side dependency

1. `./minimal_clone.sh`
2. `./minimal_build.sh`

### Loading Linux via RCM
First, put your switch into RCM mode and run following command

```
./load-docker.sh
```

## License
[CC0](https://creativecommons.org/share-your-work/public-domain/cc0/)
