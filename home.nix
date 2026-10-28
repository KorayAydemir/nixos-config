{ config, pkgs, unstable, ... }: {
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  home.stateVersion = "26.05";   # like system.stateVersion: set once, never change

  home.packages = with pkgs; [
    ripgrep
    fd
    gcc
    gnumake
    unstable.tree-sitter   # CLI that nvim-treesitter (main) uses to build parsers
  vscode-langservers-extracted   # html, css, json, eslint servers
  lua-language-server
    typescript-language-server   # ts_ls
  typescript                   # tsserver, which ts_ls drives under the hood
  bash-language-server         # bashls
  shellcheck                   # bashls uses it for linting, if present
  shfmt
      unstable.claude-code
      wl-clipboard

  ];

    programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

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

    xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/nvim";

  programs.home-manager.enable = true;
}
