{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, RETURN, exec, ghostty" # Run Terminal (Ghostty)
      "$mod, Q, killactive" # Close current window
      "$mod, M, exit" # Exit Hyperland
      "$mod, B, exec, google-chrome-stable" # Open Browser (Google Chrome)
      # file manager bind here
      "$mod, T, togglefloating" # Toggle between tiling and floating window
      "$mod, F, fullscreen" # Open the current window in fullscreen
      "$mod, SPACE, exec, rofi -show drun" # Open Rofi

      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"

      # Move focus with mainMod + arrow keys
      "$mod, h, movefocus, l" # Move focus left
      "$mod, l, movefocus, r" # Move focus right
      "$mod, k, movefocus, u" # Move focus up
      "$mod, j, movefocus, d" # Move focus down

      # Switch workspaces with mainMod + [0-9]
      "$mod, 1, workspace, 1" # Switch to workspace 1
      "$mod, 2, workspace, 2" # Switch to workspace 2
      "$mod, 3, workspace, 3" # Switch to workspace 3
      "$mod, 4, workspace, 4" # Switch to workspace 4
      "$mod, 5, workspace, 5" # Switch to workspace 5
      "$mod, 6, workspace, 6" # Switch to workspace 6
      "$mod, 7, workspace, 7" # Switch to workspace 7
      "$mod, 8, workspace, 8" # Switch to workspace 8
      "$mod, 9, workspace, 9" # Switch to workspace 9
      "$mod, 0, workspace, 10" # Switch to workspace 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mod SHIFT, 1, movetoworkspace, 1" # Move window to workspace 1
      "$mod SHIFT, 2, movetoworkspace, 2" # Move window to workspace 2
      "$mod SHIFT, 3, movetoworkspace, 3" # Move window to workspace 3
      "$mod SHIFT, 4, movetoworkspace, 4" # Move window to workspace 4
      "$mod SHIFT, 5, movetoworkspace, 5" # Move window to workspace 5
      "$mod SHIFT, 6, movetoworkspace, 6" # Move window to workspace 6
      "$mod SHIFT, 7, movetoworkspace, 7" # Move window to workspace 7
      "$mod SHIFT, 8, movetoworkspace, 8" # Move window to workspace 8
      "$mod SHIFT, 9, movetoworkspace, 9" # Move window to workspace 9
      "$mod SHIFT, 0, movetoworkspace, 10" # Move window to workspace 10
    ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mod, mouse:272, movewindow" # Move window
      "$mod, mouse:273, resizewindow" # Resize window
    ];
  };
}
