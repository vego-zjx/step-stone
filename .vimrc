
" some basics 
"	1) leading space when change new line:
"		 au FileType * set fo-=c fo-=r fo-=o
"	2) backspace can not back to line aboe:
"solve the backspace key issue
"	indent:allow to del the indent character, or else the character added when indent
"		can not be deleted;
"	eol: allow to del the \ln character,or else only can del to the beginning of current line,
"		can not delete character above line;
"	start: allow to delete character before entry insert mode,or else,just delete the character
"		added in current insert mode.
" set nocompatible              " be iMproved, required
" set backspace=indent,eol,start
"	3) background color for preview windown:
"		:hi  -> hi Pmenu ctermfg=0 ctermbg=232

set t_Co=256
set background=dark
syntax enable

let mapleader = ','
" === To install related plugins firstly
set rtp+=${HOME}/.vim/autoload
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" =====Plugins used to display:
Plug 'altercation/vim-colors-solarized'
Plug 'jaxbot/semantic-highlight.vim'
" Plug 'eugen0329/vim-esearch'
" Plug '~/vim_bkp/tar_vim_build/vim-esearch-master'
Plug 'frazrepo/vim-rainbow'
"Plug '~/vim_bkp/plugin_vim/external/vim-rainbow-master'

Plug 'Yggdroot/indentLine'
"Insert or delete brackets, parens, quotes in pair.
"Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'
Plug 'dimasg/vim-mark'
Plug 'skywind3000/vim-preview'
"=====Plugins used to browse
Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
"		==Plugin to serach in nerdtree
"	no ag installed,so disable it
"Plug 'taiansu/nerdtree-ag'
"	file manager plugin
" Plug 'mbbill/VimExplorer'
"	to use nerdw instead of vimExplorer
" Plug '~/vim_bkp/tar_vim_build/VimExplorer-master'
"Plug '~/ex_plugin_vim/LeaderF-master' 
Plug 'Yggdroot/LeaderF',{ 'do': './install.sh' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

"=====Plugins used to edit

" Plug 'Valloric/YouCompleteMe'
", {'do':'./install.py --clang-completer --go-completer --java-completer'}
Plug 'ycm-core/YouCompleteMe'
" Plug '~/vim_bkp/ycm_new/YouCompleteMe-master' , {'do':'./install.py --clang-completer --go-completer --java-completer'}
"Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'
"Plug '~/vim_bkp/plugin_vim/external/nerdcommenter-master'
Plug 'tpope/vim-surround'
" not used plugin
"Plug 'kana/vim-textobj-entire', {'tag': '0.0.4'}
"Plug '~/vim_bkp/plugin_vim/external/vim-textobj-entire-master'
Plug 'tpope/vim-fugitive'
" Initialize plugin system

"==========plugs more
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

" used to add change mark compared use git cvs
Plug 'mhinz/vim-signify'
" used to add change mark compared with file origin state.
Plug 'chrisbra/changesPlugin'
" syntax highlight
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-unimpaired'

"  plug for vim & tmux clipboard
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'eagle0701/vim-escalt'


Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/restore_view.vim'
" Plug '~/vim_bkp/tar_vim_build/vim-taglist-master'
" specify the folder that contain the vim plugin
" Plug '~/.vim/plugged/restore_view'
" Plug '~/vim_bkp/tar_vim_build/restore_view.vim'
" Plug '~/vim_bkp/tar_vim_build/restore_view.vim-master'

" Plug 'vimtaku/hl_matchit.vim'     " enhanced version of matchit.vim plugin for pairs match,such as ifeq endif in make
                                    " need cooperate with 'runtime macros/matchit.vim'
Plug 'andymass/vim-matchup'       " another match plugin just like hl_matchit.vim plugin,(no need special setting)
                                  " match-up can be used as a drop-in replacement for the classic plugin matchit.vim. 
call plug#end()

" default updatetime 4000ms is not good for async update
set updatetime=100

"========To configure related plugins
"-->set 256color support for vim,or color error
" set t_Co=256
" set background=dark
" syntax enable
" colorscheme solarized
" colorscheme default    " the order to load is important
"------ configure plugin solarized
let g:solarized_termcolors=256
"设置颜色为256色，默认为16
"let g:solarized_termtrans=0
""设置背景色为透明，使用终端的背景色
let g:solarized_degrade=0
"强制使用256级色彩，只用于测试，默认为0
"let g:solarized_bold=1
""使用粗体，默认为1
let g:solarized_underline=1
"使用下划线，默认为1
"let g:solarized_italic=1
""使用斜体，默认为1
let g:solarized_contrast="normal"
"设置对比度，默认为normal，还可以设置为low或者high
"let g:solarized_visibility="normal"
""设置空白符的可见性，默认为normal，还可以设置为low或者high
let g:solarized_hitrail=0
"光标高亮时，空白符仍可见，默认为0
"let g:solarized_menu=1
""启用solarized_menu菜单，默认为1
"-----------end of configuration of plugin solarized


"-----configure plugin vim-rainbow
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']]  ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']]  ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']]  ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']]  ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
":RainbowToggle  --you can use it to toggle this plugin.
":RainbowLoad    --you can use it to load/reload this plugin.
"-----end of configuration of plugin vim-rainbow

"-----configure plugin indentLine
"each indent level has a distinct character.
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
"If you want to keep your conceal setting
"let g:indentLine_setConceal = 0
"disable indentLine:
"let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceChar = '.'
" whether to show leading space
" let g:indentLine_leadingSpaceEnabled = 1

" space and tab visible for help: h listchars
set listchars=eol:$,tab:>->,space:.,trail:~,extends:>,precedes:<
" set listchars=tab:^^,trail:.
" default set nolist,if need to check ,set list
set nolist
"set list


":IndentLinesToggle toggles lines on and off.
"-----end of configuration for plugin indentLine

"-----configure plugin ntextobj-entire'
"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" Align line-wise comment delimiters flush left instead of following code indentation
"
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
"
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 
        \ 'c': { 'left': '//','leftAlt': '/*','rightAlt': '*/' },
        \ 'cpp': { 'left': '//','leftAlt': '/*','rightAlt': '*/' },
        \ 'CPP': { 'left': '//','leftAlt': '/*','rightAlt': '*/' },
        \ 'h': { 'left': '//','leftAlt': '/*','rightAlt': '*/' },
        \}
"
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
"
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" Normal cmd:
"   cc: comment current line;
"   cm: comment multiple lines;
"   c : reverse current line;
"   ci: reverse mulitipe line
"   cu: cancel comment;
"   ca: toggle comment style;
"   cA: add comment delimiter and entry insert mode;
"   c$:
" visual mode -> 'S' --> 'c'  add /**/ comment
"-----end of configuration for plugin nerdcommenter

"------configure plugin nerdtree
" Normally used commands:
"		open/collapse
"	o/O  expand folder;
"	x/X  collapse folder;
"   e    explore folder;
"		jump:
"	p/P  go to parrent/go to root
"   K/J  go to the first child/go to the last child
" C	:Change the tree root to the selected dir
" u : up one directory;

"	r   refresh current nod;
"	m	show menu  -> p get fullpathname of current file

" I : display or hide hidden files
" A : zoomout zoomin

map <leader>nN :NERDTreeToggle<CR>
let NERDTreeWinPos="right"
let NERDTreeWinSize=31
let NERDTreeWinSizeMax=40
" normal cmd:
" o/go : open file in current window;
" i/gi : open file in new horinal window;
" s/gs : open file in new vertical window;
nnoremap <leader>ne :e %:p:h<CR>
"------end of configuration of plugin nerdtree

"----------configure gtags
" gtags supported language will use local parser ,others use pygments module
let $GTAGSLABEL = 'native-pygments'
" configuration path store configuration file for gtags
let $GTAGSCONF = '/home/samuel/usr/local/share/gtags/gtags.conf'
"----------end of configuration of gtags

"---------configure plugin vim-gutentags which used to manager the tags database
"^^^^^General configuraton:
"       1) root marker setting;
let g:gutentags_add_default_project_roots = 0   "must add this setting for following setting. 
let g:gutentags_project_root = ['.root']
" let g:gutentags_project_root = ['.root','.git',]
"       2) cached dir setting
" let g:gutentags_cache_dir = expand('~/.cache/tags')
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" check ~/.cache/tags exist or not, if not,create it
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_resolve_symlinks = 0
let g:gutentags_ctags_exclude_wildignore=1
let g:gutentags_ctags_exclude = ['*.si4project', '*(*).[ch]', '*.cpp', '.*.py', '*.py', '*.txt']

