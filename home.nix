{ config, pkgs, ... }:

{
  # FIXME: discourse.nixos.org/t/home-manager-doesnt-seem-to-recognize-sessionvariables/8488/11
  home.sessionVariables = {
    EDITOR = "hx";
  };

  home.packages = with pkgs; [
    # TODO: github.com/ibraheemdev/modern-unix
    duf
  ];

  # TODO: LSP
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };
  };

  # TODO: enable and config delta
  # repo:^github\.com/nix-community/home-manager$ delta
  programs.git = {
    enable = true;
    userName = "Minghong Xu";
    userEmail = "minghong@minghongxu.name";
    lfs.enable = true;
    extraConfig.init.defaultBranch = "main";
  };
}
