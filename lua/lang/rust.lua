return {
	-- dapDependency = "mfussenegger/nvim-dap-python",
	-- dapServer = function()
	-- 	require("rust_analyzer").setup({})
	-- end,
	lspServer = {
		rust_analyzer = {

			cmd = { "rustup", "run", "rust_analyzer" },
		},
	},
}
