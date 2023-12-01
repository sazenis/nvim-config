local auto_group
local output_buf

local function create_scratch_buffer()
    vim.cmd('rightbelow vnew')
    local total_width = vim.api.nvim_get_option('columns')
    local output_width = math.floor(total_width * 0.3)
    vim.cmd('vertical resize ' .. output_width)
    output_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(0, output_buf)
    vim.api.nvim_buf_set_option(output_buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(output_buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(output_buf, 'swapfile', false)
    vim.api.nvim_win_set_option(0, 'wrap', false)
end

vim.api.nvim_create_user_command('Autorun', function (args)
    local args_tbl = vim.split(args.args, " ", { plain = true })
    local filePattern = args_tbl[1]
    table.remove(args_tbl, 1)
    local executionCmd = table.concat(args_tbl, " ")
    create_scratch_buffer()
    vim.cmd('wincmd p')
    auto_group = vim.api.nvim_create_augroup('AutoRunGroup', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePost', {
        group = auto_group,
        pattern = filePattern,
        callback = function()
            vim.api.nvim_buf_set_lines(output_buf, 0, -1, false, {})
            local cmd = executionCmd
            local function on_event(job_id, data, event)
                if event == "stdout" or event == "stderr" then
                    for _, line in ipairs(data) do
                        if line ~= "" then
                            vim.api.nvim_buf_set_lines(output_buf, -1, -1, false, {line})
                        end
                    end
                end
            end
            vim.fn.jobstart(cmd, {
                on_stdout = on_event,
                on_stderr = on_event,
                stdout_buffered = true,
                stderr_buffered = true,
            })
        end,
    })
end, { nargs = "*" })

vim.api.nvim_create_user_command('StopAuto', function ()
    if auto_group then
        vim.api.nvim_del_augroup_by_id(auto_group)
        auto_group = nil
        if output_buf and vim.api.nvim_buf_is_valid(output_buf) then
            vim.api.nvim_buf_delete(output_buf, { force = true })
        end
    end
end, {})

vim.api.nvim_create_user_command('BunAutoRun', function ()
    vim.api.nvim_command('Autorun *.ts bun run index.ts')
end, {})
