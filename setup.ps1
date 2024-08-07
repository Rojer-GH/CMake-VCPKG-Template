<#
.SYNOPSIS
    Call this file to enter the dev environment.

.DESCRIPTION
    This PowerShell script creates a new powershell environment, in which the user is able to interact with the project-related files.

.NOTES
Author: Rojer Hamoto
#>
Push-Location "."

Set-Location -Path "scripts\windows"
Invoke-Expression -Command "powershell -NoExit -Command .\env.ps1"

Pop-Location