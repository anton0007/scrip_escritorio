# Obtener información del sistema operativo
$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem

Write-Host "Información del Sistema Operativo:"
Write-Host "Nombre del sistema operativo: $($osInfo.Caption)"
Write-Host "Versión del sistema operativo: $($osInfo.Version)"
Write-Host "Arquitectura del sistema operativo: $($osInfo.OSArchitecture)"
Write-Host "Número de compilación del sistema operativo: $($osInfo.BuildNumber)"
Write-Host "Fabricante del sistema operativo: $($osInfo.Manufacturer)"
Write-Host "Idioma del sistema operativo: $($osInfo.OSLanguage)"

# Obtener información de Windows Defender
$defenderStatus = Get-MpComputerStatus

Write-Host "Información de Windows Defender:"
Write-Host "Estado de Windows Defender: $($defenderStatus.AntivirusStatus)"
Write-Host "Definiciones de antivirus: $($defenderStatus.AntivirusSignatureVersion)"
Write-Host "Ultima actualización de definiciones: $($defenderStatus.LastFullScanTime)"

# Obtener información del Firewall de Windows
$firewallStatus = Get-NetFirewallProfile | Select-Object Name,Enabled

Write-Host "Información del Firewall de Windows:"
foreach ($profile in $firewallStatus) {
    Write-Host "Perfil: $($profile.Name)"
    Write-Host "Estado: $($profile.Enabled)"
}

# Obtener la IP pública utilizando un servicio de terceros
$publicIP = Invoke-RestMethod -Uri "https://api64.ipify.org?format=json"

Write-Host "Información de la IP Pública:"
Write-Host "IP Pública: $($publicIP.ip)"

# Espera la entrada del usuario antes de cerrar la consola
Read-Host "Presiona Enter para salir"
