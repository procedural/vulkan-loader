#!/bin/bash
cd "$(dirname -- "$(readlink -fn -- "${0}")")"

# Used commits:
# https://github.com/KhronosGroup/Vulkan-Loader/commit/1f9a545
# https://github.com/KhronosGroup/Vulkan-Headers/commit/c4e056d

rm -rf Vulkan-Loader
rm -rf Vulkan-Headers

git clone --depth 1 https://github.com/KhronosGroup/Vulkan-Loader
git clone --depth 1 https://github.com/KhronosGroup/Vulkan-Headers

rm -rf Vulkan-Loader/.git
rm -rf Vulkan-Headers/.git

# Dafuq?
# https://github.com/KhronosGroup/Vulkan-Loader/blob/1f9a545/cmake/FindVulkanHeaders.cmake#L62
mkdir -p ~/Desktop/vulkan_loader/Vulkan-Headers/share/vulkan
cp -r ~/Desktop/vulkan_loader/Vulkan-Headers/registry ~/Desktop/vulkan_loader/Vulkan-Headers/share/vulkan/

cd Vulkan-Loader
mkdir -p build
cd build
cmake -G Ninja .. -DCMAKE_BUILD_TYPE=Debug -DVULKAN_HEADERS_INSTALL_DIR=~/Desktop/vulkan_loader/Vulkan-Headers
ninja
cd ../..

