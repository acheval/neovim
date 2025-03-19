local api = vim.api -- api calls

--  filetypes
api.nvim_create_augroup("specialFiletypes", {})

api.nvim_create_autocmd({
  "BufRead",
  "BufNewFile"
}, {
    group = "specialFiletypes",
    pattern = {
      "*.yml",
      "*.yaml"
    },
    command = "set filetype=yaml.ansible",
    desc = "set filetype for ansible files"
})

api.nvim_create_autocmd({
  "BufRead",
  "BufNewFile"
}, {
    group = "specialFiletypes",
    pattern = {
      "*.gitlab-ci*.{yml,yaml}",
      "*.pre-commit-config*.{yml,yaml}"
    },
    command = "set filetype=yaml.gitlab",
    desc = "set filetype for gitlab files"
})

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

api.nvim_create_autocmd({
  "BufRead",
  "BufNewFile"
}, {
    group = "specialFiletypes",
    pattern = {
      "*.tf",
      "*.tfvars"
    },
    command = "set filetype=tf",
    desc = "set FileType as terraform"
})

api.nvim_create_autocmd({
  "BufRead",
  "BufNewFile"
}, {
    group = "specialFiletypes",
    pattern = {
      "*.tfstate"
    },
    command = "set filetype=json",
    desc = "set FileType as json"
})
