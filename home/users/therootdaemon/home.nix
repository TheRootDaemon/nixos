{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/denv
    ../../modules/programs
  ];

  home.stateVersion = "26.05";
  home.username = "therootdaemon";
  home.homeDirectory = "/home/therootdaemon";
}
