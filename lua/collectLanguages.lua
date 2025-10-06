local f = vim.api.nvim_get_runtime_file("lua/languages.lua", false)
local langSetting = {
	dapDependency = {},
	dapEnsureInstalled = {},
	dapServerSetups = {},
	lspServers = {},
}
if f[1] == nil then
	print("Missing optional languages file.")
else
	OptLang = require("languages")

	for keyTable, langTable in pairs(OptLang) do
		for keyLang, lang in pairs(langTable) do
			-- print(keyLang)
			if lang.dapDependency then
				table.insert(langSetting.dapDependency, lang.dapDependency)
			end
			if lang.dapEnsureInstalled then
				table.insert(langSetting.dapEnsureInstalled, lang.dapEnsureInstalled)
			end
			if lang.dapServer then
				table.insert(langSetting.dapServerSetups, lang.dapServer)
			end

			if lang.lspServer then
				-- print("dddd")
				for keyLsp, lsp in pairs(lang.lspServer) do
					-- vim.print(lsp)
					langSetting.lspServers[keyLsp] = lsp
					break
				end
			end
		end
	end
end
-- vim.print(langSetting)
return langSetting
