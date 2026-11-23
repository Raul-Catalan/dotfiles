{
  # Per-project dev environments: `.envrc` with `use flake` auto-loads a
  # project's flake.nix devShell on `cd`. nix-direnv adds caching + keeps
  # the shell from being garbage-collected.
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
