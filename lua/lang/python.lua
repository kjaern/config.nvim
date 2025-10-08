return {
	dapDependency = "mfussenegger/nvim-dap-python",
	dapServer = function()
		local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
		if is_windows then
			require("dap-python").setup("~/pythonNvim/python.exe")
		else
			require("dap-python").setup("~/.config/pythonNvim/bin/python")
		end
	end,
	dapEnsureInstalled = "debuggy",
	lspServer = {
		pyright = {},
	},
}
