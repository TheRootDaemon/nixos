{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lua
    luajit
    lua-language-server
    luarocks
    stylua
  ];
}
