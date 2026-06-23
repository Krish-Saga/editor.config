-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Vim select using Shift J and K 

-- Disable the spacebar key's default behaviour in  Normal and Visual modes 
vim.keymap.set({ 'n', 'v'} , '<Space>', '<Nop>', {silent = true})

-- for conciseness 
local opts = { noremap = true , silent = true }

-- save file 
vim.keymap.set( 'n', '<C-s>', '<cmd> w <CR>', opts ) 
vim.keymap.set( 'n', '<leader>w', '<cmd> w <CR>', opts ) 
-- save file without auto-formatting
vim.keymap.set ( 'n' , '<leader>wn',  '<cmd> w <CR> <cmd> !cargo fmt <CR>', opts)

-- quit file
vim.keymap.set ('n' , '<C-q>', '<cmd> q <CR>', opts) 

-- delete single character without copying into register 
vim.keymap.set( 'n' , 'x' , '"_x' , opts ) 

-- Vertical scroll and center 
vim.keymap.set( 'n', '<C-d>', '<C-d>zz' , opts) 

-- Neotree keymap for side file explorer
vim.keymap.set( 'n' , '<leader>e' , '<cmd> Neotree toggle <CR>' , opts) 


-- Resize buffer 
vim.keymap.set('n', '<Up>' , ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>' , ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>' , ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>' , ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts)
vim.keymap.set('n', '<leader>b', ':bnext<CR>', opts)

-- Windows management

vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- splits Windows Vertically 
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) --Splits Windows horizontally 
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- Make splits windows equal lenght and height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- Close current split window

-- Navigate between splits
vim.keymap.set('n' , '<C-k>' , ':wincmd k<CR>' , opts)
vim.keymap.set('n' , '<C-j>' , ':wincmd j<CR>' , opts)
vim.keymap.set('n' , '<C-h>' , ':wincmd h<CR>' , opts)
vim.keymap.set('n' , '<C-l>' , ':wincmd l<CR>' , opts)

-- Manager Tabs
vim.keymap.set('n' , '<leader>to' , ':tabnew<CR>', opts) -- Open new tab
vim.keymap.set('n' , '<leader>tx' , ':tabclose<CR>', opts) -- Close new tab 
vim.keymap.set('n' , '<leader>tn' , ':tabn<CR>', opts) -- go to next tab 
vim.keymap.set('n' , '<leader>tp' , ':tabp<CR>', opts) -- go to previous tab

-- Toggle line wrapping
vim.keymap.set('n' , '<leader>lw' , '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode 
vim.keymap.set('n' , '<' , '<gv' , opts)
vim.keymap.set('n' , '>' , '>gv' , opts)

-- Keep last yanked posting 
vim.keymap.set('v' , 'p' , '"_dP' , opts) 

-- rust format
vim.keymap.set( 'n' , '<leader>rf' , '<cmd> Telescope <CR>' , opts ) 
