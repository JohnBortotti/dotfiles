{ config, pkgs, ... }:

let 
  dotfiles = pkgs.fetchFromGitHub {
    owner = "JohnBortotti";
    repo = "dotfiles";
    rev = "master";
    sha256 = "sha256-8GvvOkpj+7+QmRUgAZnX+2Nz6vxvvRyroMihdZGYi9I=";
  };

in {
  home = {
    username = "joao";
    homeDirectory = "/home/joao";
    stateVersion = "23.11";

    packages = [ 
      pkgs.htop
      pkgs.git 
      pkgs.curl 
      pkgs.docker 
      pkgs.tailscale
      pkgs.bat
      pkgs.eza
      pkgs.bash-completion
    ];

    file.".config/nvim/".source = "${dotfiles}/nvim/";
    file."/etc/tmux.conf".source = "${dotfiles}/tmux/tmux.conf";

  };

  programs.tmux = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
  };

  programs.home-manager = {
    enable = true;
  };
}

