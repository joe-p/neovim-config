if vim.g.vscode then
  return
end

-- Uses CursorModed when true, else CursorHold.
-- CursorHold introduces minor delay in updating virtual_text (i.e. hidden/visible)
local opt_high_performance_mode = false
-- Add severity symbols to start of virtual_line output.
local opt_add_symbols = true

-- Latest version of diagnostic symbols (updated on CursorHold)
local current_signs

local function update_signs()
	current_signs = vim.diagnostic.config().signs or {}
	local function confirm_sign(expected_key, value_to_set)
		if current_signs.text[expected_key] == nil then
			current_signs.text[expected_key] = "(" .. value_to_set .. ")"
		end
	end
	confirm_sign(vim.diagnostic.severity.HINT, "H")
	confirm_sign(vim.diagnostic.severity.INFO, "I")
	confirm_sign(vim.diagnostic.severity.WARN, "W")
	confirm_sign(vim.diagnostic.severity.ERROR, "E")
end

update_signs() -- init values

-- Get the window id for a buffer
-- @param bufnr integer
local function buf_to_win(bufnr)
	local current_win = vim.fn.win_getid()

	-- Check if current window has the buffer
	if vim.fn.winbufnr(current_win) == bufnr then
		return current_win
	end

	-- Otherwise, find a visible window with this buffer
	local win_ids = vim.fn.win_findbuf(bufnr)
	local current_tabpage = vim.fn.tabpagenr()

	for _, win_id in ipairs(win_ids) do
		if vim.fn.win_id2tabwin(win_id)[1] == current_tabpage then
			return win_id
		end
	end

	return current_win
end

-- Split a string into multiple lines, each no longer than max_width
-- The split will only occur on spaces to preserve readability
-- @param str string
-- @param max_width integer
local function split_line(str, max_width)
	if #str <= max_width then
		return { str }
	end

	local lines = {}
	local current_line = ""

	for word in string.gmatch(str, "%S+") do
		-- If adding this word would exceed max_width
		if #current_line + #word + 1 > max_width then
			-- Add the current line to our results
			table.insert(lines, current_line)
			current_line = word
		else
			-- Add word to the current line with a space if needed
			if current_line ~= "" then
				current_line = current_line .. " " .. word
			else
				current_line = word
			end
		end
	end

	-- Don't forget the last line
	if current_line ~= "" then
		table.insert(lines, current_line)
	end

	return lines
end

---@param diagnostic vim.Diagnostic
local function virtual_lines_format(diagnostic)
	local win = buf_to_win(diagnostic.bufnr)
	local sign_column_width = vim.fn.getwininfo(win)[1].textoff
	local text_area_width = vim.api.nvim_win_get_width(win) - sign_column_width
	local center_width = 5
	local left_width = 1

	---@type string[]
	local lines = {}
	for msg_line in diagnostic.message:gmatch("([^\n]+)") do
		local max_width = text_area_width - diagnostic.col - center_width - left_width
		local prefix = ""
		if opt_add_symbols then
			local symbol = current_signs.text[diagnostic.severity]
			if symbol ~= nil then
				prefix = symbol .. " "
			end
		end

		vim.list_extend(lines, split_line(prefix .. msg_line, max_width))
	end

	return table.concat(lines, "\n")
end

-- Don't show virtual text on current line since we'll show virtual_lines
---@param diagnostic vim.Diagnostic
local function virtual_text_format(diagnostic)
	if vim.fn.line(".") == diagnostic.lnum + 1 then
		return nil
	end
	return diagnostic.message
end

vim.diagnostic.config({
	virtual_text = { format = virtual_text_format },
	virtual_lines = { format = virtual_lines_format, current_line = true },
	severity_sort = { reverse = false },
})

-- Update signs in case they have changed
vim.api.nvim_create_autocmd("CursorHold", {
	callback = update_signs,
})

-- Re-draw diagnostics once navigation has ended, or on navigation if in
-- high performance mode

local last_line = -1

local auto_events = "CursorHold"
if opt_high_performance_mode then
	auto_events = "CursorMoved"
end

vim.api.nvim_create_autocmd(auto_events, {
	callback = function()
		local current_line = vim.fn.line(".")

		if current_line ~= last_line then
			vim.diagnostic.show()
			last_line = current_line
		end
	end,
})

-- Re-render diagnostics when the window is resized

vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.diagnostic.hide()
		vim.diagnostic.show()
	end,
})
