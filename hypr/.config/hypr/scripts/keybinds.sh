#!/usr/bin/env bash

hyprctl binds -j |
jq -r '
def mods($m):
  [
    if (($m / 64) % 2 >= 1) then "SUPER" else empty end,
    if (($m / 8) % 2 >= 1) then "ALT" else empty end,
    if (($m / 4) % 2 >= 1) then "CTRL" else empty end,
    if (($m / 1) % 2 >= 1) then "SHIFT" else empty end
  ] | join(" + ");

sort_by(.description // "") |
.[] |
"\(mods(.modmask))\(if mods(.modmask) != "" then " + " else "" end)\(.key)\t\(.description // "No description")"
' |
column -t -s $'\t' |
rofi -theme Arc-Dark -dmenu -i -p "Hyprland Keybinds"
