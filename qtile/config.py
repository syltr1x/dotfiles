import subprocess as sp, os
from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
bg_path = "/home/syltr1x/Pictures/wallpaper.jpg" # Change this to point to bg file 

# Start (picom / fix kitty transparency . feh / set background) 
@hook.subscribe.startup_once
def autostart():
    sp.Popen(["picom"], preexec_fn=os.setpgrp)
    sp.Popen(["feh", "--bg-fill", bg_path])

# Mod Keys
mod = "mod4"
alt = "mod1"
# Application Variables
terminal = "kitty"
rofi = "rofi -show run"
browser = "firefox"
editor = "code"
colors = ["#ef0a55","#b0b0b0","#0fafa1","#fff","#000"]

keys = [
    # Move Focus Window
    Key([mod], "left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "tab", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    Key([mod, "shift"], "left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    Key([mod, "control"], "left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Manage Layout
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "v", lazy.window.toggle_fullscreen()),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),

    # Custom Shortcuts
    Key([mod, "control"], "q", lazy.reload_config(), desc="Reload the config"),
    # Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "r", lazy.spawn(rofi), desc="Spawn a Rofi"),
    Key([mod], "f", lazy.spawn(browser), desc="Spawn a Default Browser"),
    Key([mod], "c", lazy.spawn(editor), desc="Spawn a Default Editor")
]

groups = [Group(i) for i in ["", "󰈹", "", "󰓇", "", "󰒋", "󰖣"]]

for i, group in enumerate(groups):
    areaNumber = str(i+1)
    keys.extend([
            # mod1 + group number = switch to group
            Key([mod], areaNumber, lazy.group[group.name].toscreen(),
                desc="Switch to group {}".format(group.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key([mod, "shift"], areaNumber, lazy.window.togroup(group.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(group.name),
            ),
        ]
    )

layouts = [
    layout.Columns(margin=5, border_focus="#eddc87", border_width=2),
    layout.Max(),
]

widget_defaults = dict(
    font="Hack Nerd Font Mono Regular",
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

# Custom Functions for Bar customization
def left_arrow(bg_color, fg_color):
    return widget.TextBox(
        text='\uE0B2',
        padding=0,
        fontsize=25,
        background=bg_color,
        foreground=fg_color)

def right_arrow(bg_color, fg_color):
    return widget.TextBox(
        text='\uE0B0',
        padding=0,
        fontsize=35,
        background=bg_color,
        foreground=fg_color)

def show_icon(icon, bg_color, fg_color):
    return widget.TextBox(
        text=icon,
        padding=0,
        fontsize=30,
        background=bg_color,
        foreground=fg_color)

def local_con(bg_color, fg_color):
    ip = sp.check_output("ip a show | grep 'inet ' | awk '{ print $2 }' | cut -d/ -f1 | tail -1", shell=True)
    ip = str(ip)[2:][:-1]
    if ip.count(' ') > 1:
        vpn = ip.split(' ')[1]
        ip = ip.split(' ')[0]
    else:
        vpn="NO"
    return widget.TextBox(
        text=f"LAN:{ip[:-2]} VPN:{vpn} ",
        padding=0,
        fontsize=14,
        background=bg_color,
        foreground=fg_color)

# Bar Configuration
screens = [
    Screen(
        top=bar.Bar([
            widget.GroupBox(
                active="fff",
                inactive="444",
                fontsize=20,
                highlight_method='text',
                disable_drag=True,
                margin_y=2,
                padding_x=12,
                center_aligned=True,
                urgent_text="#f00",
                use_mouse_wheel=False,
                rounded=False,
                highlight_color="#000",
                this_current_screen_border=["#642ca3", "#220740"],
            ),
            widget.WindowName(fontsize=14),
            left_arrow("#000","#662903"),
            local_con("#662903", "#ccc"),
           # left_arrow("#662903","#75712e"),
           # widget.PulseVolume(fmt="Sound: {}", background="#75712e", fontsize=16,),
            left_arrow("#662903", "#2b1047"),
            widget.Clock(format="%d/%m", background="#2b1047", fontsize=14),
            left_arrow("#2b1047", "#1e657d"),
            widget.Clock(format="%H:%M:%S", background="#1e657d", fontsize=14),
            left_arrow("#1e657d", "#135715"),
            widget.Battery(format="{percent:2.0%}", background="#135715", fontsize=14),
        ], 28),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None
