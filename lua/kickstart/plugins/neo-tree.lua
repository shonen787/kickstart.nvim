-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },

  lazy = false,
  keys = {
    { '<C-n>', ':Neotree filesystem reveal left<CR>', mode = 'n', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    event_handlers = {
      {
        event = 'file_opened',
        handler = function()
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
      --      {
      --        event = 'neo_tree_buffer_enter',
      --        handler = function()
      --          vim.cmd 'hightlight! Cursor blend=100'
      --        end,
      --      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<CR>'] = 'open_tabnew',
        },
      },
    },
  },
}
