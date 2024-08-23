
--nvim-lazy, load if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    ":color --branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")


-- modifying colors of linenumbers ad highlights
vim.cmd("set number relativenumber")
vim.cmd("hi LineNr guifg=lightgrey")
vim.cmd("set cursorline")
vim.cmd("hi CursorLine guibg=#484848")
vim.cmd("hi CursorLineNr guifg=yellow guibg=#484848")
vim.cmd("hi Pmenu guibg=#484848")

