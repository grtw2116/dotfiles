{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    lazygit
    eza
    ripgrep
    ghq
    peco
    lua
    python313
    python313Packages.uv
    go
    wails
    nodejs_22
    devcontainer
    awscli2
    gemini-cli
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    raycast
    immersed
    ffmpeg_6-full
    notion-app
    mas
  ];
}
