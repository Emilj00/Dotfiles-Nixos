{pkgs, ...}:

{
  programs.zsh.enable = true;

  # Users
  users.users.emilj00 = {
      isNormalUser = true;
      description = "Emilj00";
      extraGroups = [ "networkmanager" "wheel" "storage" ];
      shell = pkgs.zsh;
  };
}