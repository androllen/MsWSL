控制台vim 插入 退出
新建and编辑
vim /home/androllen/test.py 

# 编辑
输入 i

# 查看
cat  /usr/local/con.cfg

# 退出不需要保存
先按ESC，再输入冒号，在输入命令时，直接输入"q!"
# 退出需要保存
先按ESC，再shift+zz

全部删除：按esc键后，先按gg（到达顶部），然后dG
全部复制：按esc键后，先按gg，然后ggyG
全选高亮显示：按esc键后，先按gg，然后ggvG或者ggVG

单行复制：按esc键后, 然后yy
单行删除：按esc键后, 然后dd
粘贴：按esc键后, 然后p
复制到粘贴板: 全选高亮显示之后，ctrl+shift+c，

vim只能粘贴50行的问题：
在当前用户主目录编辑~/.vimrc（如果不存在，新建这个文件），添加一行

:set viminfo='1000,<500

至于为什么要输入输入’1000,这个其实不重要，
最主要的是输入<500,它是设置寄存器保存的行数的。即最大值为 500