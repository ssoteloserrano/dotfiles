return {
    "atiladefreitas/dooing",
    config = function()
        require("dooing").setup({
          window = {
              width = 55,
              height = 20,
              border = 'rounded',
              padding = {
                  top = 1,
                  bottom = 5,
                  left = 2,
                  right = 2,
              },
          },
        })
    end,
}
