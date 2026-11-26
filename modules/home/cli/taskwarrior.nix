{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    taskwarrior-tui
  ];

  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    colorTheme = "dark-256";
    dataLocation = "${config.xdg.dataHome}/task";

    config = {
      confirmation = false;

      context = {
        work = {
          read = "+work";
          write = "+work";
        };
        projects = {
          read = "+projects";
          write = "+projects";
        };
        games = {
          read = "+games";
          write = "+games";
        };
      };

      uda.taskwarrior-tui.quick-tag.name = "today";
    };
  };
}
