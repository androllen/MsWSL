
检查 WSL 状态

```bash
wsl --status
```

安装wsl到D盘

```bash
wsl --install -d Ubuntu --location D:\Microsoft\WSL\Ubuntu
```

如何将 wsl迁移到D盘

```bash
# 关机
wsl --shutdown
# 终止
wsl --terminate Ubuntu
# 将 Ubuntu 迁移到 D:\WSL\Ubuntu
wsl --manage Ubuntu --move D:\WSL\Ubuntu
# 进入 WSL
wsl -d Ubuntu
# 退出 WSL
exit
```

如何压缩wsl空间

```bash
# 进入磁盘管理工具
diskpart

# 选择你的 WSL 虚拟磁盘文件（路径需替换为你电脑的实际路径）
# 通常路径：C:\Users\[用户名]\AppData\Local\Packages\[发行版包名]\LocalState\ext4.vhdx
select vdisk file="C:\Users\androllen\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu_72rhk51fndgsc\LocalState\ext4.vhdx"

# 挂载为只读并压缩
attach vdisk readonly
compact vdisk
detach vdisk

# 退出
exit
```

卸载

```bash
wsl --uninstall
```

相关链接

https://learn.microsoft.com/zh-cn/windows/wsl/basic-commands
