return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },
    -- {
    --     'saghen/blink.cmp',
    --     dependencies = { { 'rafamadriz/friendly-snippets' }, { 'L3MON4D3/LuaSnip', version = 'v2.*' } },
    --     version = '1.*',
    --     ---@module 'blink.cmp'
    --     ---@type blink.cmp.Config
    --     opts = {
    --         snippets = { preset = 'luasnip' },
    --         sources = {
    --             providers = {
    --                 snippets = {
    --                     opt = {
    --                         extended_filetypes = {
    --                             sh = { 'shelldoc' },
    --                             templ = { 'html' },
    --                             typescriptreact = { 'html' }
    --                         },
    --                     }
    --                 },
    --             }
    --         },
    --         completion = { documentation = { auto_show = true } },
    --     },
    -- },
    {
        "hrsh7th/nvim-cmp",
        event = 'InsertEnter',
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            'hrsh7th/cmp-buffer',
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require('cmp')

            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            require("luasnip").filetype_extend("typescriptreact", { "html" })
            require("luasnip").filetype_extend("templ", { "html" })
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', keyword_length = 2 },
                    { name = 'buffer',  keyword_length = 3 },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    -- confirm completion item
                    ['<C-y>"'] = cmp.mapping.confirm({ select = true }),
                    -- navigate completion items
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    -- trigger completion menu
                    ['<C-c>'] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),

                    -- scroll up and down the documentation window
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),

                    ['<C-k>'] = cmp.mapping(function(fallback)
                        if cmp.visible_docs() then
                            cmp.close_docs()
                        elseif cmp.visible() then
                            cmp.open_docs()
                        else
                            fallback()
                        end
                    end),

                    -- jump to the next snippet placeholder
                    ['<C-f>'] = cmp.mapping(function(fallback)
                        local luasnip = require('luasnip')
                        if luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    -- jump to the previous snippet placeholder
                    ['<C-b>'] = cmp.mapping(function(fallback)
                        local luasnip = require('luasnip')
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            }
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ts_ls",
                    "rust_analyzer",
                    "gopls",
                    "pyright",
                    "ruff",
                    "lua_ls",
                    "templ",
                    "tailwindcss",
                    "html",
                    "zls",
                    "htmx",
                    "clangd",
                },
                automatic_enable = true
            })
        end
    } }
