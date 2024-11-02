{pkgs, lib, ...}:{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [ ]);
    extensions = with pkgs.vscode-extensions; [
      denoland.vscode-deno
      dbaeumer.vscode-eslint
      eamodio.gitlens
      visualstudioexptteam.vscodeintellicode
      intellicode-api-usage-examples
      bbenoist.nix
      jnoortheen.nix-ide
      brettm12345.nixfmt-vscode
      arrterian.nix-env-selector
      mkhl.direnv
      arcticicestudio.nord-visual-studio-code
      christian-kohler.npm-intellisense
      christian-kohler.path-intellisense
      ms-python.vscode-pylance
      ms-python.python
      ms-python.debugpy
      ms-python.debugpy
      ms-python.isort
      ms-python.black-formatter
      tabnine.tabnine-vscode
  ];
    };
  programs.stylix.targets.vscode.enable = true;
}