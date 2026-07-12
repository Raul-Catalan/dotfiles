{ lib, ... }:
let
  lua = lib.generators.mkLuaInline;
  mainMod = "SUPER";

  dsp = {
    exec = cmd: lua ''hl.dsp.exec_cmd("${cmd}")'';
    close = lua "hl.dsp.window.close()";
    exit = lua "hl.dsp.exit()";
    float = lua ''hl.dsp.window.float({action = "toggle"})'';
    fullscreen = lua "hl.dsp.window.fullscreen()";
    pseudo = lua "hl.dsp.window.pseudo()";
    layout = msg: lua ''hl.dsp.layout("${msg}")'';
    focus = dir: lua ''hl.dsp.focus({ direction = "${dir}" })'';
    swap = dir: lua ''hl.dsp.window.swap({ direction = "${dir}" })'';
    toggleSpecial = name: lua ''hl.dsp.workspace.toggle_special("${name}")'';
    moveToSpecial = name: lua ''hl.dsp.window.move({ workspace = "special:${name}" })'';
    focusWorkspace = ws: lua ''hl.dsp.focus({ workspace = "${toString ws}" })'';
    moveToWorkspace = ws: lua ''hl.dsp.window.move({ workspace = "${toString ws}" })'';
    drag = lua "hl.dsp.window.drag()";
    resize = lua "hl.dsp.window.resize()";
    sendshortcut = mod: key: lua ''hl.dsp.send_shortcut({ mods = "${mod}", key = "${key}" })'';
  };

  bind = keys: dispatcher: {
    _args = [
      keys
      dispatcher
    ];
  };
  bindOpts = keys: dispatcher: opts: {
    _args = [
      keys
      dispatcher
      opts
    ];
  };

  workspaceBinds = lib.concatMap (
    i:
    let
      key = toString (lib.mod i 10);
    in
    [
      (bind "${mainMod} + ${key}" (dsp.focusWorkspace i))
      (bind "${mainMod} + SHIFT + ${key}" (dsp.moveToWorkspace i))
    ]
  ) (lib.range 1 10);
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # App Launchers
      (bind "${mainMod} + RETURN" (dsp.exec "ghostty")) # Run Terminal (Ghostty)
      (bind "${mainMod} + B" (dsp.exec "google-chrome-stable")) # Open Browser
      # <-- Place Holder for file Manager -->
      (bind "${mainMod} + SPACE" (dsp.exec "noctalia msg panel-toggle launcher"))
      (bind "${mainMod} + CTRL + SPACE" (dsp.exec "noctalia msg panel-toggle control-center"))

      # Screenshots
      (bind "${mainMod} + CTRL + 1" (dsp.exec "noctalia msg screenshot-region"))
      (bind "${mainMod} + CTRL + 2" (dsp.exec "noctalia msg screenshot-fullscreen"))

      # Universal copy/paste
      (bind "${mainMod} + C" (dsp.sendshortcut "CTRL" "Insert"))
      (bind "${mainMod} + V" (dsp.sendshortcut "SHIFT" "Insert"))
      (bind "${mainMod} + X" (dsp.sendshortcut "CTRL" "X"))

      # Window management
      (bind "${mainMod} + Q" dsp.close) # Close Window
      (bind "${mainMod} + SHIFT + Q" (dsp.exit)) # Close Hyprland
      (bind "${mainMod} + T" (dsp.float)) # Toggle between tiling and floating windows
      (bind "${mainMod} + F" (dsp.fullscreen)) # Fullscreen current window
      (bind "${mainMod} + P" dsp.pseudo)
      # (bind "${mainMod} + J" (dsp.layout "togglesplit"))

      # Focus
      (bind "${mainMod} + H" (dsp.focus "left"))
      (bind "${mainMod} + L" (dsp.focus "right"))
      (bind "${mainMod} + K" (dsp.focus "up"))
      (bind "${mainMod} + J" (dsp.focus "down"))

      # Swap Windows
      (bind "${mainMod} + SHIFT + H" (dsp.swap "left"))
      (bind "${mainMod} + SHIFT + L" (dsp.swap "right"))
      (bind "${mainMod} + SHIFT + K" (dsp.swap "up"))
      (bind "${mainMod} + SHIFT + J" (dsp.swap "down"))

      # Special workspace
      (bind "${mainMod} + S" (dsp.toggleSpecial "scratchpad"))
      (bind "${mainMod} + SHIFT + S" (dsp.moveToSpecial "scratchpad"))

      # Scroll through workspaces
      (bind "${mainMod} + mouse_down" (dsp.focusWorkspace "e+1"))
      (bind "${mainMod} + mouse_up" (dsp.focusWorkspace "e-1"))

      # Volume keys
      (bindOpts "XF86AudioRaiseVolume" (dsp.exec "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+") {
        locked = true;
        repeating = true;
      })
      (bindOpts "XF86AudioLowerVolume" (dsp.exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") {
        locked = true;
        repeating = true;
      })
      (bindOpts "XF86AudioMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle") {
        locked = true;
      })
      (bindOpts "XF86AudioMicMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle") {
        locked = true;
      })

      # Mouse move/resize
      (bindOpts "${mainMod} + mouse:272" dsp.drag { mouse = true; })
      (bindOpts "${mainMod} + mouse:273" dsp.resize { mouse = true; })
    ]
    ++ workspaceBinds;
  };
}
