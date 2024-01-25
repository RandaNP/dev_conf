return function (use)
  use {
    'nvim-tree/nvim-tree.lua',
    after = 'nvim-web-devicons',
    requires = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
    --tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- close buffers without messing split
  use 'famiu/bufdelete.nvim'

  -- bufferline
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
end
