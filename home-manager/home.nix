# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
    outputs.homeManagerModules.discord
    outputs.homeManagerModules.kitty
    outputs.homeManagerModules.wofi
    outputs.homeManagerModules.bat 
    outputs.homeManagerModules.btop 
    outputs.homeManagerModules.cava 
    #outputs.homeManagerModules.gaming 
    outputs.homeManagerModules.git 
    outputs.homeManagerModules.gtk 
    #outputs.homeManagerModules.hyprland 
    outputs.homeManagerModules.mako 
    #outputs.homeManagerModules.starship 
    outputs.homeManagerModules.swaylock 
    outputs.homeManagerModules.waybar 
    outputs.homeManagerModules.zsh 

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix

  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "skogix";
    homeDirectory = "/home/skogix";
  };

  #wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
      ];
    };
  };

  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;
  #programs.neovim.coc.enable = true;

  home.packages = with pkgs; [ 
    #steam 
    spotify
    #kitty
    wofi
    nnn
    nerdfonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    twemoji-color-font
    noto-fonts-emoji
    ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";




 fonts.fontconfig.enable = true;




  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
