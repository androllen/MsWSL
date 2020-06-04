# Base on Windows Subsystem for Linux 18.04 TLS

基于 Linux 系统 搭建开发网站

## 实现

开机自启动守护进程服务，使用守护进程保护并开启python服务（网站服务）

添加自定义服务到 [守护进程Supervisor]

使用 `Docker` 迁移至生产环境部署，调试，发布程序

### 步骤

1. [安装WSL](01.WSL_Install/README.md)
1. [WSL系统命令](02.WSL_System_Cmd/README.md)
1. [关于WSL Vim 命令行](03.WSL_Vim_Cmd/README.md)
1. [远程登陆 SSH](05.WSL_SSH/README.md)
1. [创建 WSL 虚拟环境](04.WSL_VirtualEnv/README.md)

### 链接

[nginx-supervisor-gunicorn-flask](http://www.simpleapples.com/2015/06/11/configure-nginx-supervisor-gunicorn-flask/)  

[flask+nginx+gunicorn](https://baijiahao.baidu.com/s?id=1616440047552092518&wfr=spider&for=pc)  

[在 Ubuntu 上使用 Nginx 部署 Flask 应用](https://www.oschina.net/translate/serving-flask-with-nginx-on-ubuntu)  

[how-to-deploy-flask-apps](https://blog.igevin.info/posts/how-to-deploy-flask-apps/)

[nginx + gunicorn + supervisor + flask 部署笔记](https://www.jianshu.com/p/be9dd421fb8d)

[vps-config-python-vitrualenv-flask-gunicorn-supervisor-nginx](http://beiyuu.com/vps-config-python-vitrualenv-flask-gunicorn-supervisor-nginx)  

[在 ufw 上开启 nat 伪装和端口转发](https://www.logcg.com/archives/993.html)  
