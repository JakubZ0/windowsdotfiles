# Windows Dotfiles

## Usage

I use it as post-installation script to make things simpler and faster.

Primarly meant to work with my homebrew Windows LTSC images but should be fine on every other Windows Distro.

## Installation

> Please edit it to your liking.

Copy this command into your elevated PowerShell instance and run it to download this repo and start the installation:

```ps1
Set-ExecutionPolicy Unrestricted; `
Invoke-WebRequest "https://github.com/drawix/windowsdotfiles/archive/master.zip" `
-OutFile "$HOME\Downloads\windowsdotfiles.zip"; `
Get-ChildItem "$HOME\Downloads\" -Filter *.zip | Expand-Archive -DestinationPath "$HOME\" -Force; `
Rename-Item -NewName "WindowsDotfiles" -Path "$HOME\windowsdotfiles-master"; `
. "$HOME\WindowsDotfiles\Bootstrap.ps1"
```


## todo

-setup proper cmder config syslink.