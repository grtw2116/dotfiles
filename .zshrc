# Powerlevel10k インスタントプロンプトを有効化。
# ~/.zshrc のトップに近い位置に置く必要があります。
# パスワード入力や [y/n]確認など、コンソール入力を必要とする初期化コードは、
# このブロックの上に置く必要があります。そのほかのコードは、このブロックの下に置いてください。
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 補完設定を有効化
autoload -Uz compinit
compinit

# 重複した履歴を無視する
setopt histignorealldups 

# 履歴を複数のシェル間で共有する
setopt sharehistory

# EDITORがviでもemacsキーバインドを使う
bindkey -e

# 1000行の履歴を保存し~/.zsh_historyに保存する
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# iterm2_shell_integration設定
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh-completions設定
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# zsh-autocompletions設定
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highligihting設定
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# プロンプトをカスタマイズするには，`p10k configure`を実行するか，~/.p10k.zshを編集します。
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