"       3) tag file name;
let g:gutentags_ctags_tagfile = '.tags'
"       4) supported tag types;
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif
"       5) argument for ctag;
"fields:for extral field of every tag;extra:add extral tags,q add tag for every class,f:add tag for every file
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
"for cpp language(format: --{language}-kinds)
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"for c language
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
"^^^^^Detail configuraton:
"       1) directory to store tag files;
"       2) when to load tag files;
"       3) when to update tag files;
"       4) state to show tag files updating;
"       5) forbid auto loading of gtag database for issue of multiple prj;
let g:gutentags_auto_add_gtags_cscope = 0
"set cscopetag
set cscopeprg='gtags-cscope' 

" add indicating of ctagsing for large proj on status line:

"--------end of configuration of plugin vim-gutentags
function! s:get_gutentags_status(mods) abort
    let l:msg = ''
    if index(a:mods, 'ctags') >= 0
       let l:msg .= 'zjx_ctagsing...'
     endif
     if index(a:mods, 'cscope') >= 0
       let l:msg .= 'zjx_cscoping'gtags_cscope
     endif
     if index(a:mods, 'gtags_cscope') >= 0
       let l:msg .= 'zjx_gtag_cscoping'
     endif
     return l:msg
endfunction

set statusline+=%{gutentags#statusline_cb(
            \function('<SID>get_gutentags_status'))}
"---------end of configuration of plugin gutentags

"---------configure plugin gutentags_plus
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
let g:gutentags_plus_nomap = 1

"   key map for tag reference
"       reference for symbol under cursor
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gS :GscopeFind s 
"       definition of symbol under cursor
noremap <silent> <leader>gd :GscopeFind g <C-R><C-W><cr>
"       reference for this function
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
"       find file with given name that under cursor in prj
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
"       find files that contain specific header file name in prj 
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
      " find the position for assigment
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
      " search text in project
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>gT :GscopeFind t 
"       egrep find
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
"---------end of configuration of gutuentags_plus

"-----------configure plugin of LeaderF
" Note:LeaderF is special for key map, the same key map can be
" used for different mode, and details can be referenced in code.
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 0

let g:Lf_RootMarkers = ['.root']
" let g:Lf_RootMarkers = ['.root','.git']
"	below mode setting will change the working directory for vim
"		c: working directory of vim(directory inside vim start);
"		a: vim must open one specific file;
"		A: ancestor of working directory of vim;
let g:Lf_WorkingDirectoryMode = 'Aac'
" let g:Lf_WorkingDirectoryMode = 'c'
let g:Lf_ShowHidden = 0
"exclude files
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','*.si4project'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.lo','*.py[co]']
            \}

let g:Lf_MruWildIgnore = {
            \ 'dir': ['.svn','.git','.hg','*.si4project'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.lo','*.py[co]']
            \}

"Whether to visit directories pointed to by symlinks when indexing.Default value is 0.
let g:Lf_FollowLinks = 1

" let g:Lf_MruFileExclude = ['*.so']
"let g:Lf_ExternalCommand = 'find "%s" -type f'
" popup mode
"let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewPopupWidth = 240  " set preview window width of leaderf
let g:Lf_StlSeparator = { 'left': "", 'right': "", 'font': "DejaVu Sans Mono for Powerline" }
" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_WindowHeight = 0.3
let g:Lf_ReverseOrder=0
"   use memory to cache index reuslt by default.
" let g:Lf_UseMemoryCddache=0
"   file list cached or not,if 1,leaderf will not reindex files
" let g:Lf_UseCache=0
"let g:Lf_ShortcutF = '<C-P>'
let g:Lf_ShortcutF = "<leader>ff"
" <ctrl-u> :Remove all characters between the cursor position and the beginning of the line.
" <ctrl-r>/<CTRL-R> :Insert the contents of a numbered or named register.'=' is on special register,
" which will evaluate the expression following,use the evaluated result as the contents of '=' register.
" :<CTRL-U><CTRL-R> is the cmd run in command mode,which means delete all characters befor current cursor position on cmd line firstly,
"	then enter contents of '=' register.
"Command-line mode is used to enter Ex commands (":"), search patterns("/" and "?"), and filter commands ("!").
noremap <leader>fw :LeaderfMruCwd<CR>
" LeaderfMruCwd is one command defined in leaderf.vim
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" using printf to contruct one command string, Leaderf is the command name,buffer is argu and etc.
" shortcut for fb --> <leader>b
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru --fullPath %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"the showing order of filtered results depends on the algorithm
noremap <leader>fj :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fh :<C-U><C-R>=printf("Leaderf line --stayOpen %s", "")<CR><CR>
noremap <leader>fc :<C-U><C-R>=printf("Leaderf line  --cword %s", "")<CR><CR>
noremap <leader>fch :<C-U><C-R>=printf("Leaderf line --stayOpen --cword %s", "")<CR><CR>
noremap <leader>fJ :<C-U><C-R>=printf("Leaderf line  --all --cword %s", "")<CR><CR>
noremap <leader>fJh :<C-U><C-R>=printf("Leaderf line --stayOpen --all --cword %s", "")<CR><CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf line --recall")<CR><CR>
" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagsconf = '/home/samuel/usr/local/share/gtags/gtags.conf' 
let g:Lf_Gtagslabel = 'native-pygments'

" let g:Lf_CommandMap = { '<ESC>': ['<A-5>']} " alt key not work for leaderf
"   quickfix window
noremap <leader>fs :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

" key map for leaderf rg for text searching
" search word under cursor in current buffer
noremap <leader>fl :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <leader>fg :<C-U><C-R>=printf("Leaderf! rg --all-buffer -e %s ", expand("<cword>"))<CR>
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
" noremap <leader>fa :<C-U><C-R>=printf("Leaderf! rg -i --fullPath -e %s ", expand("<cword>"))<CR>

" search word under cursor in *.h and *.cpp files.
" noremap <Leader>fa :<C-U><C-R>=printf("Leaderf! rg --fullPath -g *.c -g *.cpp -g *.CPP -g *.h -g *.mk -e %s ", expand("<cword>"))<CR>
noremap <Leader>fa :<C-U><C-R>=printf("Leaderf! rg -L --fullPath -g !*.si4project -e %s ", expand("<cword>"))<CR>
" search word under cursor in cpp files, exclude the *.hpp files
"noremap <Leader>c :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -g !*.hpp", expand("<cword>"))<CR>

" noremap <Leader>fr :<C-U><C-R>=printf("Leaderf! rg --next ")<CR>
" noremap <Leader>fg :<C-U><C-R>=printf("Leaderf! rg --previous")<CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -g !*.si4project --fullPath -e %s ", leaderf#Rg#visual())<CR>
" recall last search,if the result window is closed,reopen it!
noremap go :<C-U>Leaderf! rg --recall<CR>

noremap gn :<C-U>Leaderf! rg --nowrap --next<CR>
noremap gp :<C-U>Leaderf! rg --nowrap --previous<CR>
"-----------end of configuration of plugin LeaderF


"--------configure for plugin vim-preview   ?? not work
"--->set width for preview window
let g:preview#preview_vsize = 60
let g:preview#preview_size = 20
"--->set height for preview window
" let g:preview#preview_size = 50
" autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
" autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

"--------end of configuration of plugin vim-preview

"----------configure for plugin taglist
let Tlist_Auto_Open = 0
let Tlist_Show_One_File = 1
"let Tlist_Auto_Update = 0
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Auto_Highlight_Tag = 0
"let Tlist_Highlight_Tag_On_BufEnter = 0
"let Tlist_Sort_Type = "name"
"let Tlist_Sort_Type = "order"
let Tlist_WinHeight = 20
let Tlist_WinWidth = 37
let Tlist_WinWidthMaxim = 80

let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 0

" hi MyTagListTagScope  ctermbg=12

nnoremap <leader>tt :TlistToggle<CR>
"commands normally used:
"   ->x :zoom in and zoom out;
"   ->u : update tag list;
"   ->p : show the tag definition and keep cursor in tag list;
"   ->o : in a new window;
"----------end of configuration of plugin taglist


