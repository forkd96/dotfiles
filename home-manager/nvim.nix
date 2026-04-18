{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      flavour = "macchiato";
    };

    plugins = {
      lualine.enable = true;
      nvim-tree.enable = true;
      web-devicons.enable = true;
      luasnip.enable = true;
      presence.enable = true;
      # nvim-cmp.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      mini-pairs
      # cmp_luasnip
    ];

    extraConfigLua = ''
      require('nvim-tree').setup()
      require('lualine').setup()
      require('mini.pairs').setup()

      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          require('nvim-tree.api').tree.open()
        end;
      })
    '';

    extraPackages = with pkgs; [
      xclip
      wl-clipboard
    ];
  };
}