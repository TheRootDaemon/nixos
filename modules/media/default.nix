{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    proton-vpn
    transmission_4-gtk
    vlc
  ];
}