"--------configure for plugin mark
let g:mwIgnoreCase = 0
"   --Normally used cmds:
"	1) hilight or clear highlight word under cursor;
"		<leader>m
"	2) clear current marks or disable mark function, but mark info still exist
"		<leader>n
"	3) clear all mark, mark is in enabled state
"		:MarkClear
"	4) mark word match pattern
"		[n]<leader>r pattern
"   5) list marks
nnoremap <leader>ml :Marks<CR>
"--------end of configuration of plugin mark

"------configure for plugin youcompleteme
" let g:ycm_server_python_interpreter='/home/samuel/vim_bkp/tar_vim_build/Python-3.8.1/python'
" one option:
let g:ycm_global_ycm_extra_conf = '/home/samuel/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" two option (key):
" clangd:  --compile-commands-dir=<string> - Specify a path to look for compile_commands.json. 
" If path is invalid, clangd will look in the current directory and parent paths of each source file
let g:ycm_auto_trigger = 1
" normally, clangd only has a view of symbols from file you are editing,
" create a database, to extend the view of symbols from files of whole prj
let g:ycm_use_clangd = 1
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = ['-log=verbose', '-pretty', '-j=10']
let g:ycm_key_invoke_completion = '<c-s-y>'

" used to close the completion menu
let g:ycm_key_list_stop_completion = ['<C-y>']
" Setting this option to a high number like '99' effectively turns off the
" identifier completion engine and just leaves the semantic engine.
" Note: when let g:ycm_clangd_uses_ycmd_caching = 0, below setting does not work 
let g:ycm_min_num_of_chars_for_completion = 2

" to limit the number of suggestions from the identifier-based engine
let g:ycm_max_num_identifier_candidates = 20

" only applies to suggestions from semantic completion engines
let g:ycm_max_num_candidates = 20
let g:ycm_echo_current_diagnostic = 1
" set acutal height of pmenu,since ycm_max_num_candidates is not working
set pumheight=20

" This option controls for which Vim filetypes (see ':h filetype') should the YCM
" semantic completion engine be turned off. 
let g:ycm_filetype_specific_completion_to_disable = {
    \ 'gitcommit': 1,
    \}
" let g:ycm_filetype_specific_completion_to_disable = {
    " \ 'gitcommit': 1,
    " \ 'c': 1,
    " \ 'cpp': 1
    " \}


let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

" h ins-completion-menu
set completeopt-=preview
set completeopt+=menu,menuone
"not to interfere with other data you might have placed in the location list
let g:ycm_always_populate_location_list = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1

let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_max_diagnostics_to_display = 0
"filter out
" let g:ycm_filter_diagnostics = {
" \ "java": {
" \      "regex": [ ".*taco.*", ... ],
" \      "level": "error",
" \      ...
" \    }
" \ }

let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 0
set signcolumn=yes
" set signcolumn=no
" set tags+=/home/samuel/.cache/tags/home-samuel-prj-v533_prj_new-tina-softwinner-eyesee-mpp-middleware-sun8iw19p1-.tags
" set tags+=/home/samuel/.cache/tags/home-samuel-prj-v533_prj_new-tina-softwinner-eyesee-mpp-framework-sun8iw19p1-.tags
" 禁用syntastic来对python检查
let g:syntastic_ignore_files=[".*\.py$"] 
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 0

function! s:CustomizeYcmQuickFixWindow()
" Move the window to the top of the screen.
wincmd p
" Set the window height to 5.
" 5wincmd _
endfunction
" autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()   " keep focus one current window, not switch to quickfix  zjx
"flow1:mesage response:  command -->python -->response cmd(_HandleGotoResponse) --> invoke vim envent (default)
"flow2:call vim function  -> call python function -->invoke vim envent (deprecated!!)
"      py3 vimsupport.OpenQuickFixList( False, True ) <-- vim call python function
"    autocmd User YcmQuickFixOpened call youcompleteme#OpenGoToList()
"adjust based on above:  vim autocmd
function! s:CustomizeYcmLocationWindow()
" Move the window to the top of the screen.
" wincmd K
" Set the window height to 5.
" 5wincmd _
" Switch back to working window.
wincmd p
endfunction
" autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow() " keep focus one current window, not switch to locationlist  zjx
nnoremap <leader>yd :YcmCompleter GoTo<CR>
nnoremap <leader>ys :YcmCompleter GoToReferences<CR>
nnoremap <leader>yt :YcmCompleter GetDoc<CR>
nnoremap <leader>yc :YcmDiags<CR>
nnoremap <leader>yC :YcmForceCompileAndDiagnostics<CR>:YcmDiags<CR>
" used to refactor
nnoremap <leader>yr :YcmCompleter RefactorRename
" file format related
nnoremap <leader>yf :YcmCompleter Format<CR>
" nnoremap <leader>yp :YcmCompleter GetDoc<CR>
" :YcmCompleter GetDoc
" :YcmCompleter GoToInclude
" :YcmCompleter GoToDeclaration
" :YcmCompleter GoToDefinition
let g:ycm_filetype_blacklist = {
            \ 'tagbar': 1,
            \ 'notes': 1,
            \ 'markdown': 1,
            \ 'netrw': 1,
            \ 'unite': 1,
            \ 'text': 1,
            \ 'vimwiki': 1,
            \ 'pandoc': 1,
            \ 'infolog': 1,
            \ 'leaderf': 1,
            \ 'mail': 1
            \}

" This option controls for which Vim filetypes (see ':h filetype') should
" filepath completion be disabled.
let g:ycm_filepath_blacklist = {
            \ 'html': 1,
            \ 'jsx': 1,
            \ 'xml': 1,
            \}
"  keep log of ycm and ycmd or not:
let g:ycm_keep_logfiles = 0     " debug with :YcmToggleFile
" control the log level:
let g:ycm_log_level = 'info'
"------end of cofiguration of plugin youcompleteme

"--------configure for plugin vimExplorer
"    tempraryly not use vimExplorer,to use nerdw plugin defalut with vim
" nnoremap <leader>ve :VE<CR><CR>
let g:VEConf_previewSplitLoction = "leftabove"
let g:VEConf_sortCaseSensitive = 0
"	1:by name;2:by time;3:by type;
let g:VEConf_filePanelSortType = 1
"	0:byte;1:MKB format
let g:VEConf_showFileSizeInMKB = 0
"--------end of configuration of plugin vimExplorer
" let g:netrw_sort_by = 'time'
" let g:netrw_sort_direction = 'reverse'
" 3:tree;2:wide;1:long;0:thin
let g:netrw_liststyle = 1
"-------configure for plugin Netrw

"-------end of configuration of plugin Netre

"--------configure for plugin highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_experimental_template_highlight = 1
"--------end of configuration of plugin highlight
"--------configure for plugin vim-esearch
" let g:esearch = {
  " \ 'adapter':          'rg',
  " \ 'backend':          'vim8',
  " \ 'out':              'qflist',
  " \ 'batch_size':       1000,
  " \ 'use':              ['word_under_cursor','visual', 'hlsearch', 'last'],
  " \ 'default_mappings': 0,
  " \}
	" " Start esearch prompt autofilled with one of g:esearch.use initial patterns
 " call esearch#map('<leader>ef', 'esearch')
 " " Start esearch autofilled with a word under the cursor
 " call esearch#map('<leader>ew', 'esearch-word-under-cursor')
"
 " call esearch#out#win#map('<Enter>', 'open')
"
 " "    Move cursor with snapping
 " call esearch#out#win#map('<C-n>', 'next')
 " call esearch#out#win#map('<C-j>', 'next-file')
 " call esearch#out#win#map('<C-p>', 'prev')
 " call esearch#out#win#map('<C-k>', 'prev-file')
"
 " call esearch#cmdline#map('<C-o><C-r>', 'toggle-regex')
 " call esearch#cmdline#map('<C-o><C-i>', 'toggle-case')
 " call esearch#cmdline#map('<C-o><C-w>', 'toggle-word')
"--------end of configuration of vim-esearch

set viewoptions=cursor,folds,slash,unix

"----setting for clipbaord using
"		* : cached buffer;
"		+ : clipboard
"   to use cached buffer,the unamed register is same with * register;
" set clipboard=     *register
" set clipboard=unnamed  " * same
" set clipboard=unnamedplus + reg
" set clipboard=unnamed,unnamedplus  + * reg
set clipboard=unnamed
" set clipboard=unnamed,unnamedplus

