{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      editor = {
        auto-format = true;
        cursorline = true;
        color-modes = true;
        indent-guides.render = true;
        default-yank-register = "+";

        line-number = "relative";
        bufferline = "multiple";

        auto-pairs = {
          "(" = ")";
          "{" = "}";
          "[" = "]";
          "<" = ">";
        };

        cursor-shape = {
          "insert" = "bar";
          "normal" = "block";
          "select" = "underline";
        };

        statusline = {
          separator = "|";
          left = [
            "mode"
            "file-name"
          ];
          right = [
            "selections"
            "file-type"
            "position"
          ];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };
      keys.normal = {
        "C-r" = ":reload-all";
        "esc" = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        space = {
          "i" = ":toggle lsp.display-inlay-hints";
        };

      };
    };

    languages = {
      language-server.nixd.command = "${pkgs.nixd}/bin/nixd";
      language-server.fish-lsp.command = "${pkgs.fish-lsp}/bin/fish-lsp";
      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" ];
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
      ];
    };
  };
}
