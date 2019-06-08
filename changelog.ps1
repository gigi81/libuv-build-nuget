$first = $true
$changeLog = ""

foreach($line in Get-Content -Path "$PSScriptRoot\libuv\ChangeLog")
{
    if($line -match '\d{4}\.\d{2}\.\d{2}.*')
    {
        if($first)
        {
            $first = $false
        }
        else
        {
            break
        }
    }

    if(!$first -and ![String]::IsNullOrWhiteSpace($line))
    {
        $changeLog += $line
        $changeLog += [System.Environment]::NewLine
    }
}

$changeLog

[xml]$xml = Get-Content "$PSScriptRoot\libuv-shared.nuspec"
$xml.package.metadata.releaseNotes = $changeLog
$xml.Save("$PSScriptRoot\libuv-shared.nuspec")
