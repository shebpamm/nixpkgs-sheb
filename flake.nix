{
  description = "Neovim flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    toke-flake.url = "github:shebpamm/toke";
    toke-flake.inputs.nixpkgs-unstable.follows = "nixpkgs";
    xcli-flake.url = "github:shebpamm/copilot-x-cli";
    xcli-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-compat, toke-flake, xcli-flake }: {
    overlay = final: prev: {
      toke-rs = toke-flake.packages.${prev.system}.toke-rs;
      xcli = xcli-flake.packages.${prev.system}.default;
    };
  };
}
