require('user_commands.code-actions')
require('user_commands.autorun')

vim.api.nvim_create_user_command('SourceUserCommands', function()
    local files = vim.fn.globpath(command_dir, '*.lua', false, true)

    for _, file in ipairs(files) do
        local ok, err = pcall(dofile, file)
        if not ok then
            print('Error loading ' .. file .. ': ' .. err)
        end
    end
end, {})
