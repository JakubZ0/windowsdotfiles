Set-PSReadlineOption -BellStyle None
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

$scripts_folder = "$HOME\Documents\WindowsPowerShell\Scripts\"
Import-Module "$scripts_folder\GitLogLive.ps1", "$scripts_folder\Get-ComputerInfo.ps1"
Import-Module posh-git

$is_conemu = $env:ConEmuANSI

if ($is_conemu -eq "ON") {
    Import-Module oh-my-posh
    Set-Theme Agnoster
}
else {
    # $LAMBDA = ([char]955)
    function global:prompt {
        $realLASTEXITCODE = $LASTEXITCODE
        Write-Host "$(Split-Path $pwd -Leaf) >" -NoNewline
        Write-VcsStatus
        $global:LASTEXITCODE = $realLASTEXITCODE
        return " "
    }
}
$host.UI.RawUI.WindowTitle = $pwd

Pop-Location
Set-Alias -Name "ll" -Value "Get-ChildItem"
function dotfiles { codium "$HOME\windowsDotfiles" }

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}



function .. { cd .. }
function ... { cd .. ; cd .. }
function .... { cd .. ; cd .. ; cd .. }
function ..... { cd .. ; cd .. ; cd .. ; cd .. }
function home { cd $env:USERPROFILE }
