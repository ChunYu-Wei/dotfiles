-- import null-ls plugin safely
local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
  print("null_ls not found!")
  return
end

null_ls.setup({
    -- setup formatters & linters
    sources = {
        null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.diagnosics.cppcheck,
    },
    -- configure format on save
    on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
