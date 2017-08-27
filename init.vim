function! BuildYCM(info) " {{{
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction
" }}}

function! Preserve(command) " {{{
  " Preparation: save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Do the business:
  execute 'keepjumps ' . a:command

  " Clean up: restore previous search history and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
" }}}

" setup plug {{{

" If vim-plug is not installed, do this first
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" syntax
Plug 'jgdavey/vim-blockle'
Plug 'scrooloose/syntastic'
Plug 'ntpeters/vim-better-whitespace' " show whitespaces
Plug 'kchmck/vim-coffee-script' " CoffeeScript support to vim. It covers syntax, indenting, compiling, and more.
Plug 'tpope/vim-endwise' " that helps to end certain structures automatically.
Plug 'tpope/vim-rails' " helper for rails ???????? can't use shortcuts
Plug 'elixir-lang/vim-elixir' " helper for elixir
Plug 'tpope/vim-bundler' " This is a lightweight bag of Vim goodies for Bundler
Plug 'skalnik/vim-vroom' " helper for ruby tests
Plug 'thoughtbot/vim-rspec' " helper for ruby tests
Plug 'elzr/vim-json' " better JSON for Vim
Plug 'mustache/vim-mustache-handlebars' " plugin for working with mustache and handlebars templates
Plug 'exu/pgsql.vim', { 'for': 'sql' } " postgresql syntax
Plug 'heartsentwined/vim-emblem', { 'for': 'emblem' } " emblem syntax
Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
Plug 'SirVer/ultisnips' " UltiSnips is the ultimate solution for snippets in Vim
Plug 'honza/vim-snippets' " This repository contains snippets files for various programming languages
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') } " a code-completion engine for vim

" colorscheme & syntax highlighting
Plug 'morhetz/gruvbox' " colorscheme
Plug 'chriskempson/base16-vim' " another colorscheme
Plug 'Yggdroot/indentLine'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" file browsing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" working with code
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion' " better searching tool
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" utilities
" Plug 'terryma/vim-expand-region' " that allows you to visually select increasingly larger regions of text
Plug 'tpope/vim-dispatch'
Plug 'mattn/gist-vim' " vimscript for creating gists
" Plug 'michaeljsmith/vim-indent-object' " this plugin defines a new text object, based on indentation levels
Plug 'tpope/vim-speeddating' " helper for increment date
Plug 'dkprice/vim-easygrep' " Fast and Easy Find and Replace Across Multiple Files
Plug 'pbrisbin/vim-mkdir' " Vim has automatically created the non-existent directory for you. (after use :e and :w)
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'takac/vim-hardtime' " learn how to use vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tmux
" Plug 'christoomey/vim-tmux-navigator' " navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
" Plug 'benmills/VIMux'
" Plug 'edkolev/tmuxline.vim'

call plug#end()
" }}}

