-- vim.opt.guicursor = ""

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.g.clipboard = "unnamedplus"
end)

-- netrw config
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- line numbers
vim.opt.nu = true
vim.opt.nuw = 3
vim.opt.relativenumber = true

-- tabs/indents
vim.opt.tabstop = 4 -- Number of spaces a tab counts for
vim.opt.softtabstop = 4 -- Number of spaces for a tab during editing
vim.opt.shiftwidth = 4 -- Number of spaces for each indent level
vim.opt.expandtab = true -- Convert tabs to spaces

vim.opt.smartindent = true
vim.o.breakindent = true

vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- scroll
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

vim.opt.colorcolumn = "80" -- colume width to draw colored line at

-- Spell checking
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.completeopt = "menuone,noselect"

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
