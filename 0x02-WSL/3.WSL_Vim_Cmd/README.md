#### Vim命令行

使用 sudo 权限操作

* 新建and编辑  
    sudo vim /home/androllen/test.py 

* 编辑  
    输入 i

* 查看  
    cat  /usr/local/con.cfg

* 退出不需要保存  
    先按ESC -> : -> q!  

* 退出需要保存  
    先按ESC -> shift+zz


全部删除：按esc键后，先按gg（到达顶部），然后dG  

全部复制：按esc键后，先按gg，然后ggyG  

全选高亮显示：按esc键后，先按gg，然后ggvG或者ggVG  

单行复制：按esc键后, 然后yy  

单行删除：按esc键后, 然后dd  

粘贴：按esc键后, 然后p  

#### QA
	``` bash
	Q:
	shell returned 127
	Press ENTER or type command to continue
	A:
	:q!
	```