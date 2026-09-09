{
  programs.nixvim.plugins.nvim-surround = {
    enable = true;
    settings = {
      keymaps = {
        # En Nix, on utilise 'false' ou 'null' pour désactiver un mappage par défaut (l'équivalent de nil)
        insert = false;
        insert_line = false;
        change = false;
        
        # Tes raccourcis personnalisés
        normal = "ya";
        normal_line = "yA";
        delete = "da";
      };
    };
  };
}
