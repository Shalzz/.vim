" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" ==================== LanguageClient ====================
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" ==================== Fugitive ====================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>

" ==================== Tagbar ====================
nmap <C-b> :TagbarToggle<CR>

" Nerd Tree toggling
map <C-n> :NERDTreeToggle<CR>

" move between buffers
nnoremap <C-h> <Esc>:bprev<CR>
nnoremap <C-l> <Esc>:bnext<CR>
map X <Esc>:BD<CR>

" Move Down/up a Page
map <C-j> <Esc><PageDown>
map <C-k> <Esc><PageUp>

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" shortcut for ESC
map <M-f> <Esc>

" switch to left / right split (mostly for Nerd Tree)
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" ctrl-p plugin shortcut
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Jump to start and end of line using the home row keys
map H ^
map L $

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" CTRL-U in insert mode deletes a lot.	Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Fast saving
nmap <leader>w :w!<cr>

" Do not show stupid q: window
map q: :q

" sometimes this happens and I hate it
map :Vs :vs
map :Sp :sp

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Twiddle Case
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
