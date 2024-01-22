local ls = require('luasnip')
local s = ls.snippet;
local t = ls.text_node;
local i = ls.insert_node;
local f = ls.function_node;
local fmt = require('luasnip.extras.fmt').fmt;
local repl = require('luasnip.extras').rep;

vim.keymap.set({ "i", "s" }, "<A-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

ls.add_snippets("javascript", {
	s("asql", {
		t({ 'const { tablePrefix } = require("config/dbconfig");', '', ''}),
		t('const '), i(1), t(' = ('), i(2), t(') => `'),
		i(2),
		t({'`;', '', ''}),
		t({'module.exports = '}), repl(1), t(';')
	})
})

ls.add_snippets("javascript", {
	s("servicetestsql", {
		t({"const database_sf = require('../../database_sf');", '', ''}),
		t({"jest.mock('../../database_sf');", '', ''}),
		t('const '), i(1), t(' = ('), i(2), t(') => `'),
		i(2),
		t({'`;', '', ''}),
		t({'module.exports = '}), repl(1), t(';')
	})
})
