@ECHO OFF
:: Auto-elevation to Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Dang yeu cau quyen Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title Go bo quy tac DNS cho Steam
echo =================================================================
echo   GO BO QUY TAC DNS (NRPT) CUA STEAM
echo =================================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "Get-DnsClientNrptRule -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -eq 'Steam_Bypass' -or $_.Comment -like '*Steam*' } | ForEach-Object { Remove-DnsClientNrptRule -Name $_.Name -Force };" ^
  "Clear-DnsClientCache;"

echo =================================================================
echo  [THANH CONG] Da xoa bo quy tac DNS cua Steam!
echo  Moi truy van DNS cua Steam da tro lai mac dinh cua he thong.
echo =================================================================
echo.
pause
