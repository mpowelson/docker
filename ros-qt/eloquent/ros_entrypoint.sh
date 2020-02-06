#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/eloquent/setup.bash"
exec "$@"
