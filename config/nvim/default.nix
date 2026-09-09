{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };

  imports = [
    ./core/settings.nix
    ./core/keymaps.nix

    ./plugins/dashboard.nix
    ./plugins/lualine.nix
    ./plugins/neo-tree.nix

    ./plugins/telescope.nix
    ./plugins/flash.nix

    ./plugins/treesitter.nix
    ./plugins/lsp.nix
    ./plugins/completion.nix

    ./plugins/autopairs.nix
    ./plugins/nvim-surround.nix
  ];
}
