local options = {
  ensure_installed = { "lua", "javascript", "tsx", "typescript", "rust", "css", "markdown", "java" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
    disable = { "dart" }
  },
}

return options
