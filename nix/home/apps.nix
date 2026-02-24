{ pkgs, ... }:

{
  home.packages = with pkgs; [
    raycast
    lazygit
    eza
    ripgrep
    ghq
    peco
    lua
    immersed
    ffmpeg_6-full
    notion-app
    python313
    python313Packages.uv
    go
    wails
    nodejs_22
    mas
    devcontainer
    awscli2
    sprites
    gemini-cli
  ];
}
