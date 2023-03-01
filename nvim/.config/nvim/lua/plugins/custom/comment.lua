-- "gc" to comment visual regions/line
return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}
