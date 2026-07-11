------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "DVI-I-2",
    mode = "3440x1440@60",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "DVI-I-1",
    mode = "2560x1440@120",
    position = "3440x0",
    scale = 1,
})

hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "6000x180", -- center the 1080p laptop vertically
    scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "thunar"
local menu = "tofi-drun -c ~/.config/tofi/configA --drun-launch=true"
local browser = "brave --enable-features=UseOzonePlatform --ozone-platform=wayland"
local notes = "obsidian"
local editor = "kitty nvim"
local editorAlt = "subl"
local colorPicker = "hyprpicker"

-------------------
---- AUTOSTART ----
-------------------

hl.on(
    "hyprland.start",
    function()
        hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1") -- Polkit to manage passwords
        hl.exec_cmd("/usr/bin/dunst")
        hl.exec_cmd("waybar") -- topbar
        hl.exec_cmd("awww-daemon") -- wallpaper daemon
        hl.exec_cmd(
            "awww img ~/.config/assets/backgrounds/cat_leaves.png --transition-fps 255 --transition-type outer --transition-duration 0.8"
        )
        hl.exec_cmd("wl-paste --type text --watch cliphist store") -- clipboard
        hl.exec_cmd("wl-paste --type image --watch cliphist store")
        hl.exec_cmd("hypridle")
        hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
        hl.exec_cmd("nm-applet")
    end
)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia") -- remove if firefox crashes
hl.env("NVD_BACKEND", "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- QT
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

-- Toolkit backend variables
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config(
    {
        general = {
            gaps_in = 5,
            gaps_out = 5,
            border_size = 2,
            col = {
                active_border = {colors = {"rgb(8aadf4)", "rgb(24273A)", "rgb(24273A)", "rgb(8aadf4)"}, angle = 45},
                inactive_border = {colors = {"rgb(24273A)", "rgb(24273A)", "rgb(24273A)", "rgb(27273A)"}, angle = 45}
            },
            resize_on_border = true,
            allow_tearing = false,
            layout = "dwindle"
        },
        decoration = {
            rounding = 10,
            active_opacity = 1.0,
            inactive_opacity = 1.0,
            blur = {
                enabled = true,
                size = 3,
                passes = 3,
                new_optimizations = true,
                vibrancy = 0.1696,
                ignore_opacity = true
            }
        },
        animations = {
            enabled = true
        }
    }
)

hl.curve("wind", {type = "bezier", points = {{0.05, 0.9}, {0.1, 1.05}}})
hl.curve("winIn", {type = "bezier", points = {{0.1, 1.1}, {0.1, 1.1}}})
hl.curve("winOut", {type = "bezier", points = {{0.3, -0.3}, {0, 1}}})
hl.curve("liner", {type = "bezier", points = {{1, 1}, {1, 1}}})

hl.animation({leaf = "windows", enabled = true, speed = 6, bezier = "wind", style = "slide"})
hl.animation({leaf = "windowsIn", enabled = true, speed = 6, bezier = "winIn", style = "slide"})
hl.animation({leaf = "windowsOut", enabled = true, speed = 5, bezier = "winOut", style = "slide"})
hl.animation({leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind", style = "slide"})
hl.animation({leaf = "border", enabled = true, speed = 1, bezier = "liner"})
hl.animation({leaf = "borderangle", enabled = true, speed = 30, bezier = "liner", style = "loop"})
hl.animation({leaf = "fade", enabled = true, speed = 10, bezier = "liner"})
hl.animation({leaf = "workspaces", enabled = true, speed = 5, bezier = "wind"})

hl.config(
    {
        dwindle = {
            preserve_split = true
        }
    }
)
hl.config(
    {
        master = {}
    }
)

----------------
---- MISC ------
----------------

hl.config(
    {
        misc = {
            force_default_wallpaper = 0,
            disable_hyprland_logo = true,
            disable_splash_rendering = true,
            vrr = 0
        }
    }
)

---------------
---- INPUT ----
---------------

hl.config(
    {
        input = {
            kb_layout = "us",
            kb_variant = "",
            kb_model = "",
            kb_options = "",
            kb_rules = "",
            follow_mouse = 1,
            sensitivity = 0,
            touchpad = {
                natural_scroll = true
            }
        }
    }
)

hl.gesture(
    {
        fingers = 3,
        direction = "horizontal",
        action = "workspace"
    }
)

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(editorAlt))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + W", hl.dsp.window.float({action = "toggle"}))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

hl.bind("SUPER + E", hl.dsp.exec_cmd("jome -d | wl-copy")) -- Emoji picker + clipboard copy

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({direction = "left"}))
hl.bind(mainMod .. " + right", hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + up", hl.dsp.focus({direction = "up"}))
hl.bind(mainMod .. " + down", hl.dsp.focus({direction = "down"}))

-- Move window position with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({direction = "left"}))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({direction = "right"}))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({direction = "up"}))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({direction = "down"}))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({workspace = i}))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {mouse = true})

