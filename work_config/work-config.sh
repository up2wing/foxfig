#/*===============================================================
#*   Copyright (C) 2018 All rights reserved.
#*   
#*   FileName：work-config.sh
#*   Author：WangYi
#*   Date： 2018-07-18
#*   Description：
#*
#================================================================*/
echo "config git..."
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.df diff
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"



echo "----------fox work config completely------------"
