{pkgs, ...}: {
  services.gnome.core-apps.enable = false;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  environment.systemPackages = with pkgs; [
    apple-cursor
    papirus-icon-theme

    gnome-tweaks
    loupe
    nautilus
  ];

  programs.dconf.enable = true;

  environment.variables = {
    XCURSOR_SIZE = "32";
    XCURSOR_THEME = "macOS";
  };
}
