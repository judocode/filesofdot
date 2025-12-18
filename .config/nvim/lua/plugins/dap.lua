return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }

      dap.configurations.typescript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest (neotest)",
          cwd = vim.fn.getcwd(),
          runtimeExecutable = "node",
          runtimeArgs = {
            "./node_modules/.bin/jest",
            "--runInBand",
          },
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
      }

      dap.configurations.javascript = dap.configurations.typescript
    end,
  },
}
