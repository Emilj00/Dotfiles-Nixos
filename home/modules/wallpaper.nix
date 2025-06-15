{ config, lib, pkgs, ... }:

{
  home.packages = lib.mkAfter [ 
    pkgs.swww
  ];

  systemd.user.services.swww = {
    Unit = {
      Description = "swww daemon";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.swww}/bin/swww-daemon";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
