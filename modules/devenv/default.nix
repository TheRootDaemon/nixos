{pkgs, ...}: {
  imports = [
    ./cpp.nix
    ./docker.nix
    ./go.nix
    ./lua.nix
    ./markup.nix
    ./nix.nix
    ./neovim.nix
    ./proto.nix
    ./python.nix
    ./sh.nix
    ./zig.nix
  ];

  environment.systemPackages = with pkgs; [gnumake];
}
