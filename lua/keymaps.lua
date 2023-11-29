local mapKey = function(mode, key, func, desc, opts)
  vim.keymap.set(mode, key, func, vim.tbl_extend("force", { desc = desc }, opts or {}))
end

local mapNKey = function(key, func, desc, opts)
  vim.keymap.set('n', key, func, vim.tbl_extend("force", { desc = desc }, opts or {}))
end

local mapLeader = function(mode, key, func, desc, opts)
  mapKey(mode, '<leader>' .. key, func, desc, opts)
end

local mapNLeader = function(key, func, desc, opts)
  mapLeader('n', key, func, desc, opts)
end

local teleBuiltin = require('telescope.builtin')

mapNLeader('?', teleBuiltin.oldfiles, '[?] Find recently opened files')
mapNLeader('<space>', teleBuiltin.buffers, '[ ] Find existing buffers')

vim.keymap.set('n', '<leader>b', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })
end, { desc = '[/] Fuzzily search in current buffer' })

mapNLeader('sgf', teleBuiltin.git_files, 'Search [G]it [F]iles')
mapNLeader('sgs', teleBuiltin.git_status, 'Search [G]it [S]status')

mapNLeader('sf', teleBuiltin.find_files, '[S]earch [F]iles')
mapNLeader('sh', teleBuiltin.help_tags, '[S]earch [H]elp')
mapNLeader('sw', teleBuiltin.grep_string, '[S]earch current [W]ord')
mapNLeader('sg', teleBuiltin.live_grep, '[S]earch by [G]rep')
mapNLeader('sd', teleBuiltin.diagnostics, '[S]earch [D]iagnostics')
mapNLeader('sr', teleBuiltin.resume, '[S]earch [R]esume')
mapNLeader('s', teleBuiltin.marks, '[S]earch [M]arks')

mapNLeader('sr', teleBuiltin.lsp_references, '[S]earch [R]eferences')
mapLeader({'n', 'x'},'cr', function() require('telescope').extensions.refactoring.refactors() end, '[C]ode [R]efactor') 

-- Harpoon config
local harpoonUi = require('harpoon.ui')
local harpoonMark = require('harpoon.mark')

mapNLeader('ha', harpoonMark.add_file, '[H]arpoon [A]dd')
mapNLeader('hn', harpoonUi.nav_next, '[H]arpoon [N]ext')
mapNLeader('hp', harpoonUi.nav_prev, '[H]arpoon [P]rev')
mapNLeader('hm', '<CMD>Telescope harpoon marks<CR>', '[H]arpoon [M]marks')
mapNLeader('hh', harpoonUi.toggle_quick_menu, '[S]earch [H]arpoon')

mapNKey('<M-q>', function() require('harpoon.ui').nav_file(1) end)
mapNKey('<M-w>', function() require('harpoon.ui').nav_file(2) end)
mapNKey('<M-e>', function() require('harpoon.ui').nav_file(3) end)
mapNKey('<M-r>', function() require('harpoon.ui').nav_file(4) end)
mapNKey('<M-t>', function() require('harpoon.ui').nav_file(5) end)
mapNKey('<M-y>', function() require('harpoon.ui').nav_file(6) end)
mapNKey('<M-u>', function() require('harpoon.ui').nav_file(7) end)
mapNKey('<M-i>', function() require('harpoon.ui').nav_file(8) end)
mapNKey('<M-o>', function() require('harpoon.ui').nav_file(9) end)

-- Diagnostic keymaps
local vDiag = vim.diagnostic

mapNKey('[d', vDiag.goto_prev, 'Go to previous diagnostic message')
mapNKey(']d', vDiag.goto_next, 'Go to next diagnostic message')
mapNLeader('e', vDiag.open_float, 'Open floating diagnostic message')
mapNLeader('q', vDiag.setloclist, 'Open diagnostics list')

-- Code keys

-- Mapping CTRL + Arrow keys for window navigation
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true })

-- Meme mappings
mapNLeader("fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Quickfix list keymaps
mapNLeader("qo", "<cmd>copen<CR>", '[Q]uickfix [O]pen')
mapNLeader("qc", "<cmd>ccl<CR>", '[Q]uickfix [C]lose')
mapNLeader("qn", "<cmd>cn<CR>", '[Q]uickfix [N]ext')
mapNLeader("qp", "<cmd>cp<CR>", '[Q]uickfix [P]rev')

-- Refactoring


-- Session
