# Remap caps-lock to escape
xmodmap -e "clear lock" #disable caps lock switch
xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape

# Set keyboard repeat rates
xset r rate 250 50

# Start i3
exec i3
