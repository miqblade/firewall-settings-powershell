$portsToBlock = @(
    @{Port=445; Protocol="TCP"; Name="Block SMB Port 445"},
    @{Port=137; Protocol="UDP"; Name="Block NetBIOS Port 137"},
    @{Port=138; Protocol="UDP"; Name="Block NetBIOS Port 138"},
    @{Port=139; Protocol="TCP"; Name="Block NetBIOS Port 139"},
    @{Port=23; Protocol="TCP"; Name="Block Telnet Port 23"},
    @{Port=21; Protocol="TCP"; Name="Block FTP Port 21"},
    @{Port=1900; Protocol="UDP"; Name="Block SSDP Port 1900"},
    @{Port=3389; Protocol="TCP"; Name="Block RDP Port 3389"},
    @{Port=135; Protocol="TCP"; Name="Block RPC Port 135"}
)

foreach ($port in $portsToBlock) {
    $existingRule = Get-NetFirewallRule -DisplayName $port.Name -ErrorAction SilentlyContinue
    if (-not $existingRule) {
        New-NetFirewallRule -DisplayName $port.Name `
                            -Direction Inbound `
                            -LocalPort $port.Port `
                            -Protocol $port.Protocol `
                            -Action Block `
                            -Profile Any
        Write-Host "Правило '$($port.Name)' создано и порт $($port.Port) заблокирован."
    }
    else {
        Write-Host "Правило '$($port.Name)' уже существует."
    }
}
