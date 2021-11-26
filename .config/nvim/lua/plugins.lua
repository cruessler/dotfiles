-- https://github.com/nvim-lua/kickstart.nvim/blob/73d4b205be5711b681ef2df9d171b1c55040803b/init.lua
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end

  autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'cespare/vim-toml'
  use 'christoomey/vim-tmux-navigator'
  use 'dag/vim-fish'
  use 'edkolev/tmuxline.vim'
  use 'ElmCast/elm-vim'
  use 'elixir-lang/vim-elixir'
  use 'HerringtonDarkholme/yats.vim'
  use 'justinmk/vim-sneak'
  use 'kshenoy/vim-signature'
  use 'mattn/emmet-vim'
  use 'mxw/vim-jsx'
  use 'pangloss/vim-javascript'
  use 'rust-lang/rust.vim'
  use 'scrooloose/nerdtree'
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'tomasr/molokai'
  use 'tpope/vim-characterize'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-obsession'
  use 'tpope/vim-rails'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-unimpaired'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'vim-ruby/vim-ruby'
  use 'wincent/terminus'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  use { 'junegunn/fzf', run = './install --all' }
  use { 'junegunn/fzf.vim' }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { hl = 'GitGutterAdd', text = '+' },
          change = { hl = 'GitGutterChange', text = '~' },
          delete = { hl = 'GitGutterDelete', text = '_' },
          topdelete = { hl = 'GitGutterDelete', text = '‾' },
          changedelete = { hl = 'GitGutterChange', text = '~' },
        },
        keymaps = {
          ['n <c-n>'] = { expr = true, [[&diff ? ']c' : '<cmd>lua require"gitsigns.actions".next_hunk()<CR>']]},
          ['n <c-p>'] = { expr = true, [[&diff ? '[c' : '<cmd>lua require"gitsigns.actions".prev_hunk()<CR>']]},
          ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
          ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
          ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
          ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
          ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
          ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line({full=true})<CR>',
          ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
          ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

          ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
          ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
        }
      })
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end
  }

  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
end)

-- my colorscheme does not define the following highlight groups
-- for that reason, they are explicitly defined here
-- the values were obtained in a vim session that had loaded gitgutter
vim.api.nvim_exec(
  [[
  highlight GitGutterAdd ctermbg=235 guibg=#232526
  highlight GitGutterChange ctermfg=181 ctermbg=235 guifg=#89807D guibg=#232526
  highlight GitGutterDelete ctermfg=162 ctermbg=235 guifg=#960050 guibg=#232526
]],
  false)

vim.api.nvim_set_keymap('n', '<leader><leader>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').file_browser()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fm', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>L', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>tx', '<cmd>Trouble<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tw', '<cmd>Trouble lsp_workspace_diagnostics<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>td', '<cmd>Trouble lsp_document_diagnostics<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>Trouble loclist<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tq', '<cmd>Trouble quickfix<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'gR', '<cmd>Trouble lsp_references<CR>', { silent = true, noremap = true })

-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  -- see `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  buf_set_keymap('n', '<leader>j', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

  buf_set_keymap('n', '<leader>n', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>x', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  buf_set_keymap('n', '<leader>d', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]], opts)
  buf_set_keymap('n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  buf_set_keymap('n', '<leader>S', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]], opts)
end

-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.o.completeopt = 'menuone,noselect'

local lspconfig = require('lspconfig')

lspconfig.solargraph.setup({
  cmd = { 'bundle', 'exec', 'solargraph', 'stdio' },
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
  },
})
