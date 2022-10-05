local nnoremap = require('dylan.keymap').nnoremap
local silent = { silent = true }

nnoremap("<leader>ha", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<C-h>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<C-t>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<C-n>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<C-s>", function() require("harpoon.ui").nav_file(3) end, silent)

