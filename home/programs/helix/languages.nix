{
  programs.helix.languages = {
    language = [
      {
        name = "nginx";
        language-servers = [ "nginx-language-server" ];
        formatter = {
          command = "nginxfmt";
          args = [
            "-i"
            "4"
            "-"
          ];
        };
      }

      {
        name = "wgsl";
        language-servers = [ "wgsl-analyzer" ];
        formatter = {
          command = "wgslfmt";
          args = [ "-" ];
        };
      }

      {
        name = "python";
        language-servers = [
          "ty"
          "ruff"
        ];
        formatter = {
          command = "ruff";
          args = [
            "format"
            "-"
          ];
        };
      }
    ];
    language-server = {
      nginx-language-server = {
        command = "nginx-language-server";
        args = [ ];
      };
      wgsl-analyzer = {
        command = "wgsl-analyzer";
        args = [ ];
      };
      ruff = {
        command = "ruff";
        args = [ "server" ];
      };
      ty = {
        command = "ty";
        args = [ "server" ];
      };
    };
  };
}