" system settings {{{
set autoread
set cmdheight=2 " number of screen lines to use for the command-line
set clipboard=unnamedplus
set cursorline " highlight current line
set encoding=utf8 fileencoding=utf8 termencoding=utf8 " saving and encoding
set expandtab " insert space characters whenever the tab key is pressed
set formatoptions+=j " delete comment character when joining commented lines
set hidden " any buffer can be hidden (keeping its changes) without first writing the buffer to a file
set ignorecase smartcase " ignore case when the pattern contains lowercase letters only
set listchars+=space:·,tab:▸\ ,eol:¬ " use the symbols for tabstops and EOLs
set mouse= " disable mouse
set mousehide " the mouse pointer is hidden when characters are typed
set nohlsearch 
set number relativenumber " display line numbers
set path+=** " search down into subfolders
set scrolloff=3
set shiftwidth=2 " number of space characters inserted for indentation
set showcmd " show command in the last line of the screen
set softtabstop=2 " makes the spaces feel like real tabs
" set splitright splitbelow " put the new window right or below the current one
set tabstop=2 " number of space characters that will be inserted when the tab key is pressed
set termguicolors
set undofile
set wildignore+=*/tmp/*,*/dist/*,*/node_modules/*,*/bower_components/*,*.so,*.swp,*.zip,*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=.hg,.git,.svn
set wildmode=list:longest,full
set noswapfile
" }}}

" themes {{{
set background=dark
let &colorcolumn="80,".join(range(120,999),",") " highlight column 80 as well as 120 and onward
colorscheme base16-gruvbox-dark-pale
" }}}

" set leader key {{{
let mapleader = ','
" }}}

" stop using arrow keys {{{
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" }}}

" open a new empty buffer {{{
" nmap <leader>t :enew<cr>
" }}}

" create windows {{{
nmap <leader>h :leftabove vnew<CR>
nmap <leader>l :rightbelow vnew<CR>
nmap <leader>k :leftabove new<CR>
nmap <leader>j :rightbelow new<CR>
" }}}

" search {{{
nmap <silent> <leader>p :FZF<cr>
nmap <silent> <leader>a :Ag<cr>
" }}}

" Close the current buffer and move to the previous one {{{
nmap <leader>bq :bp <BAR> bd #<CR>
" }}}

" trim trailing spaces {{{
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
" }}}

" reindent code {{{
nmap <leader>= :call Preserve("normal gg=G")<CR>
nmap <leader>gq :call Preserve("normal gggqG")<CR>
" }}}

" show all open buffers and their status / unnecessary {{{
nmap <leader>bl :ls<CR>
" }}}

" vim paste mode toggle (for fixing indentation issues when pasting text) {{{
noremap <leader>sp :set invpaste paste?<CR>
" }}}

" shortcut to rapidly toggle `set list` {{{
nmap <leader>sl :set list!<CR>
" }}}

" ycm {{{
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
" }}}

" syntastic {{{
let g:syntastic_check_on_open = 1 " check syntax after open file
let g:syntastic_check_on_wq = 1 " check syntax after save file
let g:syntastic_ruby_checkers = ['rubocop', 'mri'] " set rubocop and mri checkers for ruby
" }}}

" faster quit without save {{{
nmap <silent> <leader>q :q!<cr>
" }}}

" faster quit with save {{{
nmap <silent> <leader>x :x!<cr>
" }}}

" faster save {{{
nmap <silent> <leader>w :w<cr>
" }}}

" edit vimrc {{{
nmap <silent> <leader>ev :edit $MYVIMRC<CR>
" }}}

" toggle nerdtree {{{
nmap <silent> <leader>n :NERDTreeToggle<cr>
" }}}

" open a new tab {{{
nmap <S-T> :tabnew<cr>
" }}}

" search and replace word under cursor {{{
nnoremap <Leader>r :%s/\<<c-r><c-w>\>//g<left><left>
" }}}

" create file in current files dir {{{
nmap <leader>cf :e %:h/
" }}}

" indentLine {{{
let g:indentLine_enabled = 1
" }}}

" airline {{{
set noshowmode " airline redundant
let g:airline_powerline_fonts=1

" show tabline
let g:airline#extensions#tabline#enabled=1
" show buffers
let g:airline#extensions#tabline#show_buffers=1

" hardtime
let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1 "  makes it possible to input 'jh', but not 'jj'

" delimitMate {{{
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
" }}}

" rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" highlight search
nmap <silent> <leader>hl :set hlsearch!<cr>

" folding {{{
au FileType javascript,css,scss,json setlocal foldlevel=99
au FileType ja/al foldmethod=syntax
" au FileType javascrtip,css,scss,json setlocal foldmarker={,}

augroup fold_vimrc
  au BufReadPre * setlocal foldmethod=marker
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
" }}}

augroup reload_vimrc " {{
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }}}

" return to last edit position when opening files {{{
if has('autocmd')
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
  au Bufread * normal zz
endif
" }}}
