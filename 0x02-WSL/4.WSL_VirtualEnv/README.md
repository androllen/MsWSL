#### Linux 虚拟环境

* 安装virtualenv
    ```
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

* 安装Virtualenvwrapper  
    sudo apt-get install virtualenvwrapper  
* 在任意目录创建 .virtualenvs （建议在 用户 根目录下）  
    androllen@DESKTOP-QKA9IF0:~$ mkdir .virtualenvs   
    androllen@DESKTOP-QKA9IF0:~$ mkdir $HOME/.virtualenvs  
    ~~~~# 查找virtualenvwrapper.sh路径~~~~
    ~~~~sudo find / -type f -mount -name virtualenvwrapper.sh~~~~

    ~~~~# 打开文件~~~~
    ~~~~sudo vi .profile~~~~

    ~~~~# 设置环境变量~~~~
    ~~~~把下面两行添加到~/.profile~~~~
    ~~~~export WORKON_HOME= $HOME/.virtualenvs~~~~
    ~~~~export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7~~~~
    ~~~~export PROJECT_HOME=$HOME/workspace~~~~
    ~~~~source /usr/share/virtualenvwrapper/virtualenvwrapper.sh~~~~

    ~~~~# 运行命令~~~~
    ~~~~source ~/.profile~~~~

* virtualenvwrapper 命令  
    创建虚拟环境：mkvirtualenv new_env 

    激活虚拟环境：workon new_env

    退出虚拟环境：deactivate

    删除虚拟环境: rmvirtualenv new_env

    查看所有虚拟环境：lsvirtualenv

    ``` bash
    # 激活当前环境
    D:\Desktop\todolist>activate todoenv
    # 导出
    (todoenv) D:\Desktop\todolist> pip freeze > requirements.txt
    # 安装的环境文件
    (todoenv) D:\Desktop\todolist> pip install -r requirements.txt
    ```

- pipenv
    ``` bash
    # 安装pipenv
    pip install pipenv 
    # 列出所有依赖包
    pip list 
    # 会使用当前系统的Python3创建环境  
    pipenv --three
    # 指定某一Python版本创建环境
    pipenv --python 3.6
    # 激活虚拟环境
    pipenv shell
    # 退出虚拟环境
    exit
    # 显示目录信息
    pipenv --where
    #显示虚拟环境信息
    pipenv --venv
    # 显示Python解释器信息
    pipenv --py
    # 查看目前安装的库及其依赖
    pipenv graph
    # 检查安全漏洞
    pipenv check
    # 卸载全部包并从Pipfile中移除
    pipenv uninstall --all
    #
    pipenv install requests
    #
    pipenv install django==1.11
    #
    pipenv uninstall requests
    # pipenv虚拟环境运行python命令
    pipenv run python your_script.py
    ```
    设置源  
    Pipfile文件中[source]下面url属性，比如修改成：  
    url = "https://pypi.tuna.tsinghua.edu.cn/simple"  
    or  
    url = "http://mirrors.aliyun.com/pypi/simple/"  
    or default url  
    url = "https://pypi.org/simple"

* Anaconda 命令 
* <https://www.cnblogs.com/hafiz/p/9085405.html>
* <https://www.jianshu.com/p/52d848317c17>
* 彻底卸载  <https://www.jianshu.com/p/50032c3cfa28>