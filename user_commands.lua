local ns = vim.api.nvim_create_namespace('MyNamespace')

vim.api.nvim_create_user_command('Lukas', function ()
  vim.notify('bybis', vim.log.levels.WARN)
end, {})
