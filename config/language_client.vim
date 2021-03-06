" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd', '--clang-tidy'],
    \ 'cpp': ['clangd', '--clang-tidy'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
    \ 'typescriptreact': ['typescript-language-server', '--stdio'],
    \ 'rust': ['rust-analyzer'],
    \ }

" \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"let g:LanguageClient_loggingLevel = 'DEBUG'
"let g:LanguageClient_loggingFile = $HOME.'/.vim/LanguageClient.log'

let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = $HOME.'/.config/nvim/settings.json'

set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

function! MyLanguageClient_statusLine(...) abort
    if exists('g:LanguageClient_serverStatus')
        let w:airline_section_statistics = join(split(g:LanguageClient_serverStatusMessage)[1:], ' ')
    endif
    return
endfunction
call airline#add_statusline_func('MyLanguageClient_statusLine')
