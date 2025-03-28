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

  return 0
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
  local current_line = ''

  for word in string.gmatch(str, '%S+') do
    -- If adding this word would exceed max_width
    if #current_line + #word + 1 > max_width then
      -- Add the current line to our results
      table.insert(lines, current_line)
      current_line = word
    else
      -- Add word to the current line with a space if needed
      if current_line ~= '' then
        current_line = current_line .. ' ' .. word
      else
        current_line = word
      end
    end
  end

  -- Don't forget the last line
  if current_line ~= '' then
    table.insert(lines, current_line)
  end

  return lines
end

---@param diagnostic vim.Diagnostic
local function virtual_lines_format(diagnostic)
  -- Only render hints on the current line
  -- Note this MUST be paired with an autocmd that hides/shows diagnostics to force a re-render
  if diagnostic.severity == vim.diagnostic.severity.HINT and diagnostic.lnum + 1 ~= vim.fn.line '.' then
    return nil
  end

  local message = diagnostic.message

  local win = buf_to_win(diagnostic.bufnr)
  local sign_column_width = vim.fn.getwininfo(win)[1].textoff
  local text_area_width = vim.api.nvim_win_get_width(win) - sign_column_width
  local center_width = 5
  local left_width = 1

  local max_width = text_area_width - diagnostic.col - center_width - left_width
  return table.concat(split_line(message, max_width), '\n')
end

vim.diagnostic.config { virtual_lines = { format = virtual_lines_format }, severity_sort = { reverse = false } }

-- Show virtual lines for hints when the cursor is on that line

local last_line = vim.fn.line '.'
-- Show virtual lines for hints when the cursor is on that line
local last_line_was_hint = false

vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
  callback = function()
    local current_line = vim.fn.line '.'

    -- Check if the cursor has moved to a different line
    if current_line ~= last_line then
      -- Get all diagnostics on the current line
      local diagnostics = vim.diagnostic.get(0, { lnum = current_line - 1 })

      -- filter for hints
      local hints = {}
      for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.severity == vim.diagnostic.severity.HINT then
          table.insert(hints, diagnostic)
        end
      end

      if #hints > 0 then
        last_line_was_hint = true
        vim.diagnostic.hide()
        vim.diagnostic.show()
      elseif last_line_was_hint then
        last_line_was_hint = false
        vim.diagnostic.hide()
        vim.diagnostic.show()
      end

      -- Update the last_line variable
      last_line = current_line
    end
  end,
})

-- Re-render diagnostics when the window is resized

vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    vim.diagnostic.hide()
    vim.diagnostic.show()
  end,
})
