#Requires -RunAsAdministrator

function CreateSymLink {
    param (
        [string]$File,
        [string]$Dest,
        [string]$Name
    )
    $fileInfo = ls $File
    $actualName = -not([string]::IsNullOrEmpty($Name)) ? $Name : $fileInfo.Name
    $targetFile = Join-Path $Dest $actualName 
    if (Test-Path $targetFile) {
        # backup ?
        rm $targetFile
    } 
    ni -Value $fileInfo.FullName `
        -Path $Dest `
        -Name $actualName `
        -ItemType SymbolicLink | Out-Null
    echo "create symlink: $targetFile to $fileInfo"
}

# current location is dotfiles-win\files

# powershell
$name = $PROFILE.Substring($PROFILE.LastIndexOf("\") + 1) 
$dir = $PROFILE.Substring(0, $PROFILE.LastIndexOf("\")) 
CreateSymLink -File ".\powershell\profile.ps1" -Dest $dir -Name $name

# git
CreateSymLink -File ".\git\.gitconfig" -Dest $env:USERPROFILE

# vim
CreateSymLink -File ".\vim\.vimrc" -Dest $env:USERPROFILE
CreateSymLink -File ".\vim\_vimrc" -Dest $env:USERPROFILE

Pause