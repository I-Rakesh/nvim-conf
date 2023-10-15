vim.g.mapleader = " "

--tmux-sessions
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/scripts/tmux-sessionizer.sh<CR>")

-- Redo
vim.keymap.set("n", "<S-u>", "<C-r>")

-- to move selected text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- to keep the cursor in the middle while moving and searching
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- to Preserve copied text to past without loosing
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>P", [["+p]])

-- to copy into system clipboard or vim buffer
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- format code based on Lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- to change the word at the cursor
vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Makes a file executable
vim.keymap.set("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { silent = true })

-- to close the current buffer
vim.keymap.set("n", "<leader>x", vim.cmd.bd)
vim.keymap.set("n", "<leader>X", ":%bd|edit#|bd#<CR>")

-- to move between buffers
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)

-- to move between windows
vim.keymap.set({ "n", "i" }, "<C-j>", "<Esc><C-w>j")
vim.keymap.set({ "n", "i" }, "<C-k>", "<Esc><C-w>k")
vim.keymap.set({ "n", "i" }, "<C-l>", "<Esc><C-w>l")
vim.keymap.set({ "n", "i" }, "<C-h>", "<Esc><C-w>h")

-- to rearrange window
vim.keymap.set({ "n" }, "<leader>H", "<Esc><C-w>H")
vim.keymap.set({ "n" }, "<leader>J", "<Esc><C-w>J")
vim.keymap.set({ "n" }, "<leader>K", "<Esc><C-w>K")
vim.keymap.set({ "n" }, "<leader>L", "<Esc><C-w>L")
vim.keymap.set({ "n", "i" }, "<C-" .. vim.g.mapleader .. ">", "<Esc><C-w><C-r>", { noremap = true })

-- to resize panes
vim.keymap.set("n", "+", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "_", [[<cmd>vertical resize -5<cr>]])
vim.keymap.set("n", "≠", [[<cmd>horizontal resize +2<cr>]])
vim.keymap.set("n", "–", [[<cmd>horizontal resize -2<cr>]])
vim.keymap.set("n", "<leader>-", "<C-w>_")
vim.keymap.set("n", "<leader>=", "<C-w>=")

-- to open new panes
vim.keymap.set("n", '<leader>"', ":new<CR>")
vim.keymap.set("n", "<leader>%", ":vnew<CR>")

-- Navigate between quickfix items
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })
vim.keymap.set("n", "<leader>q", "<cmd>copen<CR>")
