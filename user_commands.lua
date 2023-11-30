local ns = vim.api.nvim_create_namespace('MyNamespace')

vim.api.nvim_create_user_command('Lukas', function ()
  vim.notify('bybis', vim.log.levels.WARN)
end, {})


local function execute_curl()
    local url = "http://example.com"  -- Replace with your URL
    local curl_format = "-s -w '\\nStatus Code: %{http_code}\\nTotal Time: %{time_total} seconds\\n'"
    local cmd = "curl " .. curl_format .. " " .. url

    local function on_event(job_id, data, event)
        if event == "stdout" or event == "stderr" then
            for _, line in ipairs(data) do
                if line ~= "" then
                    vim.notify(line)
                end
            end
        end
    end
    
    vim.notify('Perfoming Curl')

    vim.fn.jobstart(cmd, {
        on_stdout = on_event,
        on_stderr = on_event,
        stdout_buffered = true,
        stderr_buffered = true,
    })
end

vim.api.nvim_create_user_command('DCurl', execute_curl, {})
