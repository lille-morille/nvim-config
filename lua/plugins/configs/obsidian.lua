return config = function()
  require("obsidian").setup({
  workspaces = {
    name = "personal vault",
    path = "/Users/mori/personal-vault/Utgifter.md"
  },
  completion = {
    nvim_cmp = true,

    -- Trigger complete at 2 chars
    min_chars = 2,

    -- * "current_dir" - put new notes in the same directory as the current buffer
    -- * "notes_subdir" - put new notes in the default notes subdirectory
    new_notes_location = "current_dir",

    -- Add the note id after completion, so docs are linked in obsidian
    prepend_note_id = true
  },
  mappings = {},
})
end
