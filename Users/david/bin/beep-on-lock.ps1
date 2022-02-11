[CmdletBinding()]
param ([switch]$beep)

function IsSuspended {
    $process = Get-Process -Name LockApp
    $thread = $process.Threads[0]
    return ($thread.ThreadState -eq "wait") -and ($thread.WaitReason -eq "suspended")
}

function MyDate {
    return Get-Date -DisplayHint DateTime -Format "yyyy-MM-dd HH:mm:ss"
}

Write-Host -ForegroundColor Blue "Exit the script with Ctrl+C"

$state = $true

while ($true) {
    if (!$state -eq $(IsSuspended)) {
        $state = !$state
        if ($beep) { [System.Media.SystemSounds]::Beep.Play() }
        if ($state) { Write-Host -ForegroundColor Red "$(MyDate) - Screen unlocked!" }
        else { Write-Host -ForegroundColor Green "$(MyDate) - Screen locked!" }
    }
    Start-Sleep -Seconds 1
}
