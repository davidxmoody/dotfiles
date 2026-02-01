return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "pyrightconfig.json", ".git" },
  settings = {
    python = {
      analysis = {
        diagnosticSeverityOverrides = { reportUnusedExpression = "none" },
      },
    },
  },
}
