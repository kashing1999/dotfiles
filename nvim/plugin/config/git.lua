local gitsigns = require('gitsigns')
-- local neogit = require('neogit')

-- gitsigns config
gitsigns.setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_index = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  keymaps = {},
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  diff_opts = {
    internal = false
  },
  yadm = {
    enable = false
  },
}

-- blame line
    vim.g.gitblame_enabled = 0

-- neogit
-- neogit.setup {
--   disable_signs = false,
--   disable_context_highlighting = false,
--   disable_commit_confirmation = false,
--   auto_refresh = true,
--   disable_builtin_notifications = false,
--   commit_popup = {
--       kind = "split",
--   },
--   -- customize displayed signs
--   signs = {
--     -- { CLOSED, OPENED }
--     section = { ">", "v" },
--     item = { ">", "v" },
--     hunk = { "", "" },
--   },
--   integrations = {
--     diffview = false
--   },
--   -- override/add mappings
--   mappings = {
--     -- modify status buffer mappings
--     status = {
--       -- Adds a mapping with "B" as key that does the "BranchPopup" command
--       ["B"] = "BranchPopup",
--       -- Removes the default mapping of "s"
--       ["s"] = "",
--     }
--   }
-- }
