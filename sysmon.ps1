# Author: Madhavan S
# GitHub: @witherking946
# License: MIT (Xyspace Network)

function Draw-Box($text) {
    $line = "+------------------------------------------------------+"
    $content = "| " + $text.PadRight(50) + " |"
    Write-Output $line
    Write-Output $content
    Write-Output $line
}

Clear-Host
Draw-Box "SYSMON - SYSTEM RESOURCE MONITOR"
Write-Output ""

$hostname = $env:COMPUTERNAME
$user = $env:USERNAME
$uptime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$uptimeFormatted = ((Get-Date) - $uptime).ToString("dd\.hh\:mm\:ss")

$os = (Get-CimInstance Win32_OperatingSystem).Caption
$cpuLoad = (Get-CimInstance Win32_Processor).LoadPercentage
$memory = Get-CimInstance Win32_OperatingSystem
$memUsed = [math]::Round(($memory.TotalVisibleMemorySize - $memory.FreePhysicalMemory)/1MB, 2)
$memTotal = [math]::Round($memory.TotalVisibleMemorySize/1MB, 2)
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"

$temp = "N/A"
try {
    $tempRaw = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi" | Select-Object -First 1
    if ($tempRaw) {
        $tempC = ($tempRaw.CurrentTemperature - 2732) / 10
        $temp = "$tempC °C"
    }
} catch {}

Draw-Box "Hostname: $hostname"
Draw-Box "User: $user"
Draw-Box "Uptime: $uptimeFormatted"
Draw-Box "OS: $os"
Draw-Box "CPU Load: $cpuLoad%"
Draw-Box "Memory: $memUsed GB used / $memTotal GB"
Draw-Box "Disk (C:): $([math]::Round($disk.Size/1GB,2)) GB total, $([math]::Round($disk.FreeSpace/1GB,2)) GB free"
Draw-Box "CPU Temp: $temp"

Write-Output ""
Write-Host "Press any key to exit..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
