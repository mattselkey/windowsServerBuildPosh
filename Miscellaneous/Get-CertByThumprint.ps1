[CmdletBinding()]
# Parameter help description
Param(
    [Parameter(Mandatory=$true)]   
    [string]$ThumpPrintInput
)

Begin{

    Write-Host "Removing an spaces from thumprint if present" -ForegroundColor Green

    [string]$ThumpPrint = $ThumpPrintInput.replace(' ','')

}

Process{

	Write-Host "Checking for certifcate with thumbprint $($ThumpPrint)." -ForegroundColor Green
    Get-ChildItem -path cert:\LocalMachine\My | Where-Object {$_.Thumbprint -ieq $ThumpPrint }

}