{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };
  programs.kitty.enable = true;
}
