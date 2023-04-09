function ColorMyPencils(color)
    vim.opt.background = "dark"
	color = color or "oxocarbon"
	vim.cmd.colorscheme(color)

end

ColorMyPencils()
