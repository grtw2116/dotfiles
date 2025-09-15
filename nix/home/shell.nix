{ ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza --icons always --classify always";
      la = "eza --icons always --classify always --all";
      ll = "eza --icons always --long --all --git";
      tree = "eza --icons always --classify always --tree";
    };
    initContent = ''
      function peco-src () {
        local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
        if [ -n "$selected_dir" ]; then
          BUFFER="cd ''${selected_dir}"
          zle accept-line
        fi
        zle clear-screen
      }
      zle -N peco-src
      bindkey '^]' peco-src
    '';
    envExtra = ''
      [ -f ~/.OPENAI_API_KEY ] && export OPENAI_API_KEY=$(cat ~/.OPENAI_API_KEY)
      [ -f ~/.ANTHROPIC_API_KEY ] && export ANTHROPIC_API_KEY=$(cat ~/.ANTHROPIC_API_KEY)
      [ -f ~/.DEEPL_API_KEY ] && export DEEPL_API_KEY=$(cat ~/.DEEPL_API_KEY)
      [ -f ~/.GOOGLE_TRANSLATE_API_KEY ] && export GOOGLE_TRANSLATE_API_KEY=$(cat ~/.GOOGLE_TRANSLATE_API_KEY)
      [ -f ~/.GOOGLE_GENERATIVE_AI_API_KEY ] && export GOOGLE_GENERATIVE_AI_API_KEY=$(cat ~/.GOOGLE_GENERATIVE_AI_API_KEY)
    '';
  }
}