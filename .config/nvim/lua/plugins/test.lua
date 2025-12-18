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
      adapters = {
        ["neotest-jest"] = {
          cwd = function(path)
            return find_pkg_root(path)
          end,
          jestCommand = "npm test --",
        },
      },
    },
  },
}
