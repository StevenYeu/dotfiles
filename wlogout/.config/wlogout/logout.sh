#!/bin/bash
# Exit Hyprland gracefully
hyprctl dispatch exit
# Wait a short time to allow Hyprland to finish exiting
sleep 2
# Terminate the current session
# loginctl terminate-session "${XDG_SESSION_ID:-$(who -r | awk '{print $1}')}"
loginctl kill-session $XDG_SESSION_ID
# Restart SDDM
systemctl restart sddm
