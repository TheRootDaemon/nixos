{
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
    };

    profiles.default = {
      search = {
        # enforces the search engine as teh default
        force = true;

        # ddg -> DuckDuckGo
        default = "ddg";
      };

      settings = {
        # discards the previous session
        "browser.startup.page" = 1;

        # disables firefox's recomendations
        "browser.discovery.enabled" = false;

        # hides sponsered contents in the new tab
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        # prevent firefox from showing the "What's new"
        "browser.startup.homepage_override.mstone" = "ignore";

        # disable the pop-up when entering fullscreen
        "full-screen-api.warning.delay" = 0;
        "full-screen-api.warning.timeout" = 0;
      };
    };
  };

  # set firefox as the default application
  # for viewing/reading the file types below
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
    };
  };
}
