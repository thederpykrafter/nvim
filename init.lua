vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.schedule(function() vim.o.clipboard = "unnamedplus" end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = "│ ", trail = "·", nbsp = "␣" }
vim.opt.fillchars = { eob = " " }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.expandtab = false
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.breakindent = true

--- KEYMAPS ---
-- Todo-comments
vim.keymap.set(
	"n",
	"<leader>st",
	"<cmd>TodoTelescope<cr>",
	{ desc = "[S]earch [T]odo Telescope" }
)
vim.keymap.set(
	"n",
	"<leader>sl",
	"<cmd>TodoLocList<cr>",
	{ desc = "[S]earch Todo [L]ocList" }
)

-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Oil" })
-- open config with Oil
vim.keymap.set(
	"n",
	"<leader>c",
	"<cmd> Oil ~/.config/nvim<cr>",
	{ desc = "Oil - NeoVim Config" }
)

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set(
	"n",
	"<leader>de",
	vim.diagnostic.open_float,
	{ desc = "Show [D]iagnostic [E]rror messages" }
)
vim.keymap.set(
	"n",
	"<leader>dq",
	vim.diagnostic.setloclist,
	{ desc = "Open diagnostic [Q]uickfix list" }
)

-- NOTE: This won't work in all terminal emulators/tmux/etc.
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set(
	"t",
	"<Esc><Esc>",
	"<C-\\><C-n>",
	{ desc = "Exit terminal mode" }
)

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set(
	"n",
	"<C-h>",
	"<C-w><C-h>",
	{ desc = "Move focus to the left window" }
)
vim.keymap.set(
	"n",
	"<C-l>",
	"<C-w><C-l>",
	{ desc = "Move focus to the right window" }
)
vim.keymap.set(
	"n",
	"<C-j>",
	"<C-w><C-j>",
	{ desc = "Move focus to the lower window" }
)
vim.keymap.set(
	"n",
	"<C-k>",
	"<C-w><C-k>",
	{ desc = "Move focus to the upper window" }
)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup(
		"kickstart-highlight-yank",
		{ clear = true }
	),
	callback = function() vim.highlight.on_yank() end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	}
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- See `:help gitsigns` to understand what the configuration keys do
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup()
			require("which-key").add({
				{ "g", group = "[G]o to " },
				{ "g_", hidden = true },
				{ "z", group = "[Z] Folds" },
				{ "z_", hidden = true },
				{ "s", group = "[S]urrounds" },
				{ "s_", hidden = true },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>g_", hidden = true },
				{ "<leader>C", group = "[C]ode" },
				{ "<leader>C_", hidden = true },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>d_", hidden = true },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>r_", hidden = true },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>s_", hidden = true },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>w_", hidden = true },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>t_", hidden = true },
				{ "<leader>h", group = "Git [H]unk" },
				{ "<leader>h_", hidden = true },
			}, { mode = "n" })
			-- visual mode
			require("which-key").add({
				{ "<leader>h", group = "Git [H]unk" },
				{ "<leader>h_", hidden = true },
			}, { mode = "v" })
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function() return vim.fn.executable "make" == 1 end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{
				"nvim-tree/nvim-web-devicons",
				enabled = vim.g.have_nerd_font,
			},
		},
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			}
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require "telescope.builtin"
			vim.keymap.set(
				"n",
				"<leader>sh",
				builtin.help_tags,
				{ desc = "[S]earch [H]elp" }
			)
			vim.keymap.set(
				"n",
				"<leader>sk",
				builtin.keymaps,
				{ desc = "[S]earch [K]eymaps" }
			)
			vim.keymap.set(
				"n",
				"<leader>sf",
				builtin.find_files,
				{ desc = "[S]earch [F]iles" }
			)
			vim.keymap.set(
				"n",
				"<leader>ss",
				builtin.builtin,
				{ desc = "[S]earch [S]elect Telescope" }
			)
			vim.keymap.set(
				"n",
				"<leader>sw",
				builtin.grep_string,
				{ desc = "[S]earch current [W]ord" }
			)
			vim.keymap.set(
				"n",
				"<leader>sg",
				builtin.live_grep,
				{ desc = "[S]earch by [G]rep" }
			)
			vim.keymap.set(
				"n",
				"<leader>sd",
				builtin.diagnostics,
				{ desc = "[S]earch [D]iagnostics" }
			)
			vim.keymap.set(
				"n",
				"<leader>sr",
				builtin.resume,
				{ desc = "[S]earch [R]esume" }
			)
			vim.keymap.set(
				"n",
				"<leader>s.",
				builtin.oldfiles,
				{ desc = '[S]earch Recent Files ("." for repeat)' }
			)
			vim.keymap.set(
				"n",
				"<leader><leader>",
				builtin.buffers,
				{ desc = "[ ] Find existing buffers" }
			)

			vim.keymap.set(
				"n",
				"<leader>/",
				function()
					builtin.current_buffer_fuzzy_find(
						require("telescope.themes").get_dropdown {
							winblend = 10,
							previewer = false,
						}
					)
				end,
				{ desc = "[/] Fuzzily search in current buffer" }
			)

			vim.keymap.set(
				"n",
				"<leader>s/",
				function()
					builtin.live_grep {
						grep_open_files = true,
						prompt_title = "Live Grep in Open Files",
					}
				end,
				{ desc = "[S]earch [/] in Open Files" }
			)

			vim.keymap.set(
				"n",
				"<leader>sn",
				function()
					builtin.find_files { cwd = vim.fn.stdpath "config" }
				end,
				{ desc = "[S]earch [N]eovim files" }
			)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup(
					"kickstart-lsp-attach",
					{ clear = true }
				),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set(
							"n",
							keys,
							func,
							{ buffer = event.buf, desc = "LSP: " .. desc }
						)
					end

					map(
						"gd",
						require("telescope.builtin").lsp_definitions,
						"[G]oto [D]efinition"
					)

					map(
						"gr",
						require("telescope.builtin").lsp_references,
						"[G]oto [R]eferences"
					)

					map(
						"gI",
						require("telescope.builtin").lsp_implementations,
						"[G]oto [I]mplementation"
					)

					map(
						"<leader>D",
						require("telescope.builtin").lsp_type_definitions,
						"Type [D]efinition"
					)

					map(
						"<leader>ds",
						require("telescope.builtin").lsp_document_symbols,
						"[D]ocument [S]ymbols"
					)

					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)

					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					map(
						"<leader>ca",
						vim.lsp.buf.code_action,
						"[C]ode [A]ction"
					)

					map("K", vim.lsp.buf.hover, "Hover Documentation")

					map(
						"gD",
						vim.lsp.buf.declaration,
						"[G]oto [D]eclaration"
					)

					local client =
						vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client.server_capabilities.documentHighlightProvider
					then
						local highlight_augroup = vim.api.nvim_create_augroup(
							"kickstart-lsp-highlight",
							{ clear = false }
						)
						vim.api.nvim_create_autocmd(
							{ "CursorHold", "CursorHoldI" },
							{
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.document_highlight,
							}
						)

						vim.api.nvim_create_autocmd(
							{ "CursorMoved", "CursorMovedI" },
							{
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.clear_references,
							}
						)

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup(
								"kickstart-lsp-detach",
								{ clear = true }
							),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds {
									group = "kickstart-lsp-highlight",
									buffer = event2.buf,
								}
							end,
						})
					end

					if
						client
						and client.server_capabilities.inlayHintProvider
						and vim.lsp.inlay_hint
					then
						map(
							"<leader>th",
							function()
								vim.lsp.inlay_hint.enable(
									not vim.lsp.inlay_hint.is_enabled()
								)
							end,
							"[T]oggle Inlay [H]ints"
						)
					end
				end,
			})

			local capabilities =
				vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend(
				"force",
				capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)

			local servers = {
				-- clangd = {},
				-- gopls = {},
				-- pyright = {},
				-- rust_analyzer = {},
				-- tsserver = {},

				lua_ls = {
					-- cmd = {...},
					-- filetypes = { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
				"zls",
				"pyright",
				"bash-language-server",
			})
			require("mason-tool-installer").setup {
				ensure_installed = ensure_installed,
			}

			require("mason-lspconfig").setup {
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend(
							"force",
							{},
							capabilities,
							server.capabilities or {}
						)
						require("lspconfig")[server_name].setup(server)
					end,
				},
			}
		end,
	},

	{
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format {
						async = true,
						lsp_fallback = true,
					}
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = true,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				zsh = { "beautysh" },
				bash = { "beautysh" },
				sh = { "beautysh" },
				-- python = { "isort", "black" },
				-- javascript = { { "prettierd", "prettier" } },
			},
			formatters = {
				stylua = {
					prepend_args = {
						"--config-path",
						"/home/thederpykrafter/.config/nvim/stylua.toml",
					},
				},
				beautysh = {
					prepend_args = { "-t", "-s", "fnpar" },
				},
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if
						vim.fn.has "win32" == 1
						or vim.fn.executable "make" == 0
					then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require "cmp"
			local luasnip = require "luasnip"
			luasnip.config.setup {}

			cmp.setup {
				snippet = {
					expand = function(args) luasnip.lsp_expand(args.body) end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert {
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm { select = true },
					["<CR>"] = cmp.mapping.confirm { select = true },
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<C-Space>"] = cmp.mapping.complete {},
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			}
		end,
	},

	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function() vim.cmd.colorscheme "bluloco" end,
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup { n_lines = 500 }

			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			local statusline = require "mini.statusline"
			statusline.setup { use_icons = vim.g.have_nerd_font }

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function() return "%2l:%-2v" end
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)

			vim.filetype.add {
				extension = {
					c3 = "c3",
					c3i = "c3",
					c3t = "c3",
					vert = "glsl",
					frag = "glsl",
				},
			}

			---@class parser_config . [inject-field]
			local parser_config =
				require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.c3 = {
				install_info = {
					url = "https://github.com/c3lang/tree-sitter-c3",
					files = { "src/parser.c", "src/scanner.c" },
					branch = "main",
				},
			}
		end,
	},

	require "kickstart.plugins.debug",
	require "kickstart.plugins.indent_line",
	require "kickstart.plugins.autopairs",
	require "kickstart.plugins.gitsigns", -- adds gitsigns recommend keymaps

	{ import = "custom.plugins" },
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
