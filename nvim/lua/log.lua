require 'io'
require 'os'
local au = require 'au'
au.BufWrite = function ()
  HOME = os.getenv('HOME')
  log = io.open(HOME .. '/vim.log', 'a')
  filename = vim.fn.expand('%')
  dirname = vim.fn.getcwd()
  io.output(log)
  io.write(dirname .. '/' .. filename .. ': ' .. os.date() .. '\n')
  io.close()
end
