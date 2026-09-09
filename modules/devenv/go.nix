{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    go
    gofumpt
    golangci-lint
    gopls
    gosec
  ];
}
