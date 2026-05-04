-- Indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- List chars (Whitespace visualization)
vim.opt.list = true
vim.opt.listchars = {
	tab = "> ",
	multispace = "·",
	lead = "·",
	trail = "·",
	nbsp = "+",
}
