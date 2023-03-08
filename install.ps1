$caller = pwd
cd "$PSScriptRoot\files"

# install scoop
irm get.scoop.sh | iex
scoop install zenhan

# dbcli pgcli
cp -Force `
    -Path .\dbcli\pgcli\config `
    -Destination "$env:LOCALAPPDATA\dbcli\pgcli\config"

Start-Process -Verb runas -Wait pwsh.exe( `
        "-Command cd $pwd;" + `
        "$PSScriptRoot\scripts\runas.ps1;")

cd $caller