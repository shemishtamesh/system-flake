{
  description = "nixos and home-manager config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim.url = "github:shemishtamesh/nixvim-flake";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    stylix.url = "github:danth/stylix";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs: import ./modules inputs;
  #       {
  #   inherit (import ./modules inputs)
  #     nixosConfigurations
  #     darwinConfigurations
  #     homeConfigurations
  #     formatter
  #     apps
  #     ;
  #
  #   # apps = per_system (
  #   #   system:
  #   #   let
  #   #     pkgs = inputs.nixpkgs.legacyPackages.${system};
  #   #     lib = inputs.nixpkgs.lib;
  #   #   in
  #   #   {
  #   #     default = inputs.self.apps.${system}.switch;
  #   #     switch = {
  #   #       type = "app";
  #   #       program = inputs.nixpkgs.lib.getExe (
  #   #         pkgs.writeShellApplication {
  #   #           name = "switch";
  #   #           runtimeInputs = with pkgs; [
  #   #             git
  #   #             libnotify
  #   #             nh
  #   #             nvd
  #   #             nix-output-monitor
  #   #           ];
  #   #           text =
  #   #             let
  #   #               FLAKE_ROOT = "$HOME/.config/system-flake";
  #   #               kernel = lib.last (lib.splitString "-" system);
  #   #               os_switch_command =
  #   #                 if kernel == "linux" then # sh
  #   #                   ''nh os switch "$FLAKE"''
  #   #                 else if kernel == "darwin" then # sh
  #   #                   ''darwin-rebuild switch --flake "$FLAKE"''
  #   #                 else
  #   #                   throw "unknown system type";
  #   #             in
  #   #             # sh
  #   #             ''
  #   #               export FLAKE="${FLAKE_ROOT}"
  #   #
  #   #               git -C "$FLAKE" add .
  #   #               git -C "$FLAKE" commit -m 'before formatting' || true
  #   #               nix fmt "$FLAKE"
  #   #
  #   #               if [[ -z "''${1-}" || "$1" == "os" ]]; then
  #   #                 git -C "$FLAKE" commit --amend -am 'rebuilding nixos'
  #   #                 if ! ${os_switch_command}; then
  #   #                   git -C "$FLAKE" commit --amend -am 'nixos rebuild failed'
  #   #                   git push
  #   #                   notify-send -u critical 'nixos rebuild failed'
  #   #                   exit 1
  #   #                 fi
  #   #               fi
  #   #
  #   #               if [[ -z "''${1-}" || "$1" == "home" ]]; then
  #   #                 git -C "$FLAKE" commit --amend -am 'rebuilding home'
  #   #                 nix flake update nixvim --flake "$FLAKE"
  #   #                 if ! nh home switch "$FLAKE" --backup-extension bak; then
  #   #                   git -C "$FLAKE" commit --amend -m 'home rebuild failed'
  #   #                   git push
  #   #                   notify-send -u critical 'home rebuild failed'
  #   #                   exit 1
  #   #                 fi
  #   #               fi
  #   #
  #   #               if [[ -z "''${1-}" ]]; then
  #   #                 git -C "$FLAKE" commit --amend -m 'system rebuild succeeded'
  #   #               fi
  #   #
  #   #               git push
  #   #
  #   #               if ! systemctl --user restart hyprpaper.service; then
  #   #                 notify-send -u critical 'wallpaper switch failed'
  #   #                 exit 1
  #   #               fi
  #   #
  #   #               notify-send -u low 'successfully rebuilt'
  #   #             '';
  #   #         }
  #   #       );
  #   #     };
  #   #   }
  #   # );
  # };
}
