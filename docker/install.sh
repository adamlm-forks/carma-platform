#!/bin/bash

# Copyright 2021 U.S. Department of Transportation, Federal Highway Administration
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Build the software and its dependencies

set -ex

# Source the ROS installation
source /opt/ros/noetic/setup.bash

cd ~/carma_ws

echo "Building CARMA 1Tenth (C1T)"

catkin_make_isolated --install --install-space /opt/carma/install --only-pkg-with-deps \
    carma \
    arbitrator \
    guidance \
    health_monitor \
    plan_delegator \
    trajectory_executor \
    rosbridge_server \
    route \
    -DCMAKE_BUILD_TYPE=Release

echo "Build Complete"
