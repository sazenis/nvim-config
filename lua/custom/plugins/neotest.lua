return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest"
  },
  config = function()
    require('neotest').setup({
      discovery = {
        enabled = false
      },
      adapters = {
        require('neotest-jest')({
          jestCommand = "npm run test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      }
    })
  end
}
