"
"                         ███████████████████████████
"                         ███████▀▀▀░░░░░░░▀▀▀███████
"                         ████▀░░░░░░░░░░░░░░░░░▀████
"                         ███│░░░░░░░░░░░░░░░░░░░│███
"                         ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                         ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                         ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                         ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                         ██▌░│██████▌░░░▐██████│░▐██
"                         ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                         ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                         ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                         ████▄─┘██▌░░░░░░░▐██└─▄████
"                         █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                         ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                         █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                         ███████▄░░░░░░░░░░░▄███████
"                         ██████████▄▄▄▄▄▄▄██████████
"                         ███████████████████████████
"
"
"                ╔══════════════════════════════════════════╗
"                ║           ⎋ HERE BE VIMPIRES ⎋           ║
"                ╚══════════════════════════════════════════╝


call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'artanikin/vim-synthwave84'

Plug 'christoomey/vim-tmux-navigator'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-commentary'

Plug 'mhinz/vim-startify'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-speeddating'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat' 

Plug 'tpope/vim-obsession'

Plug 'airblade/vim-rooter'

Plug 'reedes/vim-pencil'

Plug 'godlygeek/tabular' 

Plug 'plasticboy/vim-markdown'

Plug 'vim-scripts/taglist.vim'

Plug 'majutsushi/tagbar'

Plug 'jiangmiao/auto-pairs'

Plug 'nanotech/jellybeans.vim'

Plug 'dhruvasagar/vim-table-mode'

Plug 'rakr/vim-one'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'sindrets/diffview.nvim'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'ryanoasis/vim-devicons'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'nvim-lualine/lualine.nvim'

Plug 'TimUntersberger/neogit'

Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

set nocompatible 
filetype indent plugin on 
syntax on 
set hidden 
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2 
set confirm 
set visualbell 
set t_vb= 
set mouse=a 
set cmdheight=2 
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=2
set softtabstop=2
set expandtab
set noerrorbells
set nowrap
set encoding=utf-8
set shell=/bin/zsh
set lazyredraw
set showmatch
set incsearch
set background=dark
set signcolumn=yes
set nobackup
set nowritebackup
set updatetime=300
set clipboard=unnamedplus
set noswapfile
set ic
set showmatch
set autoread
set foldmethod=indent
" should keep things unfolded. If we have more than 20 levels of nesting, we
" got bigger problems than code folding...
set foldlevel=20
" clear search highlights
nmap <F9> :noh<CR>

let mapleader = "\<Space>"

if (has("termguicolors"))
  set termguicolors
endif

let g:airline_theme='synthwave84'
colorscheme tokyonight 

colorscheme tokyonight-night
" colorscheme tokyonight-storm
" colorscheme tokyonight-day
" colorscheme tokyonight-moon
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
map Y y$

" Use jj to exit insert mode 
imap jj <Esc>

nnoremap <silent> \ :vsplit<CR>
nnoremap <silent> - :split<CR>

"create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>B :enew<cr>
"close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
"close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>

" coc settings----------------------------------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap for rename current word
nmap <leader><F6> <Plug>(coc-rename)

" Remap for format selected region
xmap <silent> <leader>f  <Plug>(coc-format-selected)

nnoremap<silent> <leader>r <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAcjion of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" telescope settings ---------------------------------------------

nnoremap <silent> <c-p> <cmd>Telescope find_files<CR>
nnoremap <leader><leader><leader> <cmd>Telescope live_grep<CR> 

" gutentag settings ------------------------------------------------------

let g:gutentags_project_root = ['.git', '.svn', '.root', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" vim markdown settings --------------------------------------------------
"
let g:vim_markdown_folding_disabled = 1

" vim pencil settings ----------------------------------------------------

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END

" Vim table mode settings ----------------------------------------------

" The below code lets us set tables on the fly by checking if we are in input
" mode and have typed || or __
" You can enter table mode manually by typing <leader> tm in normal mode
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


" enables relative line numbering in normal mode
" and absolute line numbers in insert mode
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" tagbar settings

nmap <F8> :TagbarToggle<CR>

" treesitter settings ------------------------------------------------------

lua << EOF

local status_ok, configs = pcall(require, "nvim-treesitter.configs") 
if not status_ok then
  return
end

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "go",
        "bash",
        "python", 
        "typescript", 
        "kotlin", 
        "javascript",
        "json",
        "yaml",
        "toml",
        "html"
    },
    highlight = {
      enable = true,
      disable = { "" },
      additional_vim_regex_highlighting = true
    },
    indent = {
      enable = true,
      disable = { "" }
    }
}
EOF


" lualine settings -------------------------------------------------------

lua << END
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto'
      }
  }


END

" neo-git settings -------------------------------------------------------
lua << EOF
local neogit = require('neogit')

neogit.setup {
    integrations = {
        diffview = true
    }
  }
EOF


" neo-tree settings

map <C-n> :NvimTreeToggle<CR>

lua << EOF
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  filters = { custom = { "^.git$", "^__pycache__$", "^.pytest_cache$" } }
})
EOF
