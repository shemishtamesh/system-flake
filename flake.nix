{
  description = "nixos and home-manager config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    # stylix = {
    #   url = "github:danth/stylix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      hyprland,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      theme = (import ./modules/general/theming.nix { inherit pkgs; });
    in
    {
      nixosConfigurations.shenixtamesh = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit theme;
          inherit system;
        };
        modules = [
          ./modules/nixos/configuration.nix
          stylix.nixosModules.stylix
          hyprland.nixosModules.default
        ];
      };
      homeConfigurations.shemishtamesh = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {
          inherit inputs;
          inherit theme;
        };
        inherit pkgs;
        modules = [
          ./modules/home-manager/home.nix
          stylix.homeManagerModules.stylix
          hyprland.homeManagerModules.default
          nixvim.homeManagerModules.nixvim
        ];
      };
    };
}
