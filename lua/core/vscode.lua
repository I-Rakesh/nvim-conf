if not vim.g.vscode then
	return {}
end

local enabled = {
	"flash.nvim",
	"Comment.nvim",
	"nvim-treesitter",
	"nvim-treesitter-textobjects",
	"nvim-ts-context-commentstring",
	"nvim-treesitter-refactor",
	"vim-repeat",
	"vim-surround",
	"LazyVim",
  "telescope.nvim",
}

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	defaults = {
		cond = function(plugin)
			return vim.tbl_contains(enabled, plugin.name)
		end,
	},
	checker = {
		enabled = false, -- automatically check for plugin updates
	},
	change_detection = {
		enabled = false,
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimKeymaps",
	callback = function()
		vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
		vim.keymap.set("n", "<leader>/", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
		vim.keymap.set("n", "<leader>ss", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])
	end,
})
