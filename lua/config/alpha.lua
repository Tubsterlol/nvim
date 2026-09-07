local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
  " ████╗  ██║██║   ██║██║████╗ ████║",
  " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
  " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

dashboard.section.buttons.val = {
  dashboard.button("f", "󰱼  Find file", "<cmd>Telescope find_files<CR>"),
  dashboard.button("r", "󰋚  Recent files", "<cmd>oldfiles<CR>"),
  dashboard.button("s", "󰁯  Sessions", "<cmd>SessionManager load_session<CR>"),
  dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
}

alpha.setup(dashboard.config)
