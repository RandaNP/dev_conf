return {
  "chomosuke/typst-preview.nvim",
  -- Load the plugin when entering a typst buffer to ensure autocommands are active
  event = "BufEnter *.typ",

  config = function()
    -- Function to dynamically set TYPST_FONT_PATHS based on file location
    local function set_typst_font_paths()
      local path_of_main_file = vim.api.nvim_buf_get_name(0) -- Get current buffer's file path

      if path_of_main_file == "" or vim.bo["buftype"] ~= "" then
        -- Not a normal file buffer (e.g., [No Name], help buffer, etc.)
        vim.env.TYPST_FONT_PATHS = nil
        return
      end

      -- Try to find a file named template*.typ in the grandparent directory
      local grandparent_dir = vim.fn.fnamemodify(path_of_main_file, ":p:h:h")
      local templates_dir_path = grandparent_dir .. "/templates"

      if vim.fn.isdirectory(templates_dir_path) == 1 then
        -- Set TYPST_FONT_PATHS to the fonts directory relative to the grandparent
        vim.env.TYPST_FONT_PATHS = templates_dir_path .. "/fonts"
      else
        -- Clear TYPST_FONT_PATHS if no template file is found
        vim.env.TYPST_FONT_PATHS = nil
      end
    end

    -- Create an autocommand group to manage typst-preview related autocommands
    vim.api.nvim_create_augroup("TypstPreviewDynamicConfig", { clear = true })

    -- Autocommand to set TYPST_FONT_PATHS when entering a typst file
    vim.api.nvim_create_autocmd("BufEnter", {
      group = "TypstPreviewDynamicConfig",
      pattern = "*.typ",
      callback = set_typst_font_paths,
      desc = "Dynamically set TYPST_FONT_PATHS for typst files",
    })

    -- Autocommand to clear TYPST_FONT_PATHS when leaving a typst file
    vim.api.nvim_create_autocmd("BufLeave", {
      group = "TypstPreviewDynamicConfig",
      pattern = "*.typ",
      callback = function()
        vim.env.TYPST_FONT_PATHS = nil
      end,
      desc = "Clear TYPST_FONT_PATHS on leaving typst files",
    })

    require("typst-preview").setup({
      -- Setting this true will enable logging debug information to
      -- `vim.fn.stdpath 'data' .. '/typst-preview/log.txt'`
      debug = true,
      -- extra_args is now nil because font paths are handled by TYPST_FONT_PATHS env var
      extra_args = nil,

      -- This function will be called to determine the root of the typst project
      get_root = function(path_of_main_file)
        local root = os.getenv("TYPST_ROOT")
        if root then
          return root
        end

        -- Try to find a file named template*.typ in the grandparent directory
        local grandparent_dir = vim.fn.fnamemodify(path_of_main_file, ":p:h:h")
        local templates_dir_path = grandparent_dir .. "/templates"

        -- Check if the "templates" directory exists
        if vim.fn.isdirectory(templates_dir_path) == 1 then
          return grandparent_dir
        end

        -- Fallback: use the directory of the main file (parent directory)
        return vim.fn.fnamemodify(path_of_main_file, ":p:h")
      end,

      -- This function will be called to determine the main file of the typst
      -- project.
      get_main_file = function(path_of_buffer)
        return path_of_buffer
      end,
    })
  end,
}
