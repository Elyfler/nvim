function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

vim.wo.relativenumber = true
vim.opt.termguicolors = true
vim.opt.fillchars = {eob = " "}
vim.api.nvim_set_option_value("colorcolumn", "", {})
vim.cmd("colorscheme generated")

Map("i", "jj", "<Esc>")

