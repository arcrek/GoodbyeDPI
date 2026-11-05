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
PUSHD "%_arch%"

title GoodbyeDPI - Steam Only
echo =================================================================
echo   GOODBYEDPI - CHI AP DUNG CHO STEAM (KHONG ANH HUONG DNS MAY)
echo =================================================================
echo  [+] Che do: --blacklist steam-blacklist.txt
echo  [+] DNS toan may: HOAN TOAN KHONG BI THAY DOI HAY CHUYEN HUONG
echo  [+] Cac web va game khac: KHONG bi can thiep
echo.
echo  Ung dung dang chay... De dung, hay dong cua so nay hoac an Ctrl+C.
echo =================================================================
echo.

goodbyedpi.exe -9 --blacklist ..\steam-blacklist.txt

POPD
POPD
pause
