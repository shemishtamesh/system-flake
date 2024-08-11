{ inputs, pkgs, theme, ... }:

{
  imports = [
    ../apps/hyprpaper.nix
    ../apps/hyprlock.nix
    ../apps/hyprland.nix
    ../apps/waybar.nix
    ../apps/wlogout.nix
    ../apps/dunst.nix
    # ../apps/onagre.nix
    ../apps/kitty.nix
    ../apps/zsh.nix
    ../apps/git.nix
  ];

  home.username = "shemishtamesh";
  home.homeDirectory = "/home/shemishtamesh";

  stylix = {
      enable = true;
      base16Scheme = theme.scheme;
      image = theme.wallpaper;
      fonts = theme.fonts;
  };

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.05"; # WARNING: do not change this without reading docs
}
