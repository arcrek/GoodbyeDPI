@ECHO OFF
:: Auto-elevation to Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Dang yeu cau quyen Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

sc stop "GoodbyeDPI" >nul 2>&1
sc delete "GoodbyeDPI" >nul 2>&1
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -9 --blacklist \"%CD%\steam-blacklist.txt\"" start= "auto"
sc description "GoodbyeDPI" "Passive Deep Packet Inspection blocker for Steam"
sc start "GoodbyeDPI"

echo.
echo =================================================================
echo   DA CAI DAT SERVICE GOODBYEDPI CHO STEAM THANH CONG!
echo =================================================================
echo  [+] GoodbyeDPI se tu khoi dong ngam cung Windows.
echo  [+] Chi ap dung cho Steam (thong qua steam-blacklist.txt).
echo  [+] KHONG can thiep DNS toan may hay cac ung dung khac.
echo  [+] Neu muon go bo service, chay file: service_remove.cmd
echo =================================================================
echo.
pause

POPD
