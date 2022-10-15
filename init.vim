autocmd InsertLeave * :silent !/opt/homebrew/bin/im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman

" VSCode Neovim でのみの設定
if exists('g:vscode')
	call plug#begin()
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	call plug#end()
endif
