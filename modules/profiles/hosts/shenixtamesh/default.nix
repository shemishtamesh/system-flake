inputs:
let
  host = {
    hostname = "shenixtamesh";
    system = "x86_64-linux";
    monitors = {
      "eDP-1" = {
        width = 1920;
        height = 1080;
        refresh_rate = 60;
        horizontal_offset = 1920;
        vertical_offset = 0;
        scaling = 1;
      };
      "HDMI-A-1" = {
        width = 1920;
        height = 1080;
        refresh_rate = 60;
        horizontal_offset = 0;
        vertical_offset = 0;
        scaling = 1;
      };
    };
    users = {
      shemishtamesh = {
        isNormalUser = true;
        extraGroups = [
          "networkmanager"
          "wheel"
          "input"
          "adbusers"
          "docker"
        ];
      };
    };
  };
in
{
  nixosConfigurations = ((import ../../utils.nix) inputs).mkNixosSystem host;
  homeConfigurations = builtins.foldl' (
    accumulator: username:
    accumulator // (import ../../users/${username}) { inherit username host inputs; }
  ) { } (builtins.attrNames host.users);
}
