param([string]$gitBranchName)
netsh wlan connect name="I21WIRELESS"
Write-Host "Connecting to I21WIRELESS..."
Start-Sleep -Seconds 1
$connectionStatus = netsh wlan show interfaces | Select-String -Pattern "State" | Select-String -Pattern "connected"
if ($connectionStatus){
    cd "C:\Users\ItsYa\Documents\Github\v2-crescendo-2024"
    git switch $gitBranchName
    git pull
    netsh wlan connect name="9573_Joshua"
    
    if ($connectionStatus){
        cmd.exe /d /c gradlew deploy  -PteamNumber=9573 --offline  -Dorg.gradle.java.home="C:\Users\Public\wpilib\2024\jdk"
    } else {Write-Host "Connection to Joshua failed"}
} else {Write-Host "Connection to I21WIRELESS failed"}