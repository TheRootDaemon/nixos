{
  virtualisation.docker = {
    enable = true;

    daemon.settings = {
      default-address-pools = [
        {
          base = "10.0.0.0/8";
          size = 24;
        }
      ];
    };
  };
}
