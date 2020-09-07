#!/bin/bash

### Installation
err=0

type git || {
  echo 'Please install git or update your path to include the git executable!'
  exit 1
}
echo ""

git clone git@github.com:hanghang/dotfiles.git

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p dotfiles/vimfiles/gitignored/
mkdir -p dotfiles/shell/gitignored/

touch ~/dotfiles/vimfiles/gitignored/dbconf.vim
touch ~/dotfiles/shell/gitignored/ssh

# vim
if [ -f ~/.vimrc ]; then
	echo "~/.vimrc already exists, please manually add 'source ~/dotfiles/vimrc'"
	err=1;
else 
	echo 'source ~/dotfiles/vimrc' > ~/.vimrc
fi
vim +PlugClean +qall

# tmux
if [ -f ~/.tmux.conf ]; then
	echo "~/.tmux.conf already exists, please manually add 'source ~/dotfiles/tmux.conf'"
	err=1;
else 
	echo 'source ~/dotfiles/tmux.conf' > ~/.tmux.conf
fi

# git
cd ~
if [ -f ~/.gitconfig ]; then
	echo "~/.gitconfig already exists, please manually link 'ln ~/dotfiles/git/gitconfig .gitconfig'"
	err=1;
else 
	ln ~/dotfiles/git/gitconfig .gitconfig
fi
if [ -f ~/.gitignore ]; then
	echo "~/.gitignore already exists, please manually link 'ln ~/dotfiles/git/gitignore .gitignore'"
	err=1;
else 
	ln ~/dotfiles/git/gitignore .gitignore
fi


# result
if [ !"$err"="0" ]; then
	echo "Install not complete."
else 
	echo "Install succeed."
fi
