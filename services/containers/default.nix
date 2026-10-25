{
  virtualisation.oci-containers.containers = {
    cybarbot = import ./cybarbot.nix;
    degoog = import ./degoog.nix;
  };
}
