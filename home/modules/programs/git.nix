{profile, ...}: {
  programs.git = {
    enable = true;

    settings = {
      core.editor = "nvim";

      user = {
        name = profile.userName;
        email = profile.userEmail;
      };
    };
  };
}
