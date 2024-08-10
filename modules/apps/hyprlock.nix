{ pkgs, config, ... }:
let
  palette = config.lib.stylix.colors;
  rgba = (import ../utils/functions.nix { inherit pkgs; }).rgba config.lib.stylix.colors;
  wallpaper = (import ../utils/theming.nix { inherit pkgs; }).wallpaper;
in
{
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    general = {
      hide_cursor = true;
    };
    background = {
      path = toString wallpaper;
      blur_passes = 3;
      brightness = 0.5;
    };
    input-field = {
      size = "50, 50";
      outline_thickness = 0;
      inner_color = rgba "base01" "1";
      font_color = rgba "base07" "0"; # no typing indication
      fade_on_empty = true;
      fade_timeout = 1000;
      rounding = -1;
      placeholder_text = "";
      fail_text = "";
      check_color = palette.base09;
      fail_color = palette.base08;
      halign = "center";
      valign = "center";
      position = "0, 7";
    };
    label = [
      {
        text = "cmd[update:1000] echo $(date)";
        color = rgba "base02" "1";
        font_size = 22;
        position = "0, 70";
        halign = "center";
        valign = "bottom";
      }
    ];

    # image {
    #     path = /home/justin/Pictures/profile_pictures/justin_square.png
    #     size = 100
    #     border_size = 2
    #     border_color = $foreground
    #     position = 0, -100
    #     halign = center
    #     valign = center
    # };
    # image {
    #     path = /home/justin/Pictures/profile_pictures/hypr.png
    #     size = 75
    #     border_size = 2
    #     border_color = $foreground
    #     position = -50, 50
    #     halign = right
    #     valign = bottom
    # };
    # label {
    #     monitor =
    #     text = cmd[update:1000] echo "$(/home/justin/Documents/Scripts/whatsong.sh)" 
    #     color = $foreground
    #     #color = rgba(255, 255, 255, 0.6)
    #     font_size = 18
    #     font_family = Metropolis Light, Font Awesome 6 Free Solid
    #     position = 0, 50
    #     halign = center
    #     valign = bottom
    # };
    # label {
    #     monitor =
    #     text = cmd[update:1000] echo "$(/home/justin/Documents/Scripts/whoami.sh)"
    #     color = $foreground
    #     font_size = 14
    #     font_family = JetBrains Mono
    #     position = 0, -10
    #     halign = center
    #     valign = top
    # };
    # label {
    #     monitor =
    #     text = cmd[update:1000] echo "$(/home/justin/Documents/Scripts/battery.sh)"
    #     color = $foreground
    #     font_size = 24
    #     font_family = JetBrains Mono
    #     position = -90, -10
    #     halign = right
    #     valign = top
    # };
    # label {
    #     monitor =
    #     text = cmd[update:1000] echo "$(/home/justin/Documents/Scripts/network-status.sh)"
    #     color = $foreground
    #     font_size = 24
    #     font_family = JetBrains Mono
    #     position = -20, -10
    #     halign = right
    #     valign = top
    # };
  };
}
