param([string]$gitBranchName)

netsh wlan connect name="I21WIRELESS"
Write-Host "Connecting to I21WIRELESS..."
Start-Sleep -Seconds 1

$connectionStatus = netsh wlan show interfaces | Select-String -Pattern "State" | Select-String -Pattern "connected"
Write-Host $connectionStatus

    cd "C:\Users\ItsYa\Documents\Github\v2-crescendo-2024"
    git switch $gitBranchName
    git pull

    netsh wlan connect name="9573_Joshua"
    Write-Host "Connecting to Joshua..."
    Start-Sleep -Seconds 1

    $connectionStatus2 = netsh wlan show interfaces | Select-String -Pattern "State" | Select-String -Pattern "connected"
    Write-Host $connectionStatus2

    cmd.exe /d /c gradlew deploy  -PteamNumber=9573 --offline  -Dorg.gradle.java.home="C:\Users\Public\wpilib\2024\jdk"