[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

schtasks /run /tn "enableLock"

timeout /t 3 /nobreak

$PowerState = [System.Windows.Forms.PowerState]::Hibernate;
$Force = $false;
$DisableWake = $false;

[System.Windows.Forms.Application]::SetSuspendState($PowerState, $Force, $DisableWake);