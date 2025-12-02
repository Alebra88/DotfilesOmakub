#!/bin/bash

# Check if an Alacritty window exists by checking for the executable 'alacritty' in the window list class.
if wmctrl -lx | grep -q "Alacritty.Alacritty"; then
    # Window exists, activate it. The -x option matches the WM_CLASS.
    wmctrl -x -a "Alacritty.Alacritty"
else
    # No window found, launch Alacritty
    alacritty
fi
