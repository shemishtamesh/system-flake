{
  inputs,
  pkgs,
  host,
  ...
}:
let
  shared_modules = [
    ./git.nix
    ./zsh.nix
    ./starship.nix
    ./zoxide.nix
    ./fzf.nix
    ./direnv.nix
    ./tmux.nix
    ./nixvim.nix
  ];
  shared_packages = with pkgs; [
    libqalculate
    ripgrep
    bat
    fd
    eza
    tree
    tldr
    btop
    atool
    unrar
    unzip
    wget
    curl
    visidata
    glow
    rmtrash
    trash-cli
    fastfetch
    yazi
    killall
    nh
    nix-diff
    nix-output-monitor
    nvd
  ];
  per_host = {
    shenixtamesh = {
      modules = [
        ./kitty.nix
        ./protonup.nix
        ./hypridle.nix
        ./hyprlock.nix
        ./hyprpaper.nix
        ./hyprland
        ./waybar.nix
        ./wlogout.nix
        ./dunst.nix
        ./rofi.nix
      ];
      packages = with pkgs; [
        (callPackage ./ohrrpgce { })
        inputs.zen-browser.packages.${system}.default
        slack
        obsidian
        zathura
        mpv
        bitwarden
        cht-sh
        tetrio-desktop
        furnace
        bottles
        blender
        openscad
        chromium
        audacity
        musescore
        lmms
        krita
        aseprite
        imv
        pulsemixer
        inkscape
        hyprpicker
        hyprshot
        tree-sitter
        wl-clipboard
        wev
        gimp
        obs-studio
        libreoffice
        smassh
        koji
        slides
        difftastic
        wtype
        whatsapp-for-linux
        discord-screenaudio
        spotify
        easyeffects
        pavucontrol
        cliphist
        vlc
        lorien
        qpwgraph
        transmission_4-gtk
        tremc
        steam-tui
        lutris
      ];
    };
    shemishtamac = {
      modules = [
        ./kitty.nix
        ./karabiner-elements.nix
        ./databricks.nix
      ];
      packages = with pkgs; [
        slack
        obsidian
        zathura
        mpv
        bitwarden
      ];
    };
  };
in
{
  # sorting to help comparing different builds
  imports = builtins.sort builtins.lessThan (
    shared_modules ++ (per_host.${host.hostname}.modules or [ ])
  );
  home.packages = builtins.sort (a: b: a.outPath < b.outPath) (
    shared_packages ++ (per_host.${host.hostname}.packages or [ ])
  );
}
