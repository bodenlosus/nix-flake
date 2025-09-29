# My shell configuration
{
  pkgs,
  lib,
  config,
  ...
}:
{

  home.packages = with pkgs; [
    bat
    ripgrep
    tldr
    sesh
  ];

  home.sessionPath = [ "$HOME/go/bin" ];

  programs.nushell = {
    enable = true;
    extraConfig = # nushell
    ''
        let carapace_completer = {|spans|
          carapace $spans.0 nushell ...$spans | from json
        }

        $env.STARSHIP_SHELL = "nu"      

        def create_left_prompt [] {
          starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
        }      
        def create_right_prompt [] {
          starship prompt --right --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
        }      

        $env.PROMPT_COMMAND = { || create_left_prompt }      
        $env.PROMPT_COMMAND_RIGHT = { || create_right_prompt }

        $env.PROMPT_INDICATOR = ""
        $env.PROMPT_INDICATOR_VI_INSERT = ": "
        $env.PROMPT_INDICATOR_VI_NORMAL = "〉"
        $env.PROMPT_MULTILINE_INDICATOR = "::: "

        $env.config = {

         show_banner: false,
         completions: {
         case_sensitive: false # case-sensitive completions
         quick: true    # set to false to prevent auto-selecting completions
         partial: true    # set to false to prevent partial filling of the prompt
         algorithm: "fuzzy"    # prefix or fuzzy
         external: {
         # set to false to prevent nushell looking into $env.PATH to find more suggestions
             enable: true 
         # set to lower can improve completion performance at the cost of omitting some options
             max_results: 100 
             completer: $carapace_completer # check 'carapace_completer' 
           }
         }
        } 
        '';
    # NOTE- for btop to show gpu usage
    #may want to check the driver version with:
    #nix path-info -r /run/current-system | grep nvidia-x11
    #and
    #nix search nixpkgs nvidia_x11
    # sessionVariables = {
    #   LD_LIBRARY_PATH = lib.concatStringsSep ":" [
    #     "${pkgs.linuxPackages_latest.nvidia_x11_beta}/lib" # change the package name according to nix search result
    #     "$LD_LIBRARY_PATH"
    #   ];
    # };

    shellAliases = {
      c = "clear";
      clera = "clear";
      celar = "clear";
      e = "exit";
      cd = "z";
      ls = "eza --icons=always --no-quotes";
      tree = "eza --icons=always --tree --no-quotes";
      sl = "ls";
      open = "${pkgs.xdg-utils}/bin/xdg-open";
      icat = "${pkgs.kitty}/bin/kitty +kitten icat";
      ssh = "kitten ssh";

      wireguard-import = "nmcli connection import type wireguard file";

      notes = "nvim ~/nextcloud/Notes/index.md --cmd 'cd ~/nextcloud/Notes' -c ':Telescope find_files'";
      note = "notes";

      # git
      g = "lazygit";
      ga = "git add";
      gc = "git commit";
      gcu = "git add .; git commit -m 'Update'";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
      gd = "git diff";
      gco = "git checkout";
      gcb = "git checkout -b";
      gbr = "git branch";
      grs = "git reset HEAD~1";
      grh = "git reset --hard HEAD~1";

      gaa = "git add .";
      gcm = "git commit -m";

      nixsh = "nix-shell -p --run nu";
      kitty = "kitty -1";
    };
  };

  stylix.targets.nushell.enable = true;
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}
