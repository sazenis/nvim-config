local auto_group
local output_buf

local function create_scratch_buffer()
    vim.cmd('rightbelow vnew')
    output_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(0, output_buf)
    vim.api.nvim_buf_set_option(output_buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(output_buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(output_buf, 'swapfile', false)
    vim.api.nvim_win_set_option(0, 'wrap', false)
    vim.cmd('vertical resize 80') 
end

vim.api.nvim_create_user_command('Autorun', function (args)
    local executor = args.args ~= "" and args.args or "bun"
    local main_buf = vim.api.nvim_get_current_buf()

    create_scratch_buffer()

    vim.cmd('wincmd p')

    auto_group = vim.api.nvim_create_augroup('AutoRunGroup', { clear = true })

    vim.api.nvim_create_autocmd('BufWritePost', {
        group = auto_group,
        buffer = main_buf,
        callback = function()
            vim.api.nvim_buf_set_lines(output_buf, 0, -1, false, {})

            local main_file = vim.api.nvim_buf_get_name(main_buf)
            local cmd = executor .. " " .. main_file

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
end, { nargs = "?" })

vim.api.nvim_create_user_command('StopAuto', function ()
    if auto_group then
        vim.api.nvim_del_augroup_by_id(auto_group)
        auto_group = nil
        if output_buf and vim.api.nvim_buf_is_valid(output_buf) then
            vim.api.nvim_buf_delete(output_buf, { force = true })
        end
        vim.notify("Autorun stopped")
    end
end, {})
