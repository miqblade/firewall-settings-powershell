netsh advfirewall reset
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True
Write-Host "Windows Firewall reset to default settings."

