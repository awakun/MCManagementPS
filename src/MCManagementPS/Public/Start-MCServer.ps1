<#
.SYNOPSIS
    Starts the minecraft server with the desired java options
.DESCRIPTION
    Starts a modded minecraft server using java with a modded jar file at the provided $Path.
    It will start it using the java options specified by $options.
.EXAMPLE
    PS > 
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    Author: Dave Kaylor
#>
function Start-MCServer
{
    [CmdletBinding()]
    param 
    (
        [Parameter(Mandatory = $true)]
        [ValidateScript( { Test-Path -Path $_ -PathType leaf })]
        [System.IO.FileInfo]
        $Path,

        [string]
        $Options = '-Xms256M -Xmx6G  -d64 -server -XX:+AggressiveOpts -XX:ParallelGCThreads=3 -XX:+UseConcMarkSweepGC -XX:+UnlockExperimentalVMOptions -XX:+UseParNewGC -XX:+ExplicitGCInvokesConcurrent -XX:MaxGCPauseMillis=10 -XX:GCPauseIntervalMillis=50 -XX:+UseFastAccessorMethods -XX:+OptimizeStringConcat -XX:NewSize=84m -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -Dfml.readTimeout=90 -Ddeployment.trace=true -Ddeployment.log=true -Ddeployment.trace.level=all',

        [switch]
        $AcceptEula
    )
    
    process
    {
        if (-not (Test-IsRoot))
        {
            throw 'Start-MCServer must be run with root access. Try running pwsh with sudo.'
        }
        
        if (Test-Eula -eq $false -and $AcceptEula)
        {
            Write-Verbose -Message 'Accepting EULA.'
            Set-Eula -Accept
        }
        elseif (Test-Eula -eq $false)
        {

        }

        $origLoc = Get-Location
        Set-Location -Path $Path.Directory

        #& java -jar $Path.Name nogui "$options"
    }
}