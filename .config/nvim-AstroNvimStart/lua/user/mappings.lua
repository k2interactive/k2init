-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {

  -- first key is the mode
  n = {
    ["<leader>Q"] = { "<cmd>q!<cr>", desc = "Quick write and quit" },

    ["<leader>ucl"] = { "<cmd>set cursorline!<cr>", desc = "Toggle cursor line highlight" },
    ["<leader>ucc"] = { "<cmd>set cursorcolumn!<cr>", desc = "Toggle cursor line highlight" },
    
    ["<leader><tab>"] = { "<cmd>bnext<cr>", desc = "Next Tab" },
    ["<leader><S-tab>"] = { "<cmd>bprev<cr>", desc = "Prev Tab" },

    ["<leader>\\"] = { "<C-w>t<C-w>K", desc = "Flip to Horizontal" },
    ["<leader>|"] = { "<C-w>t<C-w>H", desc = "Flip to Vertical" },

    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    ["<leader>b"] = { name = "Buffers" },

    ["j"]      = { ":m .+1<CR>==", desc = "Move Line Down" },
    ["<S-Down>"] = { ":m .+1<CR>==", desc = "Move Line Down" },
    ["k"]      = { ":m .-2<CR>==", desc = "Move Line Up" },
    ["<S-Up>"]   = { ":m .-2<CR>==", desc = "Move Line Up" },  

    ["<S-tab>"] = { "<<" },
    ["<tab>"]   = { ">>" },
       
    ["<leader>o"] = { "o<ESC>", desc = "Blank line below" },
    ["<leader>O"] = { "O<ESC>", desc = "Blank line above" },
    
    ["u"] = { "gUiw", desc = "Quick uppercase word" },
    ["l"] = { "guiw", desc = "Quick lowercase word" },
    
    -- Move half page and center
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },

    ["n"] = { "nzz", desc = "Next search and center" },
    ["N"] = { "Nzz", desc = "Prev search and center" },
    ["m"] = { "/MARK<cr>", desc = "Mark Search" },

    ["r"] = { "w<cmd>source %<cr>", desc = "Save and source current file" },

    -- remap of explorer toggle
    ["<leader>0"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      desc = "Toggle Explorer Focus",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["j"]      = { ":m '>+1<CR>gv=gv", desc = "Move Line Down" },
    ["<S-Down>"] = { ":m '>+1<CR>gv=gv", desc = "Move Line Down" },
    ["k"]      = { ":m '<-2<CR>gv=gv", desc = "Move Line Up" },
    ["<S-Up>"]   = { ":m '<-2<CR>gv=gv", desc = "Move Line Up" },
  },
  i = {
    ["j"]      = { "<ESC>:m .+1<CR>==gi", desc = "Move Line Down" },
    ["<S-Down>"] = { "<ESC>:m .+1<CR>==gi", desc = "Move Line Down" },
    ["k"]      = { "<ESC>:m .-2<CR>==gi", desc = "Move Line Up" },
    ["<S-Up>"]   = { "<ESC>:m .-2<CR>==gi", desc = "Move Line Up" },

    ["u"] = { "<ESC>gUiw", desc = "Quick uppercase word" },
    ["l"] = { "<ESC>guiw", desc = "Quick lowercase word" },

  },
  -- TODO: come back to me
  -- primeagen keymap
  -- x = {
  --   ["<C-p>"] = { "\"_dP", desc = "Clone Stamp (Paste and Keep)" },
  -- },
}
