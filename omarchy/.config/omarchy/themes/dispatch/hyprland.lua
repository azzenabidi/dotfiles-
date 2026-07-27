#     ____  _           _ _               
#    |  _ \(_)_ __   __| | |_   _ _ __ ___  _ __   ___ 
#    | |_) | | '_ \ / _` | | | | | '_ ` _ \| '_ \ / _ \
#    |  __/| | | | | (_| | | |_| | | | | | | |_) | (_) |
#    |_|   |_|_| |_|\__,_|_|\__,_|_| |_| |_| .__/ \___/ 
#                                           |_|          

$hyprcolor = rgba(1e90ffee)

background {
    monitor =
    path = screenshot
    blur_passes = 4
    blur_size = 8
    noise = 0.02
    contrast = 0.9
    brightness = 0.6
    vibrancy = 0.2
    vibrancy_darkness = 0.5
}

input-field {
    monitor =
    size = 300, 44
    outline_thickness = 2
    dots_size = 0.25
    dots_spacing = 0.2
    dots_center = true
    outer_color = $hyprcolor
    inner_color = $inner_color
    font_color = $font_color
    fade_on_empty = false
    placeholder_text = <span foreground="##e0e4ec80">Password...</span>
    hide_input = false
    check_color = $check_color
    fail_color = $fail_color
    fail_text = <span foreground="##dc143c">Access Denied</span>
    fail_transition = 300
    capslock_color = $hyprcolor
    numlock_color = $hyprcolor
    bothlock_color = $hyprcolor
    invert_numlock = false
    swap_font_color_with_shadow = false
    shadow_passes = 2
    shadow_size = 4
    shadow_color = rgba(00000055)
    shadow_offset = 0 2
    position = 0, -120
    halign = center
    valign = center
}

shape {
    monitor =
    size = 340, 140
    color = $inner_color
    rounding = 12
    border_size = 2
    border_color = $hyprcolor
    position = 0, -30
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:1000] echo "$(date +"%H:%M")"
    color = $font_color
    font_size = 52
    font_family = monospace
    position = 0, -40
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:60000] echo "$(date +"%A, %B %d")"
    color = $placeholder_color
    font_size = 16
    font_family = monospace
    position = 0, 20
    halign = center
    valign = center
}

label {
    monitor =
    text = 󰌾  Locked
    color = $hyprcolor
    font_size = 14
    font_family = monospace
    position = 0, 160
    halign = center
    valign = center
}
