$first = $false
$changeLog = ""
$path = Join-Path (Join-Path (Get-Location) 'libuv') 'ChangeLog'
$nuspec = Join-Path (Get-Location) 'libuv-shared.nuspec'

foreach($line in Get-Content -Path $path)
{
    if($line -match '\d{4}\.\d{2}\.\d{2}.*')
    {
        if($first) { break; }
        $first = $true
    }

    if($first -and ![String]::IsNullOrWhiteSpace($line))
    {
        $changeLog += $line
        $changeLog += [System.Environment]::NewLine
    }
}

[xml]$xml = Get-Content $nuspec
$xml.package.metadata.releaseNotes = $changeLog
$xml.Save($nuspec)
