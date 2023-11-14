
local mapKey = function(mode, key, func, desc, opts)
    vim.keymap.set(mode, key, func, vim.tbl_extend("force", {desc = desc}, opts or {}))
end

local mapNKey = function(key, func, desc, opts)
    vim.keymap.set('n', key, func, vim.tbl_extend("force", {desc = desc}, opts or {}))
end

local mapLeader = function (mode, key, func, desc, opts)
  mapKey(mode, '<leader>'..key, func, desc, opts)
end

local mapNLeader = function (key, func, desc, opts)
  mapLeader('n', key, func, desc, opts)
end

local teleBuiltin = require('telescope.builtin')

mapNLeader('?', teleBuiltin.oldfiles, '[?] Find recently opened files')
mapNLeader('<space>', teleBuiltin.buffers, '[ ] Find existing buffers')

vim.keymap.set('n', '<leader>b', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown{winblend = 10, previewer = false})
end, { desc = '[/] Fuzzily search in current buffer' })

mapNLeader('gf', teleBuiltin.git_files, 'Search [G]it [F]iles')
mapNLeader('sf', teleBuiltin.find_files, '[S]earch [F]iles')
mapNLeader('sh', teleBuiltin.help_tags, '[S]earch [H]elp')
mapNLeader('sw', teleBuiltin.grep_string, '[S]earch current [W]ord')
mapNLeader('sg', teleBuiltin.live_grep, '[S]earch by [G]rep')
mapNLeader('sd', teleBuiltin.diagnostics, '[S]earch [D]iagnostics')
mapNLeader('sr', teleBuiltin.resume, '[S]earch [R]esume')

-- Harpoon config
local harpoonUi = require('harpoon.ui')
local harpoonMark = require('harpoon.mark')
-- function mapNav(fileIdx)
--   harpoonUi.nav_file(fileIdx)
-- end

mapNLeader('ha', harpoonMark.add_file, '[H]arpoon [A]dd')
mapNLeader('hn', harpoonUi.nav_next, '[H]arpoon [N]ext')
mapNLeader('hp', harpoonUi.nav_prev, '[H]arpoon [P]rev')
mapNLeader('hm', '<CMD>Telescope harpoon marks<CR>', '[H]arpoon [M]marks')
mapNLeader('hh', harpoonUi.toggle_quick_menu, '[H]arpoon Quick Menu')

-- for i = 1, 9 do
--   mapNLeader(i, mapNav(i), 'Harpoon nav file: '..i)
-- end

mapNLeader('1', function() require('harpoon.ui').nav_file(1) end)
mapNLeader('2', function() require('harpoon.ui').nav_file(2) end)
mapNLeader('3', function() require('harpoon.ui').nav_file(3) end)
mapNLeader('4', function() require('harpoon.ui').nav_file(4) end)
mapNLeader('5', function() require('harpoon.ui').nav_file(5) end)
mapNLeader('6', function() require('harpoon.ui').nav_file(6) end)
mapNLeader('7', function() require('harpoon.ui').nav_file(7) end)
mapNLeader('8', function() require('harpoon.ui').nav_file(8) end)
mapNLeader('9', function() require('harpoon.ui').nav_file(9) end)

-- Diagnostic keymaps
local vDiag = vim.diagnostic

mapNKey('[d', vDiag.goto_prev, 'Go to previous diagnostic message')
mapNKey(']d', vDiag.goto_next, 'Go to next diagnostic message')
mapNLeader('e', vDiag.open_float, 'Open floating diagnostic message')
mapNLeader('q', vDiag.setloclist, 'Open diagnostics list')

-- Mapping CTRL + Arrow keys for window navigation
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', {noremap = true})

-- Meme mappings 
mapNLeader("fml", "<cmd>CellularAutomaton make_it_rain<CR>")
