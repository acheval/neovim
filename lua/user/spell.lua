local api = vim.api -- api calls

api.nvim_create_autocmd({
    "FileType"
}, {
    desc = "Disable spellSettings",
    group = "spellSettings",
    pattern = {
        "pandoc"
    },
    command = "setlocal nospell",
})
