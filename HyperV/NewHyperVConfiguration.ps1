[CmdletBinding()]
# Parameter help description
Param(
    [Parameter(Mandatory=$true)]   
    [String]$VMHDsDefaultPath,
    [Parameter(Mandatory=$true)]   
    [String]$VMsDefaultPath
  
)


Function checkPath{
param (
[Parameter(Mandatory=$true)]
[String]$FolderPath
)

try{
if( !(Test-Path -Path $FolderPath)){

    Write-Host "Folder does not exist, do you want to create the folder in path $($FolderPath)?" -ForegroundColor Green

    New-Item -Path $FolderPath -ItemType "Directory"
}
else{

    Write-Host "Folder path exists, continuing with script" -ForegroundColor Green

}

}catch{
    Write-Host "Error checking folder path. Error is: $($_)."
    Pause
    Exit
    }
}

try{

    Write-Host "Setting default VM HardDisk directory path to $($VMHDsDefaultPath) and VM Configuration Path to $($VMsDefaultPath)" -ForegroundColor Green

    #check paths
    checkPath -FolderPath $VMHDsDefaultPath
    checkPath -FolderPath $VMsDefaultPath   
    
    Import-Module -Name Hyper-V

    Set-VMHost -VirtualHardDiskPath $VMHDsDefaultPath -VirtualMachinePath $VMsDefaultPath

}
catch{

    Write-Host "Error configuraing Hyper-V host $($_)." -ForegroundColor Red
    Pause
    Exit-PSHostProcess

}


