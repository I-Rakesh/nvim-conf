return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    -- stylua: ignore
    { "<leader>sf",  mode = "n", "<cmd>Telescope find_files<CR>",           desc = "Search files" },
    { "<leader>sw",  mode = "n", "<cmd>Telescope live_grep<CR>",            desc = "Search Word" },
    { "<leader>sb",  mode = "n", "<cmd>Telescope buffers<CR>",              desc = "Search Buffer" },
    { "<leader>st",  mode = "n", "<cmd>Telescope help_tags<CR>",            desc = "Search Help Tags" },
    { "<leader>sk",  mode = "n", "<cmd>Telescope keymaps<CR>",              desc = "Search Keymaps" },
    { "<leader>sg",  mode = "n", "<cmd>Telescope git_files<CR>",            desc = "Search Git" },
    { "<leader>ch",  mode = "n", "<cmd>Telescope colorscheme<CR>",          desc = "Change Color Scheme" },
    { "<leader>sdw", mode = "n", "<cmd>Telescope diagnostics<CR>",          desc = "Search Workspace Diagnostics" },
    { "<leader>sdb", mode = "n", "<cmd>Telescope diagnostics bufnr=0<CR>",  desc = "Search Diagnostics" },
    { "<leader>sr",  mode = "n", "<cmd>Telescope lsp_references<CR>",       desc = "Search References" },
    { "<leader>ss",  mode = "n", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Search Symbles" },
    { "<leader>sj",  mode = "n", "<cmd>Telescope jumplist<CR>",             desc = "Search Jumplist" },
    { "<leader>sm",  mode = "n", "<cmd>Telescope marks<CR>",                desc = "Search Marks" },
    { "<leader>so",  mode = "n", "<cmd>Telescope oldfiles<CR>",             desc = "Search Old Files" },
    { "<leader>s*",  mode = "n", "<cmd>Telescope grep_string<CR>",          desc = "Search Current Word" },
    { "<leader>s:",  mode = "n", "<cmd>Telescope command_history<CR>",      desc = "Search Command History" },
    { "<leader>sp",  mode = "n", "<cmd>Telescope resume<CR>",               desc = "Previous Search" },
    { "<leader>z",   mode = "n", "<cmd>Telescope spell_suggest<CR>",        desc = "Search Spell Suggestion's" },
    {
      "<leader>s/",
      mode = "n",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          previewer = false,
        }))
      end,
      desc = "Search Current Buffer",
    },
  },
  config = function()
    vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
    local actions = require("telescope.actions")
    local open_with_trouble = function(...)
      return require("trouble.providers.telescope").open_with_trouble(...)
    end
    local open_selected_with_trouble = function(...)
      return require("trouble.providers.telescope").open_selected_with_trouble(...)
    end
    require("telescope").setup({
      defaults = {
        mappings = {
          n = {
            ["<leader>q"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<leader>tse"] = open_selected_with_trouble,
            ["<leader>te"] = open_with_trouble,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules", ".class" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      },
    })
  end,
}
