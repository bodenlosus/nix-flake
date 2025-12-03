{ pkgs, ... }:
{
  imports = [ ./themes/default.nix ];
  home.packages = with pkgs; [ helix ];
  xdg.configFile."helix/config.toml".text = ''
    theme = "github_dark_high_contrast"

    [editor]
    cursorline = true
    bufferline = "multiple"
    popup-border = "all"
    end-of-line-diagnostics = "hint"
    default-yank-register = "+"

    [editor.cursor-shape]

    insert = "bar"
    normal = "block"
    select = "underline"

    [editor.file-picker]
    hidden = false

    [editor.statusline]
    left = ["mode", "spinner", "register" ]
    center = ["version-control", "file-name", "file-modification-indicator"]
    right = ["diagnostics", "selections", "position", "file-encoding", "total-line-numbers", "file-line-ending", "file-type"]
    separator = "│"
    mode.normal = "NORMAL"
    mode.insert = "INSERT"
    mode.select = "SELECT"

    [editor.lsp]
    display-inlay-hints = true

    [editor.auto-save]
    focus-lost = true
    after-delay.enable = true

    [editor.indent-guides]
    render = true
    character = "┆"
    skip-levels = 1

    [editor.gutters]
    layout = ["diff", "diagnostics", "line-numbers", "spacer"]

    [editor.inline-diagnostics]
    cursor-line = "warning"
    other-lines = "hint"

    [keys.insert]
    "C-space" = "completion"

    [keys.normal]
    "C-space" = "completion"
  '';

}
