{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    black
    isort
    pyright
    python3
    uv
  ];
}
