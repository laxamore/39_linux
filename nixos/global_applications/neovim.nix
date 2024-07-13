{
  programs = {
    neovim = {
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      enable = true;
      configure = {
        customRC = ''
	  set number relativenumber
    set clipboard=unnamedplus
	'';
      };
    };
  };
}