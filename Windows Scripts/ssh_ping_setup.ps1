# Install OpenSSH if not already installed and allow ping through firewall

# Ensure PowerShell is ran as administrator
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdministrator = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if ($isAdministrator -eq $false) {
    Write-Host 'Please run PowerShell as Administrator' -foregroundcolor Red
    exit
}

# Install OpenSSH
$opensshfeature = Get-WindowsCapability -Online | Where-Object Name -Like 'OpenSSH.Server*'
if ($opensshfeature -ne 'Installed') {
 Add-WindowsCapability -Online -Name 'OpenSSH.Server~~~~0.0.1.0'
 Write-Host 'OpenSSH Server successfully installed' -ForegroundColor Cyan
} else {
    Write-Host 'OpenSSH Server is already installed' -ForegroundColor Cyan
}

# Start OpenSSH automatically
Start-Service -Name sshd
Set-Service -Name sshd -StartupType Automatic


# Enable ICMP Firewall Rule
Enable-NetFirewallRule -displayName 'File and Printer Sharing (Echo Request - ICMPv4-In)'
Write-Host 'ICMP ping firewall rule enabled' -ForegroundColor Cyan

# Set default shell to powershell
New-ItemProperty -Path 'HKLM:\SOFTWARE\OpenSSH'-Name DefaultShell -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -PropertyType String -Force
