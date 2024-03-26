{ pkgs, ... }:
{  
  #hardware.opengl.enable = true;
  #hardware.opengl.driSupport = true;
  #hardware.opengl.driSupport32Bit = true;
  #hardware.enableRedistributableFirmware = true;
  #hardware.opengl.extraPackages = with pkgs; [
  #  
  #];
  #powerManagement.cpuFreqGovernor = "performance";
services.xserver.videoDrivers = [ "nvidia" ]; # If you are using a hybrid laptop add its iGPU manufacturer
hardware.opengl = {  
  enable = true;  
  driSupport = true;  
  driSupport32Bit = true;  
};



}
