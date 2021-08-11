let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Development/Adyton/ops_text/adt-970
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +195 lib/common/components/data/get_org.dart
badd +30 lib/profile_management/pages/member_profile_screen.dart
badd +91 lib/profile_management/pages/tracker_data_screen.dart
badd +60 term://~/Development/Adyton/ops_text/adt-970//79072:/bin/zsh
badd +11 lib/common/components/data/get_account_attributes.dart
badd +475 term://~/Development/Adyton/ops_text/adt-970//53903:/bin/zsh
badd +1 term://~/Development/Adyton/ops_text/adt-970//79897:/bin/zsh
badd +3345 __FLUTTER_DEV_LOG__
argglobal
%argdel
edit lib/common/components/data/get_org.dart
argglobal
balt lib/profile_management/pages/member_profile_screen.dart
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 195 - ((58 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 195
normal! 0
lcd ~/Development/Adyton/ops_text/adt-970
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=tfTioOnclFxI
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
