# Admin Check
if (!(Verify-Elevated)) {
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);

   exit
}

# Set execution policy to remote signed
Set-ExecutionPolicy RemoteSigned

# Install posh git 
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
# Install oh-my-posh ##
Install-Module oh-my-posh -Scope CurrentUser

Write-Host "Updating Help..." -ForegroundColor "Yellow"
Update-Help -Force

###powershell modules
Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"

# Install chioco
if (Check-Command -cmdname 'choco') {
  Write-Host "Choco is already installed, skip installation." -ForegroundColor "Red"
} else {
  Write-Host "------------------------------------" -ForegroundColor "Yellow"
  Write-Host "Installing Chocolatey for Windows..." -ForegroundColor "Yellow"
  Write-Host "------------------------------------" -ForegroundColor "Yellow"
  Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

#git
choco install git --params '"/GitAndUnixToolsOnPath /NoShellIntegration"'

#nvidia
choco install nvidia-display-driver	--limit-output

#browsers
choco install firefox  					--limit-output
choco install brave  					--limit-output
choco install googlechrome              --limit-output

#everyday
choco install spotify 					--limit-output
choco install discord.install			--limit-output
choco install 7zip.install			--limit-output
choco install lightshot.install			--limit-output
choco install teamspeak					--limit-output
choco install electrum.install          --limit-output
choco install freedownloadmanager       --limit-output
choco install honeyview.install         --limit-output
choco install msiafterburner            --limit-output
choco install thunderbird               --limit-output
choco install birdtray                  --limit-output
choco install obs-studio.install        --limit-output
choco install qbittorrent               --limit-output
choco install revo-uninstaller          --limit-output
choco install unchecky                  --limit-output
choco install vlc                       --limit-output
choco install steam                     --limit-output
choco install keypirinha                --limit-output
choco install spicetify-cli             --limit-output
choco install ditto.install             --limit-output
choco install rufus.install             --limit-output
choco install telegram.install          --limit-output
choco install rufus.install             --limit-output
#fonts                                  
choco install sourcecodepro             --limit-output
choco install firacode                  --limit-output

#dev 
choco install python3                   --limit-output
choco install python2                   --limit-output
choco install curl                		--limit-output
choco install notepadplusplus.install   --limit-output
choco install github-desktop            --limit-output
choco install cmder			            --limit-output
choco install realterm			        --limit-output



#ricing KEKW
choco install winaero-tweaker.install   --limit-output
choco install eartrumpet		        --limit-output
choco install powertoys			        --limit-output

#fast refresh!
Refresh-Environment

Write-Host "Copying config files..." -ForegroundColor "Yellow"
### Copy configs

# PowerShell
Copy-Item -Force -Path ".\WindowsPowerShell"  -Destination "$HOME\Documents\" -Recurse

# Git 
Copy-Item -Force .gitconfig -Destination "$HOME\"

#Keypirahna
Copy-Item -Force Keypirinha.ini -Destination "$HOME\AppData\Roaming\Keypirinha\User" 

Write-LogAndConsole $logFile -Color "Yellow" `
    "You will need to close and re-open PowerShell to continue."
Write-Host ""
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff"
Write-LogAndConsole $logFile "You are done! - $date" -Color "Green"
