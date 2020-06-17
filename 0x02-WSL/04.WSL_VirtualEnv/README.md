---
title: Linux 虚拟环境 
---

- 编辑

  ```sh
  sudo cp /etc/apt/sources.list /etc/apt/sources.list.old
  sudo vim /etc/apt/sources.list

  deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
  deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
  deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
  deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
  deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
  deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
  deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
  deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
  deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
  deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse

  esc / shift + ZZ
  ```

- 更新：

  ```sh
  sudo apt-get update
  ```

- 检查

  ```sh
  python3 --version
  ```

- 安装其他版本 python3

  ```sh
  #
  cd /home/androllen
  wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz
  tar -zxvf Python-3.7.5.tgz
  cd Python-3.7.5
  # 创建安装目录
  mkdir -p /usr/lib/python3.7
  # 安装配置
  ./configure --prefix=/usr/lib/python3.7
  # 编译
  make
  # 安装
  make install
  # 建立 Python3 的软链:
  ln -s /usr/lib/python3.7/ /usr/bin/python3.7
  ```

- 安装 PIP

  ```sh
  cd /home/androllen
  sudo wget https://bootstrap.pypa.io/get-pip.py
  # 多试几次
  sudo python3 get-pip.py
  or
  # 可能无效
  sudo apt install python3-pip
  # 查看现有安装的python
  whereis python3
  or
  sudo find / -type f -mount -name pip3

  pip3 -V
  pip -V
  pip3 list
  ```

- 更换 PIP 源

  清华：<https://pypi.tuna.tsinghua.edu.cn/simple>

  阿里云：<http://mirrors.aliyun.com/pypi/simple/>

  中国科技大学 <https://pypi.mirrors.ustc.edu.cn/simple/>

- 更换方法

  - 可以在使用pip的时候加参数

    `pip install -i https://pypi.tuna.tsinghua.edu.cn/simple django`

  - Linux

    修改 ~/.pip/pip.conf (没有就创建一个文件夹及文件。文件夹要加“.”，表示是隐藏文件夹)内容如下：

    ```sh
    [global]
    index-url = https://pypi.tuna.tsinghua.edu.cn/simple
    [install]
    trusted-host=mirrors.aliyun.com
    ```

  - windows

    ```sh
    %appdata%
    C:\Users\Androllen\AppData\Roaming
    # 空白处 -> Shift + 鼠标右键 -> 在此处打开 Linux shell
    mkdir pip

    [global]
    index-url=https://pypi.tuna.tsinghua.edu.cn/simple
    # 复制内容到 pip.ini
    pip.ini
    ```

- 设置 python 默认版本为 python3

  ```sh
  sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150
  update-alternatives: using /usr/bin/python3.7 to provide /usr/bin/python (python) in auto mode

  androllen@DESKTOP-4QBCHIN:/usr/bin$ python
  Python 3.7.5 (default, Nov  7 2019, 10:50:52)
  [GCC 8.3.0] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  >>>

  # 设置快捷方式 py3
  sudo update-alternatives --install /usr/bin/py3 python /usr/bin/python3.7 150
  update-alternatives: renaming python link from /usr/bin/python to /usr/bin/py3

  androllen@DESKTOP-4QBCHIN:/usr/bin$ py3
  Python 3.7.5 (default, Nov  7 2019, 10:50:52)
  [GCC 8.3.0] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  >>>
  ```

- 卸载 Python2.7

  ```sh
  # 卸载python2.7
  sudo apt-get remove python2.7
  # 卸载python2.7及其依赖
  sudo apt-get remove --auto-remove python2.7
  # 消除python2.7
  sudo apt-get purge python2.7
  or
  sudo apt-get purge --auto-remove python2.7
  sudo rm -rf /usr/bin/python2.7

  # 卸载 python
  rpm -qa|grep python2.7 | xargs rpm -ev --allmatches --nodeps

  
  # 删除所有残余文件
  whereis python2.7 | xargs rm -frv
  ```
