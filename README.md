# Common Softwares and Configs

## 常用软件
### 1. TotalCommander
    配合 Hoekey 和 VimDesktop 使用，实现 Windows 下资源管理器。

### 2. Everything
    Windows 下[搜索文件立得](https://www.voidtools.com/zh-cn/)。

### 3. VimDesktop
    用 vim 来[操作一切][VimDesktop](https://github.com/goreliu/vimdesktop)。

### 4. Hoekey
    任何操作都可以[键盘呼出](https://www.appinn.com/hoekey-one/)，配置文件在[这里]()。

### 5. 番茄土豆
    用 GTD 来完成[了不起的工作](https://www.appinn.com/pomotodo/)。

### 6. gnome-calculator
    计算器。替换 mac 默认计算器，[macport安装](https://ports.macports.org/port/gnome-calculator)
    
    ```
    gnome-calculator

** (gnome-calculator:74144): CRITICAL **: 09:45:42.500: history_view_set_serializer: assertion 'self != NULL' failed
No provider of glGenSamplers found.  Requires one of:
    Desktop OpenGL 3.3
    GL_ARB_sampler_objects
    OpenGL ES 3.0
[2]    74144 abort      gnome-calculator
    ```
    
    原因为试图使用硬件加速，但 x11 环境不支持。
    ```
    GSK_RENDERER=cairo gnome-calculator
    ```

## Chrome 插件
### 1. Pocket
    一键保存到 [Pocket](http://chromecj.com/productivity/2015-11/618.html)。

### 2. Dark Reader
    [保护好眼睛](https://darkreader.org/)，可以将背景修改为舒服的配色。

### 3. 印象笔记
    将网页[剪藏](https://www.yinxiang.com/webclipper/?downloaded)到印象笔记。

### 4. iCloud 书签
    将 Chrome 书签保存到 [iCloud](http://chromecj.com/productivity/2014-11/257.html)。

### 5. 广告终结者
    [过滤广告](http://www.adtchrome.com/)，支持手动。

### 6. hosts
    [河蟹](https://laod.cn/hosts/2017-google-hosts.html#button_file)。

### 7. cVim
    可以[在 chrome 中使用 vim](https://github.com/1995eaton/chromium-vim)，商店中已下架，需手动安装。
