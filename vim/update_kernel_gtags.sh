#/*===============================================================
#*   Copyright (C) 2015 All rights reserved.
#*
#*   FileName：update_kernel_gtags.sh
#*   Author：WangYi
#*   Date： 2015-11-17
#*   Description：
#*
#================================================================*/
echo will generate gtags for kernel... ...
gtags_exc="-path ./arch"
find . \( $gtags_exc \) -prune -type f -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.S' > gtags.files
find ./arch/x86  -type f -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.S' >> gtags.files
gtags

echo gtags built completely!

