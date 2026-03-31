fox-zshrc
================================================================================

## 安装
### 安装zsh
`yum install zsh`

`chsh -s /bin/zsh`
### 安装oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

### 安装 TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### 安装 fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
sudo ln -sf ~/.fzf/bin/fzf /usr/local/bin/fzf   # 让 tmux run-shell 能找到

### 安装autojump
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


