$caller = pwd
cd "$PSScriptRoot\files"

# dbcli pgcli
cp -Force `
    -Path .\dbcli\pgcli\config `
    -Destination "$env:LOCALAPPDATA\dbcli\pgcli\config"

Start-Process -Verb runas -Wait pwsh.exe( `
        "-Command cd $pwd;" + `
        "$PSScriptRoot\scripts\runas.ps1;")

cd $caller