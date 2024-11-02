param([string]$gitBranchName)
netsh wlan connect name="I21WIRELESS"
cd "C:\Users\ItsYa\Documents\Github\v2-crescendo-2024"
git switch $gitBranchName
git pull
netsh wlan connect name="9573_Joshua"
cmd.exe /d /c gradlew deploy  -PteamNumber=9573 --offline  -Dorg.gradle.java.home="C:\Users\Public\wpilib\2024\jdk"
