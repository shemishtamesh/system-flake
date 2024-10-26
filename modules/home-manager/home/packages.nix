{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    inputs.zen-browser.packages.${system}.default
    chromium
    libqalculate
    fastfetch
    speechd
    gimp
    krita
    aseprite
    imv
    pulsemixer
    inkscape
    hypridle
    hyprpaper
    hyprpicker
    hyprshot
    hyprlock
    ripgrep
    bat
    fd
    zoxide
    eza
    fzf
    rmtrash
    visidata
    tldr
    tree-sitter
    wl-clipboard
    btop
    wev
    tree
    nh
    nix-output-monitor
    nvd
    smassh
    bitwarden
    kitty
    starship
    tmux
    wget
    curl
    git
    zoxide
    yazi
    axel
    difftastic
    killall
    waybar
    rofimoji
    wtype
    dunst
    libnotify
    whatsapp-for-linux
    discord-screenaudio
    slack
    spotify
    obs-studio
    pavucontrol
    cliphist
    wlogout
    mpv
    vlc
    obsidian
    lorien
    transmission_4-gtk
    qpwgraph
  ];
}
