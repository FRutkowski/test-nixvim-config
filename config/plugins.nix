{ pkgs, ... }:
{
  imports = [
    ./completion/cmp.nix
    ./completion/snippets.nix
    ./formaterrs/conform.nix
    ./lsp/lsp.nix
    ./utils/wtf.nix
  ];

  plugins = {
    # Navigate Tmux with the same keybindings as Neovim
    tmux-navigator = {
      enable = true;
      keymaps = [
        {
          action = "left";
          key = "<C-w>h";
        }
        {
          action = "down";
          key = "<C-w>j";
        }
        {
          action = "up";
          key = "<C-w>k";
        }
        {
          action = "right";
          key = "<C-w>l";
        }
        {
          action = "previous";
          key = "<C-w>\\";
        }
      ];
    };

    # Buffer bar
    bufferline = {
      enable = true;
    };

    # Status bar
    lualine = {
      enable = true;
    };

    # Make `nvim .` look prettier
    oil = {
      enable = true;
    };

    neoscroll = {
      enable = true;
    };

    # Includes all parsers for treesitter
    treesitter = {
      enable = true;
    };

    mini = {
      enable = true;
      modules = {
        # Highlight word under cursor
        cursorword = {
          delay = 0;
        };

        # Show indent lines
        indentscope = {
          symbol = "│";
          draw.delay = 0;
        };
      };
    };

    indent-blankline = {
      enable = true;
    };

    # Icons
    web-devicons.enable = true;

    sleuth = {
      enable = true;
    };

    # Auto-tagging
    ts-autotag = {
      enable = true;
    };

    # Autopairs
    nvim-autopairs = {
      enable = true;
    };

    none-ls = {
      enable = false;
      settings = {
        cmd = [ "bash -c nvim" ];
        debug = false;
      };
      sources = {
        code_actions = {
          statix.enable = false;
          gitsigns.enable = true;
        };
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
          pylint.enable = true;
          checkstyle.enable = true;
        };
        formatting = {
          alejandra.enable = true;
          stylua.enable = true;
          shfmt.enable = true;
          nixpkgs_fmt.enable = true;
          google_java_format.enable = false;
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
          };
          black = {
            enable = true;
            settings = ''
              {
                extra_args = { "--fast" },
              }
            '';

          };
        };
        completion = {
          luasnip.enable = true;
          spell.enable = true;
        };
      };
    };

    # Lazygit
    lazygit = {
      enable = true;
    };

    # Notify
    notify = {
      enable = true;
      backgroundColour = "#1e1e2e";
      fps = 60;
      render = "default";
      timeout = 500;
      topDown = true;
    };

    # Persistence
    persistence.enable = true;

    # Debugger
    dap = {
      enable = true;
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "●";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
      };
      extensions = {
        dap-python = {
          enable = true;
        };
        dap-ui = {
          enable = true;
          floating.mappings = {
            close = [
              "<ESC>"
              "q"
            ];
          };
        };
        dap-virtual-text = {
          enable = true;
        };
      };
      configurations = {
        java = [
          {
            type = "java";
            request = "launch";
            name = "Debug (Attach) - Remote";
            hostName = "127.0.0.1";
            port = 5005;
          }
        ];
      };
    };

    # Linting
    lint = {
      enable = true;
      lintersByFt = {
        text = [ "vale" ];
        json = [ "jsonlint" ];
        markdown = [ "vale" ];
        rst = [ "vale" ];
        ruby = [ "ruby" ];
        janet = [ "janet" ];
        inko = [ "inko" ];
        clojure = [ "clj-kondo" ];
        dockerfile = [ "hadolint" ];
        terraform = [ "tflint" ];
        python = [ "mypy" ];
      };
      linters.mypy = {
        cmd = "${pkgs.mypy}/bin/mypy";
        args = [ "--ignore-missing-imports" ];
      };
    };

    # Trouble
    trouble = {
      enable = true;
    };

    # Code snippets
    luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      fromSnipmate = [
        {
          paths = ./vim-snippets/snippets/markdown.snippets;
          include = [ "markdown" ];
        }
        {
          paths = ./vim-snippets/snippets/html.snippets;
          include = [ "html" ];
        }
        {
          paths = ./vim-snippets/snippets/go.snippets;
          include = [ "go" ];
        }
        {
          paths = ./vim-snippets/snippets/rust.snippets;
          include = [ "rust" ];
        }
        {
          paths = ./vim-snippets/snippets/php.snippets;
          include = [ "php" ];
        }
        {
          paths = ./vim-snippets/snippets/lua.snippets;
          include = [ "lua" ];
        }
        {
          paths = ./vim-snippets/snippets/c.snippets;
          include = [ "c" ];
        }
        {
          paths = ./vim-snippets/snippets/css.snippets;
          include = [ "css" ];
        }
        {
          paths = ./vim-snippets/snippets/javascript/javascript.snippets;
          include = [ "javascript" ];
        }
        {
          paths = ./vim-snippets/snippets/javascript/javascript-react.snippets;
          include = [ "javascript-react" ];
        }
        {
          paths = ./vim-snippets/UltiSnips/javascript-node.snippets;
          include = [ "javascript-node" ];
        }
        {
          paths = ./vim-snippets/snippets/typescript.snippets;
          include = [ "typescript" ];
        }
        {
          paths = ./vim-snippets/snippets/typescriptreact.snippets;
          include = [ "typescript-react" ];
        }
        {
          paths = ./vim-snippets/snippets/sh.snippets;
          include = [ "sh" ];
        }
        {
          paths = ./vim-snippets/snippets/bash.snippets;
          include = [ "bash" ];
        }
        {
          paths = ./vim-snippets/snippets/zsh.snippets;
          include = [ "zsh" ];
        }
      ];
    };

    # Easily toggle comments
    comment.enable = true;

    # Terminal inside Neovim
    toggleterm = {
      enable = true;
      settings = {
        hide_numbers = false;
        autochdir = true;
        close_on_exit = true;
        direction = "vertical";
      };
    };

    # Git signs in code
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    which-key = {
      enable = false;
      registrations = {
        "<leader>fg" = "Find Git files with telescope";
        "<leader>fw" = "Find text with telescope";
        "<leader>ff" = "Find files with telescope";
      };
    };

    # Markdown preview server
    markdown-preview = {
      enable = true;
      settings.theme = "dark";
    };

    render-markdown = {
      enable = true;
    };

    image = {
      enable = true;
      backend = "kitty";
      hijackFilePatterns = [
        "*.png"
        "*.jpg"
        "*.jpeg"
        "*.gif"
        "*.webp"
      ];
      maxHeightWindowPercentage = 25;
      tmuxShowOnlyInActiveWindow = true;
      integrations = {
        markdown = {
          enabled = true;
          downloadRemoteImages = true;
          filetypes = [
            "markdown"
            "vimwiki"
            "mdx"
          ];
        };
      };
    };

    # Prettier fancier command window
    noice = {
      enable = true;
    };

    # Good old Telescope
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
    };

    # Todo comments
    todo-comments = {
      enable = true;
      settings.colors = {
        error = [
          "DiagnosticError"
          "ErrorMsg"
          "#DC2626"
        ];
        warning = [
          "DiagnosticWarn"
          "WarningMsg"
          "#FBBF24"
        ];
        info = [
          "DiagnosticInfo"
          "#2563EB"
        ];
        hint = [
          "DiagnosticHint"
          "#10B981"
        ];
        default = [
          "Identifier"
          "#7C3AED"
        ];
        test = [
          "Identifier"
          "#FF00FF"
        ];
      };
    };

    # File tree
    neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      enableRefreshOnWrite = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
      buffers = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
      };
      window = {
        width = 40;
        height = 15;
        autoExpandWidth = false;
        mappings = {
          "<space>" = "none";
        };
      };
    };

    undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
      };
    };

    # Highlight word under cursor
    illuminate = {
      enable = true;
      underCursor = false;
      filetypesDenylist = [
        "Outline"
        "TelescopePrompt"
        "alpha"
        "harpoon"
        "reason"
      ];
    };

    hardtime = {
      enable = false;
      settings = {
        disableMouse = true;
        enabled = false;
        disabledFiletypes = [ "Oil" ];
        restrictionMode = "hint";
        hint = true;
        maxCount = 40;
        maxTime = 1000;
        restrictedKeys = {
          "h" = [
            "n"
            "x"
          ];
          "j" = [
            "n"
            "x"
          ];
          "k" = [
            "n"
            "x"
          ];
          "l" = [
            "n"
            "x"
          ];
          "-" = [
            "n"
            "x"
          ];
          "+" = [
            "n"
            "x"
          ];
          "gj" = [
            "n"
            "x"
          ];
          "gk" = [
            "n"
            "x"
          ];
          "<CR>" = [
            "n"
            "x"
          ];
          "<C-M>" = [
            "n"
            "x"
          ];
          "<C-N>" = [
            "n"
            "x"
          ];
          "<C-P>" = [
            "n"
            "x"
          ];
        };
      };
    };

    # Nix expressions in Neovim
    nix = {
      enable = true;
    };

    alpha = {
      enable = true;
      theme = "dashboard";
      # iconsEnabled = true; # Deprecated
    };

    # bufferline = {
    #   enable = true;
    #   settings = {
    #     options = {
    #       diagnostics = "nvim_lsp";
    #       mode = "buffers";
    #
    #       close_icon = " ";
    #       buffer_close_icon = "󰱝 ";
    #       modified_icon = "󰔯 ";
    #
    #       offsets = [
    #         {
    #           filetype = "neo-tree";
    #           text = "Neo-tree";
    #           highlight = "Directory";
    #           text_align = "left";
    #         }
    #       ];
    #     };
    #   };
    # };

    schemastore = {
      enable = true;
      yaml.enable = true;
      json.enable = false;
    };

    fidget = {
      enable = true;
      logger = {
        level = "warn"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
        floatPrecision = 0.01; # Limit the number of decimals displayed for floats
      };
      progress = {
        pollRate = 0; # How and when to poll for progress messages
        suppressOnInsert = true; # Suppress new messages while in insert mode
        ignoreDoneAlready = false; # Ignore new tasks that are already complete
        ignoreEmptyMessage = false; # Ignore new tasks that don't contain a message
        clearOnDetach =
          # Clear notification group when LSP server detaches
          ''
            function(client_id)
              local client = vim.lsp.get_client_by_id(client_id)
              return client and client.name or nil
            end
          '';
        notificationGroup =
          # How to get a progress message's notification group key
          ''
            function(msg) return msg.lsp_client.name end
          '';
        ignore = [ ]; # List of LSP servers to ignore
        lsp = {
          progressRingbufSize = 0; # Configure the nvim's LSP progress ring buffer size
        };
        display = {
          renderLimit = 16; # How many LSP messages to show at once
          doneTtl = 3; # How long a message should persist after completion
          doneIcon = "✔"; # Icon shown when all LSP progress tasks are complete
          doneStyle = "Constant"; # Highlight group for completed LSP tasks
          progressTtl = "math.huge"; # How long a message should persist when in progress
          progressIcon = {
            pattern = "dots";
            period = 1;
          }; # Icon shown when LSP progress tasks are in progress
          progressStyle = "WarningMsg"; # Highlight group for in-progress LSP tasks
          groupStyle = "Title"; # Highlight group for group name (LSP server name)
          iconStyle = "Question"; # Highlight group for group icons
          priority = 30; # Ordering priority for LSP notification group
          skipHistory = true; # Whether progress notifications should be omitted from history
          formatMessage = ''
            require ("fidget.progress.display").default_format_message
          ''; # How to format a progress message
          formatAnnote = ''
            function (msg) return msg.title end
          ''; # How to format a progress annotation
          formatGroupName = ''
            function (group) return tostring (group) end
          ''; # How to format a progress notification group's name
          overrides = {
            rust_analyzer = {
              name = "rust-analyzer";
            };
          }; # Override options from the default notification config
        };
      };
      notification = {
        pollRate = 10; # How frequently to update and render notifications
        filter = "info"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
        historySize = 128; # Number of removed messages to retain in history
        overrideVimNotify = true;
        redirect = ''
          function(msg, level, opts)
            if opts and opts.on_open then
              return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
            end
          end
        '';
        configs = {
          default = "require('fidget.notification').default_config";
        };

        window = {
          normalHl = "Comment";
          winblend = 0;
          border = "none"; # none, single, double, rounded, solid, shadow
          zindex = 45;
          maxWidth = 0;
          maxHeight = 0;
          xPadding = 1;
          yPadding = 0;
          align = "bottom";
          relative = "editor";
        };
        view = {
          stackUpwards = true; # Display notification items from bottom to top
          iconSeparator = " "; # Separator between group name and icon
          groupSeparator = "---"; # Separator between notification groups
          groupSeparatorHl =
            # Highlight group used for group separator
            "Comment";
        };
      };
    };

  };

  extraConfigVim = '''';

  extraConfigLuaPre = ''
    if vim.g.have_nerd_font then
      require('nvim-web-devicons').setup {}
    end
  '';

  extraConfigLuaPost = ''
    -- vim: ts=2 sts=2 sw=2 et
  '';

  extraConfigLua = ''
      require("telescope").load_extension("lazygit")

      luasnip = require("luasnip")
      kind_icons = {
        Text = "󰊄",
        Method = "",
        Function = "󰡱",
        Constructor = "",
        Field = "",
        Variable = "󱀍",
        Class = "",
        Interface = "",
        Module = "󰕳",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      local cmp = require'cmp'

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({'/', "?" }, {
        sources = {
          { name = 'buffer' }
        }
      })

      -- Set configuration for specific filetype.
       cmp.setup.filetype('gitcommit', {
         sources = cmp.config.sources({
           { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
         }, {
           { name = 'buffer' },
         })
       })

       -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
       cmp.setup.cmdline(':', {
         sources = cmp.config.sources({
           { name = 'path' }
         }, {
           { name = 'cmdline' }
         }),
    --      formatting = {
    --       format = function(_, vim_item)
    --         vim_item.kind = cmdIcons[vim_item.kind] or "FOO"
    --       return vim_item
    --      end
    -- }
         })  '';

    colorschemes.gruvbox.enable = true;
    # colorschemes.catppuccin = {
    #   enable = true;
    #   settings = {
    #       color_overrides.latte = {
    #         background = "#9d8b70";
    #       };
    #       flavour = "frappe";
    #       integrations = {
    #         cmp = true;
    #         gitsigns = true;
    #         nvimtree = true;
    #         treesitter = true;
    #       };
    #   };
    # };

  # colorschemes.catppuccin = {
  #   enable = true;
  #   settings = {
  #     no_bold = false;
  #     no_italic = false;
  #     no_underline = false;
  #     transparent_background = true;
  #     integrations = {
  #       cmp = true;
  #       noice = true;
  #       notify = true;
  #       neotree = true;
  #       harpoon = true;
  #       gitsigns = true;
  #       which_key = true;
  #       illuminate.enabled = true;
  #       treesitter = true;
  #       treesitter_context = true;
  #       telescope.enabled = true;
  #       indent_blankline.enabled = true;
  #       mini.enabled = true;
  #       native_lsp = {
  #         enabled = true;
  #         inlay_hints = {
  #           background = true;
  #         };
  #         underlines = {
  #           errors = ["underline"];
  #           hints = ["underline"];
  #           information = ["underline"];
  #           warnings = ["underline"];
  #         };
  #       };
  #     };
  #   };
  # };

  # extraPlugins = with pkgs.vimPlugins; [
  #   vim-be-good
  #   headlines-nvim
  #   # accelerated-jk
  # ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-be-good
    glow-nvim # Glow inside of Neovim
    clipboard-image-nvim
  ];
  #    ++ [
  #      (pkgs.vimUtils.buildVimPlugin {
  #      pname = "markview.nvim";
  #      version = "0.0.1";
  #      src = pkgs.fetchFromGitHub {
  #        owner = "OXY2DEV";
  #        repo = "markview.nvim";
  #        rev = "a959d77ca7e9f05175e3ee4e582db40b338c9164";
  #        hash = "sha256-w6yn8aNcJMLRbzaRuj3gj4x2J/20wUROLM6j39wpZek=";
  #      };
  #    })
  #      # Just copy this block for a new plugin
  #      # (pkgs.vimUtils.buildVimPlugin {
  #      #   pname = "";
  #      #   src = pkgs.fetchFromGitHub {
  #      #     owner = "";
  #      #     repo = "";
  #      #     rev = "";
  #      #     sha256 = "";
  #      #   };
  #      # })
  #    ];
}
