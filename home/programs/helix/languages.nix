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
    };
  };
}
