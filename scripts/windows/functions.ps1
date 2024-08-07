function global:formattedText {
    param(
        [string]$text,
        [string]$format,
        [string]$oldFormat = $norm
    )
    return "[$($format)m${text}[$($oldFormat)m"
}
function global:printError {
    param(
        [string]$text
    )
    Write-Host "$(formattedText $text $err)"
}
function global:printHighlight {
    param(
        [string]$text
    )
    Write-Host "$(formattedText $text $high)"
}
function global:printWarning {
    param(
        [string]$text
    )
    Write-Host "$(formattedText $text $warn)"
}
function global:printSuccess {
    param(
        [string]$text
    )
    Write-Host "$(formattedText $text $succ)"
}
function global:printText {
    param(
        [string]$text
    )
    Write-Host "$(formattedText $text $norm)"
}

function getMSVCEnv {
    printText "Trying to retrieve the $(formattedText "MSVC-Environment" $high). On success, a banner should be displayed:"
    $loc = Get-Location
    # credits: https://renenyffenegger.ch/notes/Windows/development/Visual-Studio/environment-variables/index
    & ((& "$env:ProgramFiles (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -latest -property installationPath).Split('#')[0] + "\Common7\Tools\Launch-VsDevShell.ps1")
    Set-Location -Path $loc
    printSuccess "The $(formattedText "cl-command" $high $succ) should now display a short usage description."
}