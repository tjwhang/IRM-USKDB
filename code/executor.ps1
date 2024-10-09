# PowerShell script to download and execute a .cmd script from GitHub

Write-Host "USK 총 데이터베이스에 오신 것을 환영합니다."

# Write-Host "프로그램 구동을 위해 Node.JS가 필요합니다. Node.JS가 설치되어 있는지 확인합니다."

# try {
#     # Try to get the Node.js command
#     $nodeCommand = Get-Command node -ErrorAction Stop
#     Write-Host "Node.js가 설치되어 있습니다."

# } catch {
#     Write-Host "Node.js가 설치되어 있지 않습니다. Node.js를 설치합니다. "
#     Write-Host "관리자 권한이 요청될 수 있습니다. 동의해 주십시오."
#     winget install OpenJS.NodeJS
#     Write-Host "Node.js가 설치되었습니다."
# }

# npm i chalk -y

# # Get the Node.js version
# Write-Host "Node.JS 버전: "

# node -v

Write-Host "데이터베이스 스크립트를 env:TEMP($env:TEMP)에 다운로드합니다."

# URL to the raw .cmd script on GitHub
$scriptUrl = "https://raw.githubusercontent.com/tjwhang/IRM-USKDB/refs/heads/main/code/main.ps1"

# Path to save the downloaded script locally
$localScriptPath = "$env:TEMP\irmuskdb.ps1"

# Download the script using Invoke-RestMethod
Invoke-RestMethod -Uri $scriptUrl -OutFile $localScriptPath

# Execute the downloaded .cmd script
#Start-Process -FilePath "cmd.exe" -ArgumentList "/c $localScriptPath" -Wait
$localScriptPath

Remove-Item -Path $localScriptPath -Force

Pause