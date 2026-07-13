{
  # Fish Shell
  programs.fish = {
    enable = true;
    shellAbbrs = {
      la = "ls -a";
      zeus-update = "sudo nixos-rebuild switch --flake ~/dotfiles#zeus";
      hermes-update = "sudo nixos-rebuild switch --flake ~/dotfiles#hermes";
      ga = "git add .";
      gc = "git commit -m";
    };
    functions = {
      syncnotes = ''
        cd ~/notes; or return

        set current_date (date +"%Y-%m-%d %H:%M")
        git add .
        git commit -m "Backup: $current_date"
        if git push
          echo "✅ Markdown folder synced successfully at $current_date"
        else
          echo "❌ Error: Git push failed. Check your network or credentials."
        end

        cd $prev_dir
      '';
    };
  };
}
