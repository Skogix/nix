{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "Skogix";
    userEmail = "skogix@gmail.com";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  home.packages = [ pkgs.gh pkgs.git-lfs ];
}
