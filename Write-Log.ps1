<#
.Synopsis
   This function is intended to record custom logs into a log file.
.DESCRIPTION
   The new function is intended to capture and store various log entries, which will help us in tracking system behaviors, identifying issues more efficiently, and improving our overall operational performance. 
   By having these detailed logs, we can better understand how our system is functioning and quickly address any anomalies that may arise.
.EXAMPLE
   Write-Log -Message "This is test log message" -level INFO -logFile "LogFileName.log"

.NOTES
  Version:             1.0
  Author:              Gautam Sharma @ergautamsharma
  Source:              https://github.com/ergautamsharma/PSModules
  Creation Date:       December 27, 2024
  Last Update Date:    December 27, 2024
#>

Function Write-Log {
  param(
      [Parameter(Mandatory = $true)]
      [string] $Message,
      [Parameter(Mandatory = $false)]
      [ValidateSet("INFO","WARN","ERROR")]
      [string] $level = "INFO",
      [Parameter(Mandatory = $false)]
      [string] $logFile = $logFile
  )
  # Create timestamp
  $timestamp = (Get-Date).toString("dd/MM/yyyy HH:mm:ss")
 
  # Append content to log file
  Add-Content -Path $logFile -Value "$timestamp [$level] - $message"
}

Write-Log -Message "This is test log message" -level INFO -logFile "LogFileName.log"