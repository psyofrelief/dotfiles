#!/bin/sh

# The volume_change event supplies a $INFO variable with the current volume percentage

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  sketchybar --set "$NAME" icon="VOL" label="${VOLUME}%"
fi
