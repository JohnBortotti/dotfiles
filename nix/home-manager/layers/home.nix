{ config, pkgs, dotfiles, ... }:

let 

in {
  home = {
    username = "joao";
    homeDirectory = "/home/joao";
    stateVersion = "23.11";

    packages = [ 
      pkgs.htop
      pkgs.git 
      pkgs.curl 
      pkgs.bat
      pkgs.eza
      pkgs.bash-completion
      pkgs.tmux
    ];

    file.".config/nvim/".source = "${dotfiles}/nvim/";
    file.".config/tmux/".source = "${dotfiles}/tmux/";
  };

  programs.neovim = {
    enable = true;
  };

  programs.home-manager = {
    enable = true;
  };
}

