Function GetRoothPath{ 

    $Path = $($PWD).Path

    if($null -eq $Path ){
        Write-Host "Path cannot be retrieved via PWD" -ForegroundColor Yellow

        try {

            if($null -ne $MyInvocation.MyCommand.path) {
                Write-Host "Getting path via MyInvocation" -ForegroundColor Green
                $Path =  Split-Path $MyInvocation.MyCommand.path
                
            }
                else
                {
                    Write-Host "Getting path via get-location" -ForegroundColor Green
                    $Path = $(Get-Location).Path ;
                }
        }
        catch {
           Write-Host "Error getting root path. Error is: $($_)" -ForegroundColor Red 
        }

        }
    else {
        Write-Host "Path retried via PWD" -ForegroundColor Green
        }

  return $Path

}


function get-JSONconfig{
    Param(
        [Parameter(Mandatory=$true)]   
        [String]$PathToJSONFile
    )

try {
    Write-Host "Getting json from location $($PathToJSONFile)" -ForegroundColor Green
    [System.Object]$convertedJSON = Get-Content $PathToJSONFile  | ConvertFrom-Json

}
catch {
    Write-Host "Error converting JSON. Error is: $($_)" -ForegroundColor Red
}

return $convertedJSON

}

$Path = GetRoothPath

get-JSONconfig -PathToJSONFile  "$($Path)\JSON\TEST.json"