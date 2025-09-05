return {
    "ray-x/go.nvim",
    dependencies = { 
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
    },
    config = function(lp, opts)
        require("go").setup(opts)
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' 
}
