--- Options
vim.opt.clipboard = "unnamedplus"

--- Plugin manager (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"L3MON4D3/LuaSnip"},
})

--- Completion
local ok, cmp = pcall(require, "cmp")
if ok then
  cmp.setup({
    snippet = {
      expand = function(args) require('luasnip').lsp_expand(args.body) end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"]      = cmp.mapping.confirm({ select = true }),
      ["<Tab>"]     = cmp.mapping.select_next_item(),
      ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
      ["<C-j>"]     = cmp.mapping.select_next_item(),
      ["<C-k>"]     = cmp.mapping.select_prev_item(),
    }),
    sources = {{ name = "nvim_lsp" }},
  })
end

--- LSP — rust-analyzer
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function()
    local lsp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
    vim.lsp.start({
      name = 'rust-analyzer',
      cmd = {'rust-analyzer'},
      root_dir = vim.fs.dirname(vim.fs.find({'Cargo.toml'}, { upward = true })[1]),
      capabilities = lsp_ok and cmp_lsp.default_capabilities() or nil,
      settings = {
        ["rust-analyzer"] = {
          check = { command = "clippy" },
          cargo = { features = "all" },
        },
      },
    })
  end,
})

--- Auto-format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.rs',
  callback = function() vim.lsp.buf.format({ async = false }) end,
})

--- LSP keybindings
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action)
vim.keymap.set('n', 'K',  vim.lsp.buf.hover)
vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help)
vim.keymap.set('n', 'g0', vim.lsp.buf.document_symbol)
vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol)
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev)
