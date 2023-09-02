
-- Set color scheme & Transparent background
-- vim.o.termguicolors = true
-- vim.cmd('colorscheme rose-pine')
-- vim.cmd('highlight Normal guibg=none')

function ColorMyPencils()
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
