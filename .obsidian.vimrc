unmap ,
" navigate visual lines rather than logical ones
nnoremap j gj
nnoremap k gk
nnoremap I g0i
nnoremap A g$a
nnoremap о gj
nnoremap л gk
nnoremap Ш g0i
nnoremap Ф g$a


" HJKL behaves like hjkl, but bigger distance
noremap H g0
noremap L g$
nnoremap J 6gj
nnoremap K 6gk
vnoremap J 6j
vnoremap K 6k

" Undo
nnoremap U <C-r>

" splits
" window controls

exmap focusRight obcommand editor:focus-right
exmap focusLeft obcommand editor:focus-left
exmap focusTop obcommand editor:focus-top
exmap focusBottom obcommand editor:focus-bottom
exmap splitVertical obcommand workspace:split-vertical
exmap splitHorizontal obcommand workspace:split-horizontal

nmap <C-w>k :focusTop
nmap <C-w>j :focusBottom
nmap <C-w>l :focusRight
nmap <C-w>h :focusLeft
nmap <C-w>v :splitVertical
nmap <C-w>s :splitHorizontal

nmap <C-w>л :focusTop
nmap <C-w>о :focusBottom
nmap <C-w>д :focusRight
nmap <C-w>р :focusLeft
nmap <C-w>м :splitVertical
nmap <C-w>ы :splitHorizontal


" Split Switching
" qwe
exmap nextSplit obcomamnd cycle-through-panes:cycle-through-panes
nnoremap <C-CR> :nextSplit

" Tabs
" qwe
exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
nnoremap gt :nextTab
nnoremap gT :prevTab

"" exmaps
exmap wq obcommand workspace:close
exmap q obcommand workspace:close


" Obsidian builtin Search & replace
" Make o and O respect context (requires Code Editor Shortcuts Plugin)
exmap blankAbove obcommand obsidian-editor-shortcuts:insertLineAbove
nmap &a& :blankAbove
nmap O &a&i

exmap blankBelow obcommand obsidian-editor-shortcuts:insertLineBelow
nmap &b& :blankBelow
nmap o &b&i
" [M]erge Lines
" the merge from Code Editor Shortcuts plugin is smarter than just using `J`
" since it removes stuff like list prefixes
exmap mergeLines obcommand obsidian-editor-shortcuts:joinLines
nnoremap M :mergeLines


exmap searchReplace obcommand editor:open-search-replace
nnoremap ,/ :searchReplace
nnoremap б. :searchReplace

" :bnext/bprev
exmap goBack obcommand app:go-back
exmap goForward obcommand app:go-forward
nnoremap zp :goBack
nnoremap zn :goForward
nnoremap яз :goBack
nnoremap ят :goForward

" [g]oto [o]pen file (= Quick Switcher)
exmap quickSwitcher obcommand obsidian-another-quick-switcher:search-command_recent-search
nnoremap zs :quickSwitcher
nnoremap яы :quickSwitcher

"" Link Jump (similar to Vimium's f)
" qwe
exmap linkjump obcommand mrj-jump-to-link:activate-jump-to-link 
nnoremap zf :linkjump
nnoremap яа :linkjump


" INFO doesn't work in visual mode
exmap lineUp obcommand editor:swap-line-up
exmap lineDown obcommand editor:swap-line-down
nnoremap <Up> :lineUp
nnoremap <Down> :lineDown
nnoremap <Right> dlp
nnoremap <Left> dlhhp

" [g]oto [s]ymbol via "Another Quick Switcher" Plugin
exmap gotoHeading obcommand obsidian-another-quick-switcher:header-floating-search-in-file
nnoremap gs :gotoHeading


" Another Quick Switcher ripgrep-search
" somewhat close to Telescope's livegrep
"qwe
exmap liveGrep obcommand obsidian-another-quick-switcher:grep
exmap fuzzyFile obcommand obsidian-another-quick-switcher:file-name-fuzzy-search
nnoremap ,fg :liveGrep
nnoremap ,ff :fuzzyFile
nnoremap бап :liveGrep
nnoremap баа :fuzzyFile

" greenclip is not worth it
imap <C-v> <ESC>"+pa
imap <C-м> <ESC>"+pa
" clippppp
set clipboard=unnamedplus
