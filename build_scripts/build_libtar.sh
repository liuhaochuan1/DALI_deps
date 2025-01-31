#!/bin/bash -xe

# Copyright (c) 2021, NVIDIA CORPORATION. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# For a snapshot of the code, see the README.rst
pushd third_party/libtar
patch -p1 < ${ROOT_DIR}/patches/libtar/libtar-1.2.20-CVE-2021-33643-CVE-2021-33644.patch
patch -p1 < ${ROOT_DIR}/patches/libtar/libtar-1.2.20-CVE-2021-33645-CVE-2021-33646.patch
autoreconf --force --install
CC=${CC_COMP} \
CXX=${CXX_COMP} \
CFLAGS="-fPIC" \
CXXFLAGS="-fPIC" \
./configure \
    ${HOST_ARCH_OPTION} \
    --prefix=${INSTALL_PREFIX} \
    --disable-shared
make -j4
cd lib
make install
popd
