# Windows Dotfiles

## Usage

I use it as post-installation script to make things simpler and faster.

Primarly meant to work with my homebrew Windows LTSC images but should be fine on every other Windows Distro.

## Installation

> Please edit it to your liking.

Copy this command into your elevated PowerShell instance and run it to download this repo and start the installation:

```ps1
Set-ExecutionPolicy Unrestricted; `
Invoke-WebRequest "https://github.com/drawix/windows-dotfiles/archive/master.zip" `
-OutFile "$HOME\Downloads\windows-dotfiles.zip"; `
Get-ChildItem "$HOME\Downloads\" -Filter *.zip | Expand-Archive -DestinationPath "$HOME\" -Force; `
Rename-Item -NewName "WindowsDotfiles" -Path "$HOME\windows-dotfiles-master"; `
. "$HOME\WindowsDotfiles\Bootstrap.ps1"
```

### TODO:

> -Figure out simple way to install firefox extensions and shadowfox and add it into bootstrap.

> -Automatic installation of newest StartIsBack (integration to the Windows install sucks.)

> -Installation of every Visual C++ Redistributable.

## Special thanks

> Nidzo-Vidic - basics of script

> farag2 - I stole shit ton of code from him :)
