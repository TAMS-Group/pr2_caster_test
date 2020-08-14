#!/bin/bash
# Author: v4hn@20200814

# Assuming pr2_caster_test is loaded according to pr2_caster_test.yaml,
# send a command velocity to rotate the caster.

# Potentially useful to clean the slip ring:
# - lift caster of the ground to reduce load
# - send a rather high velocity command to rotate (e.g. 5.0)
# - possibly test connectivity with very low rotation speed (e.g. 0.05)

rostopic pub /pr2_caster_test/steer std_msgs/Float64 "data: $1"
