#Hyper-v reference https://docs.microsoft.com/en-us/powershell/module/hyper-v/?view=win10-ps

try{

    write-host Installing Hyper-V role -Foregroundcolor Green  

    Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart

    write-host 

}
catch{


}