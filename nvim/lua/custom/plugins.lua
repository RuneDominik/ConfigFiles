return function(use)
  use({
    "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup({})
      end
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
      config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
          sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.black,    -- hier :)
            null_ls.builtins.formatting.isort,    -- hier :)
            null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.completion.spell,
        },
      })
      end
  })
  
  use({ "honza/vim-snippets" })
end
