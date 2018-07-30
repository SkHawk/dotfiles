#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PATH="$DOTFILES_DIR/bin:$PATH"

## Update dotfiles itself
echo Updating dotfiles...
if type "git -a -d "$DOTFILES_DIR/.git"" 2>/dev/null; then 
    git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; 
fi

## Verify if vim is installed
echo Verifying if vim is installed...
if type "vim" 2>/dev/null; then
    sudo apt install vim
else
    echo Vim is installed!
fi

## Verify if Vundle is installed
echo Verifying if Vundle is installed...
if [ ! -d "~/.vim/bundle/" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo Vundle is installed!
fi


echo Soft-linking files
ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
