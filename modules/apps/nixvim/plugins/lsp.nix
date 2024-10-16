let keymap = (import ../nix_functions.nix).keymap;
in {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        nil-ls.enable = true;
        pylsp.enable = true;
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
      };
    };
    keymaps = [
      (keymap "n" "<leader>lf" "<cmd>lua vim.lsp.buf.format()<CR>" { })
      (keymap "n" "<leader>ln" "<cmd>lua vim.lsp.buf.rename()<CR>" { })
      (keymap "n" "<leader>lm" "<cmd>lua vim.lsp.buf.implementation()<CR>" { })
      (keymap "n" "<leader>li" "<cmd>lua vim.lsp.buf.incoming_calls()<CR>" { })
      (keymap "n" "<leader>lo" "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>" { })
      (keymap "n" "<leader>lr" "<cmd>lua vim.lsp.buf.references()<CR>" { })
      (keymap "n" "<leader>lh" "<cmd>lua vim.lsp.buf.signature_help()<CR>" { })
      (keymap "n" "<leader>lt" "<cmd>lua vim.lsp.buf.type_definition()<CR>" { })
      (keymap "n" "<leader>lc" "<cmd>lua vim.lsp.buf.typehierarchy()<CR>" { })
      (keymap "n" "<leader>ls" "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>" { })
      (keymap "n" "<leader>ld" "<cmd>lua vim.lsp.buf.definition()<CR>" { })
      (keymap "n" "gd" "<cmd>lua vim.lsp.buf.definition()<CR>" { })

      (keymap "n" "<leader>dl" "<cmd>lua vim.lsp.diagnostic.gget_line_diagnostics()<CR>" { })
    ];
  };
}
