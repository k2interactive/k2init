-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["<tab>"] = { "<cmd>bnext<cr>", desc = "Next Tab" },
    ["<S-tab>"] = { "<cmd>bprev<cr>", desc = "Prev Tab" },

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
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },

    ["<A-j>"] = { ":m .+1<CR>==", desc = "Move Line Down" },
    ["<A-k>"] = { ":m .-2<CR>==", desc = "Move Line Down" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", desc = "Move Line Down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", desc = "Move Line Up" },
  },
  i = {
    ["<A-j>"] = { "<ESC>:m .+1<CR>==gi", desc = "Move Line Down" },
    ["<A-k>"] = { "<ESC>:m .-2<CR>==gi", desc = "Move Line Up" },
  },
  -- TODO: come back to me
  -- primeagen keymap
  -- x = {
  --   ["<C-p>"] = { "\"_dP", desc = "Clone Stamp (Paste and Keep)" },
  -- },
}
