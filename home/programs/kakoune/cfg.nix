{ pkgs, ... }:
{
  kakouneConfig =
    { plugins, config }:
    let
      config_file = pkgs.writeTextFile (
        let
          name = "kakrc.kak";
        in
        {
          inherit name;
          destination = "/share/kak/autoload/${name}";
          text = config;
        }
      );
    in
    pkgs.kakoune.override {
      plugins = [ config_file ] ++ plugins;
    };
}
