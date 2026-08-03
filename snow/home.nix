{ pkgs, ... }:

let
  themeName = "Orchis-Grey-Dark-Compact";
  themePkg = pkgs.orchis-theme;

  iconName = "Papirus-Dark";
  iconPkg = pkgs.papirus-icon-theme.override { 
    color = "black";
  };
in
{
  imports = [
    ./snowy/default.nix
  ];

  targets.genericLinux.enable = true;

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
      name = themeName;
    };

    font = {
      name = "JetBrainsMono NF";
      size = 10;
    };

    iconTheme = {
      name = themeName;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";

    kvantum = {
      enable = true;
      settings = {
        General = {
          theme = "KvGnomeDark";
        };
      };
    };

    qt5ctSettings = {
      Appearance = {
        icon_theme = themeName;
        standard_dialogs = "xdgdesktopportal";
        style = "kvantum";
      };
      Fonts = {
        fixed = "\"JetBrainsMono NF,10\"";
        general = "\"JetBrainsMono NF,10\"";
      };
    };

    qt6ctSettings = {
      Appearance = {
        icon_theme = themeName;
        standard_dialogs = "xdgdekstopportal";
        style = "kvantum";
      };
      Fonts = {
        fixed = "\"JetBrainsMono NF,10\"";
        general = "\"JetBrainsMono NF,10\"";
      };
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Noto Emoji" ];
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji
    
    waybar
    brightnessctl
    htop
    btop
    fastfetch
    networkmanagerapplet
    fuzzel
    pavucontrol
    autotiling
    wlogout
    grim
    slurp
    ristretto
    libsForQt5.qt5ct
    kdePackages.qt6ct
   
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
    zellij = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  xdg.configFile. "gtk-4.0/settings.ini" .text = ''
    [Settings]
    gtk-theme-name=Orchis-Grey-Dark-Compact
  '';

  xdg.configFile. "kdeglobals" .text = ''
    [Icons]
    Theme=Papirus-Dark
  '';

  xfconf.settings = {
    xsettings = {
      "Net/ThemeName" = themeName;
      "Net/IconThemeName" = iconName;
    };
    xfwm4 = {
      "general/theme" = themeName;
    };
  };

  home.file = {
    ".themes/${themeName}".source = "${themePkg}/share/themes/${themeName}";
    ".icons/${iconName}".source = "${iconPkg}/share/icons/${iconName}";
  };
}
