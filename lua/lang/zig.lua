return {
	dapDependency = "ziglang/zig.vim",
	dapServer = function()
		require("dap-zig").setup()
	end,
	lspServer = {
		-- pyright = {},
	},
}
