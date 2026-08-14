{
  pkgs,
  ...
}:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "my-plugin";
      src = pkgs.fetchFromGitHub {
        owner = "NotAShelf";
        repo = "direnv.nvim";
        rev = "9258f9f10c4c729d8296fce0e3ecb12543daad06";
        hash = "sha256-b5PpmkYWaDGLNcu+36tRR5ycATHYBjs9WrV8/jfmooQ";
      };
    })
  ];
  extraConfigLua = ''
    require("direnv").setup({})
  '';
}
