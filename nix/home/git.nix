{ ... }:
{
  programs.git = {
    enable = true;
    userName = username;
    userEmail = "15563588+grtw2116@users.noreply.github.com";
    extraConfig.ghq.root = "/Users/${username}/Developer";
  };
}