local M = {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	dependencies = { "Zeioth/mason-extra-cmds", opts = {} },
	cmd = {
		"Mason",
		"MasonLog",
		"MasonUpdate",
		"MasonUpdateAll",
	},
}

function M.config()
	require("mason").setup()

	local tools = {
		"basedpyright",
		"bash-language-server",
		"black",
		"chrome-debug-adapter",
		"clangd",
		"css-lsp",
		"debugpy",
		"delve",
		"dockerfile-language-server",
		"eslint-lsp",
		"firefox-debug-adapter",
		"gofumpt",
		"goimports",
		"golangci-lint-langserver",
		"gopls",
		"gotestsum",
		"html-lsp",
		"isort",
		"js-debug-adapter",
		"json-lsp",
		"lua-language-server",
		"node-debug2-adapter",
		"prettierd",
		"prisma-language-server",
		"ruff-lsp",
		"rust-analyzer",
		"shfmt",
		"sqlfluff",
		"stylelint-lsp",
		"stylua",
		-- "tailwindcss-language-server",
		"taplo",
		"texlab",
		"typescript-language-server",
		"yaml-language-server",
		"zls",
	}

	local function check()
		local mr = require("mason-registry")
		for _, tool in ipairs(tools) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end

	check()
end

return M
