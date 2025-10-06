return {
	dapDependency = "mfussenegger/nvim-dap-python",
	dapServer = function()
		require("dap-python").setup("~/pythonNvim/python.exe")
	end,
	dapEnsureInstalled = "debuggy",
	lspServer = {
		pyright = {},
	},
}
