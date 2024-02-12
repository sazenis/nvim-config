local function nmap(key, action, desc, opts)
    local options = { noremap = true, silent = true }
    if desc then
        options.desc = desc
    end
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set('n', key, action, options)
end

local which_register = require("which-key").register;

--- Telescope
local teleBuiltin = require('telescope.builtin')

nmap('<leader>?', teleBuiltin.oldfiles, '[?] Find recently opened files')
nmap('<leader><space>', teleBuiltin.buffers, '[ ] Find existing buffers')
nmap('<leader>b', teleBuiltin.current_buffer_fuzzy_find , '[/] Fuzzily search in current buffer')
nmap('<leader>sf', teleBuiltin.find_files, '[S]earch [F]iles')
nmap('<leader>sh', teleBuiltin.help_tags, '[S]earch [H]elp')
nmap('<leader>sw', teleBuiltin.grep_string, '[S]earch current [W]ord')
nmap('<leader>sg', teleBuiltin.live_grep, '[S]earch by [G]rep')
nmap('<leader>sd', teleBuiltin.diagnostics, '[S]earch [D]iagnostics')
nmap('<leader>sr', teleBuiltin.resume, '[S]earch [R]esume')
nmap('<leader>st', "<cmd>:lua require('telescope-tabs').list_tabs()<CR>", '[S]earch [Tabs]')
nmap('<leader>sr', teleBuiltin.lsp_references, '[S]earch [R]eferences')


-- Harpoon config
local harpoonUi = require('harpoon.ui')
local harpoonMark = require('harpoon.mark')

nmap('<leader>ha', harpoonMark.add_file, '[H]arpoon [A]dd')
nmap('<leader>hn', harpoonUi.nav_next, '[H]arpoon [N]ext')
nmap('<leader>hp', harpoonUi.nav_prev, '[H]arpoon [P]rev')
nmap('<leader>hm', '<CMD>Telescope harpoon marks<CR>', '[H]arpoon [M]marks')
nmap('<leader>hh', harpoonUi.toggle_quick_menu, '[S]earch [H]arpoon')

nmap('<M-q>', function() require('harpoon.ui').nav_file(1) end)
nmap('<M-w>', function() require('harpoon.ui').nav_file(2) end)
nmap('<M-e>', function() require('harpoon.ui').nav_file(3) end)
nmap('<M-r>', function() require('harpoon.ui').nav_file(4) end)
nmap('<M-t>', function() require('harpoon.ui').nav_file(5) end)
nmap('<M-y>', function() require('harpoon.ui').nav_file(6) end)
nmap('<M-u>', function() require('harpoon.ui').nav_file(7) end)
nmap('<M-i>', function() require('harpoon.ui').nav_file(8) end)
nmap('<M-o>', function() require('harpoon.ui').nav_file(9) end)

-- Diagnostic keymaps
local vDiag = vim.diagnostic

nmap('[d', vDiag.goto_prev, 'Go to previous diagnostic message')
nmap(']d', vDiag.goto_next, 'Go to next diagnostic message')
nmap('<leader>e', vDiag.open_float, 'Open floating diagnostic message')
nmap('<leader>q', vDiag.setloclist, 'Open diagnostics list')

-- Git keys
nmap('<leader>gf', teleBuiltin.git_files, '[G]it [F]iles')
nmap('<leader>gs', teleBuiltin.git_status, '[G]it [S]status')
nmap('<leader>gc', '<cmd>DiffviewClose<CR>', '[G]it DiffView [C]lose')
nmap('<leader>go', '<cmd>DiffviewOpen<CR>', '[G]it DiffView [O]pen')
nmap('<leader>gb', teleBuiltin.git_branches, '[G]it [B]branches')

-- Mapping CTRL + Arrow keys for window navigation
nmap('<C-Up>', '<C-w>k', { noremap = true })
nmap('<C-Down>', '<C-w>j', { noremap = true })
nmap('<C-Left>', '<C-w>h', { noremap = true })
nmap('<C-Right>', '<C-w>l', { noremap = true })

-- Meme mappings
nmap("<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Quickfix list keymaps
nmap("<leader>qo", "<cmd>copen<CR>", '[Q]uickfix [O]pen')
nmap("<leader>qc", "<cmd>ccl<CR>", '[Q]uickfix [C]lose')
nmap("<leader>qn", "<cmd>cn<CR>", '[Q]uickfix [N]ext')
nmap("<leader>qp", "<cmd>cp<CR>", '[Q]uickfix [P]rev')
nmap("<leader>-", "<cmd>Oil<CR>", 'Oil')
nmap("<leader>-f", "<cmd>Oil --float<CR>", 'Oil floating')

-- T keymaps 
nmap("<leader>tr", ":lua require('neotest').run.run()<CR>", "[T]est run")
nmap("<leader>ts", ":lua require('neotest').summary.toggle()<CR>", "[T]est [S]ummary toggle")
nmap("<leader>tc", "<cmd>Coverage<CR>", "[T]est [C]overage")
nmap("<leader>tt", "<cmd>CoverageToggle<CR>", "[T]est [T]oggle")

nmap("<leader>nt", "<cmd>tabnew<CR>", "[T]ab [N]ew ")
nmap("<leader>nt", "<cmd>tabclose<CR>", "[T]ab [C]lose ")


-- Which key
which_register{
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>n'] = { name = '[N]ew', _ = 'which_key_ignore' },
  ['<leader>sc'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]est/[T]ab', _ = 'which_key_ignore' },
}
