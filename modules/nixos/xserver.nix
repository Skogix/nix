{ pkgs, username, ... }: 
{
  console.keyMap = "sv-latin1";
  services.xserver = {
    enable = true;
    xkb.layout = "se";
    xkb.variant = "us_dvorak";
    displayManager.autoLogin = {
      enable = false;
      user = "${username}";
    };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
