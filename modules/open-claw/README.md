# Running OpenClaw on Docker Virtual Machine on macOS (ARM)

## Install Docker

Download Docker from the [official website][1] and install.

## Install

Start Docker application/service. Run the following command to install the [kasmweb/desktop][2] (Ubuntu) image.

```bash
docker run \
    -p 2222:22 \
    -p 6901:6901 \
    -e VNC_PASSWORD=123456 \
    -e RESOLUTION=1920x1080 \
    -v /dev/shm:/dev/shm \
    --platform linux/arm64 \
    --name="ubuntu-desktop" \
    --shm-size=4g \
    kasmweb/desktop:1.18.0

docker run -it \
    -p 2222:22 \
    -p 6901:6901 \
    -e VNC_PW=123456 \
    --name="ubuntu-desktop" \
    --platform linux/arm64 \
    --shm-size=512m \
    --user root \
    kasmweb/ubuntu-noble-desktop:1.18.0
```

This command means.

- Username: kasm_user
- Password: 123456

## Install SSH on Ubuntu Desktop

```bash
sudo apt update
sudo apt install -y openssh-server
sudo service ssh start
sudo service ssh enable
```

## Install OpenClaw

```bash
sudo apt update
sudo apt install -y \
  git cmake build-essential \
  libsdl2-dev libsdl2-mixer-dev libsdl2-image-dev libsdl2-ttf-dev \
  libboost-all-dev

git clone https://github.com/pjasicek/OpenClaw.git open-claw
cd open-claw

mkdir build
cd build
cmake ..
make -j$(nproc)
```

```bash
openclaw onboard --install-daemon
```

[1]: https://www.docker.com/products/docker-desktop/
[2]: https://hub.docker.com/r/kasmweb/desktop
