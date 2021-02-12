fox-vim
================================================================================

fox-vim, using vundle to manage plugins

## 安装插件
### 自动安装
Windows下设置HOME环境变量，指向vim的安装路径，例如：d:\Program Files\Vim，然后执行install.bat。
### 手动安装
Linux暂不能自动安装。
使用了vundle管理插件，所以首先要安装[vundle](https://github.com/VundleVim/Vundle.vim):
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle/`
然后在vim中执行`:BundleInstall`。

## vim 编译支持 python3
首先查看 python3 config 位置：  
```bash
python3-config                                                                                                                                            130 ↵
Usage: /usr/libexec/platform-python3.6m-x86_64-config --prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extension-suffix|--help|--abiflags|--configdir
```
然后按照 `python3-config` 返回的路径 configure，不能照搬网上的：  
```bash
./configure --with-features=huge -enable-multibyte --enable-python3interp=yes --enable-fail-if-missing --with-python3-config-dir=/usr/libexec/platform-python3.6m-x86_64-config
make -j4 && make install
```

## 插件的使用

### LeaderF
LeaderF 可以查找工程中的所有符号、文件，查找符号用的是 gtags，可认为是对 GNU Global 的封装，它自己管理 GTAGS 等文件，不用我们管了。  
在工程中查找文件非常迅速，并且查找非常智能，自动匹配 grep，即使记不住文件或符号的全名也没关系，阅读代码神器。  
准备工作：  
```bash
pip3 install pygments
yum install python3-pygments -y
下载并安装 [universal-ctags](https://github.com/universal-ctags/ctags.git) 和 [gtags](http://www.gnu.org/software/global/download.html)。
```
以上几步主要是为解析 python、rust 的。

手动为 LeaderF 生成 gtags 文件：  
```bash
:Leaderf gtags --update
```

### coc.nvim
使用 coc.nvim 代替 YouCompleteMe 来补全和查找引用。  

#### coc.nvim 支持 c/c++
coc-clangd 提供对 c/c++ 的支持。  
在 vim 中执行:  
```bash
:CocInstall coc-clangd
```

在 [clangd](https://github.com/clangd/clangd/releases) 网站下载 clangd 并解压：  
```bash
mv clangd_snapshot_20210124 clangd
mv clangd /usr/share
ln -sf /usr/share/clangd/bin/clangd /usr/bin/clangd
```

#### 生成 compile_commands.json
在 [fedora](https://koji.fedoraproject.org/koji/buildinfo?buildID=1610007) 上下载 bear 二进制并安装：  
```bash
yum localinstall bear-2.4.4-1.fc32.x86_64.rpm -y
```
生成 compile_commands.json 文件：  
```bash
bear make -j4
```

对于 ninja 构建的工程：  
```bash
ninja -t compdb cc cxx > compile_commands.json
```
其中 compdb 后面的要根据 `ninja -t rules` 来设置。

#### coc.nvim 支持 python
coc-pyright 提供对 python 的支持。  
首先安装依赖的 python 插件：  
```bash
pip3 install pylint
pip3 install jedi
```

在 vim 中执行：
```bash
:CocInstall coc-pyright
```

#### coc.nvim 支持 rust
首先安装 rust-analyzer：
到 [rust-analyzer 官网](https://github.com/rust-analyzer/rust-analyzer/releases) 下载 rust-analyzer-x86_64-unknown-linux-gnu.gz 并解压：
```bash
gzip -d rust-analyzer-x86_64-unknown-linux-gnu.gz
chmod +x rust-analyzer-x86_64-unknown-linux-gnu
ln -sf rust-analyzer-x86_64-unknown-linux-gnu /usr/bin/rust-analyzer
```

在 vim 中执行：
```bash
:CocInstall coc-rust-analyzer
```

### ~~YouCompleteMe~~
~~自动补全神器，需要手动安装。配置方法参考[vim 自动提示、自动补齐插件 YouCompleteMe for windows Gvim 安装及使用](http://blog.csdn.net/up2wing/article/details/20313213)。~~  
YouCompleteMe 已经用 coc.nvim 代替。

### ~~GNU Global~~
~~跳转定义、查找引用，比cscope用起来快。需要手动安装。~~
~~从GNU官网http://www.gnu.org/software/global/download.html下载压缩包，然后将bin下的文件拷贝到gvim所在目录（以Windows为例）。~~
~~映射快捷键:~~
   ~~Ctrl+F12即可生成tags,并自动添加数据库~~
   ~~F12自动更新数据库。保存文件以后也会自动更新。~~
   ~~Alt+g                   "转到函数定义~~
   ~~Alt+d                   "打开符号表，支持POSIX正则；按Tab自动补全；~~
   ~~Alt+s                   "查找引用~~
   ~~Alt+f                   "搜索字符串~~
   ~~Alt+w                   "用cscope查找符号引用。因为global显示不出具体函数~~  
GNU Global 用 LeaderF 代替。

### QuickFix窗口
    ,sf     "快速打开QuickFix窗口
    f3/F4   "向前/前后切换

### rainbow_parentheses
高亮显示匹配大括号、小括号等。不知道为什么我的配置文件自动载入不生效，按F2手动生效:(

### tagbar
比TagList在面向对象语言时看起来更舒服些, 需要ctags支持。下载CTags到gvim.exe所在目录。  
F9打开Tagbar窗口.

### Easymotion
快速移动插件  
    ,s    向前跳转到某单词
    ,b    向后跳转到某单词
    ,,f    跳转到以某字母开头的单词

### NERD_commenter
自动注释工具  
    ,ca    在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
    ,cc    注释当前行
    ,cs    以”性感”的方式注释
    ,cA    在当前行尾添加注释符，并进入Insert模式
    ,cu    取消注释

### Easy-grep
    ,vv    搜索当前光标下的单词
    ,vV    全词匹配搜索
    ,va    与,vv类似，将结果append到上次搜索结果之后
    ,vA    与,vV类似，将结果append到上次搜索结果之后
    ,vr    替换
### nerdtree
    ,w  打开 关闭树形目录结构
    在nerdtree窗口常用操作：(小写当前，大写root)
        x.......Close the current nodes parent收起当前目录树
        R.......Recursively refresh the current root刷新根目录树
        r.......Recursively refresh the current directory刷新当前目录
        P.......Jump to the root node
        p.......Jump to current nodes parent
        K.......Jump up inside directories at the current tree depth  到同目录第一个节点
        J.......Jump down inside directories at the current tree depth 最后一个节点
        o.......Open files, directories and bookmarks
        i.......Open selected file in a split window上下分屏
        s.......Open selected file in a new vsplit左右分屏
### CtrlP
在项目根目录中建立一个.git目录，ctrlp每次搜索即从根目录开始查找
如要修改根目录标志，可以修改g:ctrlp_root_markers变量。绑定快捷键：
        ,p  迅速打开工程中的一个文件，祖先目录为带.svn .git目录所在目录。因此需要在工程根目录下建立一个.git目录，否则只搜索打开文件所在目录。
        ,f  从历史文件中模糊查找

ctrlp扩展ctrlp-funky  
        ,ff    模糊查找本文件内的函数

### FixWhiteSpace
    ,space    消除代码中的空格

### Mark
    Alt+e                  "高亮/取消高亮当前单词颜色

### indentLine
    可以显示对齐的插件，对于喜欢代码整洁的人很有用。
    :IndentLinesToggle      "打开/关闭显示对齐

### markdown-preview
    markdown实时预览，推荐。需要python支持，并且配置浏览器目录。
    `:MarkdownPreview`打开markdown预览。


## vim使用
----------------------------------------------
### 字体
    采用Bitstream Vera Sans Mono，SourceInsight、VS、SSH都可以采用这种字体。
    双击VeraMono.ttf，直接安装即可。

### 窗口
    Ctrl+w  切分的窗口之间切换
    Ctrl+z或者:sh  返回shell
    fg或者exit     对应上面的返回vim
### 常用操作
### 常用操作
    lb/le/lr    到达行尾/行首/首个不为空的单词
    ,y          将选中文本复制到剪贴板
    gd          转到局部变量定义
### 常用操作
    1）禁止生成～备份文件
        修改vimrc_example.vim文件，将下面几行注释掉
        if has("vms")
          set nobackup		" do not keep a backup file, use versions instead
        else
          set backup		" keep a backup file
        endif

        补记：
        这个最好还是不要注释掉，否则再次打开文件不能回到上次打开的位置.
        本vim配置将备份文件放在~/vimbackupfile，Windows下对应vim安装目录，例如：d:\program files\vim。

    2）修改了配置后马上生效
        :source $VIM/_vimrc
    3）在终端putty下面使用时
        set t_Co=256
        配置putty的solarized配色，下载这个工程，导入注册表即可。
        https://github.com/brantb/solarized/tree/master/putty-colors-solarized
    4）粘贴时防止自动缩进
        set pastetoggle=<F8>
        粘贴之前，按下F8。粘贴之后，再次按下F8。
### vimdiff
    用于比较两个不同文件: vimdiff fileA fileB
    ]c/[c   跳到下一个/上一个不同处
    do      do obtain, 将不同的内容拷贝到本侧文件



参考：
-------------------------------------------
    1. Vundle for Windows, https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
    2. wklken/k-vim, https://github.com/wklken/k-vim
    3. 易水博客: http://easwy.com/blog/archives/advanced-vim-skills-catalog/
    4. Vimer的程序世界：http://www.vimer.cn/

