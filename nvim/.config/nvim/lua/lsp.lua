vim.opt.signcolumn = 'yes'
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warning,
            [vim.diagnostic.severity.INFO] = signs.Information,
            [vim.diagnostic.severity.HINT] = signs.Hint,
        },
    },
})
-- vim.lsp.config("*", {
--     capabilities = {
--         require('blink.cmp').get_lsp_capabilities()
--         -- require('cmp_nvim_lsp').default_capabilities()
--     }
-- })
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local nmap = function(mode, keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
        end
        nmap("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        nmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("i", "<C-h>", vim.lsp.buf.signature_help, "Signature Documentation")
    end,
})
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})
vim.lsp.config("pyright", {
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                typeCheckingMode = "strict",
            },
        },
    },
})
vim.lsp.config("ruff", {
    on_attach = function(client, _)
        if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
        end
    end,
})

-- vim.lsp.config("tailwindcss", {
--     filetypes = {
--         "templ",
--         "typescriptreact",
--         "javascriptreact",
--         "javascript",
--         "typescript",
--         "react",
--     },
--     init_options = { userLanguages = { templ = "html" } },
-- })
vim.lsp.config("html", {
    filetypes = { "html", "templ" }
})
vim.lsp.config("htmx", {
    filetypes = { "html", "templ" },
})
vim.lsp.config("bashls", {
    filetypes = { "sh", "zsh" },
})