"when use ctags alone
" set tags=./.tags;,.tags

"----------key map
"	---customer key map:
"		---jump to definition:
" nmap <A-S> <C-]>
" nnoremap <A-Z> <C-O>
" noremap <A-B> <S-*>
" noremap <A-C> <S-#>

" for user keymap
" to adjust search directories when use gf command
set path=.,${PWD}/**,/usr/include,,
"  cmd to use changesPlugin to mark the change line
" :TCV : toggle change view or not;
" :CL  : list out all changes in location window;
" :CD  : open diff view;
" :CF  : diff fold;
" :CT  : toggle change diff mode;
" -->remap { or } jump
nnoremap <a-1> ]}
nnoremap <a-2> [{
nnoremap <a-3> ]#
nnoremap <a-4> [#
xnoremap <a-1> ]}
xnoremap <a-2> [{
xnoremap <a-3> ]#
xnoremap <a-4> [#
inoremap <a-1> <c-\><c-o>]}
inoremap <a-2> <c-\><c-o>[{
inoremap <a-3> <c-\><c-o>]#
inoremap <a-4> <c-\><c-o>[#
" -->remap search next and previous

nnoremap <a-s-c> #

nnoremap <a-c> #
nnoremap <a-b> *
inoremap <a-c> <c-\><c-o>#
inoremap <a-b> <c-\><c-o>*
" --remap jump to definition and back
nnoremap <a-s> g<c-]>
nnoremap <a-z> <c-o>
nnoremap <a-x> <c-i>
inoremap <a-s> <c-\><c-o>g<c-]>
inoremap <a-z> <c-\><c-o><c-o>
inoremap <a-x> <c-\><c-o><c-i>
" --undo/redo in insert mode
inoremap <a-u> <c-\><c-o>u
inoremap <a-r> <c-\><c-o><c-r>
"  textobj: af/aF : no leading and trailing blank line/with leading and trailing line.
"  surround: d/c/y v ->S 
" remap key to screen up and down
nnoremap <A-j> <C-e>
nnoremap <A-k> <C-y>
"g] :tag-matchlist
nnoremap <leader>pp :tn<CR>
nnoremap <leader>pn :tp<CR>
"---added keymap for adjustment of taglist
nnoremap <leader>tp :let Tlist_WinWidth = 60<CR>:TlistToggle<CR>:TlistToggle<CR>
nnoremap <leader>to :let Tlist_WinWidth = 37<CR>:TlistToggle<CR>:TlistToggle<CR>
nnoremap <leader>ts :let Tlist_WinWidth = 20<CR>:TlistToggle<CR>:TlistToggle<CR>
" Note: <c-s>/<c-q> vim internal key-map,can not be reused
"		or else will not work!
"  used to check the variable definition in preview window
"  ctrl-] jump to variable definition
"  CTRL-\ CTRL-O  leave insert mode tempararily,run one cmd,then return back
inoremap  <C-S-k> <c-\><c-o>:PreviewScroll -1<CR>
inoremap  <C-S-j> <c-\><c-o>:PreviewScroll +1<CR>
nnoremap  <C-S-k> :PreviewScroll -1<CR>
nnoremap  <C-S-j> :PreviewScroll +1<CR>
inoremap  <A-S-j> <c-\><c-o><c-e>
inoremap  <A-S-k> <c-\><c-o><c-y>
"-->PreviewTag: next;PreviewTagP: previous
let g:preview#preview_position = "bottom"
nnoremap <leader>pb :PreviewTagP<CR>
nnoremap <leader>pt :PreviewTag<CR>
nnoremap <leader>pc	:PreviewClose<CR>
" keymap to insert blank line without leaving normal mode
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
"  keymap for cursor movement in sert mode
" In insert or command mode, move normally by using Ctrl
" The inoremap statements apply to insert mode, 
" while the cnoremap ones apply to command mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
"  need toCcheck more
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
" alt key Cetakey work now,but tempraryly not to use,
" use linux key mode
" inoremap <A-S-I> <UP>
" inoremap <A-S-K> <DOWN>
" put multiple command on same line:
"	case 1:command line,use | : :echo "hello" | echo "goodbye"
"	case 2:in configuration file, use <CR> :map <F5> :w<CR>:!make && ./run<CR>
" for mark clear
" [N]<Leader>r		Manually input a regular expression to mark.

"  ---> error can not use noremap:
"nnoremap <a-q> <Plug>MarkSet
" --->ok
" nmap <a-q> <Plug>MarkSet
" --->ok
" nmap <a-q> <leader>m
"inoremap <a-q> :MarkSet<cr>  "error syntax,correct one showing below: temporarily leaving insert mode,then back;
inoremap <a-q> <c-\><c-o>:MarkSet<cr>
nnoremap <a-q> :MarkSet<cr>
" nnoremap <leader>n :MarkSet<cr>
nnoremap <a-s-q> :MarkClear<CR>:nohl<CR>
"=======
"---add keymap for insert mode:
"---1)directly remap keymap,just like inoremap <a-j> <c-e>;
"---2)mapping one commnd,just like inoremap <a-q> <c-\><c-o>:MarkSet<cr> 
"---Note: <c-\><c-o> is mandatory,the meaning is temporarily leave insert mode,execute one cmd,then back to insert mode;
"=======

nnoremap <leader>mc :MarkClear<CR>:nohl<CR>
nnoremap <leader>Mc :nohl<CR>
" inoreamp <A-S-q> <ESC><leader>n
"To search for visually selected text.
"visually select the characters that are wanted in the search, 
"then type // to search for the next occurrence of the selected text.
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"----->keymap for quickfix window
nnoremap <leader>kc :ccl<CR>
" nnoremap <leader>ko :cope<CR>
nnoremap <leader>ko :bo cwindow<CR>
nnoremap <leader>kn :cnext<CR>
nnoremap <leader>kp :cprevious<CR>
nnoremap <leader>kl :clast<CR>
nnoremap <leader>kf :cfirst<CR>

"----->keymap for Location window
nnoremap <leader>lc :lcl<CR>
nnoremap <leader>lo :lope<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>
nnoremap <leader>ll :llast<CR>
nnoremap <leader>lf :lfirst<CR>
" --->for list out change files
"   toggle between open and close state for vim-signify plugin
nnoremap <leader>sf :SignifyToggle<CR>
"   to show diff mode of vim-signify plugin(diff with the  version commit in git)
nnoremap <leader>sd :SignifyDiff!<CR>
nnoremap <leader>sl :SignifyDebug<CR>
" ---> for insert one character directly in normal mode
nnoremap <leader>i i<SPACE><ESC>r
nnoremap <leader>a a<SPACE><ESC>r
"--->inset one line above/after current line in inset mode
inoremap <A-k> <UP><END><CR>
inoremap <A-j> <END><CR>
"--->delete to start/end of line in insert mode
" inoremap <A-l> <ESC>d$i
" inoremap <A-h> <ESC>d^i
" inoremap <A-s-w> <ESC>dwi
inoremap <A-l> <c-\><c-o>d$
inoremap <A-h> <c-\><c-o>d^
inoremap <A-s-w> <c-\><c-o>diw
" -->keymap to copy one word in insert mode
inoremap <a-w> <c-\><c-o>yiw

"--->quit from insert mode efficiently
inoremap <A-d> <ESC>
xnoremap <A-d> <ESC>
nnoremap <A-d> <ESC>
cnoremap <A-d> <ESC>
inoremap <A-s-d> <ESC>
xnoremap <A-s-d> <ESC>
nnoremap <A-s-d> <ESC>
cnoremap <A-s-d> <ESC>
" ---> insert one character in normal mode
" inoremap <A-S-H> <ESC><Home>i
" inoremap <A-S-L> <ESC><End>a
" --> move cursor to the beginnning and trailing of line;
inoremap <A-S-H> <c-\><c-o>^
inoremap <A-S-L> <End>
nnoremap <leader>nn ^
nnoremap <leader>mm <End>
" insert mode temporarily switch to other window
inoremap <c-w>l <ESC><c-w>l
inoremap <c-w>h <ESC><c-w>h
inoremap <c-w>k <ESC><c-w>k
inoremap <c-w>j <ESC><c-w>j
"----->lock file to ptotect
nnoremap <A-l> :set nomodifiable<CR>
nnoremap <A-S-L> :set modifiable<CR>

"--->check fullpath
nnoremap <A-g> :echo expand("%:p")<CR>
"-----------end of key map


"solve the backspace key issue
"	indent:allow to del the indent character, or else the character added when indent
"		can not be deleted;
"	eol: allow to del the \ln character,or else only can del to the beginning of current line,
"		can not delete character above line;
"	start: allow to delete character before entry insert mode,or else,just delete the character
"		added in current insert mode.
set nocompatible              " be iMproved, required
set backspace=indent,eol,start

"filetype off                  " required
syntax on
filetype on
filetype plugin on
filetype indent on
"setting for not adding leading commenter automatically for new line
" autocmd FileType evnent,* all filetype,cmd
" formatoption ->set fo?
au FileType * set fo-=c fo-=r fo-=o
" can not be modified for current file(to protect content)
" au FileType * set nomodifiable
"setting for buffer operation
set hidden
"	method 1: use wildchar
"   setting  for buffer switching using wildchar
"	1)启动wildmenu并设置匹配后文件选择模式为full
"	2)wildchar 备选文件选择快捷键；
"	3)wildcharm 宏定义设置，语义同wildchar,用于 noremap快捷键映射；
"set wildmenu wildmode=full 
"set wildchar=<Tab> wildcharm=<C-Z>
"noremap <c-n> :b <c-z>

"	method 2: use key map directly:
" normal 模式下使用 bl 列出 Buffer 列表
nnoremap <silent> bl :ls<CR>
" normal 模式下使用 bo 打开一个新 Buffer
nnoremap <silent> bo :enew<CR>
" normal 模式下使用 bn 切换到下一个 Buffer
nnoremap <silent> bn :bnext<CR>
" normal 模式下使用 bn 切换到上一个 Buffer
nnoremap <silent> bp :bprevious<CR>
" normal 模式下使用 bd 关闭当前 Buffer
nnoremap <silent> bd :bdelete<CR>
nnoremap <silent> bu :bun<CR>
"-------key map for tab
nnoremap <silent>tl :tabs<CR>
nnoremap <silent>tn :tabn<CR>
nnoremap <silent>tp :tabp<CR>
nnoremap <silent>to :tabnew<CR>
nnoremap <silent>tc :tabc<CR>
"-------end key map for tab


" 允许 airline 在顶部显示 Buffer 列表
"let g:airline#extensions#tabline#enabled=1
" 显示 buffer 编号，方便切换
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_detect_paste=1
" let g:airline_detect_spell=1
" let g:airline_detect_spelllang=1
let g:airline#extensions#whitespace#enabled = 0
" buffer setting end
" --------------configure for hl_matchit.vim plugin
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'DiffText'
"-----------------end of configuration of hl_matchit.vim

if version>580
    hi clear
    if exists("syntax on")
        syntax reset
    endif   
endif

set shell=bash
set shortmess=atI"              " Close welcome page
set history=1000                " Store lots of :cmdline history

set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode down the bottom
set number                      " Show line numbers
set numberwidth=4               " Number width

set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
" set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

set shiftwidth=4                " Default indent settings
set softtabstop=4               " 
set expandtab                   "
set tabstop=4
" set noexpandtab

set autoindent                  " Automatic indentation
set smartindent                 " Smart indent

set nowrapscan              " 
set encoding=utf-8              " Set default encoding to UTF-8
" set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" set fileencoding=utf-8
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
"set autowrite                   " Automatically save before :next, :make etc.
"set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2                " Always show the status line. or 1

" SignColumn/LineNr/CursorLineNr/CursorLine/FoldColumn/VertSplit

hi Comment ctermfg=247 
hi DiffChange ctermbg=242
"hi DiffText cterm=bold ctermfg=darkred ctermbg=none
"hi Normal ctermbg=232
hi Visual ctermbg=242
" -->configure color for plugin youcompleteme
hi Pmenu ctermfg=138 ctermbg=236
hi PmenuSel ctermfg=NONE ctermbg=94
hi Search  ctermbg=149 "199   "220 not work here,reset at another place
hi DiffAdd term=bold ctermbg=130 guibg=LightBlue
" hi LineNr ctermfg=5
hi LineNr ctermfg=242
"		To background color of sign column
hi SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE

set cursorline                  " Highlight the current line
hi CursorLine term=none cterm=none ctermbg=237
" hi CursorLineNr term=none cterm=none ctermbg=124
hi CursorLineNr term=none cterm=none ctermfg=220 ctermbg=none
"--adjust taglist color
hi FoldColumn ctermbg=NONE

" hi VertSplit ctermfg=232 ctermbg=red
hi VertSplit cterm=none ctermfg=242 ctermbg=none

hi CursorColumn ctermbg=236
" set cursorcolumn  cuc                " Highlight the current column
" set cuc			" disable the showing of current column
set tw=80 "120			" right margin
hi colorcolumn ctermbg=236
set cc=+1

"--------configure for plugin singnify
" highlight link SignifyLineAdd             DiffAdd
" highlight link SignifyLineChange          DiffChange
" highlight link SignifyLineDelete          DiffDelete
" highlight link SignifyLineDeleteFirstLine SignifyLineDelete
"
highlight link SignifySignAdd             DiffAdd
highlight link SignifySignChange          DiffChange
highlight link SignifySignDelete          DiffDelete
highlight link SignifySignDeleteFirstLine SignifySignDelete

"----->adjust for kuroi color scheme
colorscheme kuroi
hi LineNr ctermfg=242
hi VertSplit ctermfg=242
hi Visual ctermbg=242
hi SpecialKey ctermfg=239
hi DiffText ctermbg=199
hi CursorLine term=none cterm=none ctermbg=237
hi Identifier ctermfg=66
" adjust for ycm
"for error
hi SpellBad cterm=none ctermfg=168 ctermbg=52
hi Error cterm=none ctermfg=168 ctermbg=52
"for warning
hi SpellCap cterm=none ctermfg=75 ctermbg=17
hi todo ctermbg=17

hi pmenuthumb ctermbg=5
hi pmenusel ctermbg=161
" hi Normal ctermbg=232
" hi EndOfBuffer ctermbg=232
hi tabline cterm=none ctermbg=none
hi tablinesel ctermbg=241

" hi Search  ctermbg=199   "220
hi Search  ctermbg=149  "190   "220
 
hi MatchParen ctermfg=234 ctermbg=201
hi MatchWord ctermfg=234 ctermbg=199 
" <---- end adjustment

"   To set sign color in sign column
let g:signify_sign_show_text = 1
"	default to disalbe, toggle between signify and changes plugin
let g:signify_disable_by_default = 1
" hi SignifySignAdd                  ctermbg=green                guibg=#00ff00
" hi SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" hi SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
"--------end of configuration of plugin signify
" -------configure for plugin semantic-highlight
" au FileType chcpp :SemanticHighlight
let g:semanticEnableFileTypes = ['h','c','cpp','CPP','javascript', 'vim']
let g:semanticEnableBlacklist = 1
let g:semanticTermColors = [136,1,2,3,166,5,6,50,172,9,10,34,202,168,14,174,142,130,124,178]
" let g:semanticTermColors = [136,1,2,13,163,5,6,50]
let g:semanticUseCache = 1
nnoremap <leader>st :SemanticHighlightToggle<CR>
"--------end of configuration of plugin semantic-hihglight
" some issue exist when file open,tag generation error!
" augroup AutoSaveFolds
  " autocmd!
  " autocmd BufWinLeave *.c mkview
  " autocmd BufWinEnter *.c silent loadview
" augroup END
" let g:gutentags_define_advanced_commands = 1

" for taglist tag color
" hi MyTagListTagName  ctermfg=160
" hi MyTagListTagName cterm=underline ctermbg=26
hi MyTagListTagName  cterm=underline ctermbg=26

au FileType * set scrolloff=6   " set context line number for zb zt command

" runtime macros/matchit.vim     " This script is part of vim runtime and can be loaded by runtmie cmd
                            " have to load matchit.vim plugin than hl-matchit.vim plugin is loaded
"""""""""""""""""""""""""""""""""""""""""""
"      just one example to set b:match_words for matchit.vim plugin
" Let the matchit plugin know what items can be matched.
"if exists("loaded_matchit")
"  let b:match_ignorecase=0
"  let b:match_words=
"    \ '\<begin\>:\<end\>,' .
"    \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
"    \ '\<module\>:\<endmodule\>,' .
"    \ '\<if\>:\<else\>,' .
"    \ '\<function\>:\<endfunction\>,' .
"    \ '`ifdef\>:`else\>:`endif\>,' .
"    \ '\<task\>:\<endtask\>,' .
"    \ '\<specify\>:\<endspecify\>'
"endif


"""""""""""""""""""""""""""""""""""""""""

" set background=light
" colorscheme solarized
" colorscheme default
"   putty bg color:
"           bg color: 20 2 5/41 24 30 / (28 28 28)
"           bold bg color:85 85 85
"==================== vim porting  ==============
" 1) adjust vim runtimepath for plugin loading;
"	a) set environment variable : VIM used by vim;
"	b) set VIMRUNTIME;
"   20210520 thursday:    check the value of variable:  set VIM  or set runtimepath(set rtp)  .etc
"    VIM: the path vim installed,such as:~/usr/local/share/vim, $VIM/vimfiles / $VIM/vimfiles/after  "all user
"    VIMRUNTIME: the path defined with released vim to store plugin, when updated,be overrided.
"    runtimepath: path defined to store plugin, including path for current user,all user .etc. such as:
"           $HOME/.vim / $HOME/.vim/after       " current user  ,after 用于对已有设置进行一些小的修正和覆写.先于系统脚本运行，可扩展与替代系统脚本原有功能  
"           $VIM/vimfiles / $VIM/vimfiles/after  "all user
"           $VIMRUNTIME
		" when vim startup, all the plugins stored in the paths
		" contained in the vim variable runtimepath will be loaded;
		" so, if you add one new plugin with separated folder,
		" you can add the path to the runtimepath vim variable,
		" so this folder can be scanned and plugin will be loaded;

" 2) adjust configurable file path in .vimrc for target environment;
" 3) dynamic library path adjustment;
" 4) The path for pygment-parser.la needed by gtags is determined by variable $libdir,
"    the flow is showing below:
"    ./configure -->prefix -->Makefile -->libdir -->Makefile -->-DLIBDIR='"$(libdir)"' -->
"    macro definition in conf.c   --> libdir in conf.c -->gtags.conf   (read only )
"
"    so  just modify the pygment-parser definition :
"    $libdir --> /home/xxxx/usr/local/lib/gtags
"  ------------->compile vim from source:
"     vim82 compile configrue:
"  $ auto/configure --prefix=/home/samuel/usr/local --with-features=huge --enable-python3interp=yes --with-python3-config-dir=/home/samuel/usr/local/lib/python3.8/config-3.8-x86_64-linux-gnu --enable-rubyinterp=yes --enable-luainterp=yes --enable-perlinterp=yes --enable-multibyte --enable-cscope --srcdir=. --cache-file=auto/config.cache
"	1)configure:
"		./configure --prefix=${HOME}/usr/local --with-features=huge --enable-pythoninterp=yes 
"                    --with-python-config-dir=/usr/lib/python2.7_d/config --enable-rubyinterp 
"                    --enable-luainterp --enable-perlinterp  --enable-multibyte --enable-cscope
"
"	update: fix error:
"		a) can not use ~ to config python-config-dir;
"		b) add environment variable: vi_cv_path_python3
"
"
"vi_cv_path_python3=/home/samuel/usr/local/bin/python3.8 ./configure --prefix=${HOME}/usr/local --with-features=huge 
"                        --enable-python3interp=yes --with-python3-config-dir=${HOME}/usr/local/lib/python3.8/config-3.8-x86_64-linux-gnu 
"                        --enable-rubyinterp=yes --enable-luainterp=yes --enable-perlinterp=yes  --enable-multibyte --enable-cscope
"
"
"
"	2) make -j
"	3) make install
"
"
"if multiple vim of different version exist on your system, the .vimrc in your home directory is shared.	
"   <--------------------------------------------
"     (step_2: rebuild vim82)vim82 compile configrue:
"  $ auto/configure --prefix=/home/samuel/usr/local --with-features=huge --enable-python3interp=yes 
"   --with-python3-config-dir=/home/samuel/usr/local/lib/python3.8/config-3.8-x86_64-linux-gnu 
"   --enable-rubyinterp=yes --enable-luainterp=yes --enable-perlinterp=yes --enable-multibyte --enable-cscope --srcdir=. --cache-file=auto/config.cache
"     (step_1:rebuild python3.8)python3.8 compile configure:
"         $ ./configure --enable-shared/ or static
"     install pygment package:
    " first download get-pip.py
    " second install get-pip.py to target directory
    " python3 get-pip.py  --prefix=${HOME}/usr/local
    " third download pygments tar ball
    " forth install pygments to target directory
    "pip3 install Pygments
    " pip install --prefix=${HOME}/usr/local ./vim_bkp/Pygments-2.5.2.tar.gz

"tarball:ctags-master  global-6.6.4  pygment  Python-3.8.1

"  ctags compile and configure:
"  $ ./configure --prefix=/home/samuel/usr/local
"  gtags compile and configure:
"  $ ./configure --prefix=/home/samuel/usr/local

"  clangd install:
"      download clangd based the version of ubuntu;
"      copy subdir(bin and lib) of clangd to your customer install dir;
"      confiure ycm plugin in .vimrc file to enable clangd.

" tmux compilation:
"     depends one libevent-2.1.10-stable : just configure and compile (--prefix)
"     tmux-2.8:
"       PKG_CONFIG_PATH='/home/samuel/prj/test/target/libevent/lib/pkgconfig'
"      ./configure --prefix=/home/samuel/usr/local --enable-static

"ycm  -->ycmd compile:
"1) download clang library .etc
"2) python dymamic library;
"3) compile ycm_core.so;
"
"#add clang support -> semantic completer ->slow
"cmake -G "Unix Makefiles" -DPYTHON_LIBRARY=/home/samuel/usr/local/lib/libpython3.8.so -DPYTHON_INCLUDE_DIR=/home/samuel/usr/local/include/python3.8 -DPATH_TO_LLVM_ROOT=/home/samuel/vim_bkp/tar_vim_build/ycm/clang_llvm_rls . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
"#not add clang support,but use cland instead ->no semantic completer ->complete-as-type
"cmake -G "Unix Makefiles" -DPYTHON_LIBRARY=/home/samuel/usr/local/lib/libpython3.8.so -DPYTHON_INCLUDE_DIR=/home/samuel/usr/local/include/python3.8 . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
"
"cmake --build . --target ycm_core -j
"
"1)for improved Unicode support;
"2)for performance with regular expressions;
"cmake -G "Unix Makefiles" -DPYTHON_LIBRARY=/home/samuel/usr/local/lib/libpython3.8.so -DPYTHON_INCLUDE_DIR=/home/samuel/usr/local/include/python3.8 ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/cregex
"
"cmake --build . --target _regex -j
"
"QA:
"1)the library version is not matched with each other;
"2)the runtime path error setting for dynamic library;
"3)the runtime path mess setting for dynamic library;->kinds of issue,such as connection error .etc 
"4)semantic completion is too stuck; ->disable semantic completer

" ---Note: <c-\><c-o> is mandatory,the meaning is temporarily leave insert mode,
" execute one cmd,then back to insert mode;

" commands:
"	-->open file under cursor(vim built-in):
"		related options:  isfname, used to identify file name;
"						 path, used to search file with file name;
"       Normal mode:  gf / ctrl-w f; visual mode:  selecttion ->gf
"   -->search file under cusor(plugin)
"		<leader>gf
"   --> uppercase lowercase swap
"		visual mode:  U: uppercase; u: lowercase; ~:swap
"		normal mode:  gU: uppercase: gu:lowercase;

"	--> vim jump:
"		zz/zt/zb
"		M/H/L
"	--> hilight command:
"		<leader>m  : hilight or un-hilight current word
"		<leader>r  : hilight pattern
"		<leader>ml : list hilight
"		<leader>mc : clear hilight search
"		<leader>Mc : clear all hilight
"	--> global definition jump (tag command)
"		:ts /regular exression    (current .git project tag)
"  --> create marks:
"       m[a-z]   : " crete mark
"       '[a-z]   : " jump to mark
"       :marks   : " list all marks
"       y'z      : " copy lines to line with z mark
" --> align
"     =
" --> color scheme
"       :color   : " current using scheme
"       :color [space] ctrl-d  : " list all installed scheme
"       :color scheme_name      : "switch color scheme
" --> better way to use Nerdtree:
"       <leader>nN --> : e %:p:h
" --> diff merge
"       current file:
"       dp :    " copy current diff to another file
"       do :    " copy diff in another file to current file
"       diffthis : " show difference for current opened files
"       diffupdate : " update content
"-->  current window width
"     : echo winwidth('%')
"--> maximize window:
"      ctrl-w _     "maximum height
"      ctrl-w |     "maximum width
"--> use autocmd to set variable to one buffer:(use 'let' instead of 'set')
"      autocmd BufReadPre,BufNewFile * let b:did_ftplugin = 1


"-------------Install python package------
"  1)online:
"   pip install compiledb
"   pip install -t /path/to/customer/directory compiledb
"  2)offline:
"   if the installed package using the install step 1) can not work when copy to another computer,
"   then pip download -r requirement.txt -d target/directory or goto https://pypi.org/,search and 
"   download target package(*.whl(compiled package) or *.tar.gz(source package)), and finally install
"   the downloaded packages with command: pip install -t target/directory *.whl or python setup.py xxx.
"   pip install --no-index --find-links /path/to/download/dir/ -r requirements.txt  install all the requirement  
"   needed by package. Besides, PYTHONPATH=xxxsearch_directory  is not same as export PYTHONPATH=XXX   (Note)
"   currently compiledb was installed to directory ~/usr/local/compiledb, if you want to use compiledb to 
"   generate compile_commands.json, you need to execute command export PYTHONPATH=~/usr/local/compiledb to add runtime
"   search direcotry, when used done, unset PYTHONPATH, since sideeffect may be caused for leaderff plugin.
"   



"==============================
"     20211208 wednesday:
"           optimization for nerdtree-visual-selection plugin:
"               1) optimization for 'input' function using;(refer to manual about input functiion)
"               2) optimization for 'confirm' function using(default selection);
"               3) comment check at beggining of 's:ProcessSelection' function

"     20211129 monday:
"          Details improvement:
"          change cmd ':cope' to ':bo cwindow' to reopen quickfix window to
"             set the window position to below with full-width instead of below
"             last vertial window when use NerdTree plugin.


"    20211127 saturday:
"         add new keymap for LeaderF line command:
"           fj: for lines in current buffer;
"           fc: for lines containing current word in current buffer;
"           fJ: for lines containing current word in all opened buffers;
"           fr: reopen LeaderF line window containing last filtered results;
"    20211126 friday:
"           adjust file:~/usr/local/share/vim/vim82/ftplugin/make.vim to eanble 
"               hilight match "define endef" for vim-matchup plugin

"    20211119 friday:
"        add new plugin nerdtree-visual-selection and add new function to support
"           check file info using ll command in visual mode.
"       more:
"           vim echo tips:  use 'echo' built-in function;
"           vim condition check: == >= .etc
"           vim loop process


"   20211104 thursday:
"       add "/* */" comment by changing code of plugin vim-surround.
"           add below code for  s:wrap function in file plugin/surround.vim:
"               elseif newchar ==# 'c'
"                    let before = '/*'
"                    let after = '*/'
" keymap:     visual mode -> 'S' --> 'c'

