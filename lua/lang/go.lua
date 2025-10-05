return {
	dapDependency = "leoluz/nvim-dap-go",
	dapServer = function()
		-- Install golang specific config
		require("dap-go").setup({
			delve = {
				-- On Windows delve must be run attached or it crashes.
				-- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
				detached = vim.fn.has("win32") == 0,
			},
		})
	end,
	lspServer = {
		gopls = {}, -- TODO: Need to verify this
	},
}
