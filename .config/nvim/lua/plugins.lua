local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "christoomey/vim-tmux-navigator",
  "ckipp01/stylua-nvim",
  "dag/vim-fish",
  "edkolev/tmuxline.vim",
  "elixir-lang/vim-elixir",
  "HerringtonDarkholme/yats.vim",
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  "justinmk/vim-sneak",
  "kshenoy/vim-signature",
  "mxw/vim-jsx",
  "pangloss/vim-javascript",
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      suppress_missing_scope = {
        projects_v2 = true,
      },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
  "rust-lang/rust.vim",
  "scrooloose/nerdtree",
  "sindrets/diffview.nvim",
  {
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
  },
  "tmux-plugins/vim-tmux-focus-events",
  {
    -- https://lazy.folke.io/spec/lazy_loading#-colorschemes
    "tomasr/molokai",
    lazy = false,
    priority = 1000,

    config = function(_, opts)
      vim.o.termguicolors = true

      vim.cmd([[colorscheme molokai]])
    end,
  },
  "tpope/vim-characterize",
  "tpope/vim-commentary",
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-obsession",
  "tpope/vim-rails",
  "tpope/vim-repeat",
  "tpope/vim-rhubarb",
  "tpope/vim-surround",
  "tpope/vim-vinegar",
  "tpope/vim-unimpaired",
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "vim-ruby/vim-ruby",
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("package-info").setup()
    end,
  },
  "wincent/terminus",

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",

  -- using a snippet engine seems to be necessary for some features to work
  -- with some LSP servers
  -- I encountered errors when using LSP with Rust
  -- https://github.com/hrsh7th/nvim-cmp/issues/373
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    "folke/trouble.nvim",
    opts = {},
    keys = {
      {
        "<leader>tx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>td",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>gS",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>gL",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
  },

  { "neovim/nvim-lspconfig" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
            ignore_current_buffer = true,
            sort_mru = true,
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "bash", "c", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "gitcommit" },
        -- Ruby seems to depend on Vim’s syntax highlighting for indent rules.
        -- https://github.com/nvim-lua/kickstart.nvim/blob/e2bfa0c66f474f7d8863a8bc05e3d5bdf704f7bf/init.lua#L810
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
})

-- my colorscheme does not define the following highlight groups
-- for that reason, they are explicitly defined here
--
-- the values for `fg` are the values for `Green`, `Orange` and `Magenta` in
-- the following palette:
-- https://github.com/polirritmico/monokai-nightasty.nvim/blob/58e2e28ebc9fff1fab9156f8b49efa14ffadc347/README.md?plain=1#L341-L348
vim.api.nvim_set_hl(0, "GitGutterAdd", { fg = "#a4e400", bg = "#232526" })
vim.api.nvim_set_hl(0, "GitGutterChange", { fg = "#ff9700", bg = "#232526" })
vim.api.nvim_set_hl(0, "GitGutterDelete", { fg = "#fc1a70", bg = "#232526" })

-- hide tilde characters at the bottom of the screen
-- https://github.com/neovim/neovim/issues/2067#issuecomment-1288199193
vim.o.fillchars = "eob: "

vim.api.nvim_set_keymap(
  "n",
  "<leader><leader>",
  [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fa",
  [[<cmd>lua vim.lsp.buf.code_action()<CR>]],
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
  "<leader>fh",
  [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fk",
  [[<cmd>lua require('telescope.builtin').keymaps()<CR>]],
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
  "<leader>fo",
  [[<cmd>lua require('telescope.builtin').vim_options()<CR>]],
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

vim.api.nvim_set_keymap("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dh", "<cmd>DiffviewFileHistory %<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dH", "<cmd>DiffviewFileHistory<CR>", { silent = true, noremap = true })

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

lspconfig.marksman.setup({
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

-- no lspconfig setup for tsserver as recommended by
-- https://github.com/pmizio/typescript-tools.nvim?tab=readme-ov-file#-installation
require("typescript-tools").setup({
  on_attach = on_attach,
  settings = {
    expose_as_code_action = "all",
  },
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