"   20210926 sunday:
"       Note: no .root marker, no gtags will be generated.

"   20210528 friday:
"         one story for header file reference error when using ycm:
"           header file reference error --> use gf command to check the header file recursively  --> that is the point of pitfall  -->
"            gf will open the first header file searched, but maybe not the one refered in file  --> waste lots of time.
"         stupid mistake: 1) error path for -I option in compile_commands.json;2) to check the error file that not refered in file; 
"   20210520 thursday:
"        learn the matchit and filetype plugin (h matchit and h ftplugins)
"        add new matchit.vim and hl_matchit.vim plugin to add marks for pair matches,such as ifeq endif pair/define endef pair in makefile.
"   20210508 saturday:
"       ycm compile error,such as: (when search the target header file and missed in given search directories, the default directories will be searched,or not given the header file needed,  issue out below tips: /usr/include/stdlib.h,
"                                   fix: added need header file before the header file that cause error,such as add #include <stdlib.h> )
"           In included file: exception specification in declaration does not match previous declaration  /usr/include/stdlib.h:468:14: note: error occurred here  
"           /home/samuel/prj/tina/v833/tina/prebuilt/gcc/linux-x86/arm/toolchain-sunxi-musl/toolchain/include/sched.h:75:7: note: previous declaration is here [mismatched_exception_spec]

