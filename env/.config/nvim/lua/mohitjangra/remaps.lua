vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- uncomment to enable mouse mode
vim.o.mouse = "a"

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-S-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-S-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-S-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-S-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- open netrw window

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move rows in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- navigate to end of file
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set("v", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")

-- page down i.e. go half page down
vim.keymap.set("n", "<C-n>", "<C-d>zz")
-- page up i.e. go half page up
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- navigate to next and previous match from /
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- paste from system clipboard
vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- yank to system clipboard
desc = "Highlight when yanking (copying) text", vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+y$]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- navigation in quickfix list
vim.keymap.set("n", "<C-S-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-S-j>", "<cmd>cprev<CR>zz")

-- navigation in location list
vim.keymap.set("n", "<leader>K", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>J", "<cmd>lprev<CR>zz")

-- navigation between windows
vim.keymap.set("n", "<M-h>", "<cmd>wincmd h<CR>zz")
vim.keymap.set("n", "<M-j>", "<cmd>wincmd j<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>wincmd k<CR>zz")
vim.keymap.set("n", "<M-l>", "<cmd>wincmd l<CR>zz")

-- replace string
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- grant executable permission to current file
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })

-- jump to plugin config directory
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/mohitjangra/plugins/<CR>")

-- momentarily highlight yanked text
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- remove trailing white space on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = MohitJangraGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})
