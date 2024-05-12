local M = {}

M.setup = function()
  -- " Viewer options: One may configure the viewer either by specifying a built-in
  -- " viewer method:
  vim.g.vimtex_view_method = 'zathura'
  vim.g.vimtex_context_pdf_viewer = "zathura"
  vim.g.tex_flavor = "latex"

  vim.g.vimtex_compiler_latexmk = {
    options = {
      '-pdf',
      '-shell-escape',
      '-verbose',
      '-file-line-error',
      '-synctex=1',
      '-interaction=nonstopmode',
    },
  }

  -- " Most VimTeX mappings rely on localleader and this can be changed with the
  -- " following line. The default is usually fine and is the symbol "".
  vim.g.maplocalleader = " "
end

return M
