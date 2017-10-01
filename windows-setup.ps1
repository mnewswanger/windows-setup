# This script should run in PowerShell as administrator

# INSTALL CHCOLATEY
Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# ENABLE WINDOWS FEATURES
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName TelnetClient

# INSTALL PACKAGES
choco install -y `
	1Password `
	Atom `
	Cmder `
	Git `
	Golang `
	GoogleChrome `
	HackFont `
	KeePass `
	RDCMan `
	Slack `
	SQL-Server-Management-Studio `
	SublimeText3 `
	VisualStudio2017Professional `
	VisualStudioCode `
	WinSCP

##### WINDOWS SETTINGS #####

# Enable developer mode
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"

# Set Windows Explorer properties
$RegistryKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $RegistryKey Hidden 1
Set-ItemProperty $RegistryKey HideFileExt 0
Stop-Process -processname explorer

##### CONFIGURE PACKAGES #####

# Set up cmder prompt
Copy-Item cmder.lua c:\tools\cmder\config\cmder-powerline-prompt.lua

# Gen SSH Key
& "C:\Program Files\Git\git-bash.exe" -c "if [ ! -f ~/.ssh/id_rsa ]; then ssh-keygen -t rsa -f ~/.ssh/id_rsa -N '' && echo 'Key generated successfully.'; fi; sleep 3"
