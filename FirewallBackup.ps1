netsh advfirewall reset
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True
Write-Host "Windows Firewall сброшен к настройкам по умолчанию."
