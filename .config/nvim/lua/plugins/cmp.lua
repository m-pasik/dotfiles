return {
    "hrsh7th/nvim-cmp",
    enabled = true,
    opts = function(_, opts)
        local cmp = require("cmp")
        opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" } }))
    end,
}
