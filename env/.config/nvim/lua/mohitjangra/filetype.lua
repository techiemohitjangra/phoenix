--  register "templ" file type
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.templ",
    callback = function()
        vim.bo.filetype = "templ"
    end
})
