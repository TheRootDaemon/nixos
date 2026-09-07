{pkgs, ...}: {
  services.gnome.core-apps.enable = false;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  programs.dconf.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  environment.systemPackages = with pkgs; [
    nautilus
    gnome-tweaks
  ];
}
