<#
Jakub's Windows Post Install Script  (JWPIS)

Author: jakub1812

Requires to be ran as administrator/

Using ReviOs which is mostly debloated, so deleting appx won't happend in this script
#>


Write-Host "check if ran as admin"
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Write-Host "install choco"
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


choco feature enable -n=allowGlobalConfirmation

Write-Host "time for apps! Don't forget to set Quad9 Security in DNS Jumper."
$appschoco = @(
	"veracrypt",
	"vlc",
	"microsoft-windows-terminal",
	"lightshot.install",
	"qbittorrent-enhanced",
	"firacode",
	"eartrumpet",
	"winaero-tweaker.install",
	"powertoys",
	"neovim",
	"office-tool",
	"firefox",
	"au", 
	"chocolatey-core.extension",
	"mm-choco.extension",
	"imageglass",
	"discord",
	"minibin",
	"dnsjumper"
)
foreach ($app in $appschoco) {
	choco install $app -y -r}

	Write-Host "Winget time!"
	Write-Host ""
$appswinget = @(
	"M2Team.NanaZip",
	"TechPowerUp.NVCleanstall",
	"Caprine.Caprine",
	"startallback",
	"MicaForEveryone.MicaForEveryone"
)

foreach ($app2 in $appswinget) {
	winget install -e -h --accept-source-agreements --accept-package-agreements --id $app2 
}
