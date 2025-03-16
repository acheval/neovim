local api = vim.api -- api calls

--  filetypes
api.nvim_create_augroup("specialFiletypes", {})

api.nvim_create_autocmd({
  "BufRead",
  "BufNewFile"
}, {
    group = "specialFiletypes",
    pattern = {
      "*.txt",
      "*.md"
    },
    command = "set filetype=pandoc",
    desc = "set FileType as Pandoc"
})

