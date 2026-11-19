{
  description = "Nix packaging for ProxySwitchboard";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          proxy-switchboard-server = pkgs.callPackage ./packages/server { };
          proxy-switchboard-client = pkgs.callPackage ./packages/client { };
        }
      );
    };
}