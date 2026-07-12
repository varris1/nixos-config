{
  programs.ssh = {
    enable = true;
    settings = {
      "*" = {
        IdentityFile = "/run/secrets/ssh_private_keys/main";
        IdentitiesOnly = true;
        StrictHostKeyChecking = "accept-new";
      };
    };
  };
}
