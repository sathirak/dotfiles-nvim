return {
    { "MunifTanjim/nui.nvim", lazy = true },

    {"xiyaowong/transparent.nvim"},

    {
        "folke/which-key.nvim",
        opts = function(_, opts)
          if LazyVim.has("noice.nvim") then
            opts.defaults["<leader>sn"] = { name = "+noice" }
          end
        end,
    },
  
    -- Configure LazyVim to load gruvbox
    {
      "LazyVim/LazyVim",
      opts = {
        ui = "nui",
      },
    }
  }