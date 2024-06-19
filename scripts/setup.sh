#!/bin/sh
set -e

script_dir=$(dirname "$(readlink -f "$0")")
parent_dir=$(dirname "$script_dir")
ln -s $parent_dir/configs/nvim ~/.config/nvim
ln -s $parent_dir/configs/zsh/.zshrc ~/.zshrc
ln -s $parent_dir/configs/tmux/.tmux.conf ~/.tmux.conf
ln -s $parent_dir/configs/git/.gitconfig ~/.gitconfig
