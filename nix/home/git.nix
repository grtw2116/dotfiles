{ username, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = username;
        email = "15563588+grtw2116@users.noreply.github.com";
      };
      ghq.root = "/Users/${username}/Developer";
    };
  };
}

