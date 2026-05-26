-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Tema automático baseado no sistema (Dark = frappe, Light = latte)
local function get_theme()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  if result:find("Dark") then
    return "catppuccin-frappe"
  else
    return "catppuccin-latte"
  end
end

local theme = get_theme()
lvim.colorscheme = theme

-- Formatar ao salvar
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.go" }

-- Usar goimports
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    name = "goimports",
    filetypes = { "go" },
  },
})

-- DAP
lvim.builtin.dap.active = true

-- Keymaps
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename" })
lvim.keys.normal_mode["<F5>"]  = ":lua require('dap').continue()<CR>"
lvim.keys.normal_mode["<F8>"]  = ":lua require('dapui').close()<CR>"
lvim.keys.normal_mode["<F9>"]  = ":lua require('dap').toggle_breakpoint()<CR>"
lvim.keys.normal_mode["<F10>"] = ":lua require('dap').step_over()<CR>"
lvim.keys.normal_mode["<F11>"] = ":lua require('dap').step_into()<CR>"
lvim.keys.normal_mode["<F12>"] = ":lua require('dap').step_out()<CR>"
lvim.keys.normal_mode["<C-1>"] = ":ToggleTerm 1<CR>"
lvim.keys.normal_mode["<C-2>"] = ":ToggleTerm 2<CR>"
lvim.keys.normal_mode["<C-3>"] = ":ToggleTerm 3<CR>"
vim.keymap.set("n", "<C-]>", ":vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy" })
vim.keymap.set("n", "<D-v>", '"+p', { desc = "Paste" })
vim.keymap.set("i", "<D-v>", '<C-r>+', { desc = "Paste insert mode" })
vim.keymap.set("v", "<D-v>", '"+p', { desc = "Paste visual mode" })

-- Markdown Preview
vim.g.mkdp_auto_close = 0
vim.g.mkdp_theme = "dark"
vim.g.mkdp_filetypes = { "markdown" }

-- Plugins
lvim.plugins = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local flavour = theme:gsub("catppuccin%-", "")
      require("catppuccin").setup({
        flavour = flavour,
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install_sync"]()
    end,
    config = function()
      if vim.bo.filetype == "markdown" then
        vim.api.nvim_exec_autocmds("BufEnter", { buffer = 0 })
      end
    end,
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },
}

-- DAP configurações Go
local dap = require("dap")

dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "go",
    name = "Attach to process",
    request = "attach",
    mode = "local",
    processId = function()
      local pid = vim.fn.input("PID: ")
      return tonumber(pid)
    end,
  },
  {
    type = "go",
    name = "Attach remote",
    request = "attach",
    mode = "remote",
    host = "127.0.0.1",
    port = "2345",
  },
}