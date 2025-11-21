{
  description = "dotfiles-ng";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  outputs = {nixpkgs, ...} @ inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} ({inputs, ...}: {
      imports = [
        (inputs.import-tree ./nix)
      ];

      inherit (inputs) systems;
    });
}
