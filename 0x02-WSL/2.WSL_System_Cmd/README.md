#### Linux 系统命令
* 查找命令
    which 执行的可执行文件的完整路径（当前用户）
    ```
    # which vi
    /usr/bin/vi
    ```

* whereis 搜索二进制、源码和手册页文件
    ```
    # whereis vi
    vi: /usr/bin/vi /usr/share/man/man1/vi.1p.gz /usr/share/man/man1/vi.1.gz
    ```

* locate 搜索文件夹和文件
    ```
    sudo updatedb 
    locate --basename vim
    ```

* find 搜索文件夹和文件  
    sudo find / -type d -mount -name supervisor 

* ls 命令  
    蓝色：表示目录  
    绿色：表示可执行文件  
    红色：表示压缩文件   
    浅蓝色：链接文件  
    红色闪烁：表示链接的文件有问题  
    黄色：表示设备文件  
    灰色：表示其他文件  

* 创建文件夹  
  mkdir + foo

* 创建文件  
    vi + foo  
    touch + foo

* 快速查找使用过的命令  
    history | grep find
    

* 快捷键
    > ctrl+a   ctrl+e   分别代表把管标移动到最前和最后  
    > ctrl+u   ctrl+k   分别代表光标处往前和光标处往后删除    


 window下通过新建txt文件然后改成.bat的文件，输入内容后，执行出现中文乱码？
原因：
批处理文件，是以ANSI编码方式。若以别的方式（如UTF-8）编辑了批处理，转换成ANSI格式即可，正常创建的文件的格式都是utf-8的。
解决：
1.使用windows自带的记事本编辑，然后另存的时候，可选择编码方式即可。
2.在代码里修改执行时的编码格式：
@echo off
REM 后续命令使用的是：UTF-8编码
chcp 65001
echo 中文测试
pause
小知识了解一下：
doc 代码页(自行百度):
chcp 65001  就是换成UTF-8代码页
chcp 936 可以换回默认的GBK
chcp 437 是美国英语  
cmd   脚本文件的描述是 “windows nt命令脚本” （年轻人，本是多）
   