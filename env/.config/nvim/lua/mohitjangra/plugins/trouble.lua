return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>tt",
            "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>tw",
            "<CMD>Trouble diagnostics toggle<CR>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>tn",
            "<CMD>Trouble diagnostics next jump=true<CR>",
            desc = "Next Diagnostic (Trouble)",
        },
        {
            "<leader>tp",
            "<CMD>Trouble diagnostics prev jump=true<CR>",
            desc = "Previous Diagnostic (Trouble)",
        },
        {
            "<leader>tq",
            "<CMD>Trouble qflist toggle<CR>",
            desc = "Quickfix List (Trouble)",
        },
        {
            "<leader>tl",
            "<CMD>Trouble loclist toggle<CR>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>ts",
            "<CMD>Trouble symbols toggle focus=false<CR>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>tc",
            "<CMD>Trouble lsp toggle focus=false win.position=right<CR>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
    },
}
