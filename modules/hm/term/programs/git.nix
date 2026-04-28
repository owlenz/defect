{
  programs.git = {
    enable = true;
    ignores = [
      ".#*"
      "node_modules"
    ];
    settings = {
      user = {
        name = "Saif Al-Din Samy";
        email = "saifowlenzz@proton.me";
        username = "owlenz";
      };
      core = {
        editor = "emacsclient -c";
        credential.helper = "store";
      };

    };
  };
}
