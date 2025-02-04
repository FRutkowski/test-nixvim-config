{
  plugins = {
    # Language server
    lsp = {
      enable = true;
      servers = {
        # Average webdev LSPs
        # ts-ls.enable = true; # TS/JS
        ts_ls.enable = true; # TS/JS
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        astro.enable = true; # AstroJS
        phpactor.enable = true; # PHP
        svelte.enable = false; # Svelte
        volar = {
          enable = true;
          tslsIntegration = true;
        };
        pyright = {
          enable = true;
          extraOptions.settings = {
            pyright.disableOrganizeImports = true;
            python.analysis = {
              # Ignore all files for analysis to exclusively use Ruff for linting
              ignore.__raw = ''{ '*' }'';
            };
          };
          ruff = {
            enable = true;
            onAttach.function = ''
              if client.name == 'ruff' then
                -- Disable hover in favor of Pyright
                client.server_capabilities.hoverProvider = false
              end
            '';
          };
          marksman.enable = true; # Markdown
          nil_ls.enable = true; # Nix
          dockerls.enable = true; # Docker
          bashls.enable = true; # Bash
          clangd.enable = true; # C/C++
          csharp_ls.enable = true; # C#
          yamlls.enable = true; # YAML
          ltex = {
            enable = true;
            settings = {
              enabled = [
                "astro"
                "html"
                "latex"
                "markdown"
                "text"
                "tex"
                "gitcommit"
              ];
              completionEnabled = true;
              language = "en-US de-DE nl";
              # dictionary = {
              #   "nl-NL" = [
              #     ":/home/liv/.local/share/nvim/ltex/nl-NL.txt"
              #   ];
              #   "en-US" = [
              #     ":/home/liv/.local/share/nvim/ltex/en-US.txt"
              #   ];
              #   "de-DE" = [
              #     ":/home/liv/.local/share/nvim/ltex/de-DE.txt"
              #   ];
              # };
            };
          };
          gopls = {
            # Golang
            enable = true;
            autostart = true;
          };

          lua_ls = {
            # Lua
            enable = true;
            settings.telemetry.enable = false;
          };

          # Rust
          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
        };
      };
    };

    lspsaga = {
      enable = true;
      beacon.enable = true;
      ui.border = "rounded"; # One of none, single, double, rounded, solid, shadow
      hover = {
        openCmd = "!firfox";
        openLink = "gx";
      };
      symbolInWinbar = {
        enable = true; # Breadcrumbs
        showFile = false;
      };

      codeAction = {
        showServerName = true;
        numShortcut = false;
        onlyInCursor = false;
        keys = {
          exec = "<CR>";
          quit = [
            "<Esc>"
            "q"
          ];
        };
      };

      lightbulb = {
        enable = true;
        sign = true;
      };

      rename.keys = {
        exec = "<CR>";
        quit = [
          "<C-k>"
          "<Esc>"
        ];
        select = "x";
      };

      outline = {
        closeAfterJump = true;
        layout = "normal"; # normal or float
        winPosition = "right"; # left or right
        keys = {
          jump = "e";
          quit = "q";
          toggleOrJump = "o";
        };
      };

      scrollPreview = {
        scrollUp = "<C-d>";
        scrollDown = "<C-u>";
      };
    };

    which-key.settings.spec = [
      {
        __unkeyed-1 = "gp";
        mode = "n";
        group = "+peek";
      }
    ];

    lspkind = {
      enable = true;
      symbolMap = {
        Copilot = "";
      };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
  };
}
