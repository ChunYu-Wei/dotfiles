-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  print("lualine not found!")
  return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme
local new_colors = {
  grey = "D5D8DC",
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

-- change nightlfy theme colors
lualine_nightfly.normal = {
  a = {
    gui = "bold",
    bg = new_colors.blue,
    fg = new_colors.black, -- black
  },
}
lualine_nightfly.insert = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}
lualine_nightfly.visual = {
  a = {
    gui = "bold",
    bg = new_colors.violet ,
    fg = new_colors.black, -- black
  },
}
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = new_colors.grey,
    fg = new_colors.black, -- black
  },
}

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_nightfly,
  },
})
