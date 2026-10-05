return {
  {
    "wojciech-kulik/xcodebuild.nvim",

    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },

    opts = {
      show_build_progress_bar = false,

      logs = {
        auto_open_on_success_tests = false,
        auto_open_on_failed_tests = false,
        auto_open_on_success_build = false,
        auto_open_on_failed_build = false,
        auto_focus = false,
        auto_close_on_app_launch = true,
        only_summary = true,
      },

      code_coverage = {
        enabled = true,
      },
    },

    keys = {
      { "<leader>X", "<cmd>XcodebuildPicker<cr>", desc = "Show Xcodebuild Actions" },
      { "<leader>xf", "<cmd>XcodebuildProjectManager<cr>", desc = "Show Project Manager Actions" },

      { "<leader>xb", "<cmd>XcodebuildBuild<cr>", desc = "Build Project" },
      { "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", desc = "Build For Testing" },
      { "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", desc = "Build & Run Project" },

      { "<leader>xt", "<cmd>XcodebuildTest<cr>", desc = "Run Tests" },
      {
        "<leader>xt",
        "<cmd>XcodebuildTestSelected<cr>",
        mode = "v",
        desc = "Run Selected Tests",
      },
      { "<leader>xT", "<cmd>XcodebuildTestClass<cr>", desc = "Run This Test Class" },

      { "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", desc = "Toggle Xcodebuild Logs" },
      { "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", desc = "Toggle Code Coverage" },
      {
        "<leader>xC",
        "<cmd>XcodebuildShowCodeCoverageReport<cr>",
        desc = "Show Code Coverage Report",
      },
      { "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", desc = "Toggle Test Explorer" },
      { "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", desc = "Show Failing Snapshots" },

      { "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", desc = "Select Device" },
      { "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", desc = "Select Test Plan" },
      { "<leader>xq", "<cmd>Telescope quickfix<cr>", desc = "Show QuickFix List" },

      { "<leader>xx", "<cmd>XcodebuildQuickfixLine<cr>", desc = "Quickfix Line" },
      { "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", desc = "Show Code Actions" },
    },
  },
}
