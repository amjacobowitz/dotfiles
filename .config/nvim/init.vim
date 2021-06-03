" set line numbers on left
set number

syntax on
filetype on
filetype plugin on
filetype indent on

set path+=**

set smartindent

set signcolumn=yes

set pumheight=10

set nocompatible              " be iMproved, required

set clipboard=unnamedplus " copy paste to system clipboard

" displays what you are sed in real-time
" set inccommand=split

" let vim-plug manage plugins
call plug#begin('~/.vim/plugged')

"Plugins
" Start Linting
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/hrsh7th/nvim-compe'
Plug 'https://github.com/glepnir/lspsaga.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/kabouzeid/nvim-lspinstall'
Plug 'https://github.com/nvim-lua/popup.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/folke/lsp-trouble.nvim'
" Stop Linting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://github.com/windwp/nvim-autopairs'
Plug 'https://github.com/windwp/nvim-ts-autotag'
Plug 'kyazdani42/nvim-web-devicons'


Plug 'https://github.com/yuezk/vim-js'
Plug 'danro/rename.vim'                  " Rename files inline
Plug 'maxmellon/vim-jsx-pretty'          " syntax highlighting for js/jsx
Plug 'HerringtonDarkholme/yats.vim'      " syntax highlighting for ts/tsx
Plug 'tpope/vim-rails'                   " Rails utility
Plug 'elixir-editors/vim-elixir'         " syntax highlighting for elixir
Plug 'scrooloose/nerdtree'               " View file tree
Plug 'easymotion/vim-easymotion'         " Easymotion for finding and highlighting in files
Plug 'ntpeters/vim-better-whitespace'    " Highlights trailing whitespace with :StripWhitespace to remove
Plug 'rakr/vim-one'                      " Color scheme
Plug 'https://github.com/navarasu/onedark.nvim'
Plug 'tpope/vim-fugitive'                " incoporate git into vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " FZF fuzzy finder to replace ctrl-p
Plug 'junegunn/fzf.vim'                  " FZF fuzzy finder to replace ctrl-p
" All of your Plugins must be added before the following line
call plug#end()           " required

" map the leader to comma
let mapleader=" "

" if hidden not set, TextEdit might fail.
set hidden

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" make switching back to the previous buffer easier
nnoremap <Leader><Leader> <c-^>

"Automatically trim whitespace in js and ruby files
"autocmd FileType javascript autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType ruby autocmd BufWritePre * :%s/\s\+$//e

" Turn off swp files
set nobackup
set nowritebackup
set noswapfile

set autoread " Autoload files that have changed

set tabstop=2         " number of visual spaces per TAB
set softtabstop=2     " number of spaces in tab when editing
set shiftwidth=2      " size of an indent
set expandtab         " tabs are spaces
set showcmd           " show command in bottom bar
set showmatch         " highlight matching [{()}]
set incsearch         " search as characters are entered
set hlsearch          " highlight matches
set wrapscan          " if search reaces the bottom of a file, wraps back to top
set ignorecase        " makes searches case insensitive
set autoindent        " always uses autoindenting
set copyindent        " copy the previous indentation on autoindenting
set smarttab          " make 'tab' inset indents instead of tabs at the beg of line
set cursorline        " highlight current line

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Smart resizing
set wildmenu " Enables a menu at the bottom of the vim window.
set wildmode=list:longest,list:full
set winwidth=84 " Window size
set winheight=10
set winminheight=5

