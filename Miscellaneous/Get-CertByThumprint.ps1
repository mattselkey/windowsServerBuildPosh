[CmdletBinding()]
# Parameter help description
Param(
    [Parameter(Mandatory=$true)]   
    [string]$ThumpPrintInput
)

Begin{

    Write-Host "removing an spaces from thumprint if present" -ForegroundColor Green

    [string]$ThumpPrint = $ThumpPrintInput.replace(' ','')

}

Process{

    Get-ChildItem -path cert:\LocalMachine\My | Where-Object {$_.Thumbprint -ieq $ThumpPrint }

}