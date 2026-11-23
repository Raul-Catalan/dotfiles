{
  fullName,
  email,
  ...
}:
{
  # Git and GH CLI
  programs.git = {
    enable = true;
    settings = {

      user = {
        name = fullName;
        inherit email;
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
