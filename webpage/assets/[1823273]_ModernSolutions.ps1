Fu nction KillThatProcess([string]$name){
$Process = Get-Process $name
$prognum = $process.count
$choice = Read-Host "Total number of $name open: $prognum. Terminate? Y/N"
if($choice -eq "y" -or $choice  -eq "Y"){$Process | Stop-Process}
else{Write-Host -BackgroundColor red -ForegroundColor white "Nothing has been done"}
}

Function Bamboozle([string]$Path = "."){
$char = (97..122) | Get-Random | %{[char]$_}
Write-Host -BackgroundColor Yellow -ForegroundColor black "I am wanted for manslaughter in 3 different states. Also I chose the letter $char"
$files = Get-ChildItem $Path -include *"$char" -Recurse | Where-Object { $Path.Attributes -ne "Directory"}
if($files -eq $null){Write-Host -BackgroundColor red -ForegroundColor white "There are no files"}
else{$files | Remove-Item -WhatIf}
}