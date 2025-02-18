{ inputs, pkgs, ... }:

{
  imports = [
    ./apps/protonup.nix
  ];

  home.packages = with pkgs; [
    (inputs.nixvim.packages.${pkgs.system}.custom { })
    atool
    unrar
    unzip
    tetrio-desktop
    bottles
    cht-sh
    (callPackage ./apps/ohrrpgce { })
    inputs.zen-browser.packages.${system}.default
    libreoffice
    blender
    openscad
    chromium
    audacity
    musescore
    lmms
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
    libqalculate
    ripgrep
    bat
    fd
    zoxide
    eza
    fzf
    rmtrash
    trash-cli
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
    koji
    zoxide
    glow
    slides
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
    easyeffects
    pavucontrol
    cliphist
    wlogout
    zathura
    mpv
    vlc
    obsidian
    lorien
    qpwgraph
    fastfetch
    transmission_4-gtk
    tremc
    steam-tui
    lutris
  ];
}
