local ok, _ = pcall(require, "lspconfig")
if not ok then
  return print "  Couldn't load lspconfig theme"
end

require("nvim.lsp.lsp-installer")
require("nvim.lsp.handlers").setup()

