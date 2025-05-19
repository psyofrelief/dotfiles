#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo '\d+%' | cut -d% -f1)"
PERCENTAGE_INT=$(echo "$PERCENTAGE" | tr -d '%')
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ -z "$PERCENTAGE_INT" ]; then
  exit 0
fi

# Define color codes
RED="0xffd75f5f"
YELLOW="0xfffacc15"
GREEN="0xff4ade80"

# Set icon and label color
if [ -n "$CHARGING" ]; then
  ICON="PWR"
  LABEL_COLOR="$GREEN"
else
  ICON="BAT"
  if [ "$PERCENTAGE_INT" -lt 20 ]; then
    LABEL_COLOR="$RED"
  else
    LABEL_COLOR="$YELLOW"
  fi
fi

# Set icon and colored label in SketchyBar
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE_INT}%" label.color="$LABEL_COLOR"
