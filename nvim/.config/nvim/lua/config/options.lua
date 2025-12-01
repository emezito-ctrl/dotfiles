vim.cmd [[set encoding=UTF-8]] -- Set UTF-8 as default encoding
vim.cmd [[colorscheme tokyonight]] -- Set 'tokyonight' as default theme

vim.api.nvim_set_hl(0, "Normal", {bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", {bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = "none" })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true -- it's the indicator of the line and column
vim.opt.cursorline = true -- highlight the line wherer the cursor is located
vim.opt.showmatch = true -- show the matching brackets, curly braces or parenteses
vim.opt.linebreak = true -- enable line breaking
vim.opt.wrap = true -- text wrapping 
vim.opt.hlsearch = true
vim.opt.incsearch = true -- incremental searching
vim.opt.smartcase = true -- smart text casing
vim.opt.expandtab = true -- tabs are replaced by spaces
vim.opt.ignorecase = true -- ignores text casing
vim.opt.autoindent = true -- auto text indenting
vim.opt.smartindent = true -- smart indenting
--vim.opt.smarttab = true -- smart tabbing
vim.opt.autoread = true -- auto reload files changed outside neovim
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- yse system clipboard
vim.opt.path:append("**") -- include subdirs in search

vim.bo.textwidth = 90 -- maximum line length before wrapping the text
vim.bo.shiftwidth = 4 -- number of spaces to indent the code
vim.bo.softtabstop = 4 -- same as above
vim.bo.tabstop = 4 -- same thing again

-- Remap <leader> + q to clear buffer (close windows) 
vim.api.nvim_set_keymap('', '<leader>q', ':e . <CR>', { silent = true })

-- Copy to X CLIPBOARD
vim.api.nvim_set_keymap('v', '<leader>cc', ':w !xsel -i -b<CR>', { silent = true })
-- map <leader>cp :w !xsel -i -p<CR>
-- map <leader>cs :w !xsel -i -s<CR>
-- Paste from X CLIPBOARD
vim.api.nvim_set_keymap('', '<leader>p', ':r!xsel -p<CR>', { silent = true })
-- map <leader>ps :r!xsel -s<CR>
-- map <leader>pb :r!xsel -b<CR>

vim.api.nvim_set_keymap('', '<leader>e', ':Neotree toggle<CR>', { silent = true })
