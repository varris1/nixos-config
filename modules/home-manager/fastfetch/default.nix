{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "auto";
        width = 16;
        height = 16;
      };

      display = {
        separator = "->   ";
        color = {
          separator = "1"; # Bold
        };
        constants = [
          "───────────────────────────"
        ];

        key = {
          type = "both";
          paddingLeft = 4;
        };
      };

      modules = [
        "break"
        "break"
        "break"
        {
          type = "custom";
          format = "┌{$1} {#1}System Information{#} {$1}┐";
        }
        {
          key = "OS           ";
          keyColor = "red";
          type = "os";
        }
        {
          key = "Machine      ";
          keyColor = "green";
          type = "host";
        }
        {
          key = "Kernel       ";
          keyColor = "magenta";
          type = "kernel";
        }
        {
          key = "Uptime       ";
          keyColor = "red";
          type = "uptime";
        }
        {
          key = "Resolution   ";
          keyColor = "yellow";
          type = "display";
          compactType = "original-with-refresh-rate";
        }
        {
          key = "WM           ";
          keyColor = "blue";
          type = "wm";
        }
        {
          key = "DE           ";
          keyColor = "green";
          type = "de";
        }
        {
          key = "Shell        ";
          keyColor = "cyan";
          type = "shell";
        }
        {
          key = "Terminal     ";
          keyColor = "red";
          type = "terminal";
        }
        {
          key = "CPU          ";
          keyColor = "yellow";
          type = "cpu";
        }
        {
          key = "GPU          ";
          keyColor = "blue";
          type = "gpu";
        }
        {
          key = "Memory       ";
          keyColor = "magenta";
          type = "memory";
        }
        {
          key = "Local IP     ";
          keyColor = "red";
          type = "localip";
          compact = true;
        }
        {
          type = "custom";
          format = "└{$1}────────────────────{$1}┘";
        }
      ];
    };
  };
}
