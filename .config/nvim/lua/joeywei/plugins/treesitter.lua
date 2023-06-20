-- import nvim-treesitter plugin safely
local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
  print("treesitter not found!")
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "json",
    "markdown",
    "markdown_inline",
    "bash",
    "lua",
    "vim",
    "gitignore",
    "git_config",
    "git_rebase",
    "gitcommit",
    "cpp",
    "regex",
  },
  -- auto install above language parsers
  auto_install = true,
})
