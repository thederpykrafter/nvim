-- move line of text
keymap("n", "<A-j>", "<cmd>m-2<cr>", { desc = "Move Line Down"})
keymap("v", "<A-j>", "ddjp", { desc = "Move Line Down"})
keymap("n", "<A-k>", "<cmd>m+<cr>", { desc = "Move Line Up"})
keymap("v", "<A-k>", "ddkp", { desc = "Move Line Up"})
