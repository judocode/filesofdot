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
      dap.listeners.after.event_initialized["dap_keymaps"] = function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          vim.api.nvim_buf_set_keymap(
            buf,
            "n",
            "c",
            "<Cmd>lua require'dap'.continue()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_buf_set_keymap(
            buf,
            "n",
            "n",
            "<Cmd>lua require'dap'.step_over()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_buf_set_keymap(
            buf,
            "n",
            "i",
            "<Cmd>lua require'dap'.step_into()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_buf_set_keymap(
            buf,
            "n",
            "o",
            "<Cmd>lua require'dap'.step_out()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_buf_set_keymap(
            buf,
            "n",
            "b",
            "<Cmd>lua require'dap'.toggle_breakpoint()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_buf_set_keymap(
            buf,
            "n",
            "p",
            "<Cmd>lua require'dap'.pause()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_buf_set_keymap(
            buf,
            "n",
            "q",
            "<Cmd>lua require'dap'.terminate()<CR>",
            { noremap = true, silent = true }
          )
        end
      end

      dap.listeners.after.event_terminated["dap_keymaps"] = function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          for _, key in ipairs({ "c", "n", "i", "o", "b", "p", "q" }) do
            pcall(vim.api.nvim_buf_del_keymap, buf, "n", key)
          end
        end
      end
    end,
  },
}
