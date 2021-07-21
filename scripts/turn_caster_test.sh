#!/bin/bash
# Author: v4hn@20200814

# Assuming pr2_{fl,fr,bl,br}_caster_test are loaded according to pr2_caster_test.yaml,
# send a command velocity to one of them to rotate the caster

# Potentially useful to clean the slip ring:
# - lift caster of the ground to reduce load
# - send a rather high velocity command to rotate (e.g. 5.0)
# - possibly test connectivity with very low rotation speed (e.g. 0.05)

if [[ -z "$1" ]]; then
  echo "Error: specify one of {fl,fr,bl,br}" >&2
  exit 1
fi

WHEEL=$1

if [[ -z "$2" ]]; then
  echo "Error: specify velocity command (5.0 is reasonably high, 0.05 very slow)" >&2
  exit 2
fi

VELOCITY=$2

function stop_steering {
  echo "stop steering on exit"
  rostopic pub -1 /pr2_${WHEEL}_caster_test/steer std_msgs/Float64 "data: 0.0"
}
trap stop_steering EXIT

rostopic pub /pr2_${WHEEL}_caster_test/steer std_msgs/Float64 "data: ${VELOCITY}"
