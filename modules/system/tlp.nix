{
  # use tlp instead of power-profiles-daemon,
  # both services conflict when enabled at the same time
  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;

    settings = {
      START_CHARGE_THRESH_BAT0 = 70; # resume charging when battery drops 70%
      STOP_CHARGE_THRESH_BAT0 = 80; # stop charging when battery hits 80%
    };
  };
}
