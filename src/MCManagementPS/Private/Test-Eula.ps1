<#
.SYNOPSIS
    Short description
.DESCRIPTION
    Long description
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
function Test-Eula
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateScript( {
                if (-not ($_.Name -eq 'eula.txt'))
                {
                    throw 'Path must be to a eula.txt file.'
                }
                else
                {
                    $true
                }
            })]
        [System.IO.FileInfo]
        $Path
    )

    process
    {
        $eulaContent = Get-Content -Path $Path.FullName

        if ($eulaContent)
        {
            [System.Convert]::ToBoolean((($eulaContent | Where-Object -FilterScript { $_ -like 'eula=*' }) -split '=')[1])
        }
        else
        {
            $false
        }
    }
}