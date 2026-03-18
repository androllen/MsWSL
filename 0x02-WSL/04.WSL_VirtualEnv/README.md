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

- 安装pipx
  ```sh
  sudo apt install pipx
  
  # 2. 确保 pipx 在 PATH 中
  pipx ensurepath
  # 可能需要重新启动终端或执行：source ~/.bashrc
  ```
  
  
  
- 创建虚拟环境
  ```sh
  python3 -m venv .venv
  ```

- 激活虚拟环境
  ```sh
  source .venv/bin/activate
  ```

- 安装 uv
  ```sh
  pip install uv
  # 初始化项目（这会在当前目录创建项目文件）
  uv init
  # 添加生产依赖
  uv add requests
  
  # 添加开发依赖
  uv add --dev pytest black

  # 查看一般详细信息
  uv add requests -v
  
  # 查看更详细信息
  uv add requests -vv
  
  # 更安全地，删除特定包的缓存
  uv cache remove requests
  
  # 查看已安装的包
  uv pip list
  ```

  ```sh 示例
  androllen@user:~$ pipx install uv
  androllen@user:~$ uv --version
  androllen@user:~$ cd pyDemo/
  androllen@user:~/pyDemo$ uv init
  androllen@user:~/pyDemo$ uv venv
  androllen@user:~/pyDemo$ source .venv/bin/activate
  (pyDemo) androllen@user:~/pyDemo$ uv sync
  python -c "import fastapi, PyPDF2; print('依赖导入成功')"
  (pyDemo) androllen@ISSUR:~/pyDemo$ which python
  /home/androllen/pyDemo/.venv/bin/python
  (pyDemo) androllen@ISSUR:~/pyDemo$ uv add sqlalchemy
  ```

  ```sh
  # 安装 pyproject.toml 中定义的所有依赖
  uv sync
  
  # 强制重新同步（清空后重新安装）
  uv sync --reinstall
  # 管理依赖
  uv add <package>            # 添加包并记录
  uv remove <package>         # 移除包
  uv update                   # 更新所有包
  
  # 环境管理
  uv venv                     # 创建虚拟环境
  uv sync                     # 同步依赖
  uv pip install <package>    # 临时安装（不记录）
  
  # 项目工具
  uv run <command>           # 在项目环境中运行命令
  uv build                   # 构建项目包
  uv publish                 # 发布到 PyPI

  
  # 创建配置文件
  mkdir -p ~/.config/uv
  sudo vim ~/.config/uv/uv.toml
  
  # 添加以下内容（以清华源为例）
  [index]
  url = "https://pypi.tuna.tsinghua.edu.cn/simple"
  
  or
  sudo vim ~/.bashrc
  # 设置默认镜像源 (以清华大学镜像源为例)
  export UV_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
  
  # 如果你需要添加多个镜像源作为备用
  # export UV_EXTRA_INDEX_URL="https://mirrors.aliyun.com/pypi/simple/"
  
  # 方式 A：直接指定 URL
  uv pip install numpy --index-url https://pypi.tuna.tsinghua.edu.cn/simple
  
  # 方式 B：如果你想保留官方源作为备用（防止某些包只在官方有）
  uv pip install numpy --default-index https://pypi.tuna.tsinghua.edu.cn/simple

  pyproject.toml 共享团队


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
