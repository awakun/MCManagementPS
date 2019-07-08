# Only used for local testing. Build process combines module into a single psm1 file.

$moduleFiles = Get-ChildItem -Path $PSScriptRoot -Filter *.ps1 -Recurse

# Dot source module function files
foreach ($file in $moduleFiles)
{
    . $file.FullName
}