return {
  "lervag/vimtex",
  config = function ()
    vim.cmd("filetype plugin indent on")
    vim.cmd("syntax enable")
    vim.g.vimtex_view_method = "zathura"

    vim.g.vimtex_view_general_viewer = "okular"
    vim.g.vimtex_compiler_method = "latexmk"
    -- vim.g.maplocalleader = ","
    vim.g.vimtex_compiler_latexmk = {
        executable = 'latexmk',
        options = {
            '-xelatex',
            '-file-line-error',
            '-synctex=1',
            '-interaction=nonstopmode',
        },
    }
    vim.g.vimtex_compiler_latexmk_engines = { ["_"] = "-pdf" }
    vim.g.vimtex_quickfix_open_on_warning = 0
  end
}
