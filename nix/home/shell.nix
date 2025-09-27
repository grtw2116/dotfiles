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
      for key in OPENAI_API_KEY ANTHROPIC_API_KEY DEEPL_API_KEY \
                 GOOGLE_TRANSLATE_API_KEY GOOGLE_GENERATIVE_AI_API_KEY; do
        [ -f ~/.$key ] && export $key=$(< ~/.$key)
      done
    '';
  };
}
