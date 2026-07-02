{ config, pkgs, ... }:

{
  imports = [
    ./neovim.nix
    ./fcitx.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "haru";
    homeDirectory = "/home/haru";
    stateVersion = "26.05";
  };

  home.pointerCursor = {
    enable = true;
    size = 24;
    x11.enable = true;
    sway.enable = true;
    gtk.enable = true;
    package = pkgs.google-cursor;
    name = "GoogleDot-Black";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Orchis-Grey-Dark-Compact";
      package = pkgs.orchis-theme;
    };

    font = {
      name = "JetBrainsMono NF";
      size = 10;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override { 
        color = "black";
      };
    };
  };

  qt = {
    enable = true;
    style.name = "Adwaita-dark";
    style.package = pkgs.adwaita-qt;
    platformTheme.name = "Adwaita-dark";
    platformTheme.package = with pkgs; [
      adwaita-qt
      adwaita-qt6
    ];
  };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "JetBrainsMono NF" ];
        serif = [ "JetBrainsMono NFP Medium" ];
        sansSerif = [ "JetBrainsMono NFP SemiBold" ];
      };
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji

    nwg-look

    rustc
    cargo
    rust-analyzer
    lua
    lua-language-server
    python315
    pyright
    clang
    clang-tools
    bash-language-server
    nil
  ];

  programs = {
    firefox.enable = false;
    discord.enable = true;
    tmux.enable = true;
  };

  xdg.configFile. "tmux/tmux.conf" .source = config.lib.file.mkOutOfStoreSymlink "/home/haru/.config/tmux/tmux.conf";

}
