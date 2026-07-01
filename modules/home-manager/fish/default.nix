{
  programs.fish = {
    enable = true;
    functions.fish_greeting = "";
    shellAliases = {
      ec = "hx ~/.nixconf";
      rebuild = "nh os switch";
      ff = "fastfetch";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      line_break.disabled = true;
      cmd_duration.disabled = true;
    };
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}
