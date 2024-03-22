{ config, pkgs, ... }:

let 

in {
  home.packages = [ 
    # clang
    pkgs.gcc
    pkgs.gnumake
    pkgs.cmake

    # node / typescript
    pkgs.nodePackages.typescript-language-server
    pkgs.typescript
    pkgs.nodejs

    # ocaml
    pkgs.opam
    pkgs.ocaml 
    pkgs.ocamlformat 
    pkgs.dune_3 
    pkgs.ocamlPackages.ocaml-lsp

    # rust
    pkgs.cargo 
    pkgs.rustc
    pkgs.rust-analyzer

    # python
    pkgs.python3
    pkgs.python311Packages.pip
    pkgs.python311Packages.python-lsp-server

    # haskell  
    pkgs.ghc
    pkgs.haskellPackages.cabal-install
    # pkgs.haskellPackages.lsp
    pkgs.haskell-language-server
    
    # lua
    pkgs.lua
  ];

  programs.git = {
    enable = true;
    userName  = "JohnBortotti";
    userEmail = "joao_bortotti@hotmail.com";
  };
}

