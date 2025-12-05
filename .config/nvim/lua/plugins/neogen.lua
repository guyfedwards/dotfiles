return {
  "danymat/neogen",
  opts = {},
  keys = {
    {
      "<leader>dd",
      function()
        require("neogen").generate()
      end,
      "n",
      noremap = true,
      silent = true,
      desc = "Generate annotations (neogen)",
    },
  },
}
