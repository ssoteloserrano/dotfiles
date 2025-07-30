return {
	cmd = {
		"pylsp",
	},
	filetypes = {
		"python",
	},
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		".git",
	},
	settings = {
		pylsp = {
			plugins = {
				-- Intenté activar desde aquí los formatters, typecheck y ordenamiento
				-- de imports (isort), pero no funciona. Por lo tanto lo delego en
				-- terceros (conform.nvim, none-ls)
				--
				-- linter options
				pyflakes = { enabled = true },
				pycodestyle = { enabled = false },
				pylint = { enabled = false }, -- extremadamente verboso
				-- formatter options
				black = { enabled = false },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				-- type checker
				pylsp_mypy = { enabled = false },
				-- auto-completion options
				jedi_completion = { fuzzy = false },
				-- import sorting
				pyls_isort = { enabled = false },
			},
		},
	},
}
