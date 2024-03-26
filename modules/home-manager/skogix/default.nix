{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.neovim.enable = true;
  programs.steam.enable = true;
  programs.kitty.enable = true;
}
