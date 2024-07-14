{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    ripgrep
    fd
  ]);

  programs.lazygit = {
    enable = true;
    settings = {
      os = {
        edit = "nvim {{filename}}";
        editAtLine = "nvim {{filename}} +{{line}}";
        editAtLineAndWait = "nvim {{filename}} +{{line}}";
        editInTerminal = true;
      };
    };
  };

  home.file."./.config/nvim/" = {
     source = ./nvim;
     recursive = true;
   };

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    enable = true;
    extraConfig = ''
      set number relativenumber
      set clipboard=unnamedplus
    '';
    plugins = with pkgs.vimPlugins; [
      # LSP
      lsp-zero-nvim
      nvim-lspconfig
      lazy-lsp-nvim

      # Copilot
      copilot-lua
      copilot-vim
      copilot-cmp

      # Comment
      commentary

      # Tree File Explorer
      nvim-tree-lua

      # Colorscheme
      catppuccin-nvim

      # Telescope
      telescope-nvim

      # Treesitter
      nvim-treesitter.withAllGrammars

      # Git
      lazygit-nvim

      # Icons
      nvim-web-devicons

      # Appearance
      noice-nvim
      bufferline-nvim
      lualine-nvim
    ];
  };
}