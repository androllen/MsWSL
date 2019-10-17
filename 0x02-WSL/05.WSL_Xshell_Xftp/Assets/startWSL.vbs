set ws=WScript.createobject("WScript.shell")
cmd = "C:\Windows\System32\bash.exe -c 'sudo /usr/sbin/service ssh start'"
ws.run cmd,0
Set ws = Nothing
WScript.quit