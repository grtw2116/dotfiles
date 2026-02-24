{ pkgs, ... }:
let
  lsp = with pkgs; [
    nil
    lua-language-server
    python313Packages.python-lsp-server
    gopls
  ];
  dap = with pkgs; [ vscode-js-debug ];
  formatter = with pkgs; [
    stylua
    google-java-format
    biome
    prettierd
    shfmt
    nixfmt
    nodePackages.prettier
    python313Packages.autopep8
  ];
  extraPackages = lsp ++ dap ++ formatter;
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = extraPackages;
    extraPython3Packages = pyPkgs: with pyPkgs; [ autopep8 ];
    withNodeJs = true;
  };

  # neovimの設定ファイルをシンボリックリンクで配置
  xdg.configFile."nvim" = {
    source = ../../nvim;
    recursive = true;
  };
}

