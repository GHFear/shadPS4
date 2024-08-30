<!--
SPDX-FileCopyrightText: 2024 shadPS4 Emulator Project
SPDX-License-Identifier: GPL-2.0-or-later
-->

## ShadPS4-QT Build Setup for Linux Mint.

#### Add ubuntu-toolchain-r/test : Required for Linux Mint
```
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
```
#### Install gcc-13 and g++-13 : Required for Linux Mint
```
sudo apt-get update <br>
sudo apt-get install gcc-13
```
#### Install dependencies pack 1 : Required for Linux Mint
```
sudo apt-get update && sudo apt install libx11-dev libxext-dev libwayland-dev libfuse2 clang build-essential qt6-base-dev qt6-tools-dev
```

#### Install dependencies pack 2 : Required for Linux Mint
```
sudo apt-get install build-essential libasound2-dev libpulse-dev libopenal-dev zlib1g-dev libedit-dev libvulkan-dev libudev-dev git libevdev-dev libsdl2-2.0 libsdl2-dev libjack-dev libsndio-dev
```

#### Clone ShadPS4 repository recursively.
```
git clone --recursive https://github.com/shadps4-emu/shadPS4.git
cd shadPS4
```

#### Generate the build directory in the shadPS4 directory with QT GUI enabled
```
cmake -S . -B build/  -DENABLE_QT_GUI=ON
```

#### Enter the build directory
```
cd build/
```

#### Parallel build project with cmake
```
cmake --build . --parallel$(nproc)
```

#### shadPS4 executable will be inside "shadPS4/build" directory
