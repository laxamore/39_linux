{ pkgs, ... }:

{
  imports = [
    ./zsh
    ./daw
    ./neovim
  ];

  home.packages = (with pkgs; [
    # Web Browsers
    brave
    
    # Communication
    discord
    zoom-us
    
    # Development Tools
    vscode
    dotnet-runtime
    postman
    dbeaver-bin
    docker-compose
    kicad
    git
    stm32cubemx
    python39
    kingstvis
    
    # Password Manager
    keepassxc
    
    # Cloud Services
    nextcloud-client
    
    # Multimedia
    mpv
    pavucontrol
    
    # Utility Tools
    appimage-run
    tmux
    neofetch
    unrar
    
    # Office
    libreoffice
    
    # Hardware Utilities
    usbutils
    pciutils
    lshw
    
    # 3D Printing
    bambu-studio

    # Recording
    obs-studio
  ]);

}
