{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules
    ./gigabyte-hardware-configuration.nix
  ];

  networking.hostName = "gigabyte";

  boot.blacklistedKernelModules = [ "nouveau" ];

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  environment.sessionVariables = {
    AQ_DRM_DEVICES              = "/dev/dri/card0";
    GBM_BACKEND                 = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME   = "nvidia";
    LIBVA_DRIVER_NAME           = "nvidia";
  };

  services.logind = {
    lidSwitch                 = "ignore";
    lidSwitchDocked           = "ignore";
    lidSwitchExternalPower    = "ignore";
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;

    open = false;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  nix.settings.cores = 12;
}