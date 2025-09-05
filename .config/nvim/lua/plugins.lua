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
  {
    "axkirillov/hbac.nvim",
    config = true,
  },
  "christoomey/vim-tmux-navigator",
  "edkolev/tmuxline.vim",
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  "justinmk/vim-sneak",
  "kshenoy/vim-signature",
  "mfussenegger/nvim-lint",
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
      },
      buffers = { show_unloaded = true },
    },
  },
  {
    {
      "antosha417/nvim-lsp-file-operations",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-neo-tree/neo-tree.nvim",
      },
      config = function()
        require("lsp-file-operations").setup()
      end,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
      },
    },
  },
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
  "rust-lang/rust.vim",
  "sindrets/diffview.nvim",
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          bash = { "shellcheck" },
          css = { "prettier" },
          elixir = { "mix" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          svelte = { "prettier" },
          lua = { "stylua" },
          sh = { "shellcheck" },
          zsh = { "shellcheck" },
        },
        format_on_save = {
          timeout_ms = 2000,
          lsp_fallback = true,
        },
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["u"] = "actions.parent",
          ["-"] = "actions.open_cwd",
        },
        view_options = {
          show_hidden = true,
        },
      })

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<space>-", require("oil").toggle_float, { desc = "Open parent directory in float" })
    end,
  },
  "tmux-plugins/vim-tmux-focus-events",
  {
    -- https://lazy.folke.io/spec/lazy_loading#-colorschemes
    "tomasr/molokai",
    lazy = false,
    priority = 1000,

    config = function()
      vim.o.termguicolors = true

      vim.cmd([[colorscheme molokai]])
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {},
  },
  "tpope/vim-abolish",
  "tpope/vim-characterize",
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-obsession",
  "tpope/vim-rails",
  "tpope/vim-repeat",
  "tpope/vim-rhubarb",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "vim-ruby/vim-ruby",
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    opts = {},
  },
  "wincent/terminus",

  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "enter" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        -- > By default, the buffer source will only show when the LSP source
        -- > is disabled or returns no items.
        --
        -- https://cmp.saghen.dev/configuration/sources.html#show-buffer-completions-with-lsp
        --
        -- there’s also a source for things on Github:
        --
        -- https://github.com/Kaiser-Yang/blink-cmp-git
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },

  -- using a snippet engine seems to be necessary for some features to work
  -- with some LSP servers
  -- I encountered errors when using LSP with Rust
  -- https://github.com/hrsh7th/nvim-cmp/issues/373
  "L3MON4D3/LuaSnip",

  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
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
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
    keys = {
      {
        "<c-q>",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete Buffer",
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
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-node-modules.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("live_grep_args")
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
      ensure_installed = { "bash", "c", "html", "lua", "luadoc", "markdown", "vim", "vimdoc", "diff" },
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

vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "#232526" })
vim.api.nvim_set_hl(0, "TroubleNormalNC", { bg = "#232526" })
vim.api.nvim_set_hl(0, "TroubleIndent", { bg = "#232526" })

-- hide tilde characters at the bottom of the screen
-- https://github.com/neovim/neovim/issues/2067#issuecomment-1288199193
vim.o.fillchars = "eob: "

vim.api.nvim_set_keymap("n", "<C-d>", "8j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "8k", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "ZA", "<cmd>qa<CR>", { noremap = true, silent = true })

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
  "<leader>fj",
  [[<cmd>lua require('telescope.builtin').jumplist()<CR>]],
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
vim.api.nvim_set_keymap("n", "<leader>ft", [[<cmd>TodoTelescope<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>d",
  [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>l",
  [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]],
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

-- https://gpanders.com/blog/whats-new-in-neovim-0.10/#lsp-inlay-hints
vim.api.nvim_set_keymap(
  "n",
  "<leader>gh",
  [[<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>]],
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>nb",
  [[<cmd>Neotree buffers position=float reveal<cr>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>nf",
  [[<cmd>Neotree position=float reveal<cr>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ns",
  [[<cmd>Neotree git_status position=float reveal<cr>]],
  { noremap = true, silent = true }
)

require("gitsigns").setup({
  -- https://github.com/lewis6991/gitsigns.nvim/?tab=readme-ov-file#-keymaps
  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "<c-n>", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end)

    map("n", "<c-p>", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end)

    map("n", "<leader>hs", gitsigns.stage_hunk)
    map("n", "<leader>hr", gitsigns.reset_hunk)

    map("v", "<leader>hs", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)

    map("v", "<leader>hr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)

    map("n", "<leader>hS", gitsigns.stage_buffer)
    map("n", "<leader>hR", gitsigns.reset_buffer)
    map("n", "<leader>hp", gitsigns.preview_hunk)
    map("n", "<leader>hi", gitsigns.preview_hunk_inline)

    map("n", "<leader>hb", function()
      gitsigns.blame_line({ full = true })
    end)

    map("n", "<leader>hd", gitsigns.diffthis)

    map("n", "<leader>hD", function()
      gitsigns.diffthis("~")
    end)

    map("n", "<leader>hQ", function()
      gitsigns.setqflist("all")
    end)
    map("n", "<leader>hq", gitsigns.setqflist)

    map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
    -- `c` stands for context
    map("n", "<leader>tc", gitsigns.toggle_current_line_blame)
    map("n", "<leader>td", gitsigns.toggle_deleted)
    map("n", "<leader>tw", gitsigns.toggle_word_diff)

    map({ "o", "x" }, "ih", gitsigns.select_hunk)
  end,
})

require("mason").setup()
require("mason-lspconfig").setup({
  -- 2025-06-09
  -- the tailwind LSP server, on one of my machines, uses quite a lot of CPU,
  -- so I disabled it for the time being
  automatic_enable = { exclude = { "tailwindcss" } },
})

-- see `:help LspAttach` and `:help lsp-attach`
-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#configuration
local callback = function(event)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(event.buf, ...)
  end

  local opts = { noremap = true, silent = true }

  -- see `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover({border='rounded'})<CR>", opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], opts)
  buf_set_keymap("n", "gt", [[<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>]], opts)
  buf_set_keymap("n", "gr", [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)
  buf_set_keymap("n", "gi", [[<cmd>lua require('telescope.builtin').lsp_implementations()<CR>]], opts)

  buf_set_keymap("n", "<leader>j", "<cmd>lua vim.diagnostic.jump({count=1, float=true})<CR>", opts)
  buf_set_keymap("n", "<leader>k", "<cmd>lua vim.diagnostic.jump({count=-1, float=true})<CR>", opts)

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

vim.o.completeopt = "menuone,noselect"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = callback,
})

vim.lsp.config("ts_ls", {
  settings = {
    typescript = {
      tsserver = {
        useSyntaxServer = false,
      },
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})

require("lint").linters_by_ft = {
  rust = { "clippy" },
  javascript = { "eslint" },
  typescript = { "eslint" },
  javascriptreact = { "eslint" },
  typescriptreact = { "eslint" },
  -- 2025-09-05
  -- `eslint` can be used to lint `*.svelte` files if `eslint-plugin-svelte` is
  -- available
  -- https://svelte.dev/docs/cli/eslint
  svelte = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