"   20210423 friday:
"       Display the status of gutentags plugin on vim-airline.
"      vim-airline/autoload/airline/extensions/gutentags.vim +13 will call functions in gutentags plugin, details refs to both plugins
"        fatal error for the understanding of let g:gutentags_resolve_symlinks = 0, use 0 instead of 1. 
"            for Gutentags plugin, the Gutentags commands can be used, when no root marker is found in the path of current buffer.
"   20210422 thursday:
"           alsa-lib can be re-compiled directly with command: bear make in alsa-lib root, and the compile_commands.json
"               will also be generated.( the $(MAKE) command was included in shell commands in Makefile for alsa-lib, the bear command added to the 
"               $(MAKE) ahead will not work, and the compile log is not generated,so compiledb will also not work)
"               note:  bear make only work, when alsa-lib be configured with host compilation,not for cross-platform, that
"                        is ,you need configure alsa-lib hostly.
"   20210420 tuesday:
"       fix the issue of unicode error when using youcompleteme,(saome iso-8859-1 encoded bytes exit in some *.c or *.h file),
"           fix:  write one bash script to convert all the files with iso-8859-1 encoding to utf-8 encoding.
"   20210323 tuesday:
"       fix issue when use ycm with compile_commands.json generated for linux kernel:
"           The setting in compile_commands.json such as gcc don't match the compile option -march, one execption will 
"           be issued by ycm when perform GoTo operation.
"               fix:   1) adjust gcc to actual gcc in toolchain used for current prj and adjust the isysterm option.(using)
"                       or 2) just remove the -march compile option.(some include files maybe not refered correctly(just for specific prj) )
"                                   (suggest first one)
"           20210326 friday: (mkernel -j &> compile_k.log) compile_commands.json  generation improvment:  compiledb < compile.log (
"           modify kernel-default.mk file to pass command line variable V=1 to enable the detail output when compile kernel)
"                          Note: compile_commands.json can not exist in the place with .ycm_extra_conf.py, ycm prefer .ycm_extra_conf.py over compile_commands.json
"   20210319 friday:  use compiledb to generate compile_command.json for kernel
"       1)export PYTHONPATH=~/usr/local/compiledb     "export runtime path for compiledb
"       2)~/usr/local/compiledb/bin/compiledb -n make ARCH=arm    " ARCH=arm is mandatory
"
"       adjust and analyze ycm code to keep focus on current window when execut GoTo cmd:
                "flow1:mesage response:  command -->python -->response cmd(_HandleGotoResponse) --> invoke vim envent (default)
                "flow2:call vim function  -> call python function -->invoke vim envent (deprecated!!)
            "      py3 vimsupport.OpenQuickFixList( False, True ) <-- vim call python function
                "    autocmd User YcmQuickFixOpened call youcompleteme#OpenGoToList()
                    "adjust based on above:  vim autocmd
    "   20210318 thursday:  adjust ycm 
