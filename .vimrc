
"-------------------
"Neo bundle
"

set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim.git
	call neobundle#rc(expand('~/.vim/.bundle'))
endif

NeoBundle	'git://github.com/altercation/vim-colors-solarized.git'	
NeoBundle	'git://github.com/vim-scripts/SrcExpl.git'
NeoBundle	'git://github.com/Shougo/neocomplcache.git'
NeoBundle	'git://github.com/vim-scripts/Trinity.git'
NeoBundle	'git://github.com/vim-scripts/taglist.vim.git'
NeoBundle	'git://github.com/scrooloose/nerdcommenter.git'
NeoBundle	'git://github.com/tpope/vim-fugitive.git'
NeoBundle	'git://github.com/sophacles/vim-processing.git'

filetype plugin on
filetype indent on

"-------------------
"Color Schemer 'solarized'
set	background=dark
colorscheme	solarized

"------------------
"デフォルトのエンコード設定
set	encoding=utf-8
"------------------
"
set	incsearch
set	hlsearch


"タブ幅の設定
set	tabstop=4
set	softtabstop=4
set	shiftwidth=4

"------------------
"NeoComplCacheの設定

let	g:neocomplcache_enable_at_startup = 1
" snippet ファイルの保存先
let g:neocomplcache_snippets_dir='~/.vim/snippets'
 " dictionary
let g:neocomplcache_dictionary_filetype_lists = {
		\ 'default' : '',
	\ 'objc' : $HOME . '/.vim/dict/objc.dict'
\ }
" 日本語をキャッシュしない
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" 補完候補の数
let g:neocomplcache_max_list = 5
" 1番目の候補を自動選択
let g:neocomplcache_enable_auto_select = 1
" 辞書読み込み
noremap  <Space>d. :<C-u>NeoComplCacheCachingDictionary<Enter>
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" C-jでオムニ補完
inoremap <expr> <C-j> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"
" C-kを押すと行末まで削除
inoremap <C-k> <C-o>D
" C-nでneocomplcache補完
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#cancel_popup()


"Trinity関連のオプションは，trinity.vim(プラグイン本体)をいじるべし
""------------------
""TagListの設定
"set	tags=tags

"let Tlist_Show_One_File = 1
"let Tlist_Exit_OnlyWindow = 1
"noremap <Leader>f :TlistToggle<CR>        "taglist key


""------------------
""SourceExplorer設定
""
""自動でプレビューを表示する。TODO:うざくなってきたら手動にする。またはソースを追う時だけ自動に変更する。
""let g:SrcExpl_RefreshTime   = 1
"""プレビューウインドウの高さ
"let g:SrcExpl_winHeight     = 9
""tagsは自動で作成する
"let g:SrcExpl_isUpdateTags    = 1
"let	g:SrcExpl_updateTagsCmd	= "ctags -R"
"""マッピング
"let g:SrcExpl_RefreshMapKey = "<Space>"
"let g:SrcExpl_GoBackMapKey  = "<C-b>"
"nmap <F8> :SrcExplToggle<CR>



