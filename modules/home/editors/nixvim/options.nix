{ ... }:
{
  opts = {
    number = true;
    relativenumber = true;
    signcolumn = "yes";

    cursorline = true;
    conceallevel = 2;
    termguicolors = true;

    tabstop = 4;
    shiftwidth = 2;
    numberwidth = 2;

    autoread = true;

    foldlevel = 90;
    foldlevelstart = 90;
    foldenable = true;
  };
  diagnostic.settings = {
    virtual_lines = {
      current_line = true;
    };
    signs = true;
    underline = true;
    update_in_insert = false;
    severity_sort = true;
    virtual_text = false;
  };
  autoCmd = [
    {
      event = "BufWinEnter";
      callback.__raw = ''
        function()
          local buftype = vim.bo.buftype
          local special = {
            help = true,
            quickfix = true,
            nofile = true,
            terminal = true,
            prompt = true,
          }
          if special[buftype] then
            vim.cmd("wincmd J")
          end
        end
      '';
    }
  ];
}
