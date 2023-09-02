local lsp = require('lsp-zero')

lsp.preset('recommended')

-- Add additional servers for specific languages
-- C, C++, Python, Javascript, Typescript, Lua, Dockerfile, HTML, CSS, JSON, YAML, bash, React...
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'pyright',
	'html',
	'cssls',
	'jsonls',
	'yaml',
	'vimls',
	'clangd',
	-- React
	'diagnosticls',
	-- C/C++
	'ccls',
	-- Bash
	'bashls',
  -- Python
  'pycodestyle',
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>' ] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>' ] = cmp.mapping.select_next_item(cmp_select),
	['<C-Space>' ] = cmp.mapping.complete(),
	['<C-e>' ] = cmp.mapping.close(),
	['<C-y>' ] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	}),
})

lsp.set_sign_icons({
	error = '',
	warning = '',
	hint = '',
	information = '',
})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})

  -- local opts = {buffer = bufnr, noremap = true, silent = true}
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
  vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
