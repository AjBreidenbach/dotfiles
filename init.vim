call plug#begin()
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'purescript-contrib/purescript-vim'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/nerdtree'
"Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'dikiaap/minimalist'
Plug 'HenryNewcomer/vim-theme-papaya'
Plug 'tudurom/bleh.vim'
Plug 'yuttie/inkstained-vim'
Plug 'yuttie/hydrangea-vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'nightsense/snow'
Plug 'flazz/vim-colorschemes'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'
Plug 'ElmCast/elm-vim'
Plug 'digitaltoad/vim-pug'
Plug 'pangloss/vim-javascript'
Plug 'hauleth/vim-ketos'
Plug 'Raimondi/delimitMate'
Plug 'dag/vim-fish'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'vim-ruby/vim-ruby'
Plug 'dart-lang/dart-vim-plugin'
Plug 'alx741/vim-hindent'
Plug 'cespare/vim-toml'
Plug 'udalov/kotlin-vim'
Plug 'evanleck/vim-svelte'
Plug 'leafgarland/typescript-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rust-lang/rust.vim'
"Plug 'preservim/tagbar'
Plug 'chr4/nginx.vim'
Plug 'puremourning/vimspector'
Plug 'vim-airline/vim-airline'
"Plug 'nvie/vim-flake8'
Plug 'vim-autoformat/vim-autoformat'
Plug 'ziglang/zig.vim'
Plug 'keith/swift.vim'
Plug 'alvan/vim-closetag'
Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'alaviss/nim.nvim'
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'eslint/eslint'
"Plug 'vim-syntastic/syntastic'
"Plug 'dense-analysis/ale'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-fugitive'
call plug#end()

set shell=bash
let g:mapleader = ","

"source $HOME/.config/nvim/nvim-configs/coc-base-config.vim

let g:matchparen_timeout = 1
let g:matchparen_insert_timeout = 1

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['package.json']
let g:ctrlp_custom_ignore ='/node_modules/*'
let g:flake8_show_in_file = 1

let g:python3_host_prog="/usr/bin/python3"
let g:NERDTreeWinSize =30 
nmap <silent> <C-t> :NERDTreeToggle<CR>

nmap <silent> <C-p> :CtrlP :pwd

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect


"source $HOME/.config/nvim/coc.vim

"source $HOME/.config/nvim/nim.vim
"source $HOME/.config/nvim/thrift.vim
au BufRead,BufNewFile *.thrift set filetype=thrift
au BufRead,BufNewFile *.nim* set filetype=nim
au! Syntax thrift source ~/.vim/thrift.vim

"nmap <silent> <C-i> :TagbarToggle<CR>

let g:tagbar_use_cache = 0
let g:tagbar_ctags_bin = "ctags"


let g:nobg = ($SSH_CLIENT != "") || ($VI == "nobg")

let $BASH_ENV = "~/.bash_aliases"

function! Numbering()
        if (&filetype != 'nerdtree' && !g:nobg)
                set number relativenumber
        endif
endfunc

" cd into direcotry on bufenter
autocmd BufEnter * lcd %:p:h

autocmd BufEnter * :call Numbering()
"autocmd BufWritePost *.py call flake8#Flake8()
autocmd BufWrite *.py :Autoformat

set mouse=a

syntax on


if g:nobg
  set nornu nonu
  set numberwidth=1
  hi Normal guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE

  "set cursorline
  "set cursorcolumn
  "colorscheme zellner
else 
  "colorscheme vice
  colorscheme PaperColor
endif

"colorscheme crayon
"colorscheme PaperColor
"colorscheme lightning
"colorscheme woju
"colorscheme brogrammer
"colorscheme candycode
"colorscheme 256-grayvim
"colorscheme LightDefault
"colorscheme adventurous
"colorscheme crayon
"colorscheme lightning
"colorscheme bleh
"colorscheme Monokai
"colorscheme Tomorrow


"hi CursorColumn guibg=NONE ctermbg=NONE
"hi CursorLine guibg=NONE ctermbg=NONE

set guifont=Monofur:h15
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key = '<C-d>'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_quit_key            = '<Esc>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:pymode_python='python3'
let g:rustfmt_autosave = 1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set linebreak
set foldmethod=indent
set foldlevelstart=99
set foldminlines=3
set foldnestmax=5


let g:vimspector_enable_mappings = 'HUMAN'
"call neomake#configure#automake('w')
"
let g:ncm2#complete_delay=100
let g:ncm2#complete_length=[[1,4],[7,3]]
let g:ncm2#matcher="abbrfuzzy"

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,*.vue'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'javascript.vue': '_vue',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

let g:delimitMate_matchpairs = "(:),[:],{:}"
"let g:delimitMate_excluded_regions = g:closetag_regions

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_args = ['--fix']

"let g:ale_fixers = ['eslint']
"let g:ale_fix_on_save = 1

function! Clipboard()
  :call system("xclip -selection clipboard", @*")
endfunction

funct! PrintClipboard()
    redir =>output
    :put=system("xclip -selection clipboard -o")
    redir END
    return output
endfunct!




"noremap <silent> <C-c> <y>:call system("xclip -selection clipboard @")<CR>
"noremap <silent> <C-Bslash> <y>:call system("xclip -selection clipboard @*")
noremap <silent> <C-Bslash> y:call system("xclip -selection clipboard", @")<CR>
inoremap <expr> <S-Insert> system("xclip -selection clipboard -o")

noremap <silent> <S-l> :tabn<CR>
noremap <silent> <S-h> :tabp<CR>
noremap <silent> <C-S-h> :tabp<CR>


vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


set cmdheight=1