"       1) adjust key to select completion iterm;  -->just use c-j/c-k,remove tab.
"       2) coment ycm code in setupoption function,   " call s:SetUpKeyMappings() to avoid warning when 
"               start vim without any file.(keymappping error)
"   20210225 thursday:
"       for bd/bu command:  (close last window, vim automatically quit issue)
"           bd/bu default current buffer, it is true, But
"           when taglist showing, bd/bu will also close current window.
"           Fix:
"           1) Close taglist window before use bd/bu command;
"           2) use :bd/bu target_buffer_id;
"               20210311 fix: ->That's the issue of TagList,related with setting let Tlist_Exit_OnlyWindow = 0/1,
"                               The implementation of TagList will delete taglist buff and execute quit command,so
"                               the vim editor will quit when to close last window in the mean-time the taglist window is showing.
"                                   fix: comment quit command in TagList source code.
"       for ycm goto and gotoreference command:
"           GoTo/GoToReference only search in  translation unit, so can not 
"           reach other translation unit, But
"           when other translation unit have been opended or ever, the search 
"           can acroess translation units.
"   20210222 monday:
"       vim env summary:
"           1)project constructing:
"               a)files indexing: LeaderF and gutentag
"                   touch .root file to mark the top directory of tarte project
"                   link external directory to current top directory and enable link following
"                       let g:Lf_FollowLinks = 1                " file indexing follow symbol links
"                       let g:gutentags_resolve_symlinks = 0    " tag generate follow symbol links
"               b)ycm configuration: YCM
"                   copy .ycm_extral_conf.py to top directory ;
"                   adjust setting for compile flag or generate compile database.
"                   sys_path:pending ??  --> Normally to use compile database generated by using actual compile log.
"==============================
"   20210205 friday:
"	pmenu setting
"   20210204 thursday:
"	ycm add clangd support for code completion
"   20210201 monday:
"       To capture the output of an ex command like :script into a vim text buff for easy reviewing:
"       :redir @a       " redirect the output to register a
"       :script         " run command
"       :redir END      " end the redirection
"       to paste the content of register a to a vim text buffer.
"   20210125 monday:
"       change setting for gutentag_plus:
"            change focus to quickfix window after search (optional).
"               let g:gutentags_plus_switch = 1 -->0
"       for symbol search, gutentags_plus use cscope or gtags-cscope to search target symbol;
"                          LeaderF use gtags program to search target symbol;
"   20210122 friday:
"       build project including app framwork mpp and libcedarc
"       let g:gutentags_add_default_project_roots = 0   "must add this setting for following setting. 
"       update symbol link setting for LeaderF and gutentag_plugin
"           let g:Lf_FollowLinks = 1                " file indexing follow symbol links
"           let g:gutentags_resolve_symlinks = 0    " must set to '0':tag generate follow symbol links
"           rg -L                                   " -L follow symbol links
"           20210423 friday: fatal error for the meaning of g:gutentags_resolve_symlinks,
"               g:gutentags_resolve_symlinks
                        " When set to 1, Gutentags will resolve any symlinks in
                        " the current buffer's path in order to find the project
                        " it belongs to. (That means gutentags will search the actual path of the symlinks for the root marker,so 
                        " the root maker in current prj will not be used!!)This is what you want if you're editing
                        " a symlink located outside of the project, and it
                        " points to a file inside the project. However, this is
                        " maybe not what you want if the symlink itself is
                        " part of the project(That means link one folder outside current prj into current prj, and treat it 
                        " as part of current prj)(Normally case we use).
                        " Defaults to 0.
