{lib, ...}: let
  locale = "en_IN";
  localeUTF8 = "${locale}.utf8";
in {
  time.timeZone = "Asia/Kolkata";

  # let NixOS configure the system's default locale and LANG
  i18n.defaultLocale = locale;

  # force UTF-8 for all the locale categories
  # to render the unicode symbols properly
  environment.variables = {
    LANG = lib.mkForce localeUTF8;
    LC_ALL = lib.mkForce localeUTF8;
  };
}
