{user, ...}: {
  programs.git = {
    enable = true;

    settings = {
      user = user;
      core.editor = "nvim";
    };
  };
}
