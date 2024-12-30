<#
.Synopsis
   The PowerShell GUI function is created to get an input file.
.DESCRIPTION
   The PowerShell GUI function is created to facilitate the process of obtaining The PowerShell GUI function is created to with a specified filetype, enhancing workflow efficiency and ease of use. 
   This ensures consistency and accuracy in data input.
.EXAMPLE
   Get-FileName

.NOTES
  Version:             1.0
  Author:              Gautam Sharma @ergautamsharma
  Source:              https://github.com/ergautamsharma/PSModules
  Creation Date:       December 30, 2024
  Last Update Date:    December 30, 2024
#>

#Function for get input file
Function Get-FileName
{  
 [System.Reflection.Assembly]::LoadWithPartialName(“System.windows.forms”) | Out-Null
 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = [Environment]::GetFolderPath('Desktop')
 $OpenFileDialog.filter = “Text Files (*.txt) | *.txt”
 $OpenFileDialog.ShowDialog() | Out-Null
 $path = $OpenFileDialog.filename
 if ($path -notmatch ".txt")
 {
     $path = "Nothing"
 }
 return $path
}

$InputPath = Get-FileName