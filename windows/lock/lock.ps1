schtasks /run /tn "enableLock"

timeout /t 1 /nobreak

rundll32.exe user32.dll,LockWorkStation
