if Iswindows then
	local function foo()
		vim.api.nvim_command(
			"e "
				.. "C:\\Users\\Kenneth\\AppData\\Local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json"
		)
	end
	vim.api.nvim_create_user_command("OpenTerminalSettings", foo, { nargs = 0, desc = "foo" })
end
