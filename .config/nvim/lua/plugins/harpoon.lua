return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {},
    config = function(_, opts)
      require("harpoon").setup(opts)
      local harpoon_mark = require("harpoon.mark")
      local harpoon_ui = require("harpoon.ui")
      vim.keymap.set(
        "n",
        "<leader>hp",
        harpoon_ui.nav_prev,
        { noremap = true, silent = true, desc = "Harpoon prev file" }
      )
      vim.keymap.set(
        "n",
        "<leader>hn",
        harpoon_ui.nav_next,
        { noremap = true, silent = true, desc = "Harpoon next file" }
      )
      vim.keymap.set(
        "n",
        "<leader>ha",
        harpoon_mark.add_file,
        { noremap = true, silent = true, desc = "Harpoon add file" }
      )
      vim.keymap.set(
        "n",
        "<leader>hm",
        harpoon_ui.toggle_quick_menu,
        { noremap = true, silent = true, desc = "Harpoon menu" }
      )
      vim.keymap.set("n", "<leader>h", function()
        local ch = vim.fn.getchar()
        local key = vim.fn.nr2char(ch)

        if key:match("%d") then
          vim.notify("navigate to file" .. key)
        else
          vim.notify("Not a number")
        end
      end, { silent = true })
      vim.keymap.set("n", "<C-1>", function()
        require("harpoon.ui").nav_file(1)
      end, { silent = true })
      vim.keymap.set("n", "<C-2>", function()
        require("harpoon.ui").nav_file(2)
      end, { silent = true })
      vim.keymap.set("n", "<C-3>", function()
        require("harpoon.ui").nav_file(3)
      end, { silent = true })
      vim.keymap.set("n", "<C-4>", function()
        require("harpoon.ui").nav_file(4)
      end, { silent = true })
    end,
  },
}
