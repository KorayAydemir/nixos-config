{ pkgs, unstable, ... }: {
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  home.stateVersion = "26.05";   # like system.stateVersion: set once, never change

  home.packages = with pkgs; [
    ripgrep
    fd
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      gs = "git status";
      g = "git";
      v  = "nvim";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.git = {
    enable = true;
    userName = "Koray Aydemir";
    userEmail = "your-github-email@example.com";
  };

  programs.home-manager.enable = true;
}
