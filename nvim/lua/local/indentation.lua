-- Indent with spaces instead of tabs.
-- Use Ctrl-V<Tab> to insert tabs, if needed.
-- https://stackoverflow.com/questions/51995128/setting-autoindentation-to-spaces-in-neovim
-- https://vim.fandom.com/wiki/Converting_tabs_to_spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
-- length to use when editing text (eg. TAB and BS keys)
-- (0 for ‘tabstop’, -1 for ‘shiftwidth’):
vim.opt.softtabstop = 0
-- length to use when shifting text (eg. <<, >> and == commands)
-- (0 for ‘tabstop’):
vim.opt.shiftwidth = 0
-- round indentation to multiples of 'shiftwidth' when shifting text
vim.opt.shiftround = true

