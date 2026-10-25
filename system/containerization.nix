{
  userConfig,
  pkgs,
  lib,
  ...
}:
let
  userName = userConfig.username;
in
{
  virtualisation = {
    containers = {
      enable = true;
      registries.search = [ "docker.io" ];
    };
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
      autoPrune = {
        enable = true;
        dates = "weekly";
        flags = [ "--all" ];
      };
    };
  };

  users.users.${userName} = {
    extraGroups = [
      "podman"
    ];

    subUidRanges = [
      {
        startUid = 100000;
        count = 65536;
      }
    ];

    subGidRanges = [
      {
        startGid = 100000;
        count = 65536;
      }
    ];
  };

  environment = {
    systemPackages = [ pkgs.podman-compose ];
    sessionVariables = {
      PODMAN_COMPOSE_PROVIDER = lib.getExe pkgs.podman-compose;
      PODMAN_COMPOSE_WARNING_LOGS = "false";
    };
  };
}
