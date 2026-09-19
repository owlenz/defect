{ inputs, ... }:
let
  searxng_url = "http://localhost:8888/search?q={query}&language=auto&time_range=&safesearch=0&categories=general";
  startpage_url = "https://www.startpage.com/do/metasearch.pl?query={query}";
  ddg_url = "https://duckduckgo.com/?q={query}&ia=web";
in
{
  flake-file.inputs.hister = {
    url = "github:asciimoo/hister";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.flake-parts.follows = "flake-parts";
  };
  flake.modules.nixos.hister = { ... }: {
    imports = [ inputs.hister.nixosModules.default ];

    services.hister = {
      enable = true;
      dataDir = "/var/lib/hister";
      port = 4433;
      settings = {
        app = {
          search_url = ddg_url;
        };
      };
    };
  };
}
