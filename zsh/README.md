fox-zshrc
================================================================================

## 安装
### 1. 安装zsh
`yum install zsh`

`chsh -s /bin/zsh`
### 2. 安装oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

### 3. 安装autojump
`git clone https://github.com/joelthelion/autojump.git`

进入到clone下的目录

`./install.sh`

编辑~/.zshrc，加入下面的代码:

`plugins=(git osx ruby autojump)`

### 4. 重启终端


## 使用
### 装新程序后zsh不能识别
`hash -r`
### 禁用git prompt
修改使用theme的配置文件，如：

`/root/.oh-my-zsh/themes/afowler.zsh-theme`

去掉**git_prompt_info**


