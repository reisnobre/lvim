local M = {}

local custom_actions = require("user.telescope.custom-actions")

local _, builtin = pcall(require, "telescope.builtin")
local _, finders = pcall(require, "telescope.finders")
local _, pickers = pcall(require, "telescope.pickers")
local _, sorters = pcall(require, "telescope.sorters")
local _, themes = pcall(require, "telescope.themes")

function M.grep_string_v2(opts)
	opts = opts or M.theme()

	local search_string = vim.fn.execute("history search")
	local search_list = vim.split(search_string, "\n")
	local results = {}
	for i = #search_list, 3, -1 do
		local item = search_list[i]
		local _, finish = string.find(item, "%d+ +")
		if not vim.tbl_contains(results, string.sub(item, finish + 1)) then
			table.insert(results, string.sub(item, finish + 1))
		end
	end

	pickers.new(opts, {
		prompt_title = "Search",
		finder = finders.new_table(results),
		sorter = sorters.fuzzy_with_index_bias,
		attach_mappings = function(_, map)
			map("i", "<C-y>", custom_actions.import_entry)
			map("n", "<C-y>", custom_actions.import_entry)
			map("i", "<C-space>", custom_actions.import_entry)
			map("n", "<C-space>", custom_actions.import_entry)
			map("i", "<CR>", custom_actions.fuzzy_filter_results)
			map("n", "<CR>", custom_actions.fuzzy_filter_results)
			return true
		end,
	}):find()
end

function M.fuzzy_grep_string(query)
	query = query or {}
	builtin.grep_string(themes.get_ivy({
		prompt_title = "Fuzzy grep string, initial query: " .. query,
		search = query,
	}))
end

function M.live_grep_v2(opts)
	opts = opts or {}
	builtin.live_grep(vim.tbl_deep_extend("force", {
		prompt_title = "Search",
		attach_mappings = function(_, map)
			map("i", "<C-g>", custom_actions.fuzzy_filter_results)
			map("n", "<C-g>", custom_actions.fuzzy_filter_results)
			return true
		end,
	}, opts))
end

function M.grep_dotfiles()
	M.live_grep_v2({
		search_dirs = { vim.fn.stdpath("config"), os.getenv("ZDOTDIR") },
		hidden = true,
	})
end

function M.find_dotfiles()
	local opts = themes.get_ivy({
		previewer = false,
		sorting_strategy = "ascending",
		layout_strategy = "bottom_pane",
		layout_config = {
			height = 15,
			width = 0.5,
		},
		prompt = ">> ",
		prompt_title = "~ dotfiles ~",
		cwd = "~",
		find_command = { "git", "dots", "ls-files" },
	})
	require("telescope.builtin").find_files(opts)
end

function M.find_runtime_files(opts)
	opts = opts or themes.get_ivy({})
	local runtimepath = vim.opt.runtimepath:get()
	local runtimedirs = {}

	for _, entry in ipairs(runtimepath) do
		vim.list_extend(runtimedirs, vim.fn.globpath(entry, "", 1, 1))
	end

	pickers.new(opts, {
		prompt_title = "select a runtime directory",
		layout_strategy = "flex",
		finder = finders.new_table(runtimedirs),
		sorter = sorters.get_generic_fuzzy_sorter(opts),
		attach_mappings = function(_, map)
			-- map("i", "<cr>", no_redraw_find_in_dir)
			map("i", "<cr>", custom_actions.find_in_dir)
			map("i", "<c-f>", custom_actions.find_in_dir)
			map("i", "<c-g>", custom_actions.grep_in_dir)
			return true
		end,
	}):find()
end

