#!/bin/bash
# Author: v4hn@20200814

# Load the controller configs from the file
# then load and start the controller

# load and start controller
echo "Loading configs to parameter server"
rosparam load $(rospack find pr2_caster_test)/config/pr2_caster_test.yaml / &&
echo "Loading controllers"
rosservice call /pr2_controller_manager/load_controller "name: 'pr2_fl_caster_test'" &&
rosservice call /pr2_controller_manager/load_controller "name: 'pr2_fr_caster_test'" &&
rosservice call /pr2_controller_manager/load_controller "name: 'pr2_bl_caster_test'" &&
rosservice call /pr2_controller_manager/load_controller "name: 'pr2_br_caster_test'" &&
echo "Stopping base controller"
rosservice call /pr2_controller_manager/switch_controller "stop_controllers: ['base_controller']
strictness: 2"
echo "Starting controllers"
rosservice call /pr2_controller_manager/switch_controller "start_controllers: ['pr2_fl_caster_test', 'pr2_fr_caster_test', 'pr2_bl_caster_test', 'pr2_br_caster_test']
strictness: 2"
echo "Done"
