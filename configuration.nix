# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     tree
  #   ];
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    htop
    git
    vim
    networkmanager
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

            services.vscode-server = {
            enable = true;
            enableFHS = true;
          };

  users.users = let 
    keys = [
              "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzCmDCtlGscpesHuoiruVWD2IjYEFtaIl9Y2JZGiOAyf3V17KPx0MikcknfmxSHi399SxppiaXQHxo/1wjGxXkXNTTv6h1fBuqwhJE6C8+ZSV+gal81vEnXX+/9w2FQqtVgnG2/mO7oJ0e3FY+6kFpOsGEhYexoGt/UxIpAZoqIN+CWNhJIASUkneaZWtgwiL8Afb59kJQ2E7WbBu+PjYZ/s5lhPobhlkz6s8rkhItvYdiSHT0DPDKvp1oEbxsxd4E4cjJFbahyS8b089NJd9gF5gs0b74H/2lUUymnl63cV37Mp4iXB4rtE69MbjqsGEBKTPumLualmc8pOGBHqWIdhAqGdZQeBajcb6VK0E3hcU0wBB+GJgm7KUzlAHGdC3azY0KlHMrLaZN0pBrgCVR6zBNWtZz2B2qMBZ8Cw+K4vut8GuspdXZscID10U578GxQvJAB9CdxNUtrzSmKX2UtZPB1udWjjIAlejzba4MG73uXgQEdv0NcuHNwaLuCWxTUT5QQF18IwlJ23Mg8aPK8ojUW5A+kGHAu9wtgZVcX1nS5cmYKSgLzcP1LA1l9fTJ1vqBSuy38GTdUzfzz7AbnkRfGPj2ALDgyx17Rc5ommjc1k0gFoeIqiLaxEs5FzDcRyo7YvZXPsGeIqNCYwQWw3+U+yUEJby8bxGb2d/6YQ=="
              "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7qikwR0a4LDoMQIVvtX+gyJ41OsAOWe8RcXc4ksIBP9x1nCcSrItlgC2soADB77QGIgyeyLGmnTCtMj5/s8NdREAycPeXLii1WRakbT7oZ/hTEmvAgObpadeYJn3LhaUDNtmsnAqqh2pRpCpSsAdhfIt+YyV4VgRYSfaa12Ozp/H6NI9bJMNttmG8TmY9V4zyskV9bE+up9y8Yuck2bZV/GjQe6UWgxsiC3XPSrFFGuxyaFMRGsc8h86xVwTAmwaHESEFhRvHD4EtdPNss0jqmSI6m4AoSZQ2wq7eiH8ZiYzERF0FnEFf4UsyOTM7j78bfogNLfKrdcEIPLrNNFFc3Iarfe9CJn3DdSnwwPnhFU1MBBXSbGOp1IyN3+gpjHwLMPzozlDAVqOwx6XpnpF78VpeknFBHCbkcKC/R0MXzqf900wH3i2HvfB7v9e9EUFzCQ0vUC+1Og+BFw3F5VSo0QtZyLc4BJ/akBs5mEE6TnuWQa/GhlY8Lz7wbcV1AaBOAQdx+NTbL/+Q31SJ1XsXtGtXCrwMY9noUTyVfpGVXo7Mn4HSslmeQ9SKfYKjyetkBR/1f8a47O3rCggjBy1AlfLjgbERnXy+0Ma4T8lnPZAKt3s9Ya1JupZ7SO7D5j7WfPKP+60c372/RrX1wXsxEeLvBJ0jd8GnSCXDOuvHTQ=="
            ];
    in
  {
    root = {
            password = "password";
            openssh.authorizedKeys.keys = keys;
          };
    slavni = {
      hashedPassword = "$y$j9T$ZQcBEEq/JtPjHIMNfT.R10$3txdoeaGHQtsKvxZz/z/2LtCsG.A1isj9r5HSI.utqD";
      openssh.authorizedKeys.keys = keys;

    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
  };


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It’s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

nix = {
    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;
      trusted-users = [
        "root"
        "slavni"
        "@wheel"
      ];
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

}

