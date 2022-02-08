function Main {
    do {
        $output = Start-GPG
        Write-Host $output
        if (($output -match ".*can't connect to the gpg-agent.*") -or ($output -match ".*IPC connect call failed.*")) {
            $output = Stop-GPG
            Write-Host $output
            $output = Start-GPG
            Write-Host $output
        }
    } while (!(($output -match $null) -or ($output -match ".*connection to the agent established.*")))
}

function Start-GPG {
    return & gpg-connect-agent /bye 2>&1 | Out-String
}

function Stop-GPG {
    return & gpg-connect-agent killagent /bye 2>&1 | Out-String
}

Main
