-- Relative numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Use mouse in all modes
vim.opt.mouse = 'a'

-- Set hidden
vim.opt.hidden = true

-- Tab conifg
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Splits open at the bottom and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Live substitution
vim.opt.inccommand = 'nosplit'

-- Lazy redraw to improve performance
vim.opt.lazyredraw = false

-- Scroll offset
vim.opt.so = 15

-- Show blank characters
vim.opt.list = false

vim.opt.listchars = {
    space = "⋅",
    eol = "↴",
}

vim.opt.termguicolors = true

-- Highlight current cursor in buffer
vim.opt.cul = true
vim.opt.colorcolumn = '99999'
vim.opt.cursorcolumn = true
vim.cmd(
[[
    augroup Cul
        autocmd!
        autocmd WinEnter * setl cul
        autocmd WinEnter * setl cursorcolumn
        autocmd WinLeave * setl nocul
        autocmd WinLeave * setl nocursorcolumn
    augroup END
]])

-- Disable unused builtins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- -- Fold settings
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.o.foldtext = [[
--     substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)'
-- ]]
-- vim.wo.fillchars = "fold: "
-- vim.wo.foldnestmax = 3
-- vim.wo.foldminlines = 1
