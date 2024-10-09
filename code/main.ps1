Clear-Host

#region Foreground color functions

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

#region core functions

    function mainMenu {
        Write-Output "미구현" | Cyan
    }

    function login {
        $attempt = 0
        $login = $false
        do {
            $username = Read-Host "사용자 이름을 입력하십시오"
            $password = Read-Host -AsSecureString "비밀번호를 입력하십시오"
            $pwd_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
            if ($username -eq "annonymus" -and $pwd_text -ceq "mirbyungsinanarchythebest") {
                $login = $true
                Write-Output "로그인에 성공하였습니다." | Green
                mainMenu
            } else {
                if ($attempt -eq 2) {
                    Write-Output "로그인 시도 횟수(3)를 초과하였습니다. 프로그램이 종료됩니다." | Red
                    exit
                }
                Write-Output "로그인에 실패하였습니다. 다시 시도하십시오." | Red
                $attempt++
            }
        } while (-not $login)
    }
    function title {
        Write-Output "====================================" | Cyan
        Write-Output "        * USK 정보 데이터베이스       " | Red
        Write-Output "====================================" | Cyan
    }

    function greeting {
        Write-Output "USK 정보 데이터베이스에 오신 것을 환영합니다." | Green
        Write-Output "접속을 진행하려면 아무 키나 누르십시오. 종료하려면 콘솔을 끄십시오. " | Yellow
        Write-Output "주의: 허가되지 않은 인원의 접근은 Berryman-Langford 밈적 살해인자로 인해 즉시 미르화로 이어질 수 있습니다." | Red
        Write-Output "접속을 진행하려면 아무 키나 누르십시오..." | Yellow
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        Write-Output "로그인을 진행합니다." | Green
        login
        
    }
#endregion

#region main
    title
    greeting
#endregion
