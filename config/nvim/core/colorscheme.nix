{
  programs.nixvim.colorschemes.material = {
    enable = true;
    settings = {
      # La variante "oceanic" donne les tons bleus/cyan d'Adapta
      style = "oceanic"; 
      
      disable = {
        # Passe à false si tu veux un fond opaque classique
        background = true; 
      };
    };
  };
}
