# vimConfig

# Transferring VIM into IDE
	
### Installing the vim plugin manager

- curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
* * *
### Follow the following steps
- `git clone https://github.com/h3mantD/vimConfig.git`
- `cd vimConfig`
- `cp vimrc ~/.vimrc`
- `vim ~/.vimrc`
- `:PlugInstall`
- `:source %`
* * *

### For installing `YouCompleteMe`/`Ycm` 

- `cd ~/.vim/plugged/youcompleteme`
- **If you want only c/c++ auto completion** 
	- `./install.py --clangd-completer`
- **for more options** 
	- `./install.py -h`
	- **or** `./install.py --all`
