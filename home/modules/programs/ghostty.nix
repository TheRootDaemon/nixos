{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      fullscreen = true;

      theme = "Vague";
      palette = ["2=#9ccfd8"];

      font-size = 15;
      font-family = "JetBrainsMono Nerd Font";
      font-feature = ["zero" "-calt" "-dlig" "-liga"];

      window-padding-x = "0, 0";
      window-padding-y = "0, 0";
      window-padding-balance = true;

      working-directory = "home";
      shell-integration-features = "ssh-env,no-cursor";

      cursor-style = "block";
      cursor-style-blink = false;
      mouse-hide-while-typing = true;
    };
  };
}
