-- import nvim-hop safely
local hop_status, hop = pcall(require, "hop")
if not hop_status then
  print("hop not found!")
  return
end

hop.setup({
    keys = 'etovxqpdygfblzhckisuran'
})
