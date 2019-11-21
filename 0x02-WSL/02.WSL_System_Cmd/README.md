#### Linux & Windows 系统命令
* 管理员权限  
  ```
  sudo + cmd
  ```
   
* 查找命令
    which 执行的可执行文件的完整路径（当前用户）
    ``` bash
    # which vi
    /usr/bin/vi
    ```

* whereis 搜索二进制、源码和手册页文件
    ``` bash
    # whereis vi
    vi: /usr/bin/vi /usr/share/man/man1/vi.1p.gz /usr/share/man/man1/vi.1.gz
    ```

* locate 搜索文件夹和文件
    ``` bash
    sudo updatedb 
    locate --basename vim
    ```
    
* 查看所有启动的服务  
  ```
  service --status-all
  ```

* find 搜索文件夹和文件  
  ```
  sudo find / -type d -mount -name supervisor 
  ```

* ln   
  - [Win](https://androllen.github.io/2017/03/07/mklink.html)
    ```
    软链接： ln -s 源文件 目标文件   
    硬链接： ln 源文件 目标文件
    ```
  - Linux
    ```
    无
    ```

* ls 颜色命令  
  - Linux
    ```
    蓝色：表示目录  
    绿色：表示可执行文件  
    红色：表示压缩文件   
    浅蓝色：链接文件  
    红色闪烁：表示链接的文件有问题  
    黄色：表示设备文件  
    灰色：表示其他文件  
    ```
  - Win
    ```
    无
    ```
    
* 帮助
  - Linux  
    ```
    Linux Commands + --help
    ```
  - Win  
    ```
    Windows Commands + /? or -h
    ```
    
* 创建文件夹  
  - Linux  
    ```
    sudo mkdir + foo
    ```

  - Win  
    ```
    mkdir + foo  or md + foo  
    ```

- 删除文件夹  
  - Win  
    ``` bash
    # 强制删除非空文件夹
    rmdir + foo /s /q 
    rd + foo /s /q
    ``` 
    
  - Linux  
    ``` bash
    sudo  rmdir + foo
    # 强制删除非空文件夹
    sudo  rm -rf 目录名
    ```
    
* 创建文件  
  - Linux  
    ```
    sudo vi + foo  
    sudo touch + foo
    ```

  - Win  
    ```
    cd>a.txt
    type nul>a.txt
    copy nul>a.txt 
    ```

- 删除文件  
  - Win  
    ```
    del a.txt
    ```

  - Linux  
    ```
    sudo rm -f file1
    ```

- 复制文件夹到文件夹  
  - Win  
    ```
    xcopy D:\123 C:\456\ /s /f
    ```
  - Linux  
    ```
    sudo cp -a hiflaskEnv/ /home/androllen/webflask/ 
    ```

* 快速查找使用过的命令  
  - Win  
    ```
    F7
    ```
  - Linux  
    ```
    history | grep find
    ```
    
* 添加删除更改用户  
  - Win  
    ``` bash
    # 新增
    net user 用户名 密码 /add
    # 删除
    net user 用户名     /delete
    # 更改用户权限
    net localgroup administrators 用户名 /add 
    ```
  - Linux  
    ``` bash
    在删除用户之前切换到root
    ubuntu删除用户同样是在终端下操作的，需要注意的是，如果要删除的用户当前已登陆，是删除不掉的，必须注销掉当前用户切换为另一个用户下，才能删除。举个     例子，刚才我新建立了一个用户为 yang 的用户，例如我现在用用户 yang 登陆了桌面，此时如果我想删除 yang 这个用户，是删除不掉的。正确的操作方法是，     我注销掉yang，然后使用 root 登陆到桌面，再删除 yang 即可。
    删除ubuntu用户的命令比较容易记：sudo userdel username，例如我想删除 yang ，则输入：sudo userdel yang，删除成功后，系统无任何提示。
    - userdel  -r  用户名
    - useradd -m -s  用户名
    - passwd 用户名
    sudo adduser androllen  
    ls /home  
    ```
      
* 查看系统位数  
  - Win  
    ``` 
    systeminfo
    ```
  - Linux  
    ``` 
    sudo uname --m
    ```

* 查看系统版本  
  - Win  
    ``` 
    winver
    ```
  - Linux    
    ``` 
    cat /etc/issue
    ```
  
* 下载文件
  - Win
    ```
    get-help curl
    Invoke-WebRequest -Uri "https://github.com/Shadowsocks-4.1.8.0.zip" -OutFile "1.zip"
    ```
  - Linux
    ```
    curl
    ```
    
* 切换root  
  ``` bash
  # 要求我们输入当前我们的密码 
  sudo su
  # 将当前用户有普通用户切换到root用户模式中
  sudo -i
  # su是switch user的缩写，表示用户切换
  su 用户名
  ```
  
* 文件Hash  
  - Linux
    ``` 
    md5sum filename
    sha1sum filename
    sha256sum filename    
    ```
   
  - Win  
    - PowerShell  
      ``` 
      get-filehash
      ```
      
    - cmd  
      ``` 
      certutil -hashfile D:\1.exe SHA256
      ```

* [下载文件](https://linuxize.com/post/how-to-install-deb-packages-on-ubuntu/)
  ``` bash
  wget --no-check-certificate test.deb  
  curl -k -O -L test.deb 
  ```
  
* 安装文件  
  ``` bash
  sudo apt install ./test.deb  
  sudo apt install gdebi / sudo gdebi teamviewer_amd64.deb  
  sudo dpkg -i test.deb  
  ```

* 退出 root 从新的用户状态下输入“exit”即可退回到刚才的用户状态
  exit

* 快捷键  
  ``` dos
  # 分别代表把光标移动到最前和最后
  ctrl+a  ctrl+e 
  # 分别代表光标处往前和光标处往后删除
  ctrl+u   ctrl+k 
  ```
      

window下通过新建txt文件然后改成.bat的文件，输入内容后，执行出现中文乱码？  
原因：  
批处理文件，是以ANSI编码方式。若以别的方式（如UTF-8）编辑了批处理，转换成ANSI格式即可，正常创建的文件的格式都是utf-8的。  
解决：  
1.使用windows自带的记事本编辑，然后另存的时候，可选择编码方式即可。  
2.在代码里修改执行时的编码格式：
``` dos
@echo off
REM 后续命令使用的是：UTF-8编码
chcp 65001
echo 中文测试
pause
```

小知识了解一下：  
``` dos
doc 代码页(自行百度):
chcp 65001  就是换成UTF-8代码页
chcp 936 可以换回默认的GBK
chcp 437 是美国英语  
cmd   脚本文件的描述是 “windows nt命令脚本” （年轻人，本是多）
```


[常用命令](https://www.cnblogs.com/yjd_hycf_space/p/7730690.html)  
