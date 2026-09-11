{
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
    };

    profiles.default = {
      settings = {
        "browser.startup.page" = 1;

        "full-screen-api.warning.delay" = 0;
        "full-screen-api.warning.timeout" = 0;

        "browser.discovery.enabled" = false;
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
      };
    };
  };
}
