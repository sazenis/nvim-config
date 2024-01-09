vim.api.nvim_create_user_command('ExtractSqlQueryFunction', function()
    vim.cmd('normal 0t(')
    vim.cmd('normal "nyiw')

    vim.cmd('normal va{V')
    vim.cmd('normal "ky')

    local current_word = vim.fn.getreg('n') .. 'Sql'

    local current_directory = vim.fn.expand('%:p:h')

    local file_path = current_directory .. '/queries/' .. current_word .. '.js'

    vim.fn.mkdir(vim.fn.expand(current_directory .. '/queries'), 'p')

    -- Start with the required require statement
    local import_line = "const { tablePrefix } = require(\"config/dbconfig\");"
    local export_line = "module.exports = " .. current_word .. ";"


    vim.cmd('rightbelow vsplit ' .. file_path)
    vim.cmd('normal Go' .. import_line)
    vim.cmd('normal "kp');
    vim.cmd('normal Go' .. export_line)

end, {})
