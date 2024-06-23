{ pkgs, config, ... }:
let
  settings = ''
    {
      "config": {
        "title" : "Jack's Home",
        "openLinksInNewTab": false,
        "locale": "fr-FR",
        "colors": {
          "primary": "#${config.var.theme.colors.accent}",
          "background": "#${config.var.theme.colors.bg}",
          "foreground": "#${config.var.theme.colors.fg}",
          "muted": "#${config.var.theme.colors.c8}"
        },
        "folders": [
          {
            "name": "Home",
            "links": [
              {
                "title": "Nextcloud",
                "url": "https://cloud.anotherhadi.com",
                "icon": "󰅟"
              },
              {
                "title": "Vaultwarden",
                "url": "https://vault.anotherhadi.com",
                "icon": ""
              }
            ]
          },
          {
            "name": "Admin",
            "links": [
              {
                "title": "Uptime Kuma",
                "url": "https://kuma.anotherhadi.com",
                "icon": "󱎫"
              },
              {
                "title": "Adguard Home",
                "url": "http://192.168.2.24:3001",
                "icon": "󰷱"
              },
              {
                "title": "Proxmox",
                "url": "https://192.168.2.17:8006",
                "icon": ""
              },
              {
                "title": "Cloudflare",
                "url": "https://dash.cloudflare.com/",
                "icon": ""
              },
              {
                "title": "Tailscale",
                "url": "https://login.tailscale.com/admin/machines",
                "icon": "󰖂"
              }
            ]
          }
        ]
      }
    }
  '';

  package = pkgs.buildNpmPackage {
    pname = "homepage";
    version = "0.0.0";

    src = pkgs.fetchFromGitHub {
      owner = "anotherhadi";
      repo = "homepage";
      rev = "19f56771ae7ac04e2710cbde763f70bb097eb250";
      hash = "sha256-8IzXcQ/hm2ZDzFKUL4B3501PoWoEOiKIN7rP2UrvG84=";
    };

    # npmDepsHash = lib.fakeHash;
    npmDepsHash = "sha256-bG+CHTq2Rst3JMxsjAC81KhK+G7WwsTVD1eyP87g0z4=";

    buildPhase = ''
      npm install
      cp ${
        pkgs.writeText "src/routes/config.json" settings
      } src/routes/config.json
      npm run build
      mkdir $out
      mv build $out
    '';

    meta = {
      description = "homepage";
      homepage = "https://github.com/anotherhadi/homepage";
    };
  };

in {
  services.nginx.virtualHosts."home.anotherhadi.com" = {
    serverAliases = [ "jack.anotherhadi.com" ];
    enableACME = true;
    root = package + "/build";
  };
}