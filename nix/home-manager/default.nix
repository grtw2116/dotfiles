{ pkgs, ... }:
let
  username = "grtw2116";
  lsp = with pkgs; [ nil lua-language-server ];
  dap = with pkgs; [ vscode-js-debug ];
  formatter = with pkgs; [
    stylua
    google-java-format
    biome
    prettierd
    shfmt
    nixfmt-classic
    nodePackages.prettier
    python313Packages.autopep8
    python313Packages.python-lsp-server
  ];
in {
  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.11";

    # パッケージ単体で完結するものはpackagesに記載
    packages = with pkgs; [
      raycast
      lazygit
      chatgpt
      vscode
      eza
      ripgrep
      slack
      ghq
      peco
      obsidian
      lua
      tailscale
      immersed
      gdtoolkit_4
      claude-code
      ffmpeg_6-full
      notion-app
      python313
      python313Packages.uv
    ];
  };

  # パッケージ単体で完結しないものはprogramsに記載
  # (.config/以下の設定ファイルを読み込む必要がある、など)
  # 
  # INFO: 
  # ここでインストールされるgitやneovimは**Nixパッケージではない**。
  # Nixは**それ単体で完結したパッケージ**をビルドし提供するツール。
  # NixOSやNix-darwinは、**OSを1つのパッケージ**として扱う。
  # gitやneovimはパッケージを構成するプログラムでしかなく、設定ファイルもパッケージ内部に含まれる。
  programs = {
    git = {
      enable = true;
      userName = username;
      userEmail = "15563588+grtw2116@users.noreply.github.com";
      extraConfig.ghq.root = "/Users/${username}/Developer";
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraPackages = lsp ++ dap ++ formatter;
      extraPython3Packages = pyPkgs: with pyPkgs; [ autopep8 ];
      withNodeJs = true;
    };
    zsh = {
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
        [ -f ~/.ANTHROPIC_API_KEY ] && export ANTHROPIC_API_KEY=$(cat ~/.ANTHROPIC_API_KEY)
        [ -f ~/.DEEPL_API_KEY ] && export DEEPL_API_KEY=$(cat ~/.DEEPL_API_KEY)
        [ -f ~/.GOOGLE_TRANSLATE_API_KEY ] && export GOOGLE_TRANSLATE_API_KEY=$(cat ~/.GOOGLE_TRANSLATE_API_KEY)
        [ -f ~/.GOOGLE_GENERATIVE_AI_API_KEY ] && export GOOGLE_GENERATIVE_AI_API_KEY=$(cat ~/.GOOGLE_GENERATIVE_AI_API_KEY)
      '';
    };

    home-manager = { enable = true; };
  };

  # Neovimの設定ファイルを配置
  xdg.configFile = {
    "nvim" = {
      source = ../../nvim;
      recursive = true;
    };
    "ghostty" = {
      source = ../../ghostty;
      recursive = true;
    };
  };
}
