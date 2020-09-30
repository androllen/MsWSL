---
title: Linux & Windows 系统命令  
---

- 帮助
  - Linux

    ``` sh
    Linux Commands + --help
    ```

  - Win

    ``` sh
    Windows Commands + /? or -h
    ```

- 管理员权限

  ``` sh
  sudo + cmd
  ```

- 查找命令
  which 执行的可执行文件的完整路径（当前用户）

  ``` bash
  # which vi
  /usr/bin/vi
  ```

- whereis 搜索二进制、源码和手册页文件

  ``` bash
  # whereis vi
  vi: /usr/bin/vi /usr/share/man/man1/vi.1p.gz /usr/share/man/man1/vi.1.gz
  ```

- locate 搜索文件夹和文件

  ``` bash
  sudo updatedb
  locate --basename vim
  ```

- 查看所有启动的服务

  ``` sh
  service --status-all
  ```

- find 搜索文件夹和文件

  ``` sh
  sudo find / -type d -mount -name supervisor
  ```

- ln

  - [Win](https://androllen.github.io/post/mklink.html)

    ```sh
    软链接： ln -s 源文件 目标文件
    硬链接： ln 源文件 目标文件
    ```

  - Linux

    ``` sh
    无
    ```

- ls 颜色命令
  - Linux

    ``` sh
    蓝色：表示目录
    绿色：表示可执行文件
    红色：表示压缩文件
    浅蓝色：链接文件
    红色闪烁：表示链接的文件有问题
    黄色：表示设备文件
    灰色：表示其他文件
    ```

  - Win

    ``` sh
    无
    ```

- 创建文件夹
  - Linux

    ``` sh
    sudo mkdir + foo
    ```

  - Win

    ``` sh
    mkdir + foo  or md + foo
    ```

- 删除文件夹
  - Win

    ``` bash
    # 强制删除非空文件夹
    # 管理员权限的时候使用
    rmdir + foo /s /q

    rd + foo /s /q
    ```

  - Linux

    ``` bash
    sudo  rmdir + foo
    # 强制删除非空文件夹
    sudo  rm -rf 目录名
    ```

- 创建文件
  - Linux

    ```sh
    # 使用sudo 创建的文件夹具用root权限当然也可以更改当前root权限到当前用户权限
    sudo vi + foo
    sudo touch + foo
    ```

  - Win

    ```sh
    cd>a.txt
    type nul>a.txt
    copy nul>a.txt
    ```

- 删除文件
  - Win bash

    ``` sh
    del a.txt
    ```

  - Linux

    ```bash
    sudo rm -f file1
    ```

- 复制文件夹到文件夹
  - Win

    ```bash
    xcopy D:\123 C:\456\ /s /f
    ```

  - Linux

    ```  bash
    sudo cp -a hiflaskEnv/ /home/androllen/webflask/
    ```

- 快速查找使用过的命令
  - Win

    ```bash
    F7
    ```

  - Linux

    ```bash
    history | grep find
    ```

- 添加删除更改用户
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
    # 在删除用户之前切换到root
    # ubuntu删除用户同样是在终端下操作的，需要注意的是，如果要删除的用户当前已登陆，是删除不掉的，必须注销掉当前用户切换为另一个用户下，才能删除。
    # 举个例子，刚才我新建立了一个用户为 yang 的用户，例如我现在用用户 yang 登陆了桌面，此时如果我想删除 yang 这个用户，是删除不掉的。正确的操作方法是，我注销掉yang，然后使用 root 登陆到桌面，再删除 yang 即可。
    # 删除ubuntu用户的命令比较容易记：sudo userdel username，例如我想删除 yang ，则输入：sudo userdel yang，删除成功后，系统无任何提示。
    - userdel  -r  dogs
    - useradd -m -s  dogs
    - passwd dogs
    sudo adduser androllen
    ls /home
    ```

- 查看系统位数
  - Win

    ```bash
    systeminfo
    ```

  - Linux

    ```bash
    sudo uname --m
    ```

- 查看系统版本
  - Win

    ```bash
    winver
    ```

  - Linux

    ```bash
    cat /etc/issue
    ```

- 下载安装
  - Win

    ```bash
    get-help curl
    Invoke-WebRequest -Uri https://github.com/Shadowsocks-4.1.8.0.zip -OutFile Shadowsocks-4.1.8.0.zip
    ```

  - [Linux](https://linuxize.com/post/how-to-install-deb-packages-on-ubuntu)

    ```bash
    # 升级列表中的软件
    apt-get update
    # 升级所有已安装的包
    apt-get upgrade
    # 安装/更新一个软件
    apt-get install package_name
    # 安装 deb 包
    dpkg -i package_name.deb

    sudo apt install ./test.deb
    sudo apt install gdebi
    sudo gdebi teamviewer_amd64.deb
    ```

- 卸载
  - Linux

    ``` sh
    # 卸载软件并清除配置
    sudo apt-get remove --purge package_name
    # 连同配置文件一起删除
    dpkg -r --purge package_name.deb

    # 从下载的软件包中清理缓存
    apt-get clean
    wget --no-check-certificate test.deb

    curl -k -O -L test.deb
    # 清理系统：
    sudo apt-get autoclean
    sudo apt-get clean
    sudo apt-get autoremove
    ```

- 切换root
  - linux

    ``` bash
    # 要求我们输入当前我们的密码
    sudo su
    # 将当前用户有普通用户切换到root用户模式中
    sudo -i
    # su是switch user的缩写，表示用户切换
    su 用户名
    ```

- 文件Hash
  - Linux

    ```bash
    md5sum filename
    sha1sum filename
    sha256sum filename
    ```

  - Win
    - PowerShell

      ```bash
      get-filehash
      ```

    - cmd

      ```bash
      certutil -hashfile D:\1.exe SHA256
      ```

- 退出

  ``` bash
  # root 从新的用户状态下输入“exit”即可退回到刚才的用户状态
  exit
  ```

- 快捷键
  - win

    ```sh
    cls
    ```

  - linux

    ``` bash
    # 删除光标前的命令
    ctrl + u
    # 删除光标后的命令
    ctrl + k
    # 光标移动到最前
    ctrl + a
    # 光标移动到最后
    ctrl + e
    # 清空屏幕并保留所有命令
    ctrl + l
    # 清空当前屏幕所有命令
    clear
    ```

- 查看安装的所有软件
  - linux

    ``` sh
    # dpkg -l | grep ftp
    dpkg -l
    ```

- 查看软件安装的路径
  - linux

    ``` sh
    dpkg -L | grep ftp
    or
    whereis ftp
    # 显示工作路径
    pwd
    ```

- 查看软件版本
  - linux

  ```sh
  # aptitude  show ftp
  aptitude show
  ```

- 挂载与移动数据

  ```sh
  mount
  可以看到 Linux mount（挂载）到/mnt/c, /mnt/d中

  rootfs on / type lxfs (rw,noatime)
  none on /dev type tmpfs (rw,noatime,mode=755)
  sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,noatime)
  proc on /proc type proc (rw,nosuid,nodev,noexec,noatime)
  devpts on /dev/pts type devpts (rw,nosuid,noexec,noatime,gid=5,mode=620)
  none on /run type tmpfs (rw,nosuid,noexec,noatime,mode=755)
  none on /run/lock type tmpfs (rw,nosuid,nodev,noexec,noatime)
  none on /run/shm type tmpfs (rw,nosuid,nodev,noatime)
  none on /run/user type tmpfs (rw,nosuid,nodev,noexec,noatime,mode=755)
  binfmt_misc on /proc/sys/fs/binfmt_misc type binfmt_misc (rw,relatime)
  cgroup on /sys/fs/cgroup type tmpfs (rw,relatime,mode=755)
  cgroup on /sys/fs/cgroup/devices type cgroup (rw,relatime,devices)
  C:\ on /mnt/c type drvfs (rw,noatime,uid=1000,gid=1000,case=off)
  D:\ on /mnt/d type drvfs (rw,noatime,uid=1000,gid=1000,case=off)


  cd /mnt/d/
  cd Desktop/
  sudo mv frp_0.33.0_linux_amd64.tar.gz /etc/frp/
  cd /etc/frp/
  ```

  ``` sh
  mount /dev/hda2 /mnt/hda2 挂载一个叫做hda2的盘 - 确定目录 '/ mnt/hda2' 已经存在
  umount /dev/hda2 卸载一个叫做hda2的盘 - 先从挂载点 '/ mnt/hda2' 退出
  fuser -km /mnt/hda2 当设备繁忙时强制卸载
  umount -n /mnt/hda2 运行卸载操作而不写入 /etc/mtab 文件- 当文件为只读或当磁盘写满时非常有用
  mount /dev/fd0 /mnt/floppy 挂载一个软盘
  mount /dev/cdrom /mnt/cdrom 挂载一个cdrom或dvdrom
  mount /dev/hdc /mnt/cdrecorder 挂载一个cdrw或dvdrom
  mount /dev/hdb /mnt/cdrecorder 挂载一个cdrw或dvdrom
  mount -o loop file.iso /mnt/cdrom 挂载一个文件或ISO镜像文件
  mount -t vfat /dev/hda5 /mnt/hda5 挂载一个Windows FAT32文件系统
  mount /dev/sda1 /mnt/usbdisk 挂载一个usb 捷盘或闪存设备
  mount -t smbfs -o username=user,password=pass //WinClient/share /mnt/share 挂载一个windows网络共享
  ```

- 关机并重启
  - Linux

    ``` sh
    # 重启
    shutdown -r now
    # 关机
    shutdown -h now
    # 10s 后关机
    shutdown -h -t 10
    # 取消
    shutdown -c
    ```

  - Win

    ``` sh
    # 重启
    shutdown -r
    # 关机
    shutdown -s
    # 10s 后关机
    shutdown -s -t 10
    # 取消
    shutdown-a
    ```

- 权限
  - Linux

    ``` sh
    # 显示权限
    ls -lh
    ```

  - Win

    ``` sh

    ```

- 压缩并解压
  - Linux

    ``` sh
    # tar格式 tar是打包，不是压缩！compression 压缩 首字母 c
    解包：$ sudo tar xvf FileName.tar
    打包：$ sudo tar cvf FileName.tar DirName

    # tar.gz格式
    解压：$ sudo tar zxvf FileName.tar.gz
    压缩：$ sudo tar zcvf FileName.tar.gz DirName

    # 压缩单文件 /指定的目录下压缩  /压缩目录下的文件
    tar -cvf /home/filename.tar /home/filename
    # 多文件
    tar -cvf /home/filename.tar /home/filename /home/DirectoryName
    # 显示包里包含的文件
    tar -tf archive.tar
    ```

  - Win

    ``` sh
    7.zip
    ```

- Linux
  - 管道符号

    ```sh
    docker images |awk '{print $1}' |sed -n '2,$p' |xargs docker save -o zhao.tar
    ```

  - awk
  
    ```sh
    awk '{print $1}' 
    ```

  - [sed](https://blog.csdn.net/wdz306ling/article/details/80087889)
    
    ```sh
    sed -n '2,$p' 
    ```

  - xargs
    
    ```sh
    xargs docker save -o zhaobsh.tar 
    ```

- 文件格式转换
  - Linux

    ``` sh
    dos2unix filedos.txt fileunix.txt 将一个文本文件的格式从MSDOS转换成UNIX
    unix2dos fileunix.txt filedos.txt 将一个文本文件的格式从UNIX转换成MSDOS
    ```

  - Win

    ``` sh

    ```

- 备份
  - Linux

    ``` sh
    rsync
    ```

  - Win

    ``` sh

    ```

- 网络
  - Linux

    ``` sh
    rsync
    ```

  - Win

    ``` sh
    ifconfig
    ```

- sh

  ```sh
  # 执行 sh 脚本
  chmod u+x run.sh
  ./run.sh
  # or
  bash ./run.sh
  # or
  sh ./run.sh
  ```

- 同步

```sh
# 同步本地文件到远程服务器
$ sudo rsync -av ./laozhi.tar.gz androllen@192.168.100.84:/home/androllen
# 远程服务器文件夹bak 同步到本地(会新建一个bak文件夹)
cd /opt
$ sudo rsync -av dogs@192.168.100.50:/home/dogs/env/bak ./

