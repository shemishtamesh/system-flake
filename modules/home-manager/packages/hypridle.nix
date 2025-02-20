{ pkgs, ... }:
let
  sync_external =
    (import ../../general/utils.nix { inherit pkgs; }).sync_external_monitor_brightness;
in
{
  services.hypridle.enable = true;
  services.hypridle.settings = {
    general = {
      lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
      before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
      after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
    };
    listener = [
      {
        timeout = 150; # 2.5min.
        on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 1% && ${sync_external}"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
        on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r && ${sync_external}"; # monitor backlight restore.
      }

      # turn off keyboard backlight
      {
        timeout = 150; # 2.5min.
        on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
        on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -rd rgb:kbd_backlight"; # turn on keyboard backlight.
      }

      {
        timeout = 300; # 5min
        on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
      }

      {
        timeout = 330; # 5.5min
        on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
        on-resume = "hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired.
      }

      {
        timeout = 1800; # 30min
        on-timeout = "systemctl suspend"; # suspend pc
      }
    ];
  };
}
