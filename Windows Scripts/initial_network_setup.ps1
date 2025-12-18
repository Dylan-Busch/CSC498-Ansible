# Configure a Windows System with static IP address, gateway, and DNS

# Ensure PowerShell is ran as administrator
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdministrator = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if ($isAdministrator -eq $false) {
    Write-Host 'Please run PowerShell as Administrator' -foregroundcolor Red
    exit
}

param(
    [string]$ipaddress = '192.168.1.11', # CHANGE TO DESIRED HOST IP ADRESS
    [string]$subnetmask = '24',
    [string]$defaultgateway = '192.168.1.1', # CHANGE TO ENVIRONMENT FORWARDING ROUTER
    [string]$dnsserver = '192.168.1.1',
    [string]$interfacealias = 'Ethernet0'
)

# Set IP Address & Default Gateway
New-NetIPAddress -InterfaceAlias $interfacealias -IPAddress $ipaddress -PrefixLength $subnetmask -DefaultGateway $defaultgateway
Write-Host 'Network address configured' -ForegroundColor Cyan

# Set DNS Address
Set-DnsClientServerAddress -InterfaceAlias $interfacealias -ServerAddresses $dnsserver
Write-Host 'DNS address configured' -ForegroundColor Cyan