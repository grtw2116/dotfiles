{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
    immersed
    gdtoolkit_4
    claude-code-latest
    ffmpeg_6-full
    notion-app
    python313
    python313Packages.uv
    go
    wails
    nodejs_22
    jetbrains.rider
    jetbrains-toolbox
    google-chrome
  ];
}