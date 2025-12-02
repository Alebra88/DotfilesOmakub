#!/bin/bash

# Check if an Obsidian window exists by checking for the executable 'obsidian' in the window list class.
if wmctrl -lx | grep -q "obsidian.obsidian"; then
    # Window exists, activate it. The -x option matches the WM_CLASS.
    wmctrl -x -a "obsidian.obsidian"
else
    # No window found, launch Obsidian
    obsidian
fi
