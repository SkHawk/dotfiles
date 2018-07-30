#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PATH="$DOTFILES_DIR/bin:$PATH"

## Update dotfiles itself
if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

## Verify if vim is installed
if hash vim 2>/dev/null; then
    sudo apt install vim
fi

## Verify if Vundle is installed
if [ ! -d "~/.vim/bundle/" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
