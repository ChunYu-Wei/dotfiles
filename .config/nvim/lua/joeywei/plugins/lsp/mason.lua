-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  print("mason not found!")
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  print("mason_lspconfig not found")
  return
end

mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "clangd",
    "cmake",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})
