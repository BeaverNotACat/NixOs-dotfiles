{
    hardware.opengl.enable = true;
    
    programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    };

    home-manager.users.beaver = {
    home.file.".config/hypr/hyprland.conf".text = ''
    # Monitors
    monitor=eDP-1,1920x1080@60,1920x0,1
    monitor=HDMI-A-1,1920x1080@60,0x0,1

    # Environment variables
    env = XCURSOR_SIZE,32
    env = EDITOR,hx
    env = BROWSER,firefox
    env = TERMINAL,kitty
    env = XDG_CURRENT_DESKTOP,Hyprland
    env = XDG_SESSION_DESKTOP,Hyrpland
    env = XDG_SESSION_TYPE, wayland

    # Autostart
    exec-once = dunst
    exec = pkill waybar & sleep 0.5 && waybar

    # Basic input
    input {
        kb_layout = us,ru
        kb_options = grp:toggle
        follow_mouse = 1
        touchpad {
            natural_scroll = true
        }
    }
    
    # Gestures
    gestures {
        workspace_swipe = true
        workspace_swipe_create_new = false
    }


    # Window settings
    general {
        gaps_in = 5
        gaps_out = 5
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
    }

    # Fancy stuff
    decoration {
        rounding = 7
    }

    # Default animations
    animations {
        enabled = yes

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }

    misc {
        disable_autoreload = true
    }

    $mainMod = SUPER 
    
    # Execution binds
    bind = $mainMod, X, killactive,
    bind = $mainMod, C, fullscreen,
    bind = $mainMod, V, togglefloating, 
    bind = $mainMod, escape, exit, 
    
    bind = $mainMod, F, exec, rofi -show drun
    bind = $mainMod, D, exec, firefox
    bind = $mainMod, S, exec, kitty
    bind = $mainMod, R, exec, telegram-desktop
    bind = $mainMod, E, exec, discord
    bind = $mainMod, W, exec, hx #change to obsidian

    # Focus binds
    bind = $mainMod, H, movefocus, l
    bind = $mainMod, L, movefocus, r
    bind = $mainMod, K, movefocus, u
    bind = $mainMod, J, movefocus, d

    # Workspaces
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10
    
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10
    
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    bind = , Print, exec, grim - | wl-copy --type=image/png
    bind = $mainMod, Print, exec, slurp | grim -g - - | wl-copy --type=image/png

    # Window changing binds
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
        '';
    };
}
