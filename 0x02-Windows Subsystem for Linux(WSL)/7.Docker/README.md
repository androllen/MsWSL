
<p align="center">
<img width="200" align="center" src="Assets/bg2018020901.png"/>
</p>
<h1 align="center">Docker入门教程</h1>

## 目录
### [Docker简介](https://docs.microsoft.com/zh-cn/dotnet/standard/containerized-lifecycle-architecture/what-is-docker)



### Docker配置

### Docker安装
* 在线下载
1. sudo apt-get update
2. sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
3. curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
4. sudo apt-key fingerprint 0EBFCD88
5. sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
6. sudo apt-get update
7. sudo apt-get install docker-ce docker-ce-cli containerd.io
8. docker version   
 
* 离线下载<https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/>
    > 把下载的文件放到用户名目录下查看
```
# 客户端
sudo dpkg -i containerd.io_1.2.5-1_amd64.deb
sudo dpkg -i docker-ce_18.09.6_3-0_ubuntu-bionic_amd64.deb
sudo dpkg -i docker-ce-cli_18.09.6_3-0_ubuntu-bionic_amd64.deb
```

### Docker 源

### Uninstall Docker CE

### Docker 服务命令
* 开启  
sudo service docker start
* 查看状态  
sudo service docker status
* 开机自启动  
sudo systemctl enable docker
* 查看开机自启动状态  
sudo systemctl is-enabled docker
* 禁用开机自启  
sudo systemctl disable docker

### Docker 三大组件
#### image 文件
```Docker 把应用程序及其依赖，打包在 image 文件里面。```
* 列出本机的所有 image 文件。  
$ docker image ls

* 删除 image 文件  
$ docker image rm [imageName]

#### container 文件
```image 文件生成的容器实例，本身也是一个文件，称为容器文件。也就是说，一旦容器生成，就会同时存在两个文件： image 文件和容器文件。而且关闭容器并不会删除容器文件，只是容器停止运行而已。```
* 列出本机正在运行的容器  
$ docker container ls

* 列出本机所有容器，包括终止运行的容器  
$ docker container ls --all
#### Registry
```
Docker 仓库用来保存镜像，可以理解为代码控制中的代码仓库。
```
Dockerfile 

#### image文件

http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html
https://zhuanlan.zhihu.com/p/58436705
https://download.docker.com/linux/ubuntu/dists/
https://www.cnblogs.com/kaixinyufeng/p/9389348.html


docker之安装和基本使用(一)
https://www.cnblogs.com/cwp-bg/p/9365983.html
https://www.cnblogs.com/cwp-bg/p/9376130.html

https://blog.csdn.net/li_yan_sring/article/details/84408701
https://www.cnblogs.com/cwp-bg/p/9376130.html
https://blog.csdn.net/wxb880114/article/details/82904765
https://blog.csdn.net/qq_28295425/article/details/86537124



https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user
使用 Docker 在 Linux 上托管 flask
Linux开启启动Docker
sudo chkconfig docker on 

### 下载地址
[download.docker.com for Windows](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)

### 问题
* Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? <https://blog.csdn.net/HOOKTTG/article/details/80626369>
意思是说windows10子系统有其特殊性，需要安装docker for windows，这个就是docker daemon，然后打开如下选项：
然后，执行“docker -H tcp://0.0.0.0:2375 info”就可以返回docker信息了。但是这样很麻烦，所以可执行如下操作
![docker](Assets/20180608175713938.jpg)

```
echo "export DOCKER_HOST='tcp://0.0.0.0:2375'" >> ~/.bashrc
source ~/.bashrc
```
然后就可以直接执行“docker info”了。

* Manage Docker as a non-root user
    * sudo groupadd docker
    * sudo usermod -aG docker $USER
    * docker run hello-world
