return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
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
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "S1M0N38/love2d.nvim",
        event = "VeryLazy",
        version = "2.*",
        opts = {},
        keys = {
            { "<leader>v",  ft = "lua",          desc = "LÖVE" },
            { "<leader>vv", "<cmd>LoveRun<cr>",  ft = "lua",   desc = "Run LÖVE" },
            { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua",   desc = "Stop LÖVE" },
        },
    }
}
