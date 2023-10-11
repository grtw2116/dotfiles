-- drawer オプションでサイドバー形式にする
-- toggle オプションでサイドバー開閉をトグルにする
vim.keymap.set(
    "n",
    "<C-n>",
    ":Fern . -drawer -toggle<CR>"
)
