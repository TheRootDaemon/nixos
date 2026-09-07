{lib, ...}: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      accent-color = "purple";

      show-battery-percentage = true;
    };

    "org/gnome/desktop/input-sources" = {
      xkb-options = ["caps:swapescape"];
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      repeat = true;

      delay = lib.hm.gvariant.mkUint32 200;
      repeat-interval = lib.hm.gvariant.mkUint32 35;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-temperature = 3000;
    };
  };
}
