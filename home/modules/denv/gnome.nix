{lib, ...}: {
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      xkb-options = ["caps:swapescape"];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "purple";
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      repeat = true;

      delay = lib.hm.gvariant.mkUint32 200;
      repeat-interval = lib.hm.gvariant.mkUint32 35;
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-temperature = 3000;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      close = ["<Super>q"];
      www = ["<Super>b"];

      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];
      switch-to-workspace-9 = ["<Super>9"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal" = {
      name = "terminal";
      command = "ghostty";
      binding = "<Super>r";
    };
  };
}
