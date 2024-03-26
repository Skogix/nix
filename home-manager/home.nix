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
    steam 
    spotify
    kitty
    wofi
    nnn
    ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";









  #programs.zsh = {
  #  enable = true;
  #  enableCompletion = true;
  #  autosuggestion.enable = true;
  #  syntaxHighlighting.enable = true;
  #  oh-my-zsh = {
  #    enable = true;
  #    plugins = [ "git" "fzf" ];
  #  };
  #  initExtraFirst = ''
  #    DISABLE_MAGIC_FUNCTIONS=true
  #    export "MICRO_TRUECOLOR=1"
  #  '';
  #  shellAliases = {
  #    # record = "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";

  #    # Utils
  #    c = "clear";
  #    cd = "z";
  #    # vim = "nvim";
  #    cat = "bat";
  #    nano = "micro";
  #    icat = "kitten icat";
  #    dsize = "du -hs";
  #    findw = "grep -rl";

  #    l = "eza --icons  -a --group-directories-first -1"; #EZA_ICON_SPACING=2
  #    ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
  #    tree = "eza --icons --tree --group-directories-first";

  #    # Nixos
  #    cdnix = "cd ~/nixos-config && codium ~/nixos-config";
  #    ns = "nix-shell --run zsh";
  #    nix-shell = "nix-shell --run zsh";
  #    nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
  #    nix-switchu = "sudo nixos-rebuild switch --upgrade --flake ~/nixos-config#nixos";
  #    nix-flake-update = "sudo nix flake update ~/nixos-config#";
  #    nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
  #    # nix-clean = "sudo nix-collect-garbage -d";
  #    # nix-cleanold = "sudo nix-collect-garbage --delete-old";
  #    # nix-cleanboot = "sudo /run/current-system/bin/switch-to-configuration boot";

  #    # Git
  #    ga   = "git add";
  #    gaa  = "git add --all";
  #    gs   = "git status";
  #    gb   = "git branch";
  #    gm   = "git merge";
  #    gpl  = "git pull";
  #    gplo = "git pull origin";
  #    gps  = "git push";
  #    gpst = "git push --follow-tags";
  #    gpso = "git push origin";
  #    gc   = "git commit";
  #    gcm  = "git commit -m";
  #    gtag = "git tag -ma";
  #    gch  = "git checkout";
  #    gchb = "git checkout -b";
  #    gcoe = "git config user.email";
  #    gcon = "git config user.name";

  #    # g = "lazygit";

  #    # python
  #    piv = "python -m venv .venv";
  #    psv = "source .venv/bin/activate";
  #  };
  #};

  #programs.zoxide = {
  #  enable = true;
  #  enableZshIntegration = true;
  #};













  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
