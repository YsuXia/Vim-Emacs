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
nmap <F8> :w<CR>:!unflatten -l8 -c5 % |dot -Tpng -o %<.png && xdg-open %<.png<CR><CR>
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <silent> <F5> zfa}<CR>
nnoremap <silent> <F6> zo<CR>

let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:clang_complete_auto=1
let g:clang_use_library = 1
set tags=./tags,tags


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


function! DriverProgramSupport()
	let choice=input('Do you want to use your host kernel head file?[Y/N]: ')
	if choice == "Y" || choice == "y"
		echo "\n"
		"let linux_version=system('uname -r')
		let linux_version = substitute(system('uname -r'), '\n\+$', '', '')
		let host_kernel_dir= "/lib/modules/" . linux_version . "/build"
		echo host_kernel_dir
	else
		echo 'test'
	endif
endfunc




