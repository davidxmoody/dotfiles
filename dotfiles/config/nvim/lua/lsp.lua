-- Global LSP capabilities (for nvim-cmp integration)
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Enable language servers
vim.lsp.enable({ "ts_ls", "svelte", "eslint", "lua_ls", "pyright" })

-- Svelte-specific: notify on TS/JS file changes
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "svelte" then
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.js", "*.ts" },
        callback = function(ctx)
          client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
        end,
      })
    end
  end,
})

-- Diagnostic display configuration
vim.diagnostic.config({ float = { border = "single", source = true } })
