#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi

for sid in $(aerospace list-workspaces --all); do
  if [ "$sid" = "1" ]; then name="WEB"
  elif [ "$sid" = "2" ]; then name="DEV"
  elif [ "$sid" = "3" ]; then name="TRM"
  else name="$sid"
  fi

  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    label="$name" \
    click_script="aerospace workspace $sid"
done

