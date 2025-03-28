{
  shared,
  username,
  pkgs,
  ...
}:
{
  imports = [
    ./packages
    ./services.nix
    ./environment_variables.nix
    ./scripts.nix
  ];

  home.username = username;
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";

  stylix = shared.theme.stylix_settings;

  # allowing unfree packages
  nixpkgs.config = import ./nixpkgs.nix;
  xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs.nix;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.05"; # WARNING: do not change this without reading docs
}
