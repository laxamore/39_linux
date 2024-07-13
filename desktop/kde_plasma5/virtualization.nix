{
  # Docker
  virtualisation.docker.enable = true;

  # VirtualBox
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
    guest = {
      enable = true;
      draganddrop = true;
    };
  };
}
