# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  #zsh = import ./zsh/default.nix;
  discord = import ./discord/default.nix;
  kitty = import ./kitty/default.nix;
  wofi = import ./wofi/default.nix;
  bat = import ./bat/default.nix;
  btop = import ./btop/default.nix;
  cava = import ./cava/default.nix;
  gaming = import ./gaming/default.nix;
  git = import ./git/default.nix;
  gtk = import ./gtk/default.nix;
  hyprland = import ./hyprland/default.nix;
  mako = import ./mako/default.nix;
  starship = import./starship/default.nix;
  swaylock = import ./swaylock/default.nix;
  waybar = import ./waybar/default.nix;
  zsh = import ./zsh/default.nix;
}
