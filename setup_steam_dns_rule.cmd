@ECHO OFF
:: Auto-elevation to Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Dang yeu cau quyen Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title Cau hinh DNS rieng cho Steam (NRPT)
echo =================================================================
echo   THIET LAP QUY TAC DNS (NRPT) CHI DANH RIENG CHO STEAM
echo =================================================================
echo.
echo  Dang thiet lap: Chi cac ten mien cua Steam moi gui toi 8.8.8.8 va 1.1.1.1.
echo  DNS card mang va toan bo he thong cua ban GIU NGUYEN 100%% khong doi!
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ruleName = 'Steam_Bypass';" ^
  "$domains = @('.steampowered.com', '.steamcommunity.com', '.steamstatic.com', '.steamcontent.com', '.steam-chat.com', '.steamgames.com', '.s.team');" ^
  "$servers = @('8.8.8.8', '1.1.1.1');" ^
  "Get-DnsClientNrptRule -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -eq $ruleName -or $_.Comment -like '*Steam*' } | ForEach-Object { Remove-DnsClientNrptRule -Name $_.Name -Force };" ^
  "Add-DnsClientNrptRule -Namespace $domains -Nameservers $servers -DisplayName $ruleName -Comment 'Steam_Bypass' | Out-Null;" ^
  "Clear-DnsClientCache;"

echo =================================================================
echo  [THANH CONG] Da thiet lap xong quy tac DNS cho Steam!
echo  [+] Kiem tra: Windows se chi hoi DNS Google khi vao Steam.
echo  [+] Tat ca web, game, mang noi bo khac van dung DNS mac dinh cua ban.
echo  [+] De go bo quy tac nay, chay file: remove_steam_dns_rule.cmd
echo =================================================================
echo.
pause
