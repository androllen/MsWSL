


### Docker安装
1. sudo apt-get update
1. sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
1. curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
1. sudo apt-key fingerprint 0EBFCD88
1. sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
1. sudo apt-get update
1. sudo apt-get install docker-ce docker-ce-cli containerd.io
1. docker version    

### Docker 服务命令
* 开启  
sudo service docker start
* 查看状态
sudo service docker status
* 开机自启动
sudo systemctl enable docker
* 查看开机自启动状态
sudo systemctl is-enabled docker



http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html
https://zhuanlan.zhihu.com/p/58436705
https://download.docker.com/linux/ubuntu/dists/
https://www.cnblogs.com/kaixinyufeng/p/9389348.html

https://blog.csdn.net/HOOKTTG/article/details/80626369
docker之安装和基本使用(一)
https://www.cnblogs.com/cwp-bg/p/9365983.html
https://www.cnblogs.com/cwp-bg/p/9376130.html

https://blog.csdn.net/li_yan_sring/article/details/84408701
https://www.cnblogs.com/cwp-bg/p/9376130.html
https://blog.csdn.net/wxb880114/article/details/82904765
https://blog.csdn.net/qq_28295425/article/details/86537124
https://blog.csdn.net/HOOKTTG/article/details/80626369

使用 Docker 在 Linux 上托管 flask
Linux开启启动Docker
sudo chkconfig docker on 

### 下载地址
[download.docker.com for Windows](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)

### 问题
* Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? 
意思是说windows10子系统有其特殊性，需要安装docker for windows，这个就是docker daemon，然后打开如下选项：
然后，执行“docker -H tcp://0.0.0.0:2375 info”就可以返回docker信息了。但是这样很麻烦，所以可执行如下操作
![docker](https://github.com/androllen/WeWSL/blob/master/0x02-Windows%20Subsystem%20for%20Linux(WSL)/7.Docker/Assets/20180608175713938.jpg)

1、“echo "export DOCKER_HOST='tcp://0.0.0.0:2375'" >> ~/.bashrc”

2、“source ~/.bashrc”

然后就可以直接执行“docker info”了。
* Manage Docker as a non-root user
    * sudo groupadd docker
    * sudo usermod -aG docker $USER
    
