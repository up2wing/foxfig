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
vimConfigPath="~/.vim"
bundlePath="~/.vim/bundle"
vimConfig="~/.vimrc"

if [ ! -d "$bundlePath" ]; then
    echo "clone vundle and install..."
    git clone https://github.com/vundlevim/vundle.vim.git ~/.vim/bundle/vundle/
fi

if [ -f "$vimConfig" ]; then
    cp $vimConfig $vimConfigPath/.vimrc.bak
fi

cp _vimrc ~/.vimrc
cp coc-settings.json ~/.vim/coc-settings.json

vim +BundleInstall! +BundleClean +qall

echo "config successfully!"
