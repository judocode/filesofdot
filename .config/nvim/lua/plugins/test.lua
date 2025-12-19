local function find_pkg_root(path)
  return vim.fs.dirname(vim.fs.find("package.json", { upward = true, path = path })[1])
end

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
    },
    opts = {
      discovery = { enabled = false },
      adapters = {
        ["neotest-jest"] = {
          cwd = function(path)
            return find_pkg_root(path)
          end,
          jestCommand = "npm test --",
          jest_test_discovery = false,
        },
      },
    },
    keys = {
      {
        "<leader>tr",
        function()
          local neotest = require("neotest")
          neotest.run.run()
          -- neotest.summary.open() -- show tree with running indicator
          vim.notify("Running nearest test", vim.log.levels.INFO)
        end,
        desc = "Run Nearest (Neotest)",
      },
    },
  },
}
