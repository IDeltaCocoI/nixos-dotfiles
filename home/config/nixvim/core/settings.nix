{
  programs.nixvim = {
    # -- Leader key --
    globals.mapleader = " ";

    opts = {
      # -- Line numbers --
      number = true;
      # -- Relative numbers --
      relativenumber = true;

      # -- Tabs to spaces --
      expandtab = true;
      # -- Indent size --
      shiftwidth = 2;
      # -- Tab display size --
      tabstop = 2;
      # -- Smart auto-indent --
      smartindent = true;

      # -- System clipboard --
      clipboard = "unnamedplus";
      # -- Persistent undo --
      undofile = true;

      # -- Ignore case in search --
      ignorecase = true;
      # -- Match case if uppercase --
      smartcase = true;

      # -- Keep sign column fixed --
      signcolumn = "yes";
      # -- Keep context around cursor --
      scrolloff = 8;
      # -- Faster update time --
      updatetime = 1;

      # -- Active highlight on current line --
      cursorline = true;
      # -- Highlight ONLY the line number --
      cursorlineopt = "number";
    };
  };
}
