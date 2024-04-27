local M = {}

-- No need to copy this inside `setup()`. Will be used automatically.
-- Module mappings. Use `''` (empty string) to disable one.
M.mappings = {
  -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
  left = '<A-h>',
  right = '<A-l>',
  down = '<A-j>',
  up = '<A-k>',

  -- Move current line in Normal mode
  line_left = '<A-h>',
  line_right = '<A-l>',
  line_down = '<A-j>',
  line_up = '<A-k>',
}

-- Options which control moving behavior
M.options = {
  -- Automatically reindent selection during linewise vertical move
  reindent_linewise = true,
}

return M
