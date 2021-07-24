let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Development/Polygrok/polygrokdemo/pg-develop
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/Development/Polygrok/polygrokdemo/pg-develop/experimental/rn-paper-expo-managed/navigation/BottomTabNavigator/BottomTabNavigator.tsx
badd +61 ~/Development/Polygrok/polygrokdemo/pg-develop/experimental/rn-paper-expo-managed/containers/FindMetersScreenContainer.tsx
badd +92 term://~/Development/Polygrok/polygrokdemo/pg-develop//34363:/bin/zsh
argglobal
%argdel
argglobal
if bufexists("term://~/Development/Polygrok/polygrokdemo/pg-develop//34363:/bin/zsh") | buffer term://~/Development/Polygrok/polygrokdemo/pg-develop//34363:/bin/zsh | else | edit term://~/Development/Polygrok/polygrokdemo/pg-develop//34363:/bin/zsh | endif
if &buftype ==# 'terminal'
  silent file term://~/Development/Polygrok/polygrokdemo/pg-develop//34363:/bin/zsh
endif
balt ~/Development/Polygrok/polygrokdemo/pg-develop/experimental/rn-paper-expo-managed/navigation/BottomTabNavigator/BottomTabNavigator.tsx
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 60 - ((58 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 60
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=FocOxiltfnTI
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
