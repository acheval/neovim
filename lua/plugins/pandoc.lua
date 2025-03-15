return {
    {
        'vim-pandoc/vim-pandoc',
        config = function()
            local g = vim.g -- global variables
            local api = vim.api -- api calls

            -- disable pandoc conceal syntax
            g['pandoc#syntax#conceal#use'] = false 

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

            api.nvim_create_autocmd("FileType", {
                group = "spellSettings",
                pattern = "pandoc",
                command = "setlocal nospell",
                desc = "Disable spellSettings for pandoc FileType"
            })

            api.nvim_create_autocmd("FileType", {
                group = "specialFolds",
                pattern = "pandoc",
                command = "setlocal foldmethod=syntax wrap linebreak",
                desc = "Fold config for pandoc"
            })

        end,
    },
    {
        'vim-pandoc/vim-pandoc-syntax',
    }
}
