require('monitors')

-- ===================
--     MY PROGRAMS
-- ===================
local terminal = 'ghostty'
local fileManager = 'nautilus'
local menu = 'rofi -show combi -combi-modes "window,run,ssh,drun" -modes combi'
local browser = 'librewolf'

-- =================
--     AUTOSTART
-- =================
hl.on('hyprland.start', function()
    hl.exec_cmd(terminal .. ' -e nvim $HOME/todo.md')
    hl.exec_cmd('nm-applet & blueman-applet')
    hl.exec_cmd('waybar & hyprpaper')
    hl.exec_cmd('kdeconnectd & kdeconnect-indicator')
    hl.exec_cmd('steam -silent')
    hl.exec_cmd('transmission-qt --minimized')
end)


-- =============================
--     ENVIRONMENT VARIABLES
-- =============================
-- See https://wiki.hypr.land/Configuring/Environment-variables/
hl.env('XCURSOR_THEME', 'Future-cursors')
hl.env('XCURSOR_SIZE', 24)
hl.env('HYPRCURSOR_SIZE', 24)


-- ===================
--     PERMISSIONS
-- ===================
-- ecosystem {
--   enforce_permissions = 1
-- }
--
-- permission = /usr/(bin|local/bin)/grim, screencopy, allow
-- permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow
-- permission = /usr/(bin|local/bin)/hyprpm, plugin, allow


