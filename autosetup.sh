# ShadPS4-QT Build Setup for Linux Mint 22

# Add apt-repo: ppa:ubuntu-toolchain-r/test : Required for Linux Mint 22
sudo add-apt-repository ppa:ubuntu-toolchain-r/test

# Add gcc-13 and g++-13 : Required for Linux Mint
sudo apt-get update
sudo apt-get install gcc-13

# Install dependencies pack 1 : Required for Linux Mint 22
sudo apt-get update && sudo apt install libssl-dev libx11-dev libxext-dev libwayland-dev libfuse2 clang build-essential qt6-base-dev qt6-tools-dev

# Install dependencies pack 2 : Required for Linux Mint 22
sudo apt-get install build-essential libasound2-dev libpulse-dev libopenal-dev zlib1g-dev libedit-dev libvulkan-dev libudev-dev git libevdev-dev libsdl2-2.0 libsdl2-dev libjack-dev libsndio-dev

# Clone ShadPS4 repository recursively.
git clone -b main --recursive --single-branch https://github.com/shadps4-emu/shadPS4.git
git clone -b filedpot --single-branch https://github.com/GHFear/shadPS4-mint22.git

# Copy patched libavutil/error.h
cp "shadPS4-mint22/externals/patched-libavutil-error/error.h" "shadPS4/externals/ffmpeg-core/include/libavutil/error.h"

# Move into the shadPS4 directory
cd shadPS4

# Generate the build directory in the shadPS4 directory with QT GUI enabled
cmake -S . -B build/ -DCMAKE_C_COMPILER="/usr/bin/gcc-13" -DCMAKE_CXX_COMPILER="/usr/bin/g++-13" -DENABLE_QT_GUI=ON

# Enter the build directory
cd build/

# Parallel build project with cmake.
cmake --build . --parallel$(nproc)

# shadPS4 executable will be inside "shadPS4/build" directory.

