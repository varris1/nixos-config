{
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.sops.nixosModules.sops
  ];
  sops.defaultSopsFile = ../../secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/persist/home/manuel/.config/sops/age/keys.txt";

  sops.secrets."user_login_passwords/manuel".neededForUsers = true;
  users.users.manuel.hashedPasswordFile = config.sops.secrets."user_login_passwords/manuel".path;

}
