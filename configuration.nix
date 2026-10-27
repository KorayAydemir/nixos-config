# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, unstable, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "nixos";

  programs.direnv = { enable = true; nix-direnv.enable = true; };  # per-project shells
  programs.nix-ld.enable = true;      # needed for the VS Code Remote-WSL server and other prebuilt binaries
  programs.ssh.startAgent = true;
  programs.ssh.extraConfig = ''
      AddKeysToAgent yes
  '';
  virtualisation.docker.enable = true;
  users.users.nixos.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [
    git vim wget curl gnumake
    unstable.neovim
];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