-- Move/resize windows + keyboard
hl.bind(mainMod .. " + Z", hl.dsp.window.drag(), {mouse = true})
hl.bind(mainMod .. " + X", hl.dsp.window.resize(), {mouse = true})

-- Resize windows with mainMod + CTRL + arrow keys
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({x = 30, y = 0, relative = true}), {repeating = true})

hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({x = -30, y = 0, relative = true}), {repeating = true})

hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({x = 0, y = -30, relative = true}), {repeating = true})

hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({x = 0, y = 30, relative = true}), {repeating = true})

-- Clipboard
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | tofi -c ~/.config/tofi/configV | cliphist decode | wl-copy"))

-- Colour picker
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(colorPicker .. " | wl-copy"))

-- Screen locking
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))

-- wlogout
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("wlogout"))

-- waybar
hl.bind("CTRL + ESCAPE", hl.dsp.exec_cmd("killall waybar || waybar")) -- toggle waybar

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("grimblast --notify copysave screen"), {locked = true}) -- entire screen + clipboard copy
hl.bind("SUPER + Print", hl.dsp.exec_cmd("grimblast --notify copysave active"), {locked = true}) -- current active window + clipboard copy
hl.bind("SUPER + ALT + Print", hl.dsp.exec_cmd("grimblast --notify copysave area"), {locked = true}) -- select an area

-- Volume and media control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), {locked = true, repeating = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), {locked = true, repeating = true})
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -m"), {locked = true})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"), {locked = true})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {locked = true})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {locked = true})
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {locked = true})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {locked = true})

-- Screen brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), {locked = true, repeating = true})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), {locked = true, repeating = true})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({match = {class = "^(jome)$"}, float = true})
hl.window_rule({match = {class = "^(kvantummanager)$"}, float = true})
hl.window_rule({match = {class = "^(qt5ct)$"}, float = true})
hl.window_rule({match = {class = "^(qt6ct)$"}, float = true})
hl.window_rule({match = {class = "^(nwg-look)$"}, float = true})
hl.window_rule({match = {class = "^(org.kde.ark)$"}, float = true})
hl.window_rule({match = {class = "^(pavucontrol)$"}, float = true})
hl.window_rule({match = {class = "^(blueman-manager)$"}, float = true})
hl.window_rule({match = {class = "^(nm-applet)$"}, float = true})
hl.window_rule({match = {class = "^(nm-connection-editor)$"}, float = true})
hl.window_rule({match = {class = "^(org.kde.polkit-kde-authentication-agent-1)$"}, float = true})

hl.window_rule({match = {class = ".*"}, opacity = "0.80 0.80", suppress_event = "maximize"})

hl.window_rule({match = {class = "^(pavucontrol)$"}, opacity = "0.80 0.70"})
hl.window_rule({match = {class = "^(blueman-manager)$"}, opacity = "0.80 0.70"})
hl.window_rule({match = {class = "^(nm-applet)$"}, opacity = "0.80 0.70"})
hl.window_rule({match = {class = "^(nm-connection-editor)$"}, opacity = "0.80 0.70"})
hl.window_rule({match = {class = "^(org.kde.polkit-kde-authentication-agent-1)$"}, opacity = "0.80 0.70"})
hl.window_rule({match = {class = "^(polkit-gnome-authentication-agent-1)$"}, opacity = "0.80 0.70"})
hl.window_rule({match = {class = "^(org.freedesktop.impl.portal.desktop.gtk)$"}, opacity = "0.80 0.70"})
hl.window_rule({match = {class = "^(org.freedesktop.impl.portal.desktop.hyprland)$"}, opacity = "0.80 0.70"})

hl.layer_rule({match = {namespace = "tofi"}, ignore_alpha = 0})
hl.layer_rule({match = {namespace = "dunst"}, ignore_alpha = 0, blur = true})
