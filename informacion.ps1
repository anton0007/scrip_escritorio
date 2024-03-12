# Obtener informaci�n del sistema operativo
$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem

Write-Host "Informaci�n del Sistema Operativo:"
Write-Host "Nombre del sistema operativo: $($osInfo.Caption)"
Write-Host "Versi�n del sistema operativo: $($osInfo.Version)"
Write-Host "Arquitectura del sistema operativo: $($osInfo.OSArchitecture)"
Write-Host "N�mero de compilaci�n del sistema operativo: $($osInfo.BuildNumber)"
Write-Host "Fabricante del sistema operativo: $($osInfo.Manufacturer)"
Write-Host "Idioma del sistema operativo: $($osInfo.OSLanguage)"

# Obtener informaci�n de Windows Defender
$defenderStatus = Get-MpComputerStatus

Write-Host "Informaci�n de Windows Defender:"
Write-Host "Estado de Windows Defender: $($defenderStatus.AntivirusStatus)"
Write-Host "Definiciones de antivirus: $($defenderStatus.AntivirusSignatureVersion)"
Write-Host "Ultima actualizaci�n de definiciones: $($defenderStatus.LastFullScanTime)"

# Obtener informaci�n del Firewall de Windows
$firewallStatus = Get-NetFirewallProfile | Select-Object Name,Enabled

Write-Host "Informaci�n del Firewall de Windows:"
foreach ($profile in $firewallStatus) {
    Write-Host "Perfil: $($profile.Name)"
    Write-Host "Estado: $($profile.Enabled)"
}

# Obtener la IP p�blica utilizando un servicio de terceros
$publicIP = Invoke-RestMethod -Uri "https://api64.ipify.org?format=json"

Write-Host "Informaci�n de la IP P�blica:"
Write-Host "IP P�blica: $($publicIP.ip)"

# Espera la entrada del usuario antes de cerrar la consola
Read-Host "Presiona Enter para salir"
