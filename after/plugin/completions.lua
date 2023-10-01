local cmp = require("cmp")
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local tabout = require('tabout')

require("luasnip.loaders.from_vscode").lazy_load()
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function (fallback)
          if luasnip.expandable() then
            luasnip.expand()
          elseif cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif vim.api.nvim_get_mode().mode == 'i' then
            tabout.tabout()
          else
            fallback()
          end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function (fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {'i', 's'})
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),
    formatting = {
     format = lspkind.cmp_format({
       maxwidth = 50,
       ellipsis_char = "...",
     }),
   },
   window = {
     completion = cmp.config.window.bordered(),
     documentation = cmp.config.window.bordered(),
   },
})

vim.cmd("highlight Pmenu guibg=NONE")
