#!/bin/sh

for file in .??*; do
    [[ "$file" == ".git" ]] && continue
	  [[ "$file" == ".gitconfig" ]] && continue
	  [[ "$file" == ".gitignore" ]] && continue
	  [[ "$file" == ".DS_Store" ]] && continue
    ln -sfnv ~/dotfiles/$file ~/$file
done
