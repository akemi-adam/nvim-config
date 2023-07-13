local map = require("utils").map

map("n", "<C-b>", ":NvimTreeToggle <Enter>", { silent = true })
map("n", "<C-p>", ":Telescope find_files <Enter>", { silent = true })
map("n", "<C-s>", ":w <Enter>", { silent = true })
map("n", "<C-w>", ":q <Enter>", { silent = true })
map("n", "<A-.>", ":BufferNext <Enter>", { silent = true })
map("n", "<A-,>", ":BufferPrevious <Enter>", { silent = true })
map("n", "<C-j>", ":ToggleTerm <Enter>", { silent = true })
map("t", "<C-j>", "exit <Enter>", { silent = true })
