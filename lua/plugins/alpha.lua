return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,

    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      require("alpha.term")

      local logo = [[
                                        ⢰⣶⡆   ⣀⣤⡆ ⣶⣶⣶⣶⣶⣶⣶⣄  ⣠⣶⣶⣶⣶⣶⣶⣶ ⢰⣶⡆   ⢀⣤⡆ ⢰⣶⣶⣶⣶⣶⣤⡀  ⣶⣶    ⣶⣶
                                        ⢸⣿⣿⣶⣴⣾⠿⠋⠁ ⣿⣿⣀  ⠈⣿⣿  ⣿⣿⠁  ⣠⣿⣿ ⢸⣿⣿⣷⣶⣾⡿⠛⠁  ⣀⣀⣀⣀⣉⡻⢿⡇ ⣿⣿⣀   ⣿⣿
                                        ⢸⣿⡇⠉⠛⠿⣷⣦⡀ ⣿⣿⠿⣿⣦⣄⡉⠉  ⣿⣿⣠⣴⣿⠿⣿⣿ ⢸⣿⡇⠈⠙⠿⣿⣦⡄ ⢰⣿⣟⣛⣛⣛⣁⣀⡀ ⣿⣿⠿⣿⣦⣄⣿⣿
                                        ⠘⠛⠃   ⠈⠙⠃ ⠛⠛  ⠙⠛⠛⠒  ⠛⠛⠛⠉  ⠛⠛ ⠘⠛⠃    ⠙⠃ ⠘⠛⠛⠛⠛⠛⠛⠛⠃ ⠛⠛  ⠙⠛⠛⠛
      ]]
      dashboard.section.header.type = "group"
      dashboard.section.header.val = {
        { type = "text", val = vim.split(logo, "\n"), position = "center" },
        { type = "padding", val = 1 },
        {
          type = "text",
          val = "Rage, rage, rage against the dying of light",
          opts = { position = "center", shrink_margin = false, hl = "Type" },
        },
      }

      dashboard.section.buttons.val = {
        dashboard.button("s", "Restore", [[<cmd> lua require("persistence").load() <cr>]]),
        dashboard.button("t", "Terminal", "<cmd> lua  LazyVim.terminal() <cr>"),
      }

      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "Comment"
        button.opts.hl_shortcut = ""
        button.opts.position = "center"
        button.opts.width = 25
      end
      dashboard.section.footer.opts.hl = "String"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,

    config = function(_, dashboard)
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local current_hour = tonumber(os.date("%H"))

          local greeting, greetingColor

          if current_hour < 5 then
            greeting = "      Good night!  "
            greetingColor = "PreProc"
          elseif current_hour < 12 then
            greeting = "   󰼰   Good morning!  "
            greetingColor = "Operator"
          elseif current_hour < 17 then
            greeting = "      Good afternoon!   "
            greetingColor = "Type"
          elseif current_hour < 20 then
            greeting = "   󰖝   Good evening!  "
            greetingColor = "Boolean"
          else
            greeting = "   󰖔   Good night!  "
            greetingColor = "Identifier"
          end

          dashboard.section.footer.val = greeting
          dashboard.section.footer.opts.hl = greetingColor
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
