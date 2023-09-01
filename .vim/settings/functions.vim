function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" Toggle comment line
function! CommentLine()
  let l:line_number = line('.') " Get the current line number
  let l:line = getline('.')     " Get the current line  
  let l:file_type = &filetype   " Get the file type

  " Put the appropriate comment symbol that matches the file type
  if l:file_type == 'vim'
    let l:comment_symbol = '"'
  elseif l:file_type == 'python' || l:file_type == 'py'
    let l:comment_symbol = '#'
  elseif l:file_type == 'sh'
    let l:comment_symbol = '#'
  elseif l:file_type == 'c' || l:file_type == 'h' || l:file_type == 'cpp' || l:file_type == 'hpp'
    let l:comment_symbol = '//'
  elseif l:file_type == 'cpp'
    let l:comment_symbol = '//'
  elseif l:file_type == 'html' || l:file_type == 'markdown'
    let l:comment_symbol = '<!--'
  elseif l:file_type == 'css'
    let l:comment_symbol = '/*'
  elseif l:file_type == 'javascript' || l:file_type == 'typescript'
    let l:comment_symbol = '//'
  elseif l:file_type == 'conf'
    let l:comment_symbol = '#'
  elseif l:file_type == 'vimrc'
    let l:comment_symbol = '"'
  endif

  " Check if the line is already commented
  if l:line =~ '^'.l:comment_symbol
    " If it is, remove the comment symbol
    execute 's/^'.l:comment_symbol.'//'
  else
    " If it isn't, add the comment symbol
    execute 's/^/'.l:comment_symbol.'/'
  endif

endfunction
