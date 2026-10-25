{
  description = "cybardev/homelab/nixos";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  outputs =
    inputs:
    let
      userConfig = rec {
        nickname = "Ace";
        username = "sage";
        hostname = "aspire";
        home = "/home/${username}";
        locale = "en_CA.UTF-8";
        timezone = "America/Halifax";
        nixos = "${home}/.config/nixos";
        system = "x86_64-linux";
      };
    in
    {
      nixosConfigurations.${userConfig.hostname} = inputs.nixpkgs.lib.nixosSystem {
        modules = [ ./configuration.nix ];
        specialArgs = { inherit inputs userConfig; };
      };
    };
}
