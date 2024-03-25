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

# skip status and dirty check to avoid zsh slow
git config --global --add oh-my-zsh.hide-status 1
git config --global --add oh-my-zsh.hide-dirty 1

echo "save token..."
git config --global credential.helper cache
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
read -p "global git user name, just enter to ignore: " git_name
read -p "global git user mail, just enter to ignore: " git_mail
if [ ${#git_name} -gt 0 ]; then
    git config --global user.name "$git_name"
fi
if [ ${#git_mail} -gt 0 ]; then
    git config --global user.email  "$git_mail"
fi


echo "----------fox work config completely------------"
