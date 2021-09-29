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

-- Colorscheme
vim.opt.termguicolors = true
vim.opt.background = 'dark'
-- vim.g.gruvbox_material_disable_italic_comment = true
-- vim.cmd('colorscheme gruvbox-material')

vim.g.everforest_background = 'hard'
vim.g.everforest_disable_italic_comment = true
vim.cmd('colorscheme everforest')

-- Splits open at the bottom and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Live substitution
vim.opt.inccommand = 'nosplit'

-- Lazy redraw to improve performance
vim.opt.lazyredraw = true

-- Scroll offset
vim.opt.so = 15

-- Highlight current cursor in buffer
vim.opt.cul = true
vim.opt.cursorcolumn = true
vim.cmd(
[[
    augroup Cul
        highlight CursorColumn guibg=#505050 guifg=fg
        autocmd!
        autocmd WinEnter * set cul
        autocmd WinEnter * set cursorcolumn
        autocmd WinLeave * set nocul
        autocmd WinLeave * set nocursorcolumn
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

-- Fold settings
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldtext =
    [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
vim.wo.fillchars = "fold: "
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1
