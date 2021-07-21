#!/bin/bash
# Author: v4hn@20210721

# stop caster test controllers and start base controller again

rosservice call /pr2_controller_manager/switch_controller "start_controllers: ['base_controller']
stop_controllers: ['pr2_fl_caster_test', 'pr2_fr_caster_test', 'pr2_bl_caster_test', 'pr2_br_caster_test']
strictness: 2"
