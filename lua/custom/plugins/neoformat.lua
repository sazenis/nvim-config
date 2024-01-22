local fmt_group = vim.api.nvim_create_augroup("fmt", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = fmt_group,
    pattern = "*",
    callback = function()
        local max_size_kb = 128 -- 128 KB
        local file_size_kb = vim.fn.getfsize(vim.fn.expand('%:p')) / 1024

        if file_size_kb < max_size_kb then
            vim.cmd("undojoin | Neoformat")
        end
    end
})

return {
  'sbdchd/neoformat'
}
