#!/bin/bash
# Author: v4hn@20200814

# Assuming a file <controller_name>.yaml and a running controller called <controller_name>
# stop, unload and delete controller configuration, then load it again from the file and start the controller

# remove controller - skip if no controller is loaded yet
rosservice call /pr2_controller_manager/switch_controller "stop_controllers: ['$1']
strictness: 2" &&
rosservice call /pr2_controller_manager/unload_controller "name: '$1'" &&
rosparam delete /$1 &&

# load and start controller
rosparam load $1.yaml / &&
rosservice call /pr2_controller_manager/load_controller "name: '$1'" &&
rosservice call /pr2_controller_manager/switch_controller "start_controllers: ['$1']
strictness: 2"
