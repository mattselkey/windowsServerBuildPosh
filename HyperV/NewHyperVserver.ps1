#Hyper-v reference https://docs.microsoft.com/en-us/powershell/module/hyper-v/?view=win10-ps

try{

    write-host "Installing Hyper-V role" -ForegroundColor Green  

    Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart

    write-host 

}
catch{
    
    write-host "Error Installing Hyper-V role $($_)" -ForegroundColor Red
    Pause
    Exit-PSHostProcess  
}