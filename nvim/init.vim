if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'rktjmp/lush.nvim', { 'branch': 'main' }
Plug 'ellisonleao/gruvbox.nvim', { 'branch': 'main' }
Plug 'sainnhe/gruvbox-material'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'iCyMind/NeoSolarized'
Plug 'marko-cerovac/material.nvim', { 'branch': 'main' }
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'jremmen/vim-ripgrep'
Plug 'szw/vim-maximizer'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'hoob3rt/lualine.nvim'
Plug 'f-person/git-blame.nvim'
Plug 'numtostr/FTerm.nvim'

call plug#end()


let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Use mouse
    set mouse=a

" Relative number
    set number relativenumber
	" augroup numbertoggle
	"   autocmd!
	"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
	" augroup END

" Stop search highlight
	nnoremap <esc><esc> :nohl<return><esc>

" Don't put stuff deleted from c into buffer
    nnoremap c "_c

" GUI
    set guifont=Hack\ Nerd\ Font\ Mono:h12

"remap motion
    "nnoremap <silent> <PageUp>   <C-U>
    "nnoremap <silent> <PageDown> <C-D>


" Shortcutting split navigation, saving a keypress:
	nnoremap <leader>d <C-w>h
	nnoremap <leader>h <C-w>j
	nnoremap <leader>t <C-w>k
	nnoremap <leader>n <C-w>l

" Go to tab by number
    noremap <leader>1 1gt
    noremap <leader>2 2gt
    noremap <leader>3 3gt
    noremap <leader>4 4gt
    noremap <leader>5 5gt
    noremap <leader>6 6gt
    noremap <leader>7 7gt
    noremap <leader>8 8gt
    noremap <leader>9 9gt
    noremap <leader>0 :tablast<cr>

" Go to last active tab
    nnoremap <leader><Left>  :tabprevious<cr>
    nnoremap <leader><Right> :tabnext<cr>

" Resize window
    nnoremap <c-Left>  :vertical resize -5<cr>
    nnoremap <c-Down>  :resize +5<cr>
    nnoremap <c-Up>    :resize -5<cr>
    nnoremap <c-Right> :vertical resize +5<cr>

" Use ripgrep to search
    nnoremap <leader>r :Rg -i ./%<Left><Left><Left><Left><space>

" Maximizer
    nnoremap <leader>m :MaximizerToggle<cr>

" Faster saving:
    nnoremap <leader>q <esc>:q<return>
    nnoremap <leader>w <esc>:w!<return><esc>

" Copy a line to clipboard
    nnoremap <leader>y "+yy

" Find files using Telescope command-line sugar.
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" coq autocomplete
    let g:coq_settings = { 'auto_start': 'shut-up' }

" Reload nvim config
    nnoremap <leader>sv :source $MYVIMRC<cr>

" Map space to leader in normal mode:
    nmap <SPACE> <leader>

" Tabs:
	set tabstop=4       " The width of a TAB is set to 4.
	set shiftwidth=4    " Indents will have a width of 4
	set softtabstop=4   " Sets the number of columns for a TAB
	set expandtab       " Expand TABs to spaces

" Color:
    set termguicolors
	set background=dark

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e


    " let g:jellybeans_overrides = {
    " \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
    " \}
    " let g:jellybeans_overrides['background']['guibg'] = 'none'

	colorscheme gruvbox-material
	set t_Co=256

    if $TERM == 'st-256color'
        hi Normal guibg=NONE ctermbg=NONE
    elseif $TERM == 'screen-256color'
        hi Normal guibg=NONE ctermbg=NONE
    endif

" Neovide settings
    let g:neovide_refresh_rate=120
    let g:neovide_no_idle=v:true

" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
	set splitbelow splitright

" Chad tree
	map <leader>p :CHADopen<cr>
    let g:chadtree_settings = { "theme.text_colour_set": "nerdtree_syntax_dark" }

" Registers
    let g:registers_window_border = "rounded" "'none' by default, can be 'none', 'single','double', 'rounded', 'solid', or 'shadow' (requires Neovim 0.5.0+)

" lspsaga
    nnoremap <silent> gh :Lspsaga lsp_finder<cr>
    nnoremap <silent><leader>gca :Lspsaga code_action<cr>
    vnoremap <silent><leader>gca :<C-U>Lspsaga range_code_action<cr>
    nnoremap <silent>K :Lspsaga hover_doc<cr>
    " scroll down hover doc or scroll in definition preview
    nnoremap <silent> <PageDown> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>
    " scroll up hover doc
    nnoremap <silent> <PageUp> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>

    nnoremap <silent>gr :Lspsaga rename<CR>

" blame
    nnoremap <silent> <leader>b :GitBlameToggle<CR>

" Floating terminal
    nnoremap <C-e> <Cmd>lua require'FTerm'.toggle()<CR>
    tnoremap <C-e> <Cmd>lua require'FTerm'.toggle()<CR>

" Lua
lua << EOF
local lsp = require "lspconfig"
local coq = require "coq" -- add this
local saga = require "lspsaga"

-- lsp
lsp.pylsp.setup(coq.lsp_ensure_capabilities())
lsp.clangd.setup(coq.lsp_ensure_capabilities())

-- lspsaga
saga.init_lsp_saga {
    -- add your config value here
    -- default value
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = true,
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
       open = 'o', vsplit = 's',split = 'i',quit = 'q'
    },
    code_action_keys = {
      quit = 'q',exec = '<CR>'
    },
    rename_action_keys = {
      quit = '<C-c>',exec = '<CR>'  -- quit can be a table
    },
    definition_preview_icon = '  ',
    -- "single" "double" "round" "plus"
    border_style = "round",
    rename_prompt_prefix = '➤',
}

-- fterm
require'FTerm'.setup({
    dimensions  = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5
    },
    border = 'double' -- or 'double'
})

-- colorizer
require'colorizer'.setup()

-- icons
require'nvim-web-devicons'.setup {
     -- your personnal icons can go here (to override)
     -- DevIcon will be appended to `name`
     override = {
      zsh = {
        icon = "",
        color = "#428850",
        name = "Zsh"
      }
     };
     -- globally enable default icons (default to false)
     -- will get overriden by `get_icons` option
     default = true;
}

-- treesitter setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_material',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

EOF
