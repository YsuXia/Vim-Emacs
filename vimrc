set nocompatible
filetype on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()
filetype plugin indent on

colorscheme torte
func LoadCscope() 
if has("cscope")  
        set csprg=/usr/bin/cscope  
        set csto=0  
        set cst  
        set csverb  
        set cspc=3  
        "add any database in current dir  
        if filereadable("cscope.out")  
            cs add cscope.out  
        "else search cscope.out elsewhere  
        else  
           let cscope_file=findfile("cscope.out", ".;")  
           let cscope_pre=matchstr(cscope_file, ".*/")  
           if !empty(cscope_file) && filereadable(cscope_file)  
               exe "cs add" cscope_file cscope_pre  
           endif        
         endif  
 endif  
endfunc

map <F3> :call LoadCscope()<CR>
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set number
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab

let mapleader=","
map <silent> <leader>ss :source ~/.vimrc<cr>
map <silent> <leader>ee :e ~/.vimrc<cr>
nmap <silent> <leader>tt :TagbarToggle<CR>
nmap <F8> :w<CR>:!unflatten -l8 -c5 % |dot -Tpng -o %<.png && viewnior  %<.png &<CR><CR>
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <silent> <F5> zfa}<CR>
nnoremap <silent> <F6> zo<CR>

"let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang.so.1'
"let g:clang_complete_auto=1
"let g:clang_use_library = 1
"let g:clang_user_options='-stdlib=libc++ -std=c++11'
set tags=./tags,tags
set tags+=$HOME/.vim/tags/cpp
set tags+=$HOME/.vim/tags/opencv2


function! Demo()
	let curline = getline('.')
	call inputsave()
	let name = input('Enter name: ')
	call inputrestore()
	call setline('.', curline . ' ' . name)
endfunction

function! GenerateAndLoadCurrentDirTags()
	:! ctags -R --c-kinds=+px --c++-kinds=+px --fields=+iafksS --extra=+qf .
	:! cp tags \/tmp
	set tags=/tmp
endf
nmap <silent><leader>cc :call GenerateAndLoadCurrentDirTags()<CR>
nmap <silent><leader>dp :call DriverProgramSupport()<CR>
nmap <silent><leader>cpp :call CppProgramSupport()<CR>


function! ConfigKernel(kerneldir, arch, subarch)
	let lkerneldir=a:kerneldir
	let larch=a:arch
	let lsubarch=a:subarch
	"echo "xiayang:" lkerneldir
	execute '! kernel-ctags' a:kerneldir
endfunc

"this function work very well, when I develop driver code
function! DriverProgramSupport()
	"call system('rm -f ${HOME}/.vim/plugin/YouCompleteMe')
	"call system('ln -s $HOME/bin/omnicppcomplete-0.41 $HOME/.vim/omnicppcomplete-0.41')
	let choice=input('Do you want to use your host kernel head file?[Y/N]: ')
	if choice == "Y" || choice == "y"
		echo "\n"
		"let linux_version=system('uname -r')
		let linux_version = substitute(system('uname -r'), '\n\+$', '', '')
		let host_kernel_dir= "/lib/modules/" . linux_version . "/build"
		echo host_kernel_dir
	else
		let kerneldir=input('Please input your kernel source dir: ')
		let arch=input('Please input your development arch:')
		let subarch=input('Please input your development subarch:')
		call ConfigKernel(kerneldir, arch, subarch)
	endif
	"althouth kernel src maybe different dir, cscope.out and tags will
	"generate at current dir
endfunc

function! CppProgramSupport()
	"call system('ln -s $HOME/bin/YouCompleteMe  ${HOME}/.vim/plugin/YouCompleteMe')
	"call system('rm -f  $HOME/.vim/omnicppcomplete-0.41')
endfunc



" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<c-d>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/vim-snippets/UltiSnips']

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

if has("autocmd")
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif 



