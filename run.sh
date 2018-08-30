#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PATH="$DOTFILES_DIR/bin:$PATH"

## Update dotfiles itself
echo -n Updating dotfiles... 
if [ type "git -a -d "$DOTFILES_DIR/.git"" 2>/dev/null]
then 
    git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; 
    echo Updated!
fi
echo

## Verify if vim is installed
echo -n Verifying if vim is installed... 
if [ type "vim" 2>/dev/null ]
then
    sudo apt install vim
else
    echo Vim is installed!
fi

## Install vim color scheme
if [ -d "~/.vim/colors" ]
then
    mkdir ~/.vim/colors
    cp -r "$DOTFILES_DIR/colors" ~/.vim/colors
else
    cp -r "$DOTFILES_DIR/colors" ~/.vim/colors
fi
echo

## Verify if Vundle is installed
echo -n Verifying if Vundle is installed... 
if [ -d "~/.vim/bundle/" ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo Vundle is installed!
fi
echo

## Verify if Tmux is installed
echo -n Verifying if tmux is installed... 
if which tmux >/dev/null 2>&1; then ##if [ type "tmux" 2>/dev/null ]; then
    echo tmux is installed!
else
    sudo apt install tmux
fi
echo

##Verify if tpm is installed
echo -n Verifying if tpm is installed... 
if [ -d "~/.tmux/plugins/tpm" ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo tpm is installed!
fi
echo


echo Soft-linking files
ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~



