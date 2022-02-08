# replace-file-content.ps1 -path "*.refresh" -old "..\..\..\project\packages\" -new "..\packages\"
param (
    [Parameter(Mandatory = $true)][string]$Path,
    [Parameter(Mandatory = $true)][string]$OldString,
    [string]$NewString
)

if ([string]::IsNullOrEmpty($Path) -or [string]::IsNullOrEmpty($OldString)) { exit }
if ([string]::IsNullOrEmpty($NewString)) { $NewString = "" }

$counter = 0
Get-ChildItem -Recurse -File -Path $Path | ForEach-Object {
    $counter += 1
    if ((Get-Content $_).Contains($OldString)) {
        (Get-Content $_).Replace($OldString, $NewString) | Out-File -Encoding utf8 $_
        Write-Host "${counter}: Successful!       --> $_"
    }
    else {
        Write-Host "${counter}: String not found! --> $_"
    }
}
