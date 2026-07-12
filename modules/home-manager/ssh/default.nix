{
  programs.ssh = {
    enable = true;
    settings = {
      "*" = {
        identityFile = "/run/secrets/ssh_private_keys/main";
        identitiesOnly = true;
      };
    };
  };
}
