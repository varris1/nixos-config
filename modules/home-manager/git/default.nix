{
  programs.git = {
    enable = true;
    settings = {
      user.name = "varris";
      user.email = "varris@posteo.net";
      core.pager = "bat";
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user.email = "varris@posteo.net";
      user.name = "Varris";
    };
  };
}
