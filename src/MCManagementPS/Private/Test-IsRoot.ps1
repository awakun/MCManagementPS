<#
.SYNOPSIS
    Tests if running as root (sudo)
.EXAMPLE
    PS > Test-IsRoot
    Returns true if run with elevated access
#>
function Test-IsRoot
{
    (id -u) -eq 0
}