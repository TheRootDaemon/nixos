{pkgs, ...}: {
  home.packages = with pkgs; [
    apple-cursor
    papirus-icon-theme
  ];

  home.sessionVariables = {
    XCURSOR_SIZE = "32";
    XCURSOR_THEME = "macOS";
  };

  gtk = {
    enable = true;

    gtk3.extraConfig.gtk-decoration-layout = "menu:";

    iconTheme.name = "Papirus";
    cursorTheme = {
      name = "macOS";
      size = 32;
    };
  };
}
