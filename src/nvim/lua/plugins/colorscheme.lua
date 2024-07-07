return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "main",
      styles = {
        transparency = true,
      },
      highlight_groups = {
        CursorLine = nil,
      },
      enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
