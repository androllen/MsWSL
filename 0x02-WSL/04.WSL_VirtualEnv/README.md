# Linux 虚拟环境

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
  ```

- 更新：

  ```sh
  sudo apt-get update
  ```

- 更换PIP源  
  清华：<https://pypi.tuna.tsinghua.edu.cn/simple>

  阿里云：<http://mirrors.aliyun.com/pypi/simple/>

  中国科技大学 <https://pypi.mirrors.ustc.edu.cn/simple/>

- 更换方法
  - 可以在使用pip的时候加参数-i <https://pypi.tuna.tsinghua.edu.cn/simple>

  - Linux

      修改 ~/.pip/pip.conf (没有就创建一个文件夹及文件。文件夹要加“.”，表示是隐藏文件夹)内容如下：

      ```sh
      [global]
      index-url = <https://pypi.tuna.tsinghua.edu.cn/simple>
      [install]
      trusted-host=mirrors.aliyun.com
      ```
      
   - windows
   
     直接在user目录中创建一个pip目录，如：C:\Users\xx\pip，新建文件pip.ini。内容同上。

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
  
  # 查看现有安装的python
  whereis python 
  
  # 卸载 python3
  rpm -qa|grep python3 | xargs rpm -ev --allmatches --nodeps 

  # 删除所有残余文件
  whereis python3 | xargs rm -frv 
  ```

- 安装python3 pip

  ``` bash
  sudo apt-get install python3.7
  sudo easy_install pip
  or
  sudo apt-get install python3-pip
  sudo find / -type f -mount -name pip3
  /usr/bin/pip3
  pip3 list
  
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

- 安装virtualenv(Option)

  ``` bash
  # 准备环境
  安装 sudo apt-get install python-pip
  # 查看是否安装虚拟环境
  sudo apt search python-virtualenv
  # 如果没有安装则下载
  sudo apt-get install python-virtualenv

  # 创建虚拟环境
  virtualenv testEnv  (提前 cd 到你指定的目录下)
  # 查看python 版本
  python -V
  # 创建指定的python版本虚拟环境
  virtualenv -p /usr/bin/python3.5  testEnv
  # 激活虚拟环境 或者配置vs code 虚拟环境
  cd testEnv/
  source ./bin/activate or source bin/activate
  # 安装依赖
  pip install flask
  # 退出虚拟环境
  deactivate
  ```
