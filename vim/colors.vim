"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------
" ハイライト on
syntax enable

set t_Co=256
set t_Sf=[3%dm
set t_Sb=[4%dm

""colorscheme jellybeans
""colorscheme wombat
""colorscheme railscasts
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme molokai
colorscheme sonokai

" sonokaiのairlineテーマ
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
let g:airline_theme = 'sonokai'

" ターミナルタイプによるカラー設定
" if &term =~ "xterm-256color" || "screen-256color"
  " 256色
  " set t_Co=256
  " set t_Sf=[3%dm
  " set t_Sb=[4%dm
" elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  " set t_Co=16
  " set t_Sf=[3%dm
  " set t_Sb=[4%dm
" elseif &term =~ "xterm-color"
  " set t_Co=8
  " set t_Sf=[3%dm
  " set t_Sb=[4%dm
" endif

"ポップアップメニューのカラーを設定
" hi Pmenu guibg=#666666
" hi PmenuSel guibg=#8cd0d3 guifg=#666666
" hi PmenuSbar guibg=#333333

" 補完候補の色づけ for vim7
hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
" hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
" hi PmenuSbar ctermbg=0 ctermfg=9
hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF

