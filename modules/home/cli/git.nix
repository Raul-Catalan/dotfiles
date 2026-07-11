{
  # Git and GH CLI
  programs.git = {
    enable = true;
    settings = {

      user = {
        name = "Raul Catalan";
        email = "raulrcatalan@gmail.com";
      };

      core = {
        editor = "hx";
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };

    };
  };
}
