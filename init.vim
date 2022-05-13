call plug#begin()
	
"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }	

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	
	Plug 'vim-airline/vim-airline'
	
	Plug 'vim-airline/vim-airline-themes'	
	
	Plug 'goolord/alpha-nvim'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'LunarVim/onedarker.nvim'
	
	Plug 'folke/which-key.nvim'
	
	Plug 'nvim-lua/plenary.nvim'

	Plug 'nvim-telescope/telescope.nvim'

	Plug 'goolord/alpha-nvim'
	
	Plug 'ryanoasis/vim-devicons'

	Plug 'lewis6991/gitsigns.nvim'
	
	Plug 'lukas-reineke/indent-blankline.nvim'
	
	Plug 'moll/vim-bbye'

	Plug 'nvim-lua/popup.nvim'

	Plug 'rcarriga/nvim-notify'
	
	Plug 'fannheyward/telescope-coc.nvim'
	
	Plug 'puremourning/vimspector'

call plug#end()
let g:airline_powerline_fonts = 1


set shiftwidth=3

set tabstop=3

set number

set relativenumber


set clipboard+=unnamedplus

colorscheme onedarker

set hidden

set encoding=utf-8

set nobackup

set nowritebackup

set updatetime=300

set signcolumn=number
set laststatus=3
let mapleader="\<Space>"

let maplocalleader="\<Space>"


lua require('user.telescope')
lua require('user.whichkey')
lua require('user.indentBlankline')
lua require('user.startup')
lua require('user.notification')
let g:neovide_no_idle=v:true
let g:neovide_fullscreen=v:true
let g:neovide_transparency=1.0
let g:neovide_refresh_rate=60
let g:neovide_remember_window_size=v:true
let g:neovide_profiler=v:false
let g:neovide_input_use_logo=v:true
let g:neovide_touch_deadzone=6.0
let g:neovide_touch_drag_timeout=0.17
let g:neovide_courser_animation_length=0.13
let g:neovide_cursor_trail_length=0.8
let g:neovide_cursor_antialiasing=v:false
let g:neovide_cursor_unfocused_outline_width=0.2
let g:neovide_cursor_vfx_mode = "railgun" " torpedo | pixiedust | sonicboom | ripple | wireframe 
let g:neovide_cursor_vfx_opacity=300.0
let g:neovide_cursor_vfx_partical_lifetime=1.7
let g:neovide_cursor_vfx_partical_density=22.0
let g:neovide_cursor_vfx_partical_phase=1.5
let g:neovide_cursor_vfx_particle_curl=1.0
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

let g:airline_theme="onedark"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline=1



"*********************Keybindings*****************************"


nnoremap <silent> H <Cmd>bprevious<Cr>
nnoremap <silent> L <Cmd>bnext<Cr>
nnoremap <silent> B <Cmd>Bdelete!<Cr>
nnoremap <silent> P <Cmd>put!<Cr>

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

nnoremap <silent> <C-space> <Cmd>CocCommand explorer<Cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <leader>cl  <Plug>(coc-codelens-action)
nmap <leader>ac  <Plug>(coc-codeaction)
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap Q  <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)

noremap <silent><nowait><expr>  <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" ******************** COC-bindings *************************"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.



" Remap keys for applying codeAction to the current buffer.
" Apply AutoFix to problem on the current line.

" Run the Code Lens action on the current line.

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.

" Remap <C-f> and <C-b> for scroll float windows/popups.


" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


function! s:DiagnosticNotify() abort
  let l:info = get(b:, 'coc_diagnostic_info', {})
  if empty(l:info) | return '' | endif
  let l:msgs = []
  let l:level = 'info'
   if get(l:info, 'warning', 0)
    let l:level = 'warn'
  endif
  if get(l:info, 'error', 0)
    let l:level = 'error'
  endif
 
  if get(l:info, 'error', 0)
    call add(l:msgs, ' Errors: ' . l:info['error'])
  endif
  if get(l:info, 'warning', 0)
    call add(l:msgs, ' Warnings: ' . l:info['warning'])
  endif
  if get(l:info, 'information', 0)
    call add(l:msgs, ' Infos: ' . l:info['information'])
  endif
  if get(l:info, 'hint', 0)
    call add(l:msgs, ' Hints: ' . l:info['hint'])
  endif
  let l:msg = join(l:msgs, "\n")
  if empty(l:msg) | let l:msg = ' All OK' | endif
  call v:lua.coc_diag_notify(l:msg, l:level)
endfunction

function! s:StatusNotify() abort
  let l:status = get(g:, 'coc_status', '')
  let l:level = 'info'
  if empty(l:status) | return '' | endif
  call v:lua.coc_status_notify(l:status, l:level)
endfunction

function! s:InitCoc() abort
	runtime! autoload/coc/ui.vim
  execute "lua vim.notify('Initialized coc.nvim for LSP support', 'info', { title = 'LSP Status' })"
endfunction
" notifications
autocmd User CocNvimInit call s:InitCoc()
autocmd User CocDiagnosticChange call s:DiagnosticNotify()
autocmd User CocStatusChange call s:StatusNotify()
