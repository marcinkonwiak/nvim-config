local lsp = 'basedpyright' -- "pyright"

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'ninja', 'python', 'rst', 'toml' })
      end
    end,
  },
  {
    'linux-cultist/venv-selector.nvim',
    cmd = 'VenvSelect',
    opts = function(_, opts)
      return vim.tbl_deep_extend('force', opts, {
        name = {
          'venv',
          '.venv',
          'env',
          '.env',
        },
      })
    end,
    keys = { { '<leader>cv', '<cmd>:VenvSelect<cr>', desc = 'Select VirtualEnv' } },
  },
}
