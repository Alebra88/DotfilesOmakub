#!/bin/bash

# Check if a VS Code window exists by checking for the executable 'code' in the window list class.
if wmctrl -lx | grep -q "code.Code"; then
    # Window exists, activate it. The -x option matches the WM_CLASS.
    wmctrl -x -a "code.Code"
else
    # No window found, launch VS Code
    code
fi
