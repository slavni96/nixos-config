{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-vscode-server.url = "github:msteen/nixos-vscode-server";
  };

  outputs = inputs@{self, nixpkgs, nixos-vscode-server, ...}:
  {
    nixosConfigurations = {

      mysystem = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-vscode-server.nixosModules.default
          ./configuration.nix
        ];
      };
    };
  };
}
