#!/bin/bash

# Run the themes selector
kitten themes --reload-in=all

# Wait a moment to ensure the theme is fully applied
sleep 0.5

# Simulate pressing Cmd+Shift+R to reload the config
kitten @ load-config ~/.config/kitty/kitty.conf

# Restart Zsh to apply theme changes fully
exec zsh
