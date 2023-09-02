local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", function()
    mark.add_file()
    ui.toggle_quick_menu()
end)

vim.keymap.set("n", "<leader>hr", function()
    mark.rm_file()
    ui.toggle_quick_menu()
end)

vim.keymap.set("n", "<leader>hc", function()
    mark.clear_all()
    ui.toggle_quick_menu()
end)

vim.keymap.set("n", "<leader>hm", function()
    ui.toggle_quick_menu()
end)
