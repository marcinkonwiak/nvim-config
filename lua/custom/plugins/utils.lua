return {

  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  -- library used by other plugins
  { 'nvim-lua/plenary.nvim', lazy = true },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = function()
      local logo = [[
                                       ,--.           
        ,--,--,  ,---.  ,---.,--.  ,--.`--',--,--,--. 
        |      \| .-. :| .-. |\  `'  / ,--.|        | 
        |  ||  |\   --.' '-' ' \    /  |  ||  |  |  | 
        `--''--' `----' `---'   `--'   `--'`--`--`--' 
                                                      
      ]]

      logo = string.rep('\n', 3) .. logo .. '\n\n'

      local opts = {
        config = {
          header = vim.split(logo, '\n'),
        },
      }

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          pattern = 'DashboardLoaded',
          callback = function()
            require('lazy').show()
          end,
        })
      end

      return opts
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
