windows10子系统ubuntu使用xshell登陆
1.打开Ubuntu命令行
cd /etc/ssh #切换到ssh配置文件的位置
sudo cp sshd_config sshd_config.bak   #先把原来的备份
sudo vim sshd_config		#编辑配置文件

2.修改sshd_config配置
    Port 3652  #修改端口，原来的22端口已经存在
    ListenAddress 0.0.0.0  #打开本地监听
    #StrictModes yes  #注释掉
    PasswordAuthentication yes  #修改登陆的方式，允许密码登陆

3.启动SSH
sudo service ssh start 

Could not load host key: /etc/ssh/ssh_host_rsa_key
Could not load host key: /etc/ssh/ssh_host_ecdsa_key
Could not load host key: /etc/ssh/ssh_host_ed25519_key

4.重新生成host key 
sudo dpkg-reconfigure openssh-server

5.重新启动SSH
sudo service ssh restart

6.配置SSH自动启动
sudo systemctl enable ssh

7.check ssh auto status
 sudo systemctl is-enabled ssh

https://blog.csdn.net/tengchengbaba/article/details/85481145