{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    docker-language-server
    dockerfmt
  ];
}