"   20210121 thursday:
"       better use s///
"           :s///gnp  "locate one target line with given pattern
"   20210114 thursday:
"       count match:
"            1) set shortmess-=S
"            2) :%s/word//gn
"   20210113:
"   operate or use environment variable in VIM
" to adjust search directories when use gf command
"   set path=.,${PWD}/**,/usr/include,,
"           :let ${env-name} = {expr1}
"       Set environment variable {env-name} to the result of the expression {expr1}.
"           :unl[et] ${env-name}
"       Remove environment variable {env-name}.
"       Can mix {name} and ${env-name} in one :unlet command.
" plugins:
"   20210107 1638:
"   gutentags.vim:
"       1)plugin used to generate ctags and gtags;
"       2)ignore files:
"            let g:gutentags_ctags_exclude_wildignore=1
"            let g:gutentags_ctags_exclude = ['*.si4project', '*(*).[ch]', '*.cpp']
"   gutentags_plus:
"       1)Just one wrap for gutentags plugin.

"   20200106 :
"   semantic-highlight.vim:
"       1)define kinds of colors that will be used in source code;
"       2)bind defined color to text that match given pattern;
"   LeaderF:
"       1)LeaderF is one executable python script;
"       2)LeaderF script call functions defined with vim;
"            lfCmd("hi! default link Lf_hl_cursor Cursor")
"            lfCmd("call leaderf#Mru#Maps()")
"            lfCmd("let g:Lf_Debug_GtagsCmd = '%s'" % escQuote(cmd))
"       3)Provide keymap and function implementation in LeaderF source.
"       4)LeaderF will use gtags external program, if you want to ignore kinds 
"           of files, to change gtags.conf file.

"   kurio.vim color scheme
"       1)re-definition of color elements


"     <<   key map  >>
" 字 符     模 式   
" <Space>    普通、可视、选择和操作符等待
"	n       普通模式
"	v       可视和选择模式
"	s       选择模式
"	x       可视模式
"	o       操作符等待模式
"	!       插入和命令行模式
"	i       插入模式
"	l       插入、命令行和 Lang-Arg 模式的 ":lmap" 映射
"	c       命令行模式
"
"	详细的映射命令以及和模式的对应关系可以在Vim用:h map-modes
"	
"[nore]map [<args>] {lhs} {rhs}	
"	<args> 表示map命令的一些参数，其中常用的有
"		<buffer> 表示这个映射只是在当前的buffer中定义，而不是定义全局的映射
"		<expr> 表示{rhs}是一个Vim表达式 ，而不是按键序列，见下文
"		<silent> 表示静默映射，不会显示Vim在处理rhs过程中对界面产生的变化。
"        比如在Normal模式下定义了nmap <c-s> :write<cr> ，
"		按下<c-s> 后可以看到界面底部显示有write 的字样，但如果在<c-s> 前面加了<silent> ，
"		则不会显示.
"		
"		map命令，尽管rhs可组合出很多且很强的功能，但都是固定序列，
"		不能根据某个条件给出不同的序列。使用expr参数可在rhs的位置指定一个表达式，
"		vim eval这个表达式，并将表达式的值作为真正的rhs序列.
"		map-expr命令简洁、优美且灵活，可直接把一个按键序列的功能和一个函数绑定起来。
"		noremap  <expr>0     col('.') == 1 ? '^': '0'
"
"			expr 存在限制  -->Insert和Command模式下的=
"			<c-r>= 是Vim作者留给用户在Insert和Command模式下的另一个解决方案，
"			尽管看起来不如<expr> 优美，但是它没限制，可以在表达式里调用任何移动光标和改标文本的命令和函数。
"			
"			inoremap <silent><m-f> <c-r>=Exec('norm! e')<cr>
"			Insert模式下<c-r> ，本来用于输入某个寄存器的内容，
"			而= 寄存器又是一个比较特殊的存在，不像其他寄存器在输入完寄存器名之后，
"			直接返回寄存器的值，而是等待用户输入某个表达式，并eval这个表达式。
"			
"			递归映射的问题  -->
"			忽略递归映射：忽略递归映射的feedkeys函数

" mode 1: define command in vim source and provide key map, eg:
    " noremap <leader>fw :LeaderfMruCwd<CR>   " LeaderfMruCwd is one command defined in leaderf.vim
" mode 2: use defintion showing blow:
    " noremap <silent> <Plug>LeaderfBufferTop        :<C-U>Leaderf buffer --top<CR>
    " noremap <silent> <Plug>LeaderfBufferBottom     :<C-U>Leaderf buffer --bottom<CR>
    " noremap <silent> <Plug>LeaderfBufferLeft       :<C-U>Leaderf buffer --left<CR>
    " noremap <silent> <Plug>LeaderfBufferRight      :<C-U>Leaderf buffer --right<CR>
    " noremap <silent> <Plug>LeaderfBufferFullScreen :<C-U>Leaderf buffer --fullScreen<CR>

    " if want to export one key map, to use below operation:
        " call s:mapkeys(']l','<Plug>LeaderfBufferTop')
            " call s:mapkeys('[l','<Plug>LeaderfBufferBottom')
    "    or
    " map <unique> <leader>cd2 <Plug>XTablineCdDown2




"=============================> apps normally used==============>
"   diagramming/whiteboarding visualization application:
"       https://github.com/jgraph/drawio
"   xmind.exe  (Edraw.exe 9.2)
"   terminal: putty, Cmder.exe SecureCRT.exe
"   folder browser:  Q-dir8.71.exe  Everything.exe
"   sourceinsight.exe BeyondCompare.exe 010 editor.exe WinHex.exe
"   notepad++ typora.exe ultraEdit.exe
"   Audacity.exe GoldWavePortable.exe Wavosaur.exe YUView.exe MP4 Inspector.exe YUVViewer.exe tsMuxerGUI.exe
"   PotPlayer 64 bit.exe vlc.exe

