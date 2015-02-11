#!/bin/sh

echo git clone https://github.com/rexuehaidao/dotvim.git ~/dotvim
git clone https://github.com/rexuehaidao/dotvim.git ~/dotvim

echo git clone https://github.com/gmarik/vundle.git ~/dotvim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/dotvim/bundle/vundle

if [ ! -e ~/.vim_bak ]
then
    echo backup old .vimrc and .vim to .vim_bak
    mkdir ~/.vim_bak
    mv -f ~/.vimrc ~/.vim_bak/.vimrc
    mv -f ~/.vim ~/.vim_bak/.vim
fi

rm -f ~/.vimrc
ln -s ~/dotvim/vimrc ~/.vimrc
rm -fr ~/.vim
ln -s ~/dotvim ~/.vim

vim +BundleInstall +qall

