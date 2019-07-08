function Set-Eula
{
    [CmdletBinding()]
    param
    (
        [switch]
        $Accept,

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
        $Path,

        [switch]
        $Force
    )
    
    if (-not (Test-IsRoot))
    {
        throw 'Set-Eula must be run as root. Try reopening PowerShell with sudo.'
    }

    $eulaExists = Test-Path -Path $Path -ErrorAction 'SilentlyContinue'
    
    if ($Force -and $eulaExists)
    {
        ''
    }
    elseif ($Force)
    {
        ''
    }
    elseif ($eulaExists)
    {
        $eulaContents = Get-Content -Path $Path.FullName
        if ($eulaContent[2] -like 'eula=*'))
        {
            ''
        }
        else
        {
            throw ''
        }
    }
    else
    {
        
    }
}