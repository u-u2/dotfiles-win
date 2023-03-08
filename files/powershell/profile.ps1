
# alias
Set-Alias vi 'C:\Program Files\Vim\vim90\vim.exe'

function Prompt {
    if ($?) {
        Write-Host "( 'ω')" -NoNewLine -ForegroundColor "Green"
    }
    else {
        Write-Host "( ;ω;)" -NoNewLine -ForegroundColor "Red"
    }
    Write-Host "${env:USERNAME}@${env:COMPUTERNAME} " -NoNewLine -ForegroundColor "Cyan"
    Write-Host $pwd -NoNewLine -ForegroundColor "DarkCyan"
    return ">"
}

# function
function GenerateMavenProject {
    [CmdletBinding()]
    param(
        [parameter(ValueFromPipeline)]$Scope
    )
    process {
        Invoke-Expression "mvn archetype:generate -DarchetypeCatalog=${scope}"
    }
}

function CreateTempDirectory {
    [CmdletBinding()]
    param(
        [parameter(ValueFromPipeline)]
        [string]$Name,
        [Parameter(ValueFromPipeline)]
        [boolean]$ExitOnDelete
    )
    process {
        $name = $Name -ne (null) ? "${Name}_tmp":"tmp"
    }
}

function DockerRemoveExitedProcess {
    Invoke-Expression 'docker ps -qf status=exited | % {docker rm $_}'
}

function DockerListImageTemplate {
    Invoke-Expression "docker images --format '{{.Repository}}:{{.Tag}}'"
}