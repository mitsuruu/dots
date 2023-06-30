local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					'vim',
					'require'
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