" Adjusting buffers height
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Adjusting buffers width
noremap <C-]> :vertical resize +5<return>
noremap <C-[> :vertical resize -5<return>

" Redraw pane sizes
set lazyredraw
set redrawtime=1000 " Stop highlighting if it takes more than a second

" === zoom a vim pane, <C-w>= to re-balance ===
nnoremap <Leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <Leader>= :wincmd =<CR>

" === Move up and down by visible lines if current line is wrapped
nnoremap j gj
nnoremap k gk

" Unbind esc
inoremap jk <esc>
inoremap kj <esc>

" Auto-close ERB tags
inoremap <% <% %><Esc>bi
inoremap <%= <%= %><Esc>bi

"remap split screen navigation
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

"Fuzzy search options
nnoremap <C-p> :Files<CR>

" Pass commands to ag by using :Ag command i.e. :Ag --js components
function! s:fzf_ag_raw(cmd)
  call fzf#vim#ag_raw('--noheading '. a:cmd)
endfunction
augroup ag_commands_with_fzf
  autocmd! VimEnter * command! -nargs=* -complete=file Ag :call s:fzf_ag_raw(<q-args>)
augroup END

" grep the word under the cursor
nnoremap gr :Rg <C-R><C-W><CR>

" Press ; and then start typing to fzf search the whole project for a word or
" string
command! -bang -nargs=* Fg call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap ; :Fg<CR>

""""""
" NERDTREE
"""""""

" Map key
map <C-n> :NERDTreeToggle<CR>

" Don't split windows when opening nerdtree on initial screen
" and then using CtrlP
let g:ctrlp_dont_split = 'NERD'

" Close Vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

syntax enable

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('js', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('slim', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('scss', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('rb', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Active color scheme
colorscheme onedark
set background=dark

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "css",
    "html",
    "javascript",
    "json",
    "python",
    "ruby",
    "rust",
    "scss",
    "tsx",
    "typescript",
    "yaml"
  },
  highlight = {
    enable = true
  },
  autotag = {
    enable = true
  }
}

require('nvim-autopairs').setup()
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

_G.MUtils= {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

require'lspconfig'.tsserver.setup{}
require'lspconfig'.solargraph.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.stylelint_lsp.setup{
  settings = {
    stylelintplus = {
      filetypes = { "postcss" }
    }
  }
}
require'lspconfig'.diagnosticls.setup{
  filetypes = {
    'ruby',
    'typescript',
    'typescriptreact',
    'javascript',
    'sh',
    'python'
  },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = {
          '--cache',
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
      rubocop = {
        command = 'bundle',
        sourceName = 'rubocop',
        rootPatterns = { '.git' },
        debounce = 100,
        args = {
          'exec',
          'rubocop',
          '--format',
          'json',
          '--force-exclusion',
          '--stdin',
          '%filepath'
        },
        parseJson = {
          errorsRoot = 'files[0].offenses',
          line = 'location.start_line',
          endLine = 'location.last_line',
          column = 'location.start_column',
          endColumn = 'location.end_column',
          message = '[${cop_name}] ${message}',
          security = 'severity'
        },
        securities = {
          fatal = 'error',
          error = 'error',
          warning = 'warning',
          convention = 'info',
          refactor = 'info',
          info = 'info'
        }
      },
      pylint = {
        sourceName = 'pylint',
        command = 'pylint',
        args = {
          '--output-format',
          'text',
          '--score',
          'no',
          '--msg-template',
          '"{line}:{column}:{category}:{msg} ({msg_id}:{symbol})"',
          '%file'
        },
        formatPattern = {
          '^(\\d+?):(\\d+?):([a-z]+?):(.*)$',
          {
            line = 1,
            column = 2,
            security = 3,
            message = 4
          }
        },
        rootPatterns = {'.git', 'pyproject.toml', 'setup.py'},
        securities = {
          informational = 'hint',
          refactor = 'info',
          convention = 'info',
          warning = 'warning',
          error = 'error',
          fatal = 'error'
        },
        offsetColumn = 1,
        formatLines = 1
      },
      shellcheck = {
        command = 'shellcheck',
        debounce = 100,
        args = {
          '--format',
          'json',
          '-'
        },
        sourceName = 'shellcheck',
        parseJson = {
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${code}]',
          security = 'level'
        },
        securities = {
          error = 'error',
          warning = 'warning',
          info = 'info',
          style = 'hint'
        }
      }
    },
    filetypes = {
      javascript = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
      ruby = 'rubocop',
      sh = 'shellcheck',
    },
    formatters = {
      prettierEslint = {
        command = 'prettier-eslint',
        args = { '--stdin' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'prettierEslint',
      javascriptreact = 'prettierEslint',
      json = 'prettier',
      python = 'pylint',
      scss = 'prettier',
      typescript = 'prettierEslint',
      typescriptreact = 'prettierEslint'
    }
  }
}

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ge', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>gh', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})

local saga = require 'lspsaga'
saga.init_lsp_saga()
vim.api.nvim_set_keymap('n', 'gh', '<cmd> lua require("lspsaga.provider").lsp_finder()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gs', '<cmd> lua require("lspsaga.signaturehelp").signature_help()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'rg', '<cmd> lua require("lspsaga.rename").rename()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gd', '<cmd> lua require("lspsaga.provider").preview_definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>cd', '<cmd> lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ca', '<cmd> lua require("lspsaga.codeaction").code_action()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>ca', '<cmd> lua require("lspsaga.codeaction").range_code_action()<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<CR>', "compe#confirm('<CR>')", {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-e>', "compe#close('<C-e>')", {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-f>', "compe#scroll({ 'delta': +4 })", {expr = true, noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-d>', "compe#scroll({ 'delta': -4 })", {expr = true, noremap = true, silent = true})


require('trouble').setup {}
vim.api.nvim_set_keymap('n', '<Leader>o', '<cmd>LspTroubleToggle lsp_document_diagnostics<CR>', {noremap = true})
EOF

