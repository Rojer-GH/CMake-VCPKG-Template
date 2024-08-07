$global:dependency = $configJson.paths.deps

$global:pythonBin = $dependency + "/" + $configJson.paths.py.binary
$global:pythonEnv = $dependency + "/" + $configJson.paths.py.venv

$global:err = $configJson.colors.error
$global:high = $configJson.colors.highlight
$global:warn = $configJson.colors.warning
$global:norm = $configJson.colors.text
$global:succ = $configJson.colors.success