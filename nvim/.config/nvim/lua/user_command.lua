vim.api.nvim_create_user_command("Space", function(opts)
  local num = tonumber(opts.args)
  if type(num) == "number" then
    vim.opt.tabstop = num
    vim.opt.shiftwidth = num
    vim.opt.softtabstop = num

    print(":set ts=" .. num .. " sw=" .. num .. " sts=" .. num)
  end
end, { nargs = 1 })
