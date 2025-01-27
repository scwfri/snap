local _2afile_2a = "fnl/snap/producer/ripgrep/vimgrep.fnl"
local snap = require("snap")
local general = snap.get("producer.ripgrep.general")
local function _1_(request)
  local cwd = snap.sync(vim.fn.getcwd)
  return general(request, {args = {"--line-buffered", "-M", 100, "--vimgrep", request.filter}, cwd = cwd})
end
return _1_