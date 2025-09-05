return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    keys = {
        {
            "<leader>me",
            "<CMD>RenderMarkdown<CR>",
            mode = "n",
            desc = "RednderMarkdown - Enable Render"
        },
        {
            "<leader>md",
            "<CMD>RenderMarkdown disable<CR>",
            mode = "n",
            desc = "RednderMarkdown - Disable Render"
        }
    },
    opts = {
    },
}
