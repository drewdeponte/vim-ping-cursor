""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor Pinging
"
" This is a work around for the fact that the cursorcolumn setting makes
" moving the cursor to the left and the right horribly slow when using h and
" l. Instead this creates a function which can be bound to a key combo to
" basically make the cross-hair appear and for a short period of time and then
" disappear letting you get back to work
" http://briancarper.net/blog/590/cursorcolumn--cursorline-slowdown
" https://gist.github.com/pera/2624765
" http://vim.1045645.n5.nabble.com/Vim-7-slows-down-when-highlighting-cursor-line-td1148280.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:PingCursor()
  set cursorline cursorcolumn
  redraw
  sleep 250m
  set nocursorline nocursorcolumn
endfunction

command PingCursor :call s:PingCursor()
