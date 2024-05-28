# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### emacs風キーバインド ###
bindkey -e                       # emacs風キーバインドを有効にする


### ghqとpecoの連携 ###
# <C-g>でghq listをpecoで絞り込み、選択したディレクトリに移動する
# ref. https://zenn.dev/obregonia1/articles/e82868e8f66793
function ghqcd() {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N ghqcd
bindkey '^g' ghqcd


### history ###
HISTFILE=~/.zsh_history         # historyの保存先
HISTSIZE=10000                  # メモリ上に保存するhistoryの数
SAVEHIST=10000                  # HISTFILEに保存するhistoryの数

setopt histignorealldups        # 重複した履歴を無視する
setopt sharehistory             # 履歴を複数のシェル間で共有する


### alias ###
alias g='git'
alias gb='git branch'
alias gs='git switch'
alias gd='git diff'
alias gc='git commit'
alias gp='git pull'
alias gP='git push'
alias gl='git log'
alias ga='git add'
alias gm='git merge'
alias gr='git rebase'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# batcatがインストールされていればcatをbatcatに置き換える
if type batcat > /dev/null 2>&1; then
    alias bat='batcat'
fi

### completion ###
autoload -Uz compinit && compinit     # 補完を有効にする


# zinit がインストールされていなければインストールする
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


### zinitプラグイン ###
zinit ice depth=1; zinit light romkatv/powerlevel10k        # プロンプト
zinit light zdharma/fast-syntax-highlighting                # シンタックスハイライト
zinit light zsh-users/zsh-autosuggestions                   # 入力補完
zinit light paulirish/git-open                              # `git open`でリポジトリを開く


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


### OS固有設定 ###
[ -f $HOME/.config/zsh/.zshrc_`uname` ] && . $HOME/.config/zsh/.zshrc_`uname`

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
