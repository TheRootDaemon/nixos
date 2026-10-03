{profile, ...}: {
  programs.git = {
    enable = true;

    settings = {
      core.editor = "nvim";
      init.defaultBranch = "master";
      user = {
        name = profile.userName;
        email = profile.userEmail;
      };
    };
  };
}
