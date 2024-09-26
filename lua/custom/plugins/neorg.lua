return {
    "nvim-neorg/neorg",
    lazy = false, 
    version = "*",
    config =  function()
      require("neorg").setup({
          load = {
              ["core.defaults"] = {},
              ["core.concealer"] = {}, -- We added this line!
              ["core.dirman"] = {
                 config = {
                  workspaces = {
                  notes = "~/notes",
             },
            },
           },
          }
      })
    end
}
