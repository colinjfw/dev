" vim:fdm=marker et ft=vim sts=2 sw=2 ts=2
scriptencoding utf-8


call plug#begin()
" Auto-close parens / quotes, requires no config
Plug 'cohama/lexima.vim'
" Shared project settings
Plug 'editorconfig/editorconfig-vim'
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Autosave.
Plug '907th/vim-auto-save'
" Themes.
Plug 'chriskempson/base16-vim'
Plug 'dikiaap/minimalist'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'w0ng/vim-hybrid'
Plug 'kaicataldo/material.vim'
" Javascript syntax highlighting.
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
" Nerdtree tree view
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Makes tabbing better
Plug 'ervandew/supertab'
" Auto close html tags
Plug 'alvan/vim-closetag'
" Airline status line
Plug 'vim-airline/vim-airline'
" Neoformatter
Plug 'sbdchd/neoformat'
" Language server nvim.
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Close tags plugin.
let g:closetag_filetypes = 'html,xhtml,xml,javascript.jsx,typescript.tsx'
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions =  {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ }

" Formatters
let g:neoformat_enabled_python = ['black']

" Required for operations modifying multiple buffers.
set hidden

" Add language servers here.
let g:LanguageClient_rootMarkers = {
    \ 'javascript': ['package.json'],
    \ 'rust': ['Cargo.toml'],
    \ }
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['pyls'],
    \ 'go': ['bingo'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }

" Mapping commands for goto definition and more.
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

let g:deoplete#enable_at_startup = 1

" Enable auto save.
let g:auto_save = 1

" Themeing.
let g:material_terminal_italics = 1
let g:material_theme_style = 'dark'
set termguicolors
set background=dark
syntax on
colorscheme material

" Nerdtree on ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>
