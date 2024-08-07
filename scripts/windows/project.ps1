<#
.SYNOPSIS
Interact with the project files

.DESCRIPTION
USAGE
    .\project.ps1 <command> <action> 

COMMANDS
    python      python-related action
    cmake       cmake-related action
    deps        dependencies-related action
    help, -?    show this help message
#>

param(
    [Parameter(Position = 0)]
    [ValidateSet("python", "cmake", "deps", "help")]
    [string]$command,
    [Parameter(Position = 1, ValueFromRemainingArguments = $true)]
    $action
)

function help {
    Get-Help $PSCommandPath
}

if (!$Command) {
    help
    exit
}

function python {

}

function cmake {

}

function deps {

}

switch ($command) {
    "python" { python }
    "cmake" { cmake }
    "deps" { deps }
    "help" { help }
}