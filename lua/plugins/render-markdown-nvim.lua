-- https://github.com/MeanderingProgrammer/render-markdown.nvim
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  -- opts = {},
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  config = function()
    require("render-markdown").setup {}
  end,
}

-- Commands
-- --------
-- :RenderMarkdown | :RenderMarkdown enable - Enable this plugin
-- Can also be accessed directly through require('render-markdown').enable()
--
-- :RenderMarkdown disable - Disable this plugin
-- Can also be accessed directly through require('render-markdown').disable()
--
-- :RenderMarkdown toggle - Switch between enabling & disabling this plugin
-- Can also be accessed directly through require('render-markdown').toggle()
--
-- :RenderMarkdown expand - Increase anti-conceal margin above and below by 1
-- Can also be accessed directly through require('render-markdown').expand()
--
-- :RenderMarkdown contract - Decrease anti-conceal margin above and below by 1
-- Can also be accessed directly through require('render-markdown').contract()
