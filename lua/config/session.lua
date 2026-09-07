local Path = require("plenary.path")
local config = require("session_manager.config")

require("session_manager").setup({
  sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),

  autoload_mode = config.AutoloadMode.Disabled,

  -- Don't show the current session when loading.
  load_include_current = false,

  -- Automatically save when leaving Neovim.
  autosave_last_session = true,

  -- Save the session when Vim exits.
  autosave_ignore_not_in_list = false,
})
