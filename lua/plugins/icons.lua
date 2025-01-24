return {
  {
    "echascnovski/mini.icons",
    opts = {
      filetype = {
        astro = {
          glyph = "",
          hl = "MiniIconsYellow",
        },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
}
