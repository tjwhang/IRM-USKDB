Clear-Host

#region Foreground color functions
    function greeting {
        Write-Host "USK 정보 데이터베이스에 오신 것을 환영합니다."
    }

    function Green {
        process { Write-Host $_ -ForegroundColor Green }
    }

    function Red {
        process { Write-Host $_ -ForegroundColor Red }
    }

    function Yellow {
        process { Write-Host $_ -ForegroundColor Yellow }
    }

    function Cyan {
        process { Write-Host $_ -ForegroundColor Cyan }
    }

    function Magenta {
        process { Write-Host $_ -ForegroundColor Magenta }
    }

#endregion

#region display functions
    function title {
        Write-Host "====================================" | Cyan
        Write-Host "        * USK 정보 데이터베이스       " | Red
        Write-Host "====================================" | Cyan
    }

    function greeting {
        Write-Host "USK 정보 데이터베이스에 오신 것을 환영합니다." | Green
    }
#endregion

#region main
    title
    greeting
#endregion

Write-Output "this is a test" | Green
Write-Output "this is a test" | Red