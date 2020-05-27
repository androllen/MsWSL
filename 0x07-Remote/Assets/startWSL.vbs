set ws=WScript.createobject("WScript.shell")
cmdssh = "C:\Windows\System32\bash.exe -c 'sudo /usr/sbin/service ssh start'"
cmdsuper = "C:\Windows\System32\bash.exe -c 'sudo /usr/sbin/service supervisor start'"
ws.run cmdssh,0
Set ws = Nothing
WScript.quit