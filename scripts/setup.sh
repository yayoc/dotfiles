#!/bin/sh
set -e

root_dir=$(dirname "$(pwd)")
ln -s $root_dir/configs/nvim ~/.config/nvim
ln -s $root_dir/configs/zsh/.zshrc ~/.zshrc
ln -s $root_dir/configs/tmux/.tmux.conf ~/.tmux.conf
ln -s $root_dir/configs/git/.gitconfig ~/.gitconfig
