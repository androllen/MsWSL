# Vim命令行

使用 sudo 权限操作

```bash
# 查看
cat /usr/local/con.cfg  
# 编辑
vim /home/androllen/test.py  
```

按 ESC 键跳到命令模式，然后：

``` bash
:w                  -保存文件，不退出 vim。
:w file             -将修改另外保存到 file 中，不退出 vim。
:w!                 -强制保存，不退出 vim 。
:wq                 -保存文件，退出 vim。
:wq!                -强制保存文件，退出 vim。
:q                  -不保存文件，退出 vim。
:q!                 -不保存文件，强制退出 vim。
:e!                 -放弃所有修改，从上次保存文件开始再编辑。
shift+zz            -退出需要保存  
gg -> dG            -全部删除
gg -> ggyG          -全部复制
gg ->ggvG or ggVG   -全选高亮显示
yy                  -单行复制
dd                  -单行删除
p                   -粘贴
i                   -编辑
```

## QA

- shell returned 127
Press ENTER or type command to continue  
:q!

- e45 'readonly' option is set (add to override)  
:qa!
