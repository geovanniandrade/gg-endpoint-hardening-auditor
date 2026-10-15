# GG Endpoint Hardening Auditor - collector v0.1
# Windows PowerShell 5.1+ | Read-only | Authorized systems only
param([string]$OutputPath = (Join-Path $env:USERPROFILE 'Desktop\gg-hardening-audit.json'))
$ErrorActionPreference='Stop'
$checks = New-Object System.Collections.Generic.List[object]
function Add-Check([string]$name,[string]$status,[string]$detail) {
  $checks.Add([pscustomobject]@{name=$name;status=$status;detail=$detail})
}
try {
  $profiles=Get-NetFirewallProfile -ErrorAction Stop
  $disabled=@($profiles | Where-Object {$_.Enabled -ne $true} | Select-Object -ExpandProperty Name)
  if($disabled.Count -eq 0){Add-Check 'Windows Firewall' 'conforme' 'Todos os perfis de firewall estão habilitados'}
  else{Add-Check 'Windows Firewall' 'atencao' ('Perfis desativados: '+($disabled -join ', '))}
} catch {Add-Check 'Windows Firewall' 'nao_verificado' $_.Exception.Message}
try {
  $sys=$env:SystemDrive.TrimEnd(':')
  $b=Get-BitLockerVolume -MountPoint ($sys+':') -ErrorAction Stop
  if($b.ProtectionStatus -eq 'On'){Add-Check 'BitLocker' 'conforme' 'Proteção de volume ativa'}
  else{Add-Check 'BitLocker' 'atencao' ('Status da proteção: '+$b.ProtectionStatus)}
} catch {Add-Check 'BitLocker' 'nao_verificado' 'BitLocker indisponível ou consulta sem permissão'}
try {
  $smb=(Get-SmbServerConfiguration -ErrorAction Stop).EnableSMB1Protocol
  if($smb -eq $false){Add-Check 'SMBv1' 'conforme' 'SMBv1 desabilitado'}
  else{Add-Check 'SMBv1' 'atencao' 'SMBv1 habilitado; revisar necessidade'}
} catch {Add-Check 'SMBv1' 'nao_verificado' 'Não foi possível consultar SMBv1'}
try {
  $rdp=Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -ErrorAction Stop
  if($rdp.fDenyTSConnections -eq 1){Add-Check 'Remote Desktop (RDP)' 'informativo' 'RDP desabilitado'}
  else{Add-Check 'Remote Desktop (RDP)' 'atencao' 'RDP habilitado; validar firewall, autenticação e exposição'}
} catch {Add-Check 'Remote Desktop (RDP)' 'nao_verificado' 'Não foi possível consultar RDP'}
try {
  $os=Get-CimInstance Win32_OperatingSystem -ErrorAction Stop
  Add-Check 'Windows / Build' 'informativo' ($os.Caption+' | '+$os.Version+' | Build '+$os.BuildNumber)
} catch {Add-Check 'Windows / Build' 'nao_verificado' 'Não foi possível consultar a versão'}
$out=[pscustomobject]@{
  schema_version='0.1'
  collector='GG Endpoint Hardening Auditor'
  collected_utc=(Get-Date).ToUniversalTime().ToString('o')
  host=$env:COMPUTERNAME
  checks=@($checks.ToArray())
}
$out | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $OutputPath -Encoding UTF8
Write-Host ('Relatório criado em: '+$OutputPath)
Write-Host 'Revise o JSON: contém nome do computador e informações de configuração.'
