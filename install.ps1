$caller = pwd
cd "$PSScriptRoot\files"

# windows terminal
cp -Force `
    -Path .\wt\settings.json `
    -Destination "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# dbcli pgcli
cp -Force `
    -Path .\dbcli\pgcli\config `
    -Destination "$env:LOCALAPPDATA\dbcli\pgcli\config"

Start-Process -Verb runas -Wait pwsh.exe( `
        "-Command cd $pwd;" + `
        "$PSScriptRoot\scripts\runas.ps1;")

cd $caller