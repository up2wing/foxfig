#/*===============================================================
#*   Copyright (C) 2018 All rights reserved.
#*
#*   FileName：install.sh
#*   Author：Yi Wang
#*   Date： 2018-12-12
#*   Description： update vim automatically
#*
#================================================================*/
echo "update vim automatically, wait a moment..."
vimConfigPath="/root/.vim"
bundlePath="/root/.vim/bundle"
vimConfig="/root/.vim/vimrc"

if [ ! -d "$bundlePath" ]; then
    echo "clone vundle and install..."
    git clone https://github.com/vundlevim/vundle.vim.git ~/.vim/bundle/vundle/
fi

if [ -f "$vimConfig" ]; then
    cp $vimConfig $vimConfigPath/vimrc.bak
fi

cp _vimrc $vimConfigPath/vimrc

vim +BundleInstall! +BundleClean +qall

echo "config successfully!"
