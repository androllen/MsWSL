linux 系统命令
一。查找命令
1.which 执行的可执行文件的完整路径（当前用户）
# which vi
/usr/bin/vi

2.whereis 搜索二进制、源码和手册页文件
# whereis vi
vi: /usr/bin/vi /usr/share/man/man1/vi.1p.gz /usr/share/man/man1/vi.1.gz

3. locate 搜索文件夹和文件
sudo updatedb 
locate --basename vim

4.find 搜索文件夹和文件
sudo find / -type d -mount -name supervisor 

ctrl+a   ctrl+e   分别代表把管标移动到最前和最后
ctrl+u   ctrl+k   分别代表光标处往前和光标处往后删除

二。ls 命令
蓝色：表示目录
绿色：表示可执行文件
红色：表示压缩文件
浅蓝色：链接文件
红色闪烁：表示链接的文件有问题
黄色：表示设备文件
灰色：表示其他文件