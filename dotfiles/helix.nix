{
  home-manager.users.beaver = {
    home.file.".config/helix/config.toml".text = ''
      theme="catppuccin_mocha"

      [editor]
      auto-save=true

      [editor.cursor-shape]
      insert = "bar"
      normal = "block"
      select = "underline"

      [editor.statusline]
      left = ["mode", "read-only-indicator", "spinner"]
      center = ["file-name"]
      right = ["diagnostics", "selections", "position", "file-line-ending"]

      [editor.file-picker]
      hidden = false

      # [editor.soft-wrap]
      # enable = true
    '';
    home.file.".config/helix/languages.toml".text = ''
      [[language]]
      name = "python"
      language-servers = [ "pyright", "ruff" ]

      [language-server.pyright.config.python.analysis]
      typeCheckingMode = "basic"

      [language-server.ruff]
      command = "ruff-lsp"

      [language-server.ruff.config.settings]
      args = ["--ignore", "E501"]

      [language.formatter]
      command = "black"
      args = ["--line-length", "88", "--quiet", "-"]

    '';
  };
}

