return { 
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- automatically does setup
    -- require("catppuccin").setup()
    vim.cmd.colorscheme "catppuccin"
  end
}
