{ ... }:

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
        timeout = 500;
        on-timeout = "notify-send idle";
        on-resume = "notify-send back";
      }
    ];
  };
}
