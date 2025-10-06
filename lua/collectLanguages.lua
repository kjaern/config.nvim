local langSetting = {
	dapDependency = {},
	dapEnsureInstalled = {},
	dapServerSetups = {},
	lspServers = {},
}

local f = vim.api.nvim_get_runtime_file("lua/languages.lua", false)

if f[1] == nil then
	print("Missing optional languages file.")
else
	local optLang = require("languages")

	for keyTable, langTable in pairs(optLang) do
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
				for keyLsp, lsp in pairs(lang.lspServer) do
					langSetting.lspServers[keyLsp] = lsp
					break
				end
			end
		end
	end
end
-- vim.print(langSetting)
return langSetting
