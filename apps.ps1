<#
Jakub's Windows Post Install Script  (JWPIS)

Author: jakub1812

Requires to be ran as administrator.

Changing from ReviOs to Windows 11 Pro Education (least bloated) due to trust issues on previous homebrew.
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
	"eartrumpet",
	"winaero-tweaker.install",
	"powertoys",
	"office-tool",
	"firefox",
	"au", 
	"chocolatey-core.extension",
	"chocolateygui",
	"mm-choco.extension",
	"imageglass",
	"discord",
	"minibin",
	"dnsjumper",
	"nerd-fonts-sourcecodepro"
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
	"MicaForEveryone.MicaForEveryone",
	"JackieLiu.NotepadsApp",
	"pit-ray.win-vind",
	"VSCodium.VSCodium",
    "GitHub.GitHubDesktop"
)

foreach ($app2 in $appswinget) {
	winget install -e -h --accept-source-agreements --accept-package-agreements --id $app2 
}
