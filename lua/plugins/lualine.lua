local function xcodebuild_device()
  local platform = vim.g.xcodebuild_platform
  local device = vim.g.xcodebuild_device_name
  local os_version = vim.g.xcodebuild_os

  if platform == "macOS" then
    return " macOS"
  end

  if not device or device == "" then
    return ""
  end

  if os_version and os_version ~= "" then
    return " " .. device .. " (" .. os_version .. ")"
  end

  return " " .. device
end

return {
  {
    "nvim-lualine/lualine.nvim",

    opts = function(_, opts)
      local function xcodebuild_status()
        local status = vim.g.xcodebuild_last_status

        if not status or status == "" then
          return ""
        end

        return " " .. status
      end

      table.insert(opts.sections.lualine_x, 1, {
        xcodebuild_device,
        cond = function()
          return vim.bo.filetype == "swift"
        end,
      })

      table.insert(opts.sections.lualine_x, 1, {
        xcodebuild_status,
        cond = function()
          return vim.bo.filetype == "swift"
            and vim.g.xcodebuild_last_status ~= nil
            and vim.g.xcodebuild_last_status ~= ""
        end,
      })
    end,
  },
}
