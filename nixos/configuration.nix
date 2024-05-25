{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules
      ./fonts
    ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
       efiSupport = true;
       device = "nodev";
    };
  };

  users.users.laxa = {
    isNormalUser = true;
    description = "laxa";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  networking.hostName = "laxa";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    killall
    wget
    curl
    htop
  ];

  programs = {
    neovim = {
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      enable = true;
      configure = {
        customRC = ''
	  set number relativenumber
	'';
      };
    };

    dconf.enable = true;
  };

  # Polkit
  security.polkit = {
    enable = true;
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (
	  subject.isInGroup("users")
	    && (
	      action.id == "org.freedesktop.login1.reboot" ||
	      action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
	      action.id == "org.freedesktop.login1.power-off" ||
	      action.id == "org.freedesktop.login1.power-off-multiple-sessions"
	    )
	  )
	{
	  return polkit.Result.YES;
	}
      })
    '';
  };

  systemd = {
    user.services.lxqt-policykit-agent = {
      description = "lxqt-policykit-agent";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
	ExecStart = "${pkgs.lxqt.lxqt-policykit}/libexec/lxqt-policykit-agent";
	Restart = "on-failure";
	RestartSec = 1;
	TimeoutStopSec = 10;
      };
    };
  };

  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  system.stateVersion = "23.11";
}
