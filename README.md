#Firewall-settings-powershell

if you want to add your own rule,
you can do it by adding a new entry to the $portsToBlock array,
using the same structure — Port, Protocol (TCP/UDP), and Name.

'$portsToBlock = @(
    @{Port=445; Protocol="TCP"; Name="Block SMB Port 445"},
    @{Port=137; Protocol="UDP"; Name="Block NetBIOS Port 137"},
    @{Port=138; Protocol="UDP"; Name="Block NetBIOS Port 138"},
    @{Port=139; Protocol="TCP"; Name="Block NetBIOS Port 139"},
    @{Port=23; Protocol="TCP"; Name="Block Telnet Port 23"},
    @{Port=21; Protocol="TCP"; Name="Block FTP Port 21"},
    @{Port=1900; Protocol="UDP"; Name="Block SSDP Port 1900"},
    @{Port=3389; Protocol="TCP"; Name="Block RDP Port 3389"},
    @{Port=135; Protocol="TCP"; Name="Block RPC Port 135"}    
)'

For example:

'$portsToBlock = @(
    @{Port=80; Protocol="TCP"; Name="Block HTTP Port 80"},
)'
