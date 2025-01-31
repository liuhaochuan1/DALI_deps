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

# zstandard compression library
pushd third_party/zstd
   CFLAGS="-fPIC" \
   CXXFLAGS="-fPIC" \
   CC=${CC_COMP} \
   CXX=${CXX_COMP} \
   prefix=${INSTALL_PREFIX} \
make -j4 install 2>&1 >/dev/null
popd
