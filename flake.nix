{
  description = "Neovim flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    toke-flake.url = "github:shebpamm/toke";
    toke-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-compat, toke-flake }: {
    overlay = final: prev: {
      toke-rs = toke-flake.defaultPackage;
    };
  };
}
