-- INFO: (Quick ref)
-- cs"' : change surrounding from " to '
-- cs'<q> : change surrounding from ' to the html tag <q>
-- yss) : wrap current line in ()
-- ysiw<em> :wrap current word in <em>
-- ysiw" : wrap current word in "
-- S" : wrap sellection in "
return {
  "tpope/vim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  lazy = false,
  config = function() end,
}
