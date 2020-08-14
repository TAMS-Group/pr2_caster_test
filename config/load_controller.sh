#!/bin/bash
# Author: v4hn@20200814

# Assuming a file <controller_name>.yaml, load the controller config from this file
# then load and start the controller

# load and start controller
rosparam load $1.yaml / &&
rosservice call /pr2_controller_manager/load_controller "name: '$1'" &&
rosservice call /pr2_controller_manager/switch_controller "start_controllers: ['$1']
strictness: 2"
