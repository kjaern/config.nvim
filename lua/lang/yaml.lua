return {
	lspServer = {
		yamlls = {
			-- other configuration for setup {}
			settings = {
				yaml = {
					-- other settings. note this overrides the lspconfig defaults.
					schemas = {
						["https://json.schemastore.org/bamboo-spec.json"] = "bamboo-specs/*",
						["https://raw.githubusercontent.com/compose-spec/compose-go/master/schema/compose-spec.json"] = "docker-compose.yml",
					},
				},
			},
		},
	},
}
