return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      -- Define the Python configuration
      dap.configurations.python = dap.configurations.python or {}
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Taipy: Launch debug.py",
        program = "${workspaceFolder}/debug.py",
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "python"
          end
        end,
        console = "integratedTerminal",
        cwd = "${workspaceFolder}",
        justMyCode = true,
      })
    end,
    keys = {
      -- LazyVim already defines many DAP keys, but we can add/override them here
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<F6>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<F7>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<F8>",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      --   { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate Session" },
    },
  },
}
