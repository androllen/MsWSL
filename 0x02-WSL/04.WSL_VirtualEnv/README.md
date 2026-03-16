---
title: Linux 虚拟环境 
---

- 国内源 24.04 以前

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

- 国内源 24.04以后

  https://developer.aliyun.com/mirror/ubuntu?spm=a2c6h.13651102.0.0.3e221b11UjP74m

  ```sh
  Types: deb
  URIs: https://mirrors.aliyun.com/ubuntu
  Suites: noble noble-updates noble-backports
  Components: main universe restricted multiverse
  Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
  
  Types: deb
  URIs: https://mirrors.aliyun.com/ubuntu
  Suites: noble-security
  Components: main universe restricted multiverse
  Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
  
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
  or
  sudo apt install python3-pip

  pip3 -V
  pip -V
  pip3 list
  ```
- 查看现有安装的python
  whereis python3

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

- 设置 python3为别名

  /home/你的用户名/.bashrc
  vim ~/.bashrc
  
  ```sh
  alias python='python3'
  alias pip='pip3'
  ```
  source ~/.bashrc

  输入 python --version和 pip --version，如果显示的是 Python 3 和 pip3 的版本信息，# 1. 先安装 pipx

  ```sh
  sudo apt install pipx
  
  # 2. 确保 pipx 在 PATH 中
  pipx ensurepath
  # 可能需要重新启动终端或执行：source ~/.bashrc
  
  # 3. 用 pipx 安装 uv
  pipx install uv说明设置成功
  ```
  
- 创建虚拟环境
  ```sh
  python3 -m venv .venv
  source .venv/bin/activate
  pip install uv
  ```

- 激活虚拟环境 安装依赖
  ```sh
  source .venv/bin/activate
  pip install uv
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
