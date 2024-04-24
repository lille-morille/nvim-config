local M = {}

M.setup = function()
  require("obsidian").setup({
    workspaces = {
      {
        name = "personal vault",
        path = "/Users/mori/personal-vault"
      }
    },
    new_notes_location = "current_dir",
    wiki_link_func = function(opts)
      return string.format("[[%s]]", opts.path)
    end,
    completion = {
      nvim_cmp = true,

      -- Trigger complete at 2 chars
      min_chars = 2,
    },
    mappings = {},
  })
end

return M
