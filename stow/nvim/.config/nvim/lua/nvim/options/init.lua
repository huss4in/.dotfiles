local options = {
    termguicolors = true,
    fileencoding = "utf-8",
    guifont = "FiraCode Nerd Font:h11",

    mouse = "a",

    number = true,   
    relativenumber = true,
    scrolloff = 8,
    sidescrolloff = 8,

    tabstop = 4,
    shiftwidth = 2,
    softtabstop = 4,
    showtabline = 4,
    expandtab = true,
    smartindent = true,

    ignorecase = true,
    smartcase = true,
    hlsearch = true,

    wrap = false,
    backup = false,
    undofile = true,
    writebackup = false,

    pumheight = 10,
    cmdheight = 1,

    completeopt = { "menuone", "preview" },
    conceallevel = 0,
    
    splitbelow = true,
    splitright = true,

    timeoutlen = 500,

    cursorline = true,

    signcolumn = "yes",
}

vim.opt.iskeyword:append('-')

local globals = {
  netrw_banner = 0,
  netrw_liststyle = 3,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

for k, v in pairs(globals) do
    vim.g[k] = v
end


