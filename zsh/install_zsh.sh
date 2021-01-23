#/*===============================================================
#*   Copyright (C) 2019 All rights reserved.
#*
#*   FileName：install_zsh.sh
#*   Author：WangYi
#*   Date： 2019-03-26
#*   Description：
#*
#================================================================*/

echo instll zsh...
yum -y install zsh
chsh -s /bin/zsh
# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sh install.sh

echo install autojump...
git clone https://github.com/joelthelion/autojump.git /tmp/autojump/
cd /tmp/autojump
./install.py

mv ~/.zshrc ~/.zshrc.bak
cp .zshrc ~/.zshrc

echo install tmux...
yum install tmux -y
mv ~/.tmux.conf ~/.tmux.conf.bak
cp .tmux.conf ~/.tmux.conf

cd -
