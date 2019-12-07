
Write "
  _____   ____ _______ ______ _____ _      ______  _____ 
 |  __ \ / __ \__   __|  ____|_   _| |    |  ____|/ ____|
 | |  | | |  | | | |  | |__    | | | |    | |__  | (___  
 | |  | | |  | | | |  |  __|   | | | |    |  __|  \___ \ 
 | |__| | |__| | | |  | |     _| |_| |____| |____ ____) |
 |_____/ \____/  |_|  |_|    |_____|______|______|_____/                                                                                     
"

Set-ExecutionPolicy -ExecutionPolicy Bypass -Force

New-Item -Force -ItemType SymbolicLink "$HOME\Documents\" -Name "WindowsPowerShell" -Value "$HOME\WindowsDotfiles\WindowsPowerShell"

# Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


# scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop bucket add extras
scoop bucket add nerd-fonts
scoop install aria2 sudo concfg FiraCode
cd $PSScriptRoot

refreshenv


#choco software
choco install cmder                  -y
choco install 7zip.install           -y
choco install discord.install        -y   
choco install f.lux.install          -y
choco install Firefox                -y
choco install --force git --params "/NoGuiHereIntegration /NoShellHereIntegration" -y
choco install lightshot              -y
choco install mpv                    -y
choco install vscodium               -y
choco install winaero-tweaker        -y
choco install gpg4win                -y #how the f* do u disable context menu integration.....
choco install choco-upgrade-all-at --params "'/TIME:20:00'" -y
choco install irfanview             -y



refreshenv


# oh-my posh
Write-Output "Setting up oh-my-posh"
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser


#making powershell nice
concfg clean
concfg import -n dracula .\files\firacode-light.json
concfg tokencolor disable
Clear-Host



#configs
Write-Output "Creating config links"
New-Item -Force -ItemType SymbolicLink $HOME\AppData\Roaming\VSCodium\User -Name settings.json -Value $HOME\WindowsDotfiles\files\settings.json
New-Item -Force -ItemType SymbolicLink $HOME\ -Name .gitconfig -Value $HOME\WindowsDotfiles\files\.gitconfig

refreshenv

$extensions_block = { 
    $extensions =
        'eamodio.gitlens',
        'aaron-bond.better-comments',
        'CoenraadS.bracket-pair-colorizer',
        'dracula-theme.theme-dracula',
        'emmanuelbeziat.vscode-great-icons',
        'esbenp.prettier-vscode',
        'fabiospampinato.vscode-todo-plus',
        'formulahendry.auto-close-tag',
        'formulahendry.auto-complete-tag',
        'formulahendry.auto-rename-tag',
        'GrapeCity.gc-excelviewer',
        'Gruntfuggly.activitusbar',
        'icrawl.discord-vscode',
        'James-Yu.latex-workshop',
        'JerryHong.autofilename',
        'keyring.Lua',
        'mikey.vscode-fileheader',
        'mkaufman.HTMLHint',
        'ms-python.python',
        'ms-vscode.cpptools',
        'PKief.material-icon-theme',
        'spywhere.guides',
        'trixnz.vscode-lua'

    for ($i = 0; $i -lt $extensions.Count; $i++) {
        
        codium --install-extension $extensions[$i]
    } 
} 

Start-Process powershell -ArgumentList "-command $extensions_block"


# import registry changes
ls -r reg *.reg | foreach { reg import $_.FullName }
kill -ProcessName explorer -Force # restart explorer, to apply changes made in registry