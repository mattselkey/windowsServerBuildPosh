
[String]$VDPath = ""
[String]$VMpath = ""


try{

    Write-Host "Setting default VM directory path" -ForegroundColor Green

    Import-Module -Name Hyper-V

    Set-VMHost -VirtualHardDiskPath $VDPath -VirtualMachinePath $VMpath

}
catch{

    write-host "Error configuraing Hyper-V host $($_)" -ForegroundColor Red
    Pause
    Exit-PSHostProcess

}