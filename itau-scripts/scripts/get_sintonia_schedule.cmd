set d=%~dp0
set d=%d:~0,-1%

set PATH=%PATH%;c:\utils\bin

if not exist %d%      goto :EOF
if not exist %d%\log  mkdir %d%\log
if not exist %d%\log  goto :EOF

set LOGFILE=

for /f %%i in ('gdate +sintonia.%%Y-%%m-%%d.log') do set LOGFILE=%d%\log\%%i

if not defined LOGFILE  goto :EOF
if not exist %d%\sintonia.cmd goto :EOF

for /f "tokens=*" %%i in ('gdate "+%%d/%%m/%%Y %%H:%%M:%%S"') do (echo. && echo %%i Iniciando processamento de sintonia.cmd) >>%LOGFILE%

cd  /d %d%
cmd /c %d%\sintonia.cmd >>%LOGFILE% 2>&1
