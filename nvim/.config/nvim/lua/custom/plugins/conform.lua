return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>fc",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = function()
        -- Helper function to check if an ESLint config exists in the project
        local function has_eslint_config(bufnr)
            local eslint_files = {
                ".eslintrc",
                ".eslintrc.js",
                ".eslintrc.cjs",
                ".eslintrc.yaml",
                ".eslintrc.yml",
                ".eslintrc.json",
                "eslint.config.js",
                "eslint.config.mjs",
                "eslint.config.cjs",
                "eslint.config.ts",
                "eslint.config.mts",
                "eslint.config.cts",
            }

            -- Search upwards from the current file's directory
            local path = vim.api.nvim_buf_get_name(bufnr)
            local root = vim.fs.find(eslint_files, { path = path, upward = true })

            return #root > 0
        end
        return {
            formatters_by_ft = {
                lua = { "stylua" },
                python = function(bufnr)
                    if require("conform").get_formatter_info("ruff_format", bufnr).available then
                        return { "ruff_format" }
                    else
                        return { "black" }
                    end
                end,
                javascript = function(bufnr)
                    if has_eslint_config(bufnr) then return { "eslint_d" } else return { "prettierd" } end
                end,
                typescript = function(bufnr)
                    if has_eslint_config(bufnr) then return { "eslint_d" } else return { "prettierd" } end
                end,
                javascriptreact = function(bufnr)
                    if has_eslint_config(bufnr) then return { "eslint_d" } else return { "prettierd" } end
                end,
                typescriptreact = function(bufnr)
                    if has_eslint_config(bufnr) then return { "eslint_d" } else return { "prettierd" } end
                end,
                svelte = { "prettierd" },
                css = { "prettierd" },
                json = { "prettierd" },
                html = { "prettierd" },
                markdown = { "prettierd" },
                templ = { "templ" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                kdl = { "kdlfmt" }
            },
            formatters = {
                shfmt = {
                    prepend_args = { "-i", "2" },
                },
            },
        }
    end,
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
