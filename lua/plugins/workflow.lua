require("overseer").setup()

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local map = vim.keymap.set

map("n", "<leader>oo", "<Cmd>OverseerToggle<CR>", { silent = true, desc = "Toggle task panel" })
map("n", "<leader>or", "<Cmd>OverseerRun<CR>", { silent = true, desc = "Run task" })
map("n", "<leader>oc", "<Cmd>OverseerClose<CR>", { silent = true, desc = "Close task panel" })

map("n", "<leader>dc", dap.continue, { silent = true, desc = "Continue debugging" })
map("n", "<leader>db", dap.toggle_breakpoint, { silent = true, desc = "Toggle breakpoint" })
map("n", "<leader>dn", dap.step_over, { silent = true, desc = "Step over" })
map("n", "<leader>di", dap.step_into, { silent = true, desc = "Step into" })
map("n", "<leader>do", dap.step_out, { silent = true, desc = "Step out" })
map("n", "<leader>dx", dap.terminate, { silent = true, desc = "Terminate debugging" })
map("n", "<leader>du", dapui.toggle, { silent = true, desc = "Toggle debug UI" })
