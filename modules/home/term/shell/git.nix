{
  flake.modules.homeManager.git =
    { ... }:
    {
      programs.git = {
        enable = true;
        ignores = [
          ".#*"
          "node_modules"
        ];
        signing.format = null;
        settings = {
          user = {
            name = "Saif Al-Din Samy";
            email = "saifowlenzz@proton.me";
            username = "owlenz";
          };
          url = {
            "ssh://git@github.com:" = {
              insteadOf = "https://github.com/";
            };
          };
          core = {
            editor = "emacsclient -c";
            credential.helper = "store";
          };
        };
      };
    };
}
