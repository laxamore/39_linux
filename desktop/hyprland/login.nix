{ pkgs, ... }:

{
  programs.regreet.enable = true;

  services.greetd = {
    enable = true;
    vt = 7; # The virtual console (tty) that greetd should use.
  };

  # unlock keyring on login
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
}