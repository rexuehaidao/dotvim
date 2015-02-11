#!/bin/sh

if [ -e ~/dotvim ] 
then
    echo git pull dotvim
    cd ~/dotvim
    git pull
else
    echo git clone https://github.com/rexuehaidao/dotvim.git ~/dotvim
    git clone https://github.com/rexuehaidao/dotvim.git ~/dotvim
fi

if [ -e ~/dotvim/bundle/vundle ] 
then
    echo git pull vundle 
    cd ~/dotvim/bundle/vundle
    git pull
else
    echo git clone https://github.com/gmarik/vundle.git ~/dotvim/bundle/vundle
    git clone https://github.com/gmarik/vundle.git ~/dotvim/bundle/vundle
fi

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