# 末尾不加/，表示的是将src这个目录直接复制到文件夹下，如果dst目录下没有src，会自动创建src目录
$ sudo rsync -avzh --progress /apkg/backup/src /apkg/backup/dst
# 末尾加/，表示的是将src目录下的内容复制到dst2文件夹下
$ sudo rsync -avzh --progress /apkg/backup/src/ /apkg/backup/dst2
```

- 查看更多信息

  ```sh
  # 屏中信息量大，一屏或几屏显示不全
  # 支持上下翻页
  ifconfig | more
  iffonfig > a.txt
  ```

| apt 命令         | 取代的命令                | 命令的功能                           |
| ---------------- | ------------------------- | ------------------------------------ |
| apt install      | apt-get install           | 安装软件包                           |
| apt remove       | apt-get remove 移除软件包 |                                      |
| apt purge        | apt-get purge             | 移除软件包及配置文件                 |
| apt update       | apt-get update            | 刷新存储库索引                       |
| apt upgrade      | apt-get upgrade           | 升级所有可升级的软件包               |
| apt autoremove   | apt-get autoremove        | 自动删除不需要的包                   |
| apt full-upgrade | apt-get dist-upgrade      | 在升级软件包时自动处理依赖关系       |
| apt search       | apt-cache search          | 搜索应用程序                         |
| apt show         | apt-cache show            | 显示装细节                           |
| apt list         |                           | 列出包含条件的包（已安装，可升级等） |
| apt edit-sources |                           | 编辑源列表                           |

[DOS下文件/文件夹操作](http://www.elecfans.com/baike/wangluo/anfang/20180117617630_2.html)

- 移除进程

```sh
ps -ef|grep tomcat
kill -9 pid
rm -rf
```