-- =====================
--     LOOK AND FEEL
-- =====================
hl.config({
    general = {
        allow_tearing = false,
        resize_on_border = false,

        col = {
            active_border = {
                colors = { 'rgba(33ccffee)', 'rgba(00ff99ee)' },
                angle = 45
            },

            inactive_border = {
                colors = { 'rgba(595959aa)' },
            }
        },

        layout = 'dwindle',
        gaps_in = 2,
        gaps_out = 2,
        border_size = 2,
    },

    decoration = {
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        rounding = 0,
        rounding_power = 0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = '0x1a1a1aee',
        },

        blur = {
            enabled = true,
            size = 4,
            passes = 3,
            vibrancy = 0.1696,
        }
    },

    dwindle = {
        preserve_split = true
    },

    master = {
        new_status = 'master'
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
        focus_on_activate = true,
    },

    -- =============
    --     INPUT
    -- =============
    input = {
        kb_layout = 'us',
        kb_variant = '',
        kb_model = '',
        kb_options = 'caps:swapescape',
        kb_rules = '',

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.device({
    name = 'epic-mouse-v1',
    sensitivity = -0.5
})

hl.gesture({ fingers = 3, direction = 'horizontal', action = 'workspace' })


-- ==================
--     ANIMATIONS
-- ==================
-- # Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
hl.curve('easeOutQuint', { type = 'bezier', points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve('easeInOutCubic', { type = 'bezier', points = { { .65, 0.05 }, { 0.36, 1 } } })
hl.curve('linear', { type = 'bezier', points = { { 0, 0 }, { 1, 1 } } })
hl.curve('almostLinear', { type = 'bezier', points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve('quick', { type = 'bezier', points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = 'global', enabled = true, speed = 10, bezier = 'default' })
hl.animation({ leaf = 'border', enabled = true, speed = 5.39, bezier = 'easeOutQuint' })
hl.animation({ leaf = 'windows', enabled = true, speed = 4.79, bezier = 'easeOutQuint' })
hl.animation({ leaf = 'windowsIn', enabled = true, speed = 4.1, bezier = 'easeOutQuint', style = 'popin 87%' })
hl.animation({ leaf = 'windowsOut', enabled = true, speed = 1.49, bezier = 'linear', style = 'popin 87%' })
hl.animation({ leaf = 'fadeIn', enabled = true, speed = 1.73, bezier = 'almostLinear' })
hl.animation({ leaf = 'fadeOut', enabled = true, speed = 1.46, bezier = 'almostLinear' })
hl.animation({ leaf = 'fade', enabled = true, speed = 3.03, bezier = 'quick' })
hl.animation({ leaf = 'layers', enabled = true, speed = 3.81, bezier = 'easeOutQuint' })
hl.animation({ leaf = 'layersIn', enabled = true, speed = 4, bezier = 'easeOutQuint', style = 'fade' })
hl.animation({ leaf = 'layersOut', enabled = true, speed = 1.5, bezier = 'linear', style = 'fade' })
hl.animation({ leaf = 'fadeLayersIn', enabled = true, speed = 1.79, bezier = 'almostLinear' })
hl.animation({ leaf = 'fadeLayersOut', enabled = true, speed = 1.39, bezier = 'almostLinear' })
hl.animation({ leaf = 'workspaces', enabled = true, speed = 1.94, bezier = 'almostLinear', style = 'fade' })
hl.animation({ leaf = 'workspacesIn', enabled = true, speed = 1.21, bezier = 'almostLinear', style = 'fade' })
hl.animation({ leaf = 'workspacesOut', enabled = true, speed = 1.94, bezier = 'almostLinear', style = 'fade' })
hl.animation({ leaf = 'zoomFactor', enabled = true, speed = 7, bezier = 'quick' })


-- ===================
--     KEYBINDINGS
-- ===================
local mainMod = 'SUPER'

hl.bind(mainMod .. ' + RETURN', hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. ' + Q', hl.dsp.window.close())
hl.bind(mainMod .. ' + E', hl.dsp.exec_cmd('pkill hyprland && hyprland'))
hl.bind(mainMod .. ' + N', hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. ' + B', hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. ' + SHIFT + F', hl.dsp.window.float({ action = 'toggle' }))
hl.bind(mainMod .. ' + D', hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. ' + P', hl.dsp.window.pseudo())
hl.bind(mainMod .. ' + V', hl.dsp.layout('togglesplit'))
hl.bind(mainMod .. ' + F', hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mainMod .. ' + PRINT', hl.dsp.exec_cmd('HYPRSHOT_DIR=$HOME/screenshots hyprshot -m window'))
hl.bind(mainMod .. ' + SHIFT + PRINT', hl.dsp.exec_cmd('HYPRSHOT_DIR=$HOME/screenshots hyprshot -m region'))
hl.bind('PRINT', hl.dsp.exec_cmd('HYPRSHOT_DIR=$HOME/screenshots hyprshot -m output'))
hl.bind(mainMod .. ' + ALT + F', hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. ' + SHIFT + R', hl.dsp.exec_cmd('pkill -9 kdeconnectd && kdeconnectd && hyprctl reload'))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. ' + h', hl.dsp.focus({ direction = 'left' }))
hl.bind(mainMod .. ' + l', hl.dsp.focus({ direction = 'right' }))
hl.bind(mainMod .. ' + k', hl.dsp.focus({ direction = 'up' }))
hl.bind(mainMod .. ' + j', hl.dsp.focus({ direction = 'down' }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. ' + SHIFT + h', hl.dsp.window.move({ direction = 'left' }))
hl.bind(mainMod .. ' + SHIFT + l', hl.dsp.window.move({ direction = 'right' }))
hl.bind(mainMod .. ' + SHIFT + k', hl.dsp.window.move({ direction = 'up' }))
hl.bind(mainMod .. ' + SHIFT + j', hl.dsp.window.move({ direction = 'down' }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. ' + ' .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. ' + S', hl.dsp.workspace.toggle_special('magic'))
hl.bind(mainMod .. ' + SHIFT + S', hl.dsp.window.move({ workspace = 'special:magic' }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. ' + mouse_down', hl.dsp.focus({ workspace = 'e-1' }))
hl.bind(mainMod .. ' + mouse_up', hl.dsp.focus({ workspace = 'e+1' }))

-- # Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

-- # Laptop multimedia keys for volume and LCD brightness
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'),
    { locked = true, repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'),
    { locked = true, repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'),
    { locked = true, repeating = true })
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'),
    { locked = true, repeating = true })
hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%+'), { locked = true, repeating = true })
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%-'), { locked = true, repeating = true })

-- # Requires playerctl
hl.bind('XF86AudioNext', hl.dsp.exec_cmd('playerctl next'), { locked = true })
hl.bind('XF86AudioPause', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd('playerctl play-pause'), { locked = true })
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd('playerctl previous'), { locked = true })


-- ==============================
--     WINDOWS AND WORKSPACES
-- ==============================
local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