-- another file string search
function M.find_string()
  local opts = {
    border = true,
    previewer = false,
    shorten_path = false,
    layout_strategy = "flex",
    layout_config = {
      width = 0.9,
      height = 0.8,
      horizontal = { width = { padding = 0.15 } },
      vertical = { preview_height = 0.75 },
    },
    file_ignore_patterns = {
      "vendor/*",
      "node_modules",
      "%.jpg",
      "%.jpeg",
      "%.png",
      "%.svg",
      "%.otf",
      "%.ttf",
    },
  }
  builtin.live_grep(opts)
end

-- fince file browser using telescope instead of lir
function M.file_browser()
  local opts

  opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = {
      prompt_position = "top",
    },
    file_ignore_patterns = { "vendor/*" },

    attach_mappings = function(prompt_bufnr, map)
      local current_picker = action_state.get_current_picker(prompt_bufnr)

      local modify_cwd = function(new_cwd)
        current_picker.cwd = new_cwd
        current_picker:refresh(opts.new_finder(new_cwd), { reset_prompt = true })
      end

      map("i", "-", function()
        modify_cwd(current_picker.cwd .. "/..")
      end)

      map("i", "~", function()
        modify_cwd(vim.fn.expand "~")
      end)

      local modify_depth = function(mod)
        return function()
          opts.depth = opts.depth + mod

          local this_picker = action_state.get_current_picker(prompt_bufnr)
          this_picker:refresh(opts.new_finder(current_picker.cwd), { reset_prompt = true })
        end
      end

      map("i", "<M-=>", modify_depth(1))
      map("i", "<M-+>", modify_depth(-1))

      map("n", "yy", function()
        local entry = action_state.get_selected_entry()
        vim.fn.setreg("+", entry.value)
      end)

      return true
    end,
  }

  builtin.file_browser(opts)
end

-- show code actions in a fancy floating window
function M.code_actions()
  local opts = {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }
  builtin.lsp_code_actions(themes.get_dropdown(opts))
end

-- show refrences to this using language server
function M.lsp_references()
  local opts = {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
  builtin.lsp_references(opts)
end

-- show implementations of the current thingy using language server
function M.lsp_implementations()
  local opts = {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
  builtin.lsp_implementations(opts)
end

-- find files in the upper directory
function M.find_updir()
  local up_dir = vim.fn.getcwd():gsub("(.*)/.*$", "%1")
  local opts = {
    cwd = up_dir,
  }

  builtin.find_files(opts)
end

function M.grep_last_search(opts)
  opts = opts or {}

  -- \<getreg\>\C
  -- -> Subs out the search things
  local register = vim.fn.getreg("/"):gsub("\\<", ""):gsub("\\>", ""):gsub("\\C", "")

  opts.path_display = { "shorten" }
  opts.word_match = "-w"
  opts.search = register

  builtin.grep_string(opts)
end

function M.installed_plugins()
  builtin.find_files {
    cwd = join_paths(os.getenv "LUNARVIM_RUNTIME_DIR", "site", "pack", "packer"),
  }
end

function M.project_search()
  builtin.find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require("nvim_lsp.util").root_pattern ".git"(vim.fn.expand "%:p"),
  }
end

function M.curbuf()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }
  builtin.current_buffer_fuzzy_find(opts)
end

function M.git_status()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  -- Can change the git icons using this.
  -- opts.git_icons = {
  --   changed = "M"
  -- }

  builtin.git_status(opts)
end

function M.search_only_certain_files()
  builtin.find_files {
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input "Type: ",
    },
  }
end

function M.builtin()
  builtin.builtin()
end

function M.git_files()
  local path = vim.fn.expand "%:h"
  if path == "" then
    path = nil
  end

  local width = 0.35
  if path and string.find(path, "sourcegraph.*sourcegraph", 1, false) then
    width = 0.6
  end

  local opts = themes.get_dropdown {
    winblend = 5,
    previewer = false,
    shorten_path = false,
    cwd = path,
    layout_config = {
      width = width,
    },
  }

  opts.file_ignore_patterns = {
    "^[.]vale/",
  }
  builtin.git_files(opts)
end

return M
