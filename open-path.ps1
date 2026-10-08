param([string]$u)
# TaskFlow: open a folder (Explorer) or a file (default app) from a taskflow-open: link.
$p = $u -replace '^taskflow-open:(//)?', ''
$p = [uri]::UnescapeDataString($p).Trim().Trim('"').TrimEnd('/')
# Only local drive paths and UNC paths are allowed.
if ($p -notmatch '^([a-zA-Z]:[\\/]|\\\\)') { exit }
# Never launch programs or scripts.
$blocked = '\.(exe|bat|cmd|com|msi|msp|ps1|psm1|vbs|vbe|js|jse|wsf|wsh|scr|lnk|reg|dll|hta|cpl|jar|msc|url|appref-ms|application|gadget|inf|pif)$'
if ($p -match $blocked) { exit }
$p = $p -replace '/', '\'
if (Test-Path -LiteralPath $p -PathType Container) {
    Start-Process -FilePath 'explorer.exe' -ArgumentList ('"' + $p + '"')
} elseif (Test-Path -LiteralPath $p -PathType Leaf) {
    Start-Process -FilePath $p
} else {
    $sh = New-Object -ComObject WScript.Shell
    [void]$sh.Popup("Not found / " + [char]0x898B + [char]0x3064 + [char]0x304B + [char]0x308A + [char]0x307E + [char]0x305B + [char]0x3093 + ":`n" + $p, 8, 'TaskFlow', 48)
}
