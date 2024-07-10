-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "VimLeavePre" }, {
  pattern = "*",

  callback = function(event)
    if event.buftype or event.file == "" then
      return
    end
    vim.api.nvim_buf_call(event.buf, function()
      vim.schedule(function()
        vim.cmd("silent! write")
      end)
    end)
  end,
})

vim.opt.relativenumber = false

-- Check if 'pwsh' is executable and set the shell accordingly
if vim.fn.executable("powershell") == 1 then
  vim.o.shell = "powershell"
end

-- Setting shell command flags
vim.o.shellcmdflag =
  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"

-- Setting shell redirection
vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'

-- Setting shell pipe
vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'

-- Setting shell quote options
vim.o.shellquote = ""
vim.o.shellxquote = ""
