local Utils = {}

-- Create a map of shorcut
function Utils.map(editorMode, customKeys, command, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(editorMode, customKeys, command, options)
end

-- Remove any extension of a file
function Utils.removeExtesion(str)
  local index = string.find(str, "%.")
  if index ~= nil then
    return string.sub(str, 1, index - 1)
  else
    return str
  end
end

-- List all contents of a dir
function Utils.scandir(dirname)
    local callit = os.tmpname()
    os.execute("ls -a1 " .. dirname .. " >" .. callit)
    local f = io.open(callit,"r")
    local rv = f:read("*al")
    f:close()
    os.remove(callit)
    local list = {}
    local from = 1
    local delim_from, delim_to = string.find(rv, "\n", from)
    while delim_from do
        table.insert(list, string.sub(rv, from, delim_from-1))
        from  = delim_to + 1
        delim_from, delim_to = string.find(rv, "\n", from)
    end
    for i = 1, 2, 1 do
        table.remove(list, 1)
    end
    return list
end

return Utils
