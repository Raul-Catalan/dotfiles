{
  pkgs,
  username,
  fullName,
  ...
}:
{
  # Shared user account, defined once and keyed on the `username` passed from
  # the flake's mkHost. Base groups common to every host live here; hosts that
  # import the desktop module get `networkmanager` and `wheel` added there.
  users.users.${username} = {
    isNormalUser = true; # set password with passwd
    description = fullName;
    extraGroups = [ "docker" ];
    shell = pkgs.fish;
  };
}
