-- https://github.com/nvim-lua/kickstart.nvim/blob/73d4b205be5711b681ef2df9d171b1c55040803b/init.lua
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]],
  false
)

-- https://www.chrisatmachine.com/Neovim-2/03-plugins/
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("christoomey/vim-tmux-navigator")
  use("ckipp01/stylua-nvim")
  use("dag/vim-fish")
  use("edkolev/tmuxline.vim")
  use("elixir-lang/vim-elixir")
  use("HerringtonDarkholme/yats.vim")
  use("justinmk/vim-sneak")
  use("kshenoy/vim-signature")
  use("mattn/emmet-vim")
  use("mxw/vim-jsx")
  use("pangloss/vim-javascript")
  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  })
  use("rust-lang/rust.vim")
  use("scrooloose/nerdtree")
  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          lua = { "stylua" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  })
  use("tmux-plugins/vim-tmux-focus-events")
  use("tomasr/molokai")
  use("tpope/vim-characterize")
  use("tpope/vim-commentary")
  use("tpope/vim-eunuch")
  use("tpope/vim-fugitive")
  use("tpope/vim-obsession")
  use("tpope/vim-rails")
  use("tpope/vim-repeat")
  use("tpope/vim-rhubarb")
  use("tpope/vim-surround")
  use("tpope/vim-vinegar")
  use("tpope/vim-unimpaired")
  use("vim-airline/vim-airline")
  use("vim-airline/vim-airline-themes")
  use("vim-ruby/vim-ruby")
  use({
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = function()
      require("package-info").setup()
    end,
  })
  use("wincent/terminus")

  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")

  -- using a snippet engine seems to be necessary for some features to work
  -- with some LSP servers
  -- I encountered errors when using LSP with Rust
  -- https://github.com/hrsh7th/nvim-cmp/issues/373
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  use({ "junegunn/fzf", run = "./install --all" })
  use({ "junegunn/fzf.vim" })

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function() end,
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end,
  })

  use({
    "williamboman/mason-lspconfig.nvim",
    requires = {
      { "williamboman/mason.nvim" },
    },
  })

  use({ "neovim/nvim-lspconfig" })
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-node-modules.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("node_modules")
      require("telescope").load_extension("ui-select")

      -- https://github.com/nvim-telescope/telescope.nvim/pull/828#issuecomment-895470109
      local actions = require("telescope.actions")
      require("telescope").setup({
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
            },
          },
        },
      })
    end,
  })

  use("jose-elias-alvarez/nvim-lsp-ts-utils")
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
  false
)

vim.api.nvim_set_keymap(
  "n",
  "<leader><leader>",
  [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fa",
  [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fc",
  [[<cmd>lua require('telescope.builtin').git_commits()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>FF",
  [[<cmd>lua require('telescope.builtin').find_files()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  [[<cmd>lua require('telescope.builtin').git_files()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fm",
  [[<cmd>lua require('telescope.builtin').git_status()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>d",
  [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>L",
  [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<leader>tx", "<cmd>Trouble<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>Trouble loclist<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tq", "<cmd>Trouble quickfix<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<CR>", { silent = true, noremap = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>ns",
  [[<cmd>lua require('package-info').show()<cr>]],
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>nu",
  [[<cmd>lua require('package-info').update()<cr>]],
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>nl", "<cmd>:Telescope node_modules list<cr>", { silent = true, noremap = true })

require("gitsigns").setup({
  signs = {
    add = { hl = "GitGutterAdd", text = "+" },
    change = { hl = "GitGutterChange", text = "~" },
    delete = { hl = "GitGutterDelete", text = "_" },
    topdelete = { hl = "GitGutterDelete", text = "‾" },
    changedelete = { hl = "GitGutterChange", text = "~" },
  },
  on_attach = function(bufnr)
    local gitsigns = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "<c-n>", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gitsigns.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "<c-p>", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gitsigns.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "<leader>hs", gitsigns.stage_hunk)
    map("v", "<leader>hs", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)
    map("n", "<leader>hu", gitsigns.undo_stage_hunk)
    map("n", "<leader>hr", gitsigns.reset_hunk)
    map("v", "<leader>hr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)
    map("n", "<leader>hR", gitsigns.reset_buffer)
    map("n", "<leader>hp", gitsigns.preview_hunk)
    map("n", "<leader>hb", function()
      gitsigns.blame_line({ full = true })
    end)
    map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
    -- `c` stands for context
    map("n", "<leader>tc", gitsigns.toggle_current_line_blame)
    map("n", "<leader>hS", gitsigns.stage_buffer)
    map("n", "<leader>hU", gitsigns.reset_buffer_index)
    map("n", "<leader>hd", gitsigns.diffthis)
    map("n", "<leader>hD", function()
      gitsigns.diffthis("~")
    end)
    map("n", "<leader>td", gitsigns.toggle_deleted)

    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
})

require("mason").setup()
require("mason-lspconfig").setup()

-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  -- see `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], opts)
  buf_set_keymap("n", "gt", [[<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>]], opts)
  buf_set_keymap("n", "gr", [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)
  buf_set_keymap("n", "gi", [[<cmd>lua require('telescope.builtin').lsp_implementations()<CR>]], opts)

  buf_set_keymap("n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

  buf_set_keymap("n", "<leader>n", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>x", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  buf_set_keymap("n", "<leader>s", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  -- 2023-04-08
  --
  -- changed `lsp_workspace_symbols` to `lsp_dynamic_workspace_symbols` because
  -- the former doesn’t work for this use case
  -- there is an issue with language servers that return an empty result for an
  -- empty search string
  --
  -- https://github.com/nvim-telescope/telescope.nvim/issues/964
  buf_set_keymap("n", "<leader>S", [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>]], opts)
end

-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.o.completeopt = "menuone,noselect"

local lspconfig = require("lspconfig")

lspconfig.elixirls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- `elm-language-server` will look for binaries that are installed locally in
-- `node_modules` or globally
-- https://github.com/elm-tooling/elm-language-server#server-settings
lspconfig.elmls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.solargraph.setup({
  cmd = { "bundle", "exec", "solargraph", "stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils
lspconfig.tsserver.setup({
  init_options = require("nvim-lsp-ts-utils").init_options,
  on_attach = function(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({
      enable_formatting = true,
      formatter = "prettier",
      formatter_config_fallback = nil,
    })
    ts_utils.setup_client(client)

    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})
