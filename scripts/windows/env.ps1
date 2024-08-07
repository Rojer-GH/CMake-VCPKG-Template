$global:configJson = Get-Content -Path "..\config.json" -Raw | ConvertFrom-Json

. .\vars.ps1
. .\functions.ps1

printText ""
printText "Welcome to the $(formattedText "DEV" $succ) Environment!"

printText ""

printHighlight "Configuration:"
printText "- The $(formattedText "dependencies" $warn) will be installed in $(formattedText $dependency $high)"
printText "- The $(formattedText "Python binaries" $warn) will be installed in $(formattedText $pythonBin $high)"
printText "- The $(formattedText "Python venv" $warn) will be installed in $(formattedText $pythonEnv $high)"
printText ""

getMSVCEnv