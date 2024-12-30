return {
    "Exafunction/codeium.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    cmd = "Codeium",
    build = ":Codeium Auth",
    opts = {},
    config = function()
        require("codeium").setup({
            enable_chat = true,
        })
    end,
}
