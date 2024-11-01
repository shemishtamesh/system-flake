{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
    keyMode = "vi";
    shortcut = "Space";
    historyLimit = 5000;
    mouse = true;
    plugins = [
      # pkgs.tmuxPlugins.better-mouse-mode
      pkgs.tmuxPlugins.vim-tmux-navigator
      # pkgs.tmuxPlugins.resurrect
      # pkgs.tmuxPlugins.continuum
    ];
  };
}
