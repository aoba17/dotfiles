#!/bin/sh

files=(
    ".spacemacs"
)

for file in ${files[@]}; do
    ln -sf ~/dotfiles/$file ~/$file
done
