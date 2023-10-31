### XDG ###
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

### editor ###
export EDITOR="nvim"

### zsh ###
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

##### Go #####
export GOPATH=${XDG_DATA_HOME}/go                # Go製パッケージのインストール先
export PATH=$PATH:$GOPATH/bin                    # Go製パッケージの実行ファイルのパス

### OpenAI API key ###
export OPENAI_API_KEY="$(cat $HOME/.openai_key)"
