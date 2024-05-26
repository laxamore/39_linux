{
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
            "git"
        ];
      };

      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
    };
  };
}