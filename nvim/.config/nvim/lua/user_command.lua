local function copy_to_clipboard(text)
  for _, reg in ipairs({ "+", "*" }) do
    if vim.fn.has("clipboard") == 1 and pcall(vim.fn.setreg, reg, text) then
      return true
    end
  end
  return false
end

--- Copy the current buffer's file path to the system clipboard.
-- Usage: :CopyPath [absolute|relative]  (default: relative to cwd)
vim.api.nvim_create_user_command("CopyPath", function(opts)
  local name = vim.api.nvim_buf_get_name(0)
  if name == "" then
    vim.notify("CopyPath: current buffer has no file name", vim.log.levels.WARN)
    return
  end

  local mode = opts.args == "" and "relative" or opts.args
  local path
  if mode == "absolute" or mode == "abs" then
    path = vim.fn.fnamemodify(name, ":p")
  elseif mode == "relative" or mode == "rel" then
    path = vim.fn.fnamemodify(name, ":.")
  elseif mode == "filename" or mode == "name" then
    path = vim.fn.fnamemodify(name, ":t")
  else
    vim.notify("CopyPath: unknown mode '" .. mode .. "', use absolute or relative", vim.log.levels.ERROR)
    return
  end

  if copy_to_clipboard(path) then
    vim.notify("Copied: " .. path)
  else
    vim.notify("CopyPath: no clipboard provider available", vim.log.levels.ERROR)
  end
end, {
  nargs = "?",
  complete = function()
    return { "absolute", "relative", "filename" }
  end,
  desc = "Copy current file path to the clipboard (absolute|relative|filename)",
})

vim.api.nvim_create_user_command("Space", function(opts)
  local num = tonumber(opts.args)
  if type(num) == "number" then
    vim.opt.tabstop = num
    vim.opt.shiftwidth = num
    vim.opt.softtabstop = num

    print(":set ts=" .. num .. " sw=" .. num .. " sts=" .. num)
  end
end, { nargs = 1 })
