-- Cursor line color
-- vim.cmd([[
--   augroup CursorLine
--     autocmd!
--     autocmd VimEnter,WinEnter,BufWinEnter * highlight CursorLine guibg=#393A3B
--   augroup END
-- ]])

local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
  print("Colorscheme not found!")
  return
end
