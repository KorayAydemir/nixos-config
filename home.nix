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
      fnm                      # Node version manager; projects pin Node in .nvmrc
      unstable.pnpm            # launcher only; projects pin pnpm via package.json "packageManager"

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
    initExtra = ''
      __wezterm_osc7() { printf '\e]7;file://%s%s\e\\' "$HOSTNAME" "$PWD"; }
      PROMPT_COMMAND="__wezterm_osc7''${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
    '';
  };

  programs.git = {
    enable = true;
    userName = "Koray Aydemir";
    userEmail = "korayaydemir99@gmail.com";
  };

    xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/nvim";


  programs.home-manager.enable = true;
}
