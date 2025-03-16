local api = vim.api -- api calls

api.nvim_create_augroup("specialFolds", {})

api.nvim_create_autocmd({
  "FileType"
}, {
    desc = "set foldmethod syntax",
    group = "specialFolds",
    pattern = {
      "git",
      "lua",
      "diff",
      "markdown",
      "pandoc"
    },
    command = "setlocal foldmethod=syntax wrap linebreak"
})

api.nvim_create_autocmd({
  "FileType"
}, {
    desc = "set foldmethod indent",
    group = "specialFolds",
    pattern = {
      "yaml.ansible"
    },
    command = "setlocal foldmethod=indent wrap linebreak"
})
