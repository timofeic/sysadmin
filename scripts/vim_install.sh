#!/bin/bash

hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
./configure --enable-pythoninterp --enable-rubyinterp --with-features=huge --prefix=$HOME/opt/vim
make && make install
mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/opt/vim/bin/vim
which vim
vim --version
