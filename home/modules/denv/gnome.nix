{
  lib,
  pkgs,
  ...
}: {
  programs.gnome-shell = {
    enable = true;

    extensions = with pkgs.gnomeExtensions; [
      {package = blur-my-shell;}
      {package = just-perfection;}
    ];
  };

  dconf.settings = {
    # swaps caps lock and escape,
    # definitely to be vim friendly
    "org/gnome/desktop/input-sources" = {
      xkb-options = ["caps:swapescape"];
    };

    # general GNOME appearence and interface preferences
    "org/gnome/desktop/interface" = {
      accent-color = "purple";
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      # enables key repetition when holding a key
      repeat = true;

      # time before a held key start repeating ie., in milliseconds
      delay = lib.hm.gvariant.mkUint32 200;

      # time between repeated key presses ie., in milliseconds
      repeat-interval = lib.hm.gvariant.mkUint32 35;
    };

    # allows audio over-amplification
    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
    };

    # window manager keybindings
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];

      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];
      switch-to-workspace-9 = ["<Super>9"];

      switch-to-workspace-left = ["<Super>bracketleft"];
      switch-to-workspace-right = ["<Super>bracketright"];
    };

    # empties the dock
    "org/gnome/shell" = {
      favorite-apps = [];
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      # must stay true for overrides to work
      override-background = true;

      # disables/enables certain effects when the window is close to the panel
      override-background-dynamically = true;

      # use the panel background when a window is near
      override-background-dynamically-mode = 1;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      # disables the dash
      dash = false;

      # disables the workspace popup
      # when switching workspaces
      workspace-popup = false;
    };

    # disables <Super>{{number}} shortcuts,
    # since they are used for switching workspaces
    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;

      night-light-schedule-automatic = false;
      night-light-schedule-from = 0.0;
      night-light-schedule-to = 0.0;
      night-light-temperature = lib.hm.gvariant.mkUint32 3500;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/browser/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/files/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/settings/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/browser" = {
      name = "browser";
      command = "firefox";
      binding = "<Super>b";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/files" = {
      name = "files";
      command = "nautilus";
      binding = "<Super>e";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/settings" = {
      name = "settings";
      command = "gnome-control-center";
      binding = "<Super>s";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal" = {
      name = "terminal";
      command = "ghostty";
      binding = "<Super>r";
    };
  };
}
